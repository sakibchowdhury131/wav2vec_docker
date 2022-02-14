FROM nvidia/cuda:11.0-base
CMD nvidia-smi
FROM python:3.8
RUN mkdir /app
WORKDIR /app
ADD main.py /app
WORKDIR /app
RUN git clone https://github.com/mailong25/self-supervised-speech-recognition.git
WORKDIR /app/self-supervised-speech-recognition
RUN mkdir libs
WORKDIR /app/self-supervised-speech-recognition/libs
RUN pip install soundfile torchaudio sentencepiece editdistance sklearn
RUN pip install torch==1.6.0
RUN git clone https://github.com/pytorch/fairseq.git
WORKDIR /app/self-supervised-speech-recognition/libs/fairseq
RUN git checkout c8a0659be5cdc15caa102d5bbf72b872567c4859
RUN pip install --editable ./
WORKDIR /app/self-supervised-speech-recognition/libs
RUN apt-get update && apt-get -y install apt-utils libpq-dev libsndfile-dev
RUN apt install libboost-system-dev libboost-thread-dev libboost-program-options-dev libboost-test-dev libeigen3-dev zlib1g-dev libbz2-dev liblzma-dev -y
RUN apt-get install libsndfile1-dev libopenblas-dev libfftw3-dev libgflags-dev libgoogle-glog-dev -y
RUN git clone https://github.com/kpu/kenlm.git
WORKDIR /app/self-supervised-speech-recognition/libs/kenlm
RUN mkdir -p build && cd build
RUN pip install cmake
RUN cmake .
RUN make -j 4
WORKDIR /app/self-supervised-speech-recognition
RUN git clone -b v0.2 https://github.com/facebookresearch/wav2letter.git
WORKDIR /app/self-supervised-speech-recognition/wav2letter/bindings/python
WORKDIR /app/self-supervised-speech-recognition/
COPY corrected ../corrected
RUN ls ..
ENTRYPOINT [ "python3", "pretrain.py", "--fairseq_path", "libs/fairseq", "--audio_path", "../corrected" ]

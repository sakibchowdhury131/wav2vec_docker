### Docker Image Builder for wav2vec2.0 pretraining

- Step1: Create a folder named "corrected" in the same directory where the "Dockerfile" is placed. Put all the unlabelled raw audio files in wav2vec format as described in [here](https://github.com/mailong25/self-supervised-speech-recognition#11-prepare-unlabeled-audios)

- Step2: sudo chmod +x setup.sh
- Step3: sudo bash ./setup.sh [edit the <[IMAGE-ID](https://github.com/sakibchowdhury131/wav2vec_docker/blob/9a8f34134d52165680ede77f18cf9abddb6fe302/setup.sh#L10) > in [setup.sh](https://github.com/sakibchowdhury131/wav2vec_docker/blob/9a8f34134d52165680ede77f18cf9abddb6fe302/setup.sh) once docker build finishes]

### Docker Image Builder of wav2vec2.0 pretraining

- Step1: Create a folder named "corrected" in the same directory where the "Dockerfile" is placed. Put all the unlabelled raw audio files in wav2vec format as described in [here](https://github.com/mailong25/self-supervised-speech-recognition#11-prepare-unlabeled-audios)

- Step2: sudo chmod +x setup.sh
- Step3: sudo bash ./run.sh [edit the IMAGE-ID in run.sh once docker build finishes]

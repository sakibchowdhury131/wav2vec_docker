# wav2vec_docker

A Docker setup for running self-supervised wav2vec 2.0 speech representation pre-training using the [mailong25/self-supervised-speech-recognition](https://github.com/mailong25/self-supervised-speech-recognition) framework with Fairseq and KenLM. The container handles the full dependency installation including Fairseq, wav2letter Python bindings, KenLM, and all native libraries.

## Features

- CUDA 11.0 + Python 3.8 Docker base image for GPU-accelerated training
- Automatically clones and installs Fairseq, KenLM, and wav2letter Python bindings
- Installs all native dependencies (`libsndfile`, `libboost`, `libfftw3`, `libopenblas`, etc.)
- Mounts your pre-processed audio data into the container
- `setup.sh` script for installing NVIDIA Docker 2 and building/running the container

## Tech Stack

- Docker
- Python 3.8
- PyTorch 1.6.0
- Fairseq (Facebook Research)
- wav2letter Python bindings
- KenLM language model toolkit
- CUDA 11.0

## Project Structure

| File | Description |
|---|---|
| `Dockerfile` | Container definition: installs all dependencies and sets up wav2vec training entry point |
| `setup.sh` | Host setup script: installs NVIDIA Docker 2 and builds/runs the container |
| `changeEnvVar.py` | Utility for modifying environment variable configurations |

## Requirements

- NVIDIA GPU with CUDA 11.0 support
- NVIDIA Docker 2 (`nvidia-docker2`)
- Docker

## Setup

```bash
# Install NVIDIA Docker 2 and build the container
bash setup.sh
```

Or manually:

```bash
docker build -t "wav2vec-test1" .
docker run --rm --ipc=host --gpus all <IMAGE-ID>
```

## Usage

Place your pre-processed audio data in `../corrected/` (relative to the repo root) before building — the Dockerfile copies it into the container. The entry point runs `pretrain.py` on the provided audio.

## License

MIT

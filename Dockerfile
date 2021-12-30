FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-runtime

# Install linux packages
RUN apt update && apt install -y zip htop screen libgl1-mesa-glx git

# Create working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD ./yolov5 /usr/src/app/yolov5

RUN python -m pip install --upgrade pip
RUN pip uninstall -y nvidia-tensorboard nvidia-tensorboard-plugin-dlprof
RUN pip install --no-cache -r yolov5/requirements.txt coremltools onnx gsutil notebook wandb>=0.12.2
RUN pip install --no-cache -U torchvision numpy Pillow
RUN apt install -y libglib2.0-0  # TODO: move up

ADD train.sh /usr/src/app/train.sh


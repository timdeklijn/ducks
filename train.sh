#!/bin/bash

# Run this in the docker container

python yolov5/train.py \
  --img 640 \
  --batch 2 \
  --epochs 2 \
  --data data/ducks.yaml \
  --weights yolov5s.pt; \

echo "saving output"
cp -r yolov5/runs/train/ data/models/run/

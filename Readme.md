# Cats

Object detection stuff to play around with some MLOps/CD4ML concepts.

## CVAT

To mount a local folder add the following to the CVAT directory.

``` yml
version: '3.3'

services:
  cvat:
    environment:
      CVAT_SHARE_URL: 'Mounted from /mnt/share host directory'
    volumes:
      - cvat_share:/home/django/share:ro

volumes:
  cvat_share:
    driver_opts:
      type: none
      device: /mnt/share
      o: bind
```

## Data

- Label data using [makesense.ai](www.makesense.ai)
- Start simple and automate adding data
- Think about data versioning
- Grow data based on `production`

## Model

- Create a [Yolov5](https://github.com/ultralytics/yolov5) git submodule
- Train a model
- Convert/Export it

## Inference

- Rust/Golang: ONNX
- API?

## Usage

To start training a model:

``` sh
make train
```

## Logs

### 2021-12-13

Got initial training working. Need more data or more images.

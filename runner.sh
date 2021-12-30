#!/bin/bash

TAG="yolo-img"

# clearly print a sting
log_print () {
  local s=$1
  echo "================================================================================"
  echo $s
  echo "================================================================================"
  echo ""
}

case $1 in
  # Clean up local docker repository
  "docker-clean")
    docker system prune -a --volumes
    ;;
  "docker-build")
    # Build a yolov5 image. We move into the yolo directory because during the
    # build process files are being copied.
    log_print "building docker containter"

    docker build -t $TAG  .
    ;;

  "docker-train-cpu")
    # train a model using a docker image and NO GPU. This can only be run in the
    # root directory of this project where the folders `data` and `datasets` are
    # present.
    log_print "training model using docker image (CPU)"
    echo "$(pwd)/data:"

    docker run --rm \
      -v $(pwd)/data:/usr/src/app/data \
      -v $(pwd)/datasets:/usr/src/app/datasets \
      $TAG \
      ./train.sh
    ;;

  "docker-train-gpu")
    # train a model using a docker image and GPU. This can only be run in the
    # root directory of this project where the folders `data` and `datasets` are
    # present.
    log_print "training model using docker image (GPU)"

    docker run --rm --gpus all \
      -v $(pwd)/data:/usr/src/app/data \
      -v $(pwd)/datasets:/usr/src/app/datasets \
      $TAG \
      ./train.sh
    ;;
  "*")
    echo "unknown command"
    ;;
esac


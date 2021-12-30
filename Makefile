.PHONY: train

train:
	python yolov5/train.py \
		--img 640 \
		--batch 2 \
		--epochs 20 \
		--data data/ducks.yaml \
		--device 'cpu' \
		--weights yolov5s.pt

# help:
# bash scripts/export_model.sh yolov3_darknet

if [ x$1 != x ]; then
  Model2Export=$1
else
  echo "The model to export is not set."
  echo "Example:"
  echo "  bash scripts/export_model.sh yolov3_darknet"
  echo "The model supported:"
  echo "  [ppyolo, yolov3_darknet]" 
fi

if [ "$Model2Export" == 'yolov3_darknet' ]; then
  # 1, Set the shape of input tensor [608,416,...]
  #    vim configs/yolo3_reader.yml, and set image_shape and target_size
  # 2, Prepare the pretrained weights
  python tools/export_model.py -c configs/yolov3_darknet.yml \
          --output_dir=./ExportedModel/ \
          -o weights=/home/jasonwang/models/paddle/pretrained/yolov3_darknet
elif [ "$Model2Export" == 'ppyolo' ]; then
  # export model at output directory(default)
  #python tools/export_model.py -c configs/ppyolo/ppyolo.yml -o weights=https://paddlemodels.bj.bcebos.com/object_detection/ppyolo.pdparams
  CUDA_VISIBLE_DEVICES=0 python deploy/python/infer.py --model_dir=output/ppyolo --image_file=demo/000000014439_640x640.jpg --use_gpu=True
fi

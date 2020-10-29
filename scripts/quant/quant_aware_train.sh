# refer: https://github.com/PaddlePaddle/PaddleDetection/tree/release/0.4/slim/quantization

echo "num: $#"

if [ $# -lt 1 ]; then
  echo "Usage: quant_aware_train.sh [model id]"
  echo "model ids: 'yolov3_mobilenet_v1'"
  echo "           'ppyolo_resnet'"

  # show command line options
  python slim/quantization/train.py --help

  # show how to override parameter in configure file
  python ./tools/configure.py help MatrixNMS

  exit 0
else
  Model2Quant=$1
fi



echo "Training Start ......"

# 设置PYTHONPATH路径
export PYTHONPATH=$PYTHONPATH:.
# GPU训练 支持单卡，多卡训练，通过CUDA_VISIBLE_DEVICES指定卡号
export CUDA_VISIBLE_DEVICES=0   #,1,2,3,4,5,6,7

#Model2Quant='yolov3_mobilenet_v1'
#Model2Quant='ppyolo_resnet'

if [ "${Model2Quant}" == 'yolov3_mobilenet_v1' ]; then
  python slim/quantization/train.py --not_quant_pattern yolo_output \
      --eval \
      -c ./configs/yolov3_mobilenet_v1.yml \
      -o max_iters=30000 \
      save_dir=./output/yolov3_mobilenet_v1 \
      LearningRate.base_lr=0.0001 \
      LearningRate.schedulers="[!PiecewiseDecay {gamma: 0.1, milestones: [10000]}]" \
      pretrain_weights=/home/jasonwang/models/paddle/pretrained/yolov3_mobilenet_v1
elif [ "${Model2Quant}" == 'ppyolo_resnet' ]; then
  python slim/quantization/train.py --not_quant_pattern yolo_output \
      --eval \
      -c ./configs/ppyolo/ppyolov.yml \
      -o max_iters=30000 \
      save_dir=./output/ppyolo_resnet \
      LearningRate.base_lr=0.0001 \
      LearningRate.schedulers="[!PiecewiseDecay {gamma: 0.1, milestones: [10000]}]" \
      pretrain_weights=/home/jasonwang/models/paddle/pretrained/ppyolo.pdparams
fi

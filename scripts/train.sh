# refer: https://github.com/PaddlePaddle/PaddleDetection/blob/release/0.4/docs/tutorials/GETTING_STARTED_cn.md

# show command line options
python tools/train.py --help

echo "Training Start ......"

# 设置PYTHONPATH路径
export PYTHONPATH=$PYTHONPATH:.
# GPU训练 支持单卡，多卡训练，通过CUDA_VISIBLE_DEVICES指定卡号
export CUDA_VISIBLE_DEVICES=0   #,1,2,3,4,5,6,7
#python tools/train.py -c configs/faster_rcnn_r50_1x.yml

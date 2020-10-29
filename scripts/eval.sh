# refer: https://github.com/PaddlePaddle/PaddleDetection/blob/release/0.4/docs/tutorials/GETTING_STARTED_cn.md

# show command line options
python tools/eval.py --help

echo "Evaluate Starting ......"

# 设置PYTHONPATH路径
export PYTHONPATH=$PYTHONPATH:.
# GPU评估
export CUDA_VISIBLE_DEVICES=0
python tools/eval.py -c configs/faster_rcnn_r50_1x.yml

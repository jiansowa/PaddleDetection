# refer: https://github.com/PaddlePaddle/PaddleDetection/blob/release/0.4/docs/tutorials/GETTING_STARTED_cn.md

# show command line options
python tools/infer.py --help

echo "Inference Starting ......"
# 设置PYTHONPATH路径
export PYTHONPATH=$PYTHONPATH:.
# GPU评估
#export CUDA_VISIBLE_DEVICES=0

# 预测
python tools/infer.py -c configs/faster_rcnn_r50_1x.yml --infer_img=demo/000000570688.jpg
#python tools/infer.py -c configs/faster_rcnn_r50_1x.yml -o weights=/home/jasonwang/models/paddle/pretrained/ResNet50_cos_pretrained --infer_img=demo/000000014439_640x640.jpg
#python tools/infer.py -c configs/ppyolo/ppyolo.yml -o use_gpu=true weights=https://paddlemodels.bj.bcebos.com/object_detection/ppyolo.pdparams --infer_img=demo/000000014439.jpg
#python tools/infer.py -c configs/ppyolo/ppyolo.yml -o use_gpu=true weights=/home/jasonwang/models/paddle/pretrained/ppyolo.pdparams --infer_img=demo/000000014439.jpg



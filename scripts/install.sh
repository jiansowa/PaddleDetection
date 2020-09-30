
# Install PaddlePaddle

# PaddleDetection PaddlePaddle
# v0.4            >1.8.4

# gpu
#python -m pip install paddlepaddle-gpu==1.8.4.post107 -i https://mirror.baidu.com/pypi/simple
# cpu
#python -m pip install paddlepaddle==1.8.4 -i https://mirror.baidu.com/pypi/simple

# Install COCO-API
#pip install pycocotools

# Install PaddleDetection dependency
#git clone https://github.com/PaddlePaddle/PaddleDetection.git
#git clone https://github.com/jiansowa/PaddleDetection
#pip install -r requirements.txt

# Test Installation
python ppdet/modeling/tests/test_architectures.py

# Test inference
# use_gpu参数设置是否使用GPU
python tools/infer.py -c configs/ppyolo/ppyolo.yml -o use_gpu=true weights=https://paddlemodels.bj.bcebos.com/object_detection/ppyolo.pdparams --infer_img=demo/000000014439_640x640.jpg
# 会在output文件夹下生成一个画有预测结果的同名图像。


# Prepare dataset
# cd dataset/coco
# ln -s /mnt/teamserver/data/coco/annotations annotations
# ln -s /mnt/teamserver/data/coco/val2017 val2017
# ln -s /mnt/teamserver/data/coco/train2017 train2017

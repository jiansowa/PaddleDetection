
# prepare:
#   Install visualdl
#python -m pip install visualdl -i https://mirror.baidu.com/pypi/simple

# Training
python -u tools/train.py -c configs/yolov3_mobilenet_v1_roadsign.yml \
                        --use_vdl=true \
                        --vdl_log_dir=vdl_dir/scalar \
                        --eval  \
                        -o pretrain_weights=/home/jasonwang/models/paddle/pretrained/yolov3_mobilenet_v1
                        #-o dataset_dir=/home/jasonwang/data/roadsign_voc

# export model
python tools/export_model.py -c configs/yolov3_mobilenet_v1_roadsign.yml \
          --output_dir=out \
          -o weights=output/yolov3_mobilenet_v1_roadsign/best_model

# eval
python tools/eval.py -c configs/yolov3_mobilenet_v1_roadsign.yml -o use_gpu=true

# infer
python tools/infer.py -c configs/yolov3_mobilenet_v1_roadsign.yml -o use_gpu=true --infer_img=demo/road554.png

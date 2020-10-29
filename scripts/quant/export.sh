
ppdet_root=$(dirname $0)/../..
echo "$ppdet_root"

save_path=${ppdet_root}/quant_exported/yolov3_mobilenet_v1

python slim/quantization/export_model.py --not_quant_pattern yolo_output  -c ./configs/yolov3_mobilenet_v1.yml --output_dir ${save_path} \
-o weights=./output/yolov3_mobilenet_v1/yolov3_mobilenet_v1/best_model

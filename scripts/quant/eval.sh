
Quantized='yolo_mobilenet_v1'

if [ "${Quantized}" == 'yolo_mobilenet_v1' ]; then
  Config=./configs/yolov3_mobilenet_v1.yml
  Weights=./output/yolov3_mobilenet_v1/yolov3_mobilenet_v1/best_model
#else

fi

python slim/quantization/eval.py --not_quant_pattern yolo_output  -c ${Config} \
-o weights=${Weights}

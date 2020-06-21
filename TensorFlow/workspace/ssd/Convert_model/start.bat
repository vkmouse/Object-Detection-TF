set MODEL=model.ckpt-139135
set CONFIG=ssd_mobilenet_v1_coco.config

python Code\export_inference_graph.py --input_type image_tensor --pipeline_config_path Input\%CONFIG% --trained_checkpoint_prefix Input\%MODEL% --output_directory Temp

move Temp\frozen_inference_graph.pb Output
echo y | rmdir Temp /s

python Code\tf_text_graph_ssd.py --input Output\frozen_inference_graph.pb --config Input\pipeline.config --output Output\graph.pbtxt
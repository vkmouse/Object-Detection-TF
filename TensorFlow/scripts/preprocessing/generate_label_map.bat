set input_path=..\..\workspace\training_demo\images\annotations.txt
set output_path=..\..\workspace\training_demo\annotations\label_map.pbtxt

python generate_label_map.py %input_path% %output_path%
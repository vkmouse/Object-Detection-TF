REM generate_label_map
set input_path=..\..\workspace\training_demo\images\annotations.txt
set output_path=..\..\workspace\training_demo\annotations\label_map.pbtxt

python generate_label_map.py %input_path% %output_path%

REM generate_tfrecord
set train_input_path=..\..\workspace\training_demo\images\train
set train_output_path=..\..\workspace\training_demo\annotations\train_labels.csv
set test_input_path=..\..\workspace\training_demo\images\test
set test_output_path=..\..\workspace\training_demo\annotations\test_labels.csv

python xml_to_csv.py -i %train_input_path% -o %train_output_path%
python xml_to_csv.py -i %test_input_path% -o %test_output_path%

REM xml_to_csv
set labels_path=..\..\workspace\training_demo\images\annotations.txt
set train_csv_input=..\..\workspace\training_demo\annotations\train_labels.csv
set train_output_path=..\..\workspace\training_demo\annotations\train.record
set train_img_path=..\..\workspace\training_demo\images\train
set test_csv_input=..\..\workspace\training_demo\annotations\test_labels.csv
set test_output_path=..\..\workspace\training_demo\annotations\test.record
set test_img_path=..\..\workspace\training_demo\images\test

python generate_tfrecord.py --labels_path=%labels_path% --csv_input=%train_csv_input% --output_path=%train_output_path% --img_path=%train_img_path%
python generate_tfrecord.py --labels_path=%labels_path% --csv_input=%test_csv_input% --output_path=%test_output_path% --img_path=%test_img_path%
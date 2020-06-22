set train_input_path=..\..\workspace\training_demo\images\train
set train_output_path=..\..\workspace\training_demo\annotations\train_labels.csv
set test_input_path=..\..\workspace\training_demo\images\test
set test_output_path=..\..\workspace\training_demo\annotations\test_labels.csv

python xml_to_csv.py -i %train_input_path% -o %train_output_path%
python xml_to_csv.py -i %test_input_path% -o %test_output_path%
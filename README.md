# TensorFlow Object Detection Tutorial

This tutorial describes how to train with tensorflow framework and inference with OpenCV.

## Enviroment

- Windows 10
- Nvidia GPU driver (446.14)
- Nvidia CUDA (10.0)
- Nvidia cuDNN (7.6.5)
- Python (3.7.0)
- Tensorflow (1.15)

## Install Tensorflow Enviroment

1. [Install Nvidia driver](https://www.nvidia.com.tw/Download/index.aspx)

2. [Install CUDA (10.0)](https://developer.nvidia.com/cuda-toolkit-archive)

    2.1 Add the following path entry to the system variable

        C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\bin
        C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\libnvvp
        C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\include
        C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\extras\CUPTI\libx64

3. Extract the contents of the zip ([cuDNN 7.6.5](https://developer.nvidia.com/cudnn)) file to ```C:\tools```

    3.1 Add the following path entry to the system variable
          
        C:\tools\cuda\bin

4. [Install Python (3.7)](https://www.python.org/downloads/)

    4.1. Add the following path entry to the system variable

        C:\Users\VKmouse\AppData\Local\Programs\Python\Python37
        C:\Users\VKmouse\AppData\Local\Programs\Python\Python37\Scripts

5. Install Microsoft Visual C++ Redistributable for Visual Studio 2015, 2017 and 2019 ([vc_redist.x64.exe](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads))

6. Install virtualenv 

    ```pip3 install -U pip virtualenv```

7. Create a virtual enviroment

    ```virtualenv --system-site-packages -p python3 ./Tensorflow_1.15```

8. Start the virtual enviroment 

    ```.\Tensorflow_1.15\Scripts\activate```

9. Install Prerequisites

    ```pip install --upgrade pip```
    
    ```pip install pillow lxml jupyter matplotlib opencv-python pathlib jupyterlab tensorflow==1.15 tf-slim```

10. Test Tensorflow
    
    ```python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"```

11. [Install Protobuf](https://github.com/protocolbuffers/protobuf/releases)

12. Extract the contents of the protoc-*-*.zip to ```C:\Program Files\Google Protobuf```

    12.1 Add the following path entry to the system variable
          
        C:\Program Files\Google Protobuf

13. Compile Protobuf
    
    ```# From within TensorFlow/models/research/```

    ```for /f %i in ('dir /b object_detection\protos\*.proto') do protoc object_detection\protos\%i --python_out=.```

14. Adding necessary Environment Variables
    
    ```# From within TensorFlow/models/research/```

    ```pip install .```

    14.1 Add research/slim to your PYTHONPATH

        C:\Users\VKmouse\Documents\TensorFlow\models\research\slim

## Training Custom Object Detector

This document refer to the [tensorflow obeject detection api tutorial](https://tensorflow-object-detection-api-tutorial.readthedocs.io/en/latest/training.html)

1. Prepare dataset
   
   1.1 Put the image (\*.jpg) and annotation(\*.xml) to ```TensorFlow\workspace\training_demo\images```

2. Creating Label Map (```label_map.pbtxt```) to ```TensorFlow\workspace\training_demo\annotations```

    <pre><code>
    item {
        id: 1
        name: 'cat'
    }

    item {
        id: 2
        name: 'dog'
    }
    </code></pre>

3. Creating TensorFlow Records (Converting *.xml to *.csv)

    ```TensorFlow\scripts\preprocessing\xml_to_csv.bat```

4. Creating TensorFlow Records (Converting from *.csv to *.record)

    ```TensorFlow\scripts\preprocessing\generate_tfrecord.bat```

5. Configuring a Training Pipeline (pre-training model)

6. Training the Model

    ```python train.py --logtostderr --train_dir=training/ --pipeline_config_path=training/ssd_inception_v2_coco.config```

## Inference Engine with OpenCV
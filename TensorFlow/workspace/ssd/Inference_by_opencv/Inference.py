import tensorflow as tf
import cv2

frozen_inference_graph = 'frozen_inference_graph.pb'
graph = 'graph.pbtxt'
cvNet = cv2.dnn.readNetFromTensorflow(frozen_inference_graph, graph)

img = cv2.imread('img_2510.jpg')
rows = img.shape[0]
cols = img.shape[1]
print(rows, cols)

cvNet.setInput(cv2.dnn.blobFromImage(img, size=(300, 300), swapRB=True, crop=False))
cvOut = cvNet.forward()

for detection in cvOut[0,0,:,:]:
    score = float(detection[2])
    if score > 0.3:
        left = detection[3] * cols
        top = detection[4] * rows
        right = detection[5] * cols
        bottom = detection[6] * rows
        cv2.rectangle(img, (int(left), int(top)), (int(right), int(bottom)), (23, 230, 210), thickness=2)
        cv2.putText(img, str(score), (int(right), int(bottom)), cv2.FONT_HERSHEY_SIMPLEX, 1, (23, 230, 210), 2)
cv2.imshow('img', img)
cv2.waitKey()
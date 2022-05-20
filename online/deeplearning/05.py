import tensorflow as tf
import tensorflow.keras.utils as utils
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Activation
import numpy as np
import matplotlib.pyplot as plt
import random

# 훈련 데이터셋 준비하기
x_data = []
for i in range(100):
  x_data.append([random.randint(7, 20),random.randint(80, 130)]) #오렌지 [크기, 무게]
  x_data.append([random.randint(1, 10),random.randint(50, 100)]) #귤 [크기, 무게]
y_data = []
for i in range(100):
  y_data.append(1) #오렌지
  y_data.append(0) #귤


X_train = np.array(x_data)
Y_train = np.array(y_data)

# 테스트 데이터셋 준비하기
x_data = []
for i in range(10):
  x_data.append([random.randint(7, 20),random.randint(80, 130)]) 
  x_data.append([random.randint(1, 10),random.randint(50, 100)]) 
y_data = []
for i in range(10):
  y_data.append(1) #오렌지
  y_data.append(0) #귤

X_test = np.array([x_data])
X_test = X_test.reshape(20,2)
Y_test = np.array([y_data])
Y_test = Y_test.reshape(20,)

model = Sequential()
model.add(Dense(20, input_dim=2, activation='relu'))
model.add(Dense(10, activation='relu'))
model.add(Dense(1, activation='sigmoid'))

model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])

#  모델 학습시키기
hist = model.fit(X_train, Y_train, epochs=200, batch_size=10, validation_data=(X_train,Y_train),verbose=1)


fig, loss_ax = plt.subplots()

acc_ax = loss_ax.twinx()

loss_ax.plot(hist.history['loss'], 'y', label='train loss')
loss_ax.plot(hist.history['val_loss'], 'r', label='val loss')

acc_ax.plot(hist.history['accuracy'], 'b', label='train acc')
acc_ax.plot(hist.history['val_accuracy'], 'g', label='val acc')

loss_ax.set_xlabel('epoch')
loss_ax.set_ylabel('loss')
acc_ax.set_ylabel('accuray')

loss_ax.legend(loc='upper left')
acc_ax.legend(loc='lower left')

plt.show()

x_test = np.array([[50,150],[80,180],[75,170],[60,150],[45,155]])
x_test = x_test.reshape(5,2)
y_test = np.array([1,0,0,1,1])
scores = model.evaluate(X_test, Y_test)
print("%s: %.2f%%" %(model.metrics_names[1], scores[1]*100))

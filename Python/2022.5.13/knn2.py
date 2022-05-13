import numpy as np
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.datasets import load_iris
import matplotlib.pyplot as plt

path = '/Users/bohyenkang/Downloads/csv/iris.csv'
df = pd.read_csv(path)
data = np.array(df[['sepal.length', 'sepal.width', 'petal.length', 'petal.width']])
target = np.array(df[['variety']])
tnames = np.unique(target)

train_xs, test_xs, train_ys, test_ys = train_test_split(data, target, test_size=0.2)
knc_model = KNeighborsClassifier()
knc_model.fit(train_xs, train_ys)  # 학습
pred_val2 = knc_model.predict(test_xs)  # 예측
test_ys = test_ys.reshape(30, )
pred_val2 = pred_val2.tolist()
test_ys = test_ys.tolist()

print(f'예측 결과:{pred_val2}')
print(f'실제 결과:{test_ys}')

print(knc_model.score(test_xs, test_ys))  # 평가 스코어

plt.plot(pred_val2, 'ro', label='predict')
plt.plot(test_ys, 'b.', label='actual')
plt.xlabel('test xs index')
plt.ylabel('sepal-width')
plt.legend()
plt.title('iris - setosa')
plt.show()

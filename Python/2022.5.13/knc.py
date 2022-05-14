import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

path = '/Users/bohyenkang/Downloads/csv/iris.csv'
df = pd.read_csv(path)

data = df[['sepal.length', 'sepal.width']].to_numpy()
target = df[['variety']].to_numpy()
target_name = np.unique(target)

train_input, test_input, train_target, test_target = train_test_split(data, target)

mean = np.mean(train_input, axis=0)
std = np.std(train_input, axis=0)
train_scald = (train_input - mean) / std
test_scald = (test_input - mean) / std

kn = KNeighborsClassifier()
kn.fit(train_scald, train_target)
print(kn.score(test_scald, test_target))
print(kn.predict([[10.0,25.0]]))
print(kn.predict([[2.0,2.5]]))



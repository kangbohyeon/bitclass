import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
path = '/Users/bohyenkang/Desktop/csv/Fish.csv'
fish = pd.read_csv(path)
fish_input = fish[['Weight', 'Length2', 'Length3', 'Height', 'Width']].to_numpy()
fish_target = fish[['Species']].to_numpy()

train_input, test_input, train_target, test_target = train_test_split(fish_input,fish_target)

ss = StandardScaler()
ss.fit(train_input)
train_scaled = ss.transform(train_input)
test_scaled = ss.transform(test_input)

kn = KNeighborsClassifier(n_neighbors=3)
kn.fit(train_scaled,train_target)
print(kn.score(train_scaled,train_target))
print(kn.score(test_scaled,test_target))
print(fish['Species'].unique(), 'unique')
print(kn.classes_, 'class')
print(kn.predict(test_scaled[:6]))
print(fish_target[:6])
proba = kn.predict_proba(test_scaled[:6])
print(np.round(proba,decimals=4))


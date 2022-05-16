import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import SGDClassifier
path = '/Users/bohyenkang/Desktop/csv/Fish.csv'
fish = pd.read_csv(path)
fish_input = fish[['Weight', 'Length2', 'Length3', 'Height', 'Width']].to_numpy() # input
fish_target = fish['Species'].to_numpy()  #target

train_input, test_input, train_target, test_target = train_test_split(fish_input,fish_target)
ss = StandardScaler()
ss.fit(train_input)
train_scaled = ss.transform(train_input)
test_scaled = ss.transform(test_input)

sc =SGDClassifier(loss='log',max_iter=1000)
sc.fit(train_scaled,train_target)
print(sc.score(train_scaled,train_target))
print(sc.score(test_scaled,test_target))




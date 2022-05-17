import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_validate
from sklearn.ensemble import RandomForestClassifier

path = '/Users/bohyenkang/Desktop/csv/wine2.csv'
wine = pd.read_csv(path)
data = wine[['alcohol', 'sugar', 'pH']].to_numpy()
target = wine['class'].to_numpy()

train_input, test_input, train_target, test_target = train_test_split(data, target, test_size=0.2)
rf = RandomForestClassifier(oob_score=True,n_jobs=-1)
scores = cross_validate(rf,train_input,train_target,return_train_score=True,n_jobs=-1)
rf.fit(train_input,train_target)
print(np.mean(scores['train_score']),np.mean(scores['test_score']))
print(rf.feature_importances_)
print(rf.score(train_input,train_target))
print(rf.score(test_input,test_target))

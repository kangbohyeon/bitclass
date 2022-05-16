import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from scipy.special import softmax
path = '/Users/bohyenkang/Desktop/csv/Fish.csv'
fish = pd.read_csv(path)
fish_input = fish[['Weight', 'Length2', 'Length3', 'Height', 'Width']].to_numpy() # input
fish_target = fish['Species'].to_numpy()  #target

train_input, test_input , train_target, test_target = train_test_split(fish_input,fish_target) # 데이터 추출

ss = StandardScaler() #scaled
ss.fit(train_input)
train_scaled = ss.transform(train_input)
test_scaled = ss.transform(test_input)

lr = LogisticRegression(C=20,max_iter=1000)  #muti_logistic
lr.fit(train_scaled,train_target)
# print(lr.score(train_scaled,train_target))
# print(lr.score(test_scaled,test_target))
print(lr.classes_)
print(lr.predict(test_scaled[:5]))
# proba = lr.predict_proba(test_scaled[:5]) #softmax랑 같은 결과
# print(np.round(proba,decimals=3))
# print()
decision = lr.decision_function(test_scaled[:5])  # softmax
proba = softmax(decision,axis=1)
print(np.round(proba,decimals=3))

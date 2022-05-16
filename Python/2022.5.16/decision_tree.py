import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.tree import DecisionTreeClassifier
from sklearn.tree import plot_tree
path = '/Users/bohyenkang/Desktop/csv/wine2.csv'
wine = pd.read_csv(path)
data = wine[['alcohol','sugar','pH']].to_numpy()
target = wine['class'].to_numpy()

train_input, test_input, train_target, test_target = train_test_split(data,target,test_size=0.2)
ss = StandardScaler()
ss.fit(train_input)
train_scaled = ss.transform(train_input)
test_scaled = ss.transform(test_input)

dt = DecisionTreeClassifier()
dt.fit(train_scaled,train_target)
print(dt.score(train_scaled,train_target))
print(dt.score(test_scaled,test_target))

plt.figure(figsize=(10,7))
plot_tree(dt)
'''
테스트조건(sugar)
불순도(gini) : 노드에서 데이터를 분할할 기준을 정해줌
지니불순도 계산식 : 1-(음성클래스비율 ^2 + 양성클래스비율^2)
정보이득 : 부모와 자식노드사이의 불순도 차이
총 샘플수(samples) : 
클래스별 샘플수(value)

'''
plt.show()




import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.neighbors import KNeighborsClassifier
from sklearn.neighbors import KNeighborsRegressor
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import PolynomialFeatures
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import Ridge
from sklearn.linear_model import Lasso
path = '/Users/bohyenkang/Desktop/csv/Fish.csv'
df = pd.read_csv(path)
p_df = df[df['Species']=='Perch']
perch_full = np.array(p_df[['Length2','Height','Width']])
perch_weight = np.array(p_df['Weight'])
train_input, test_input, train_target, test_target = train_test_split(perch_full,perch_weight)

poly = PolynomialFeatures(include_bias=False)
poly.fit(train_input)
train_poly = poly.transform(train_input)
test_poly = poly.transform((test_input))

ss = StandardScaler()
ss.fit(train_poly)
train_scaled = ss.transform(train_poly)
test_scaled = ss.transform((test_poly))

#릿지 or 라쏘

lr = LinearRegression()
lr.fit(train_poly,train_target)
print(lr.score(train_poly,train_target))
print(lr.score(test_poly,test_target))






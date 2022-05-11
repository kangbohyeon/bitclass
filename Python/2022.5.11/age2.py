import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
plt.rc('font', family='AppleGothic') # mac
df = pd.read_csv('/Users/bohyenkang/Downloads/train_titanic.csv')
data = df['Age']
h,b =np.histogram(data.values,bins=[0,17,34,65,200])
plt.pie(h,labels=['아동','청소년','어른','노인'],autopct='%.2f%%')
plt.rc('font', family='AppleGothic') # mac
plt.show()

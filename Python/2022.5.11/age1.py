import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
plt.rc('font', family='AppleGothic') # mac
df = pd.read_csv('/Users/bohyenkang/Downloads/train_titanic.csv')
data = df['Age']
a = data.value_counts()
au =0
ui=0
aud=0
peo =0
b = []
for i in range(len(a)):
    if a.index[i]< 18:
        au+=a.values[i]
    elif a.index[i]< 35:
        ui+=a.values[i]
    elif a.index[i]< 66:
        aud+=a.values[i]
    else :
        peo+=a.values[i]

b.append(au)
b.append(ui)
b.append(aud)
b.append(peo)
c = pd.Series(b)
plt.pie(c,labels=['아동','청소년','어른','노인'],autopct='%.2f%%')
plt.rc('font', family='AppleGothic') # mac
plt.show()

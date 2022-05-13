import numpy as np
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.datasets import load_iris
import matplotlib.pyplot as plt
def distance(x1, x2):
  if isinstance(x1,int) and isinstance(x2,int):
    return np.abs(x2-x1)
  assert len(x1)==len(x2), "두 개의 벡터의 원소 개수는 같아야 합니다."
  return sum((x1-x2)**2)**(1/2)  #각 항목마다 제곱한 후에 루트를 취한 값입니다.

def find_k_nearest_neighbor_c(xs,ys,tx,k=5):
  sarr=[]
  #xs 목록의 항목과 tx의 거리를 측정하여 거리와 인덱스를 sarr에 보관합니다.
  for i,x in enumerate(xs):
    dis = distance(x,tx)
    sarr.append((dis,i))
  #거리로 정렬합니다.
  sarr.sort(key=lambda x:x[0])
  k = min(k,len(sarr))
  #어떠한 클래스에 속하는 지 분포를 파악합니다.
  nd = {}
  for x in sarr[:k]:
    neighbor = ys[x[1]]
    if neighbor in nd:
      nd[neighbor]+=1
    else:
      nd[neighbor]=0
  return max(nd, key=nd.get) #가장 많이 나온 클래스로 판별하여 반환합니다.


def find_k_nearest_neighbors_c(xs,ys,t_xs,k=5):
  return np.array([find_k_nearest_neighbor_c(xs,ys,tx,k) for tx in t_xs])

def evaluate(actual_ys, predict_ys):
  correct_cnt = 0
  for i,y in enumerate(actual_ys):
    if predict_ys[i] == actual_ys[i]: #일치하면
      correct_cnt+=1
  return correct_cnt/len(actual_ys) #맞춘 개수/ 전체 개수

iris_data = load_iris()
data = iris_data['data']
target = iris_data['target']
tnames = iris_data['target_names']
for i,y in enumerate(target):
    print(f'{i}: {tnames[y]}')

train_xs, test_xs, train_ys, test_ys = train_test_split(data,target,test_size=0.2)

pred_val = find_k_nearest_neighbors_c(train_xs,train_ys,test_xs)

print(f'예측 결과:{pred_val}')
print(f'실제 결과:{test_ys}')


plt.plot(pred_val,'ro',label='predict')
plt.plot(test_ys,'b.',label='actual')
plt.xlabel('test xs index')
plt.ylabel('sepal-width')
plt.yticks([0,max(max(pred_val),max(test_ys))])
plt.legend()
plt.title('iris - setosa')
plt.show()

print(evaluate(test_ys,pred_val))






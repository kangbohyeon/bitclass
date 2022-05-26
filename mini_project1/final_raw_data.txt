import pandas as pd

path = '/Users/bohyenkang/PycharmProjects/pythonProject/ori_csv/2014_1.csv'
path2 = '/Users/bohyenkang/PycharmProjects/pythonProject/score_data/2014.csv'
df = pd.read_csv(path)
df2 = pd.read_csv(path2)
b = df2.drop(df2.columns[[0,1]],axis=1)
#print(b)
new_df = pd.concat([df,b],axis=1)
new_df.to_csv('final_2014.csv',index=True)
#a = new_df.drop(new_df.columns[[11]],axis=1)
#print(new_df)
#print(a)

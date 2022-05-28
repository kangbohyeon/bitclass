import pandas as pd

path = '/Users/bohyenkang/Downloads/sec.csv'
df = pd.read_csv(path)

df2 = df[['영화명','장르','제작국가','배우','감독','평점']] # 필요한거만 추출 = df2

df3 = df2[['배우']]
df3 = df3.replace(regex=r'^|.$', value='')  #앞뒤 | 제거
a=[]
for i in range(len(df2)):
    a.append(df3.loc[i][0].replace('|',','))   #안에   |  
    
data = {
    '배우': a
}

df4 = pd.DataFrame(data)    
df5 = df2.drop(['배우'],axis=1)
new_df2 = pd.concat([df5,df4],axis=1)
new_df2.to_csv('new_df2.csv',index=True)

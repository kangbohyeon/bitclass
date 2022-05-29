#final_data

import pandas as pd
import random
path ='/Users/bohyenkang/new_df2.csv'
df = pd.read_csv(path)
df = df.drop(index=df[df['평점']==10].index)
df = df.drop(index=df[df['평점']==0].index)
df = df.rename(columns={'Unnamed: 0' : 'movie_id'})
df = df.rename(columns={'영화명' : 'title'})
df = df.rename(columns={'장르' : 'genre'})
df = df.rename(columns={'제작국가' : 'country'})
df = df.rename(columns={'감독' : 'director'})
df = df.rename(columns={'제작국가' : 'country'})
df = df.rename(columns={'평점' : 'avg_rating'})
df = df.rename(columns={'배우' : 'actor'})
df = df.rename(columns={'제작연도' : 'year'})

a = []
b = []
for i in range(len(df)):
    x = random.randint(1,400)
    y = random.randint(1,5)
    a.append(x)
    b.append(y)
    
data = {
    'user_id':a,
    'rating': b
}

df4 = pd.DataFrame(data)    
new_df3 = pd.concat([df,df4],axis=1)
new_df2.to_csv('new_df3.csv',index=True)

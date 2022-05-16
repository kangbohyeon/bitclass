import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.tree import DecisionTreeClassifier
from sklearn.tree import plot_tree
from sklearn.model_selection import GridSearchCV
from scipy.stats import uniform, randint
from sklearn.model_selection import RandomizedSearchCV

path = '/Users/bohyenkang/Desktop/csv/wine2.csv'
wine = pd.read_csv(path)
data = wine[['alcohol', 'sugar', 'pH']].to_numpy()
target = wine['class'].to_numpy()

train_input, test_input, train_target, test_target = train_test_split(data, target, test_size=0.2)

params = {
    'min_impurity_decrease': uniform(0.0001, 0.001),
    'max_depth': randint(20, 50),
    'min_samples_split': randint(2, 25),
    'min_samples_leaf': randint(1, 25)
}
gs = RandomizedSearchCV(DecisionTreeClassifier(), params, n_iter=1000, n_jobs=-1)
gs.fit(train_input, train_target)
dt = gs.best_params_
print(dt)
print(np.max(gs.cv_results_['mean_test_score']))
# print(dt.score(train_input,train_target))
dt = gs.best_estimator_
print(dt.score(test_input, test_target))

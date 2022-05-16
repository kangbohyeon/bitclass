import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.tree import DecisionTreeClassifier
from sklearn.tree import plot_tree
from sklearn.model_selection import GridSearchCV

path = '/Users/bohyenkang/Desktop/csv/wine2.csv'
wine = pd.read_csv(path)
data = wine[['alcohol', 'sugar', 'pH']].to_numpy()
target = wine['class'].to_numpy()

train_input, test_input, train_target, test_target = train_test_split(data, target, test_size=0.2)

params = {
    'min_impurity_decrease': [0.0001, 0.001, 0.01, 0.1, 0.2],
    'max_depth': range(5, 20),
    'min_samples_split': range(2, 100, 10)
}
gs = GridSearchCV(DecisionTreeClassifier(), params, n_jobs=-1)
gs.fit(train_input, train_target)
dt = gs.best_params_
print(dt)
print(np.max(gs.cv_results_['mean_test_score']))

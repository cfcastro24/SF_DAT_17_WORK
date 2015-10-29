#import packages

import numpy as np
from pandas import Series, DataFrame
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import datetime

#Import Data
#data = pd.read_csv('~/charlie_dev/SF_DAT_17_WORK/labs/data/crime_train.csv')
data = pd.read_csv('~/charlie_dev/SF_DAT_17_WORK/labs/data/crime_train.csv')


### Exploratory Data Analysis!!!! ####
data.head()
data.info()

data['Hour'] = data.apply(lambda x: datetime.datetime.strptime(x['Dates'], "%Y-%m-%d %H:%M:%S").hour, axis = 1)
data['Weekend'] = data.DayOfWeek.map({'Monday':0, 'Tuesday':0, 'Wednesday':0, 'Thursday':0, 'Friday':0, 'Saturday':1, 'Sunday':1})

data.head()


#crime by cat
data.Category.value_counts().plot(kind='bar')
data.Category.value_counts() / data.Category.shape[0]
data.Category.value_counts()

#count of crime by neighborhood
data.PdDistrict.value_counts().plot(kind='bar')


for neigh in data.PdDistrict.unique():
   fig = plt.figure()    
   neighborhood = data[data.PdDistrict == neigh].groupby([data.Category]).X.count()
   neighborhood.plot(axes=fig, kind='bar', title = neigh)
   
for neigh in data.PdDistrict.unique():
   fig = plt.figure()    
   neighborhood = data[data.PdDistrict == neigh].groupby([data.Hour]).X.count()
   neighborhood.plot(axes=fig, kind='bar', title = neigh)

data.groupby([data.Category]).Hour.mean()
data.groupby([data.PdDistrict]).Hour.mean()


data[data.PdDistrict == 'SOUTHERN'].Hour.value_counts(sort=False).plot(kind='bar')

#### KNN ###
from sklearn.neighbors import KNeighborsClassifier
X4, y4 = data[data.PdDistrict == 'SOUTHERN'][['X', 'Y','Hour', 'Weekend']], data[data.PdDistrict == 'SOUTHERN']['Category']
X1, y1 = data[data.PdDistrict == 'SOUTHERN'][['Hour', 'Weekend']], data[data.PdDistrict == 'SOUTHERN']['Category']

"""
X.shape
knn = KNeighborsClassifier(n_neighbors=3)
knn.fit(X, y)
knn.score(X, y)
"""

from sklearn.grid_search import GridSearchCV
knn = KNeighborsClassifier()
k_range = range(1, 50, 10)
param_grid = dict(n_neighbors=k_range)
grid = GridSearchCV(knn, param_grid, cv=5, scoring='accuracy')
grid.fit(X4, y4)

# this will check K=1, K=2, all the way up to 30,
# and then do cross validation on each one!
# thats 30 * 5 = 150 fits and scoring!

# check the results of the grid search
grid.grid_scores_
grid_mean_scores = [result[1] for result in grid.grid_scores_]

# plot the results
plt.figure()
plt.plot(k_range, grid_mean_scores)


grid.best_score_     # shows us the best score
grid.best_params_    # shows us the optimal parameters
grid.best_estimator_ # this is the actual model


## Logistical Regression ##

from sklearn.cross_validation import train_test_split
from sklearn import metrics
from sklearn.linear_model import LogisticRegression
X_train, X_test, y_train, y_test = train_test_split(X4, y4, random_state=1)

logreg = LogisticRegression(C=1e9)
logreg.fit(X_train, y_train)

print 'intercept and coefficient'
print logreg.intercept_ 
print logreg.coef_

y_preds = logreg.predict(X_test)

confusion = metrics.confusion_matrix(y_test, y_preds)

testResults = pd.DataFrame(zip(y_preds, y_test), columns = ['Prediction','Actual'])
testResults['Correct'] = testResults.Prediction == testResults.Actual 

print 'accuracy:'
print testResults['Correct'].sum() / float(testResults.shape[0]) 
print metrics.accuracy_score(testResults.Actual, testResults.Prediction)

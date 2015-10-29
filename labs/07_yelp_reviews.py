"""
## Class 7 Homework: Yelp Reviews
This assignment uses a small subset of the data from Kaggle's [Yelp Business Rating Prediction](https://www.kaggle.com/c/yelp-recsys-2013) competition.

**Description of the data:**

`yelp.csv` (in the data folder) contains the Yelp ratings data
* Each observation in this dataset is a review of a particular business by a particular user.
* The "stars" column is the number of stars (1 through 5) assigned by the reviewer to the business. (Higher stars is better.)
* The "cool" column is the number of "cool" votes this particular review received from other Yelp users. There is no limit to how many "cool" votes a review can receive.
* The "useful" and "funny" columns are similar to the "cool" column.

**Homework tasks:**

1. Read `yelp.csv` into a DataFrame.
2. Explore the relationship between each of the vote types (cool/useful/funny) and the number of stars.
3. Define cool/useful/funny as the features, and stars as the response.
4. Fit a linear regression model and interpret the coefficients. Do the coefficients make intuitive sense to you? Explore the Yelp website to see if you detect similar trends.
5. Evaluate the model by splitting it into training and testing sets and computing the RMSE. Does the RMSE make intuitive sense to you?
6. Try removing some of the features and see if the RMSE improves.
7. **Bonus:** Think of some new features you could create from the existing data that might be predictive of the response. (This is called "feature engineering".) Figure out how to create those features in Pandas, add them to your model, and see if the RMSE improves.
8. **Bonus:** Compare your best RMSE on testing set with the RMSE for the "null model", which is the model that ignores all features and simply predicts the mean rating in the training set for all observations in the testing set.
9. **Bonus:** Instead of treating this as a regression problem, treat it as a classification problem and see what testing accuracy you can achieve with KNN.
10. **Bonus:** Figure out how to use linear regression for classification, and compare its classification accuracy to KNN.
"""

#import packages
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.cross_validation import train_test_split
from sklearn import metrics
import statsmodels.formula.api as smf
import seaborn as sns
import matplotlib.pyplot as plt

# 1. Read `yelp.csv` into a DataFrame.
data = pd.read_csv('~/charlie_dev/SF_DAT_17_WORK/labs/data/yelp.csv')
data.head()
data.shape()


# 2. Explore the relationship between each of the vote types (cool/useful/funny) and the number of stars.
# scatter plot in Seaborn
sns.pairplot(data, x_vars=['cool','useful','funny'], y_vars='stars', size=6, aspect=0.7, kind='reg')

sns.pairplot(data, x_vars=['cool'], y_vars='stars', size=6, aspect=0.7, kind='reg')

# 3. Define cool/useful/funny as the features, and stars as the response.
### SCIKIT-LEARN ###

# create X and y
feature_cols = ['cool', 'useful', 'funny']
X = data[feature_cols]
y = data.stars

# instantiate and fit
linreg = LinearRegression()
linreg.fit(X, y)

# print the coefficients
print linreg.intercept_
print linreg.coef_

# 4. Fit a linear regression model and interpret the coefficients. Do the coefficients make intuitive sense to you? Explore the Yelp website to see if you detect similar trends.

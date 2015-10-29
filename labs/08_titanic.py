## Class 8 Exercise: Predicting Survival on the Titanic
"""
This assignment uses data from Kaggle's [Titanic](https://www.kaggle.com/c/titanic/data) competition. `titanic.csv` is in the repo, so there is no need to download the data from the Kaggle website.

**Tasks:**

1. Read `titanic.csv` into a DataFrame.
2. Define Pclass and Parch as the features, and Survived as the response.
3. Split the data into training and testing sets. (Hint: use the train test split modules from sklearn)
4. Fit a logistic regression model and examine the coefficients to confirm that they make intuitive sense.
5. Make predictions on the testing set and calculate the accuracy.
7. Create a confusion matrix and document the model's sensitivity and specificity. (remember you should run metrics on your test classes!)
8. **Bonus:** Add Age as a feature, and calculate the testing accuracy. There will be a small issue you'll have to deal with. What is it?

Always remember to fit your model on the training data and run metrics on the test set.

"""

# 1. Read `titanic.csv` into a DataFrame.
#import packages
import pandas as pd
import numpy as np
from sklearn.cross_validation import train_test_split
from sklearn import metrics

titanic = pd.read_csv('~/charlie_dev/SF_DAT_17_WORK/labs/data/titanic.csv')
titanic.describe()
titanic.info()


# 2. Define Pclass and Parch as the features, and Survived as the response.
feature_cols = ['Pclass', 'Parch']
features = titanic[feature_cols]
response = titanic.Survived


# 3. Split the data into training and testing sets. (Hint: use the train test split modules from sklearn)
features_train, features_test = train_test_split(features)
print features_train
print features_test

response_train, response_test = train_test_split(response)
print response_train
print response_test

features_train, features_test, response_train, response_test \
= train_test_split(features, response)


# 4. Fit a logistic regression model and examine the coefficients to confirm that they make intuitive sense.
# fit a linear regression model and store the class predictions
from sklearn.linear_model import LogisticRegression
logreg = LogisticRegression(C=1e9)
logreg.fit(features_train, response_train)
assorted_pred_class = logreg.predict(features_test)

assorted_pred_class


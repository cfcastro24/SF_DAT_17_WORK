'''
Move this code into your OWN SF_DAT_15_WORK repo

Please complete each question using 100% python code

If you have any questions, ask a peer or one of the instructors!

When you are done, add, commit, and push up to your repo

This is due 7/1/2015
'''


import pandas as pd
# pd.set_option('max_colwidth', 50)
# set this if you need to

killings = pd.read_csv('~/charlie_dev/SF_DAT_17_WORK/data/police-killings.csv')
#killings = pd.read_csv('data/police-killings.csv')

killings.head()

# 1. Make the following changed to column names:
# lawenforcementagency -> agency
# raceethnicity        -> race
killings.columns
killings.rename(columns={'lawenforcementagency':'agency', 'raceethnicity':'race'}, inplace=True)

# 2. Show the count of missing values in each column
col=[]
nulls=[]
for x in killings.columns:
    col.append(x)
    nulls.append(killings[x].isnull().sum())

for i in range (0, len(col)):
    print "%s: %s" % (col[i], nulls[i])

# 3. replace each null value in the dataframe with the string "Unknown"
for x in killings.columns:
    #print killings[x].isnull()
    if killings[x].isnull().any():
        killings[x].fillna(value='Unknown', inplace=True)


# 4. How many killings were there so far in 2015?
killings[(killings.year==2015)].shape[0]

# 5. Of all killings, how many were male and how many female?

#killings.groupby('gender').count()
killings.groupby('gender').size()


# 6. How many killings were of unarmed people?
(killings.armed=='No').sum()

# 7. What percentage of all killings were unarmed?
(float((killings.armed=='No').sum())/ killings.shape[0])*100

# 8. What are the 5 states with the most killings?
killings.groupby('state').count().sort('name', ascending=False).head()

# 9. Show a value counts of deaths for each race
killings.groupby('race').count()

# 10. Display a histogram of ages of all killings
killings.age.hist()

# 11. Show 6 histograms of ages by race
killings.hist(column='age', by='race')

# 12. What is the average age of death by race
killings.groupby('race').age.mean()

# 13. Show a bar chart with counts of deaths every month
killings.groupby('month').size().plot(kind='bar')


###################
### Less Morbid ###
###################

majors = pd.read_csv('~/charlie_dev/SF_DAT_17_WORK/data/college-majors.csv')
majors.head()

# 1. Delete the columns (employed_full_time_year_round, major_code)
majors.columns
del majors['Employed_full_time_year_round']
del majors['Major_code']

# 2. Show the count of missing values in each column
col=[]
nulls=[]
for x in majors.columns:
    col.append(x)
    nulls.append(majors[x].isnull().sum())

for i in range (0, len(col)):
    print "%s: %s" % (col[i], nulls[i])


# 3. What are the top 10 highest paying majors?
#majors[['Major', 'Median']].sort('Median', ascending=False).head(10)
majors[['Major', 'Median']].sort_index(by='Median', ascending=False).head(10)



# 4. Plot the data from the last question in a bar chart, include proper title, and labels!
import matplotlib.pyplot as plt
majors[['Major', 'Median']].sort_index(by='Median', ascending=False).head(10).plot(kind='bar', title='Top 10 Paying Majors')
plt.xlabel('Major')
plt.ylabel('Salary')
plt.show()

# 5. What is the average median salary for each major category?
avg_maj_cat = majors.groupby('Major_category').Median.mean()
avg_maj_cat

# 6. Show only the top 5 paying major categories
top_maj_cat = majors.groupby('Major_category', sort=False).Median.mean()
top_maj_cat.sort(ascending=False)
top_maj_cat.head(5)

# 7. Plot a histogram of the distribution of median salaries
#how to put the majors on the 
majors.Median.plot(kind='hist', )

# 8. Plot a histogram of the distribution of median salaries by major category
majors.groupby('Major_category').Median.mean().hist()

# 9. What are the top 10 most UNemployed majors?
# What are the unemployment rates?
unemp = majors.sort_index(by = 'Unemployed', ascending = False).head(10)
unemp[['Major', 'Unemployed']]

# 10. What are the top 10 most UNemployed majors CATEGORIES? Use the mean for each category
# What are the unemployment rates?
majors.groupby('Major_category').Unemployed.mean().order(ascending = False).head(10)

# 11. the total and employed column refer to the people that were surveyed.
# Create a new column showing the emlpoyment rate of the people surveyed for each major
# call it "sample_employment_rate"
# Example the first row has total: 128148 and employed: 90245. it's 
# sample_employment_rate should be 90245.0 / 128148.0 = .7042
majors.columns
majors['sample_employment_rate'] = majors.Employed / majors.Total
majors.columns
# 12. Create a "sample_unemployment_rate" column
# this column should be 1 - "sample_employment_rate"
majors['sample_unemployment_rate'] = 1 - majors['sample_employment_rate']

#sample unemployment rate, low to high
majors[['Major', 'sample_unemployment_rate']].sort_index(by='sample_unemployment_rate', ascending=True)

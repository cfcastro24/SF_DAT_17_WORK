# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 20:06:49 2015

@author: ccastro
"""

import pandas as pd
car = pd.read_csv('https://raw.githubusercontent.com/justmarkham/DAT4/master/data/used_vehicles.csv')
car

car.corr()

car.groupby('year').count()
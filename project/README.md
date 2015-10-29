**Tire Life Prediction**
##Problem Statement
For my project I wanted to choose a real life use case and work with real life data sets which could eventually materialize into something.  Automundial or “TheTireCompany”  is a Colombian company offers a rethreading tire service for large transportation companies that have fleets of vehicles w/ hundreds to thousands of tires in use at any given moment. Once tires are worn out, these companies send the tires to TheTireCompany’s processing plant for rethreading rather than buying new ones. Based on the status of the incoming tire, these tires can either be rejected or rethreaded and sent back to the transportation company. 

##What are you trying to Predict?
The goal of this project is to be able to predict the lifespan of a tire based on a set of predictors(features).

##Ideal Next Steps (extra credit):
Once we can predict the lifetime of tire, we could take it a step further and predict when a tire needs to come in for rethreading before it is too late and the tire will get rejected by the rethreading plant. This prediction should increase the actual usage of a tire in service while reducing the number of tires that are rejected by the plant. 

##Datasets:
I’ve received several dataset in raw database extract formats from TheTireCompany’s ERP (rethreading plants) and CTW (inspection service center) systems. 

##Data Challenges:
The biggest challenge that I have right now is consolidating all the ERP and CTW raw datasets into a workable dataset. 
A lot of inaccurate, manually entered data that may skew some of the results. 

##Model Selection and Testing:
TBD
 
##Feature Selection
This is a list of initial predictors/features that seem the most relevant to start building the model. There are a couple of hundred additional features that I could eventually bring as well and test whether they have any impact on predicting a tire’s lifespan. 

-number_of_rotation
-external_carving
-central_carving
-inner_carving
-psi (tire preasure)
-min_depth
-tire_dimensions
-tire_design
-tire_position
-tire_km_driven
-tire_status
-tire_rethreads
-vehicle_km_driven
-inspection_date
-movement_date
-last_inspection_date
-last_movement_date

# Apple-Store
In this project, we simulate a client that has come to us asking for advice on what type of app would be best to build for the Apple Store. The would like to know about genres, user ratings, languages supported and more.

To start with, I conduct some exploratory data analysis (EDA) previous to the actual data analysis. This is in order to check that the data is clean and to avoid issues later on in the analysis. Firstly, we check for the number of unique IDs (i.e. unique apps) and then we check for any missing values (nulls) in the track_name, user_rating or prime_genre columns of our table. We then go on to find out the number of apps per genre. To conclude the EDA, we look at the minimun, average and maximum user ratings that have been obtained by different apps.

During the data nalysis itself, we try to gain insight into how different aspects of an app can have an impact on its popularity and, therefore, its user ratings. For instance, we compare paid and free apps, we compare apps that support fewer than 10 languages to apps that support 30+ languages, we check the genres that generally get the lowest ratings and we find out which apps are the ones that rank first in their respective genres. 

All of this analysis will help our client gain insight into what kind of app they should build to make it more popular by, for example, building an app in a genre that shows a clear gap that could be filled by our client's app. 

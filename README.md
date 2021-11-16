# Do Certain Song Characteristics Impact Likelihood of Winning a Grammy Award?

## [Our Presentation](https://docs.google.com/presentation/d/1tXXHXRAge_y_Qy1BurBvhBnOEhJT--YQzEd2NiHoDvU/edit#slide=id.p10)

## [Our Dashboard](https://public.tableau.com/views/FinalDashboard_16370375376950/WhatMakesaNomineeaWinner?:language=en-US&:display_count=n&:origin=viz_share_link)

## Our Selected Topic
Using datasets scraped from grammy.com, a graduate music and data analysis project at California Polytechnic State University in San Luis Obispo, and sourced from kaggle.com, we set out to determine whether or not certain song characteristics could predict whether or not a song, if nominated, is likely to win "Song of the Year."

## Reason for Data Selection
While one group member is a musician, the saying goes that music is a universal language.  It may be both useful and fascinating to determine whether or not certain objective and subjective song factors can help predict whether nominated songs will win.

## Source Data
Source data was originally scraped from grammy.com, compiled by a graduate music and data analysis project at California Polytechnic State University in San Luis Obispo, and these and a few other tables were sourced from kaggle.com.

## Data Preprocessing
Three original datasets were used.  The "Song of the Year" award does not go to the performing artist alone; it includes all writers.  Some data sets included the writers only, some included both writers and performing artists, and some included performing artists alone.  Some data sets only included the nominated, some included only the winners.  Preprocessing was done primarily using python and pandas.

* A dataframe of nominated, but losing songs was created from the "Song of the Year" dataset, and columns were renamed to make joining easier.
* A dataframe was then created from the "the_grammy_awards" dataset of winners, and nominee column is changed to song_name for easier concat/merge puprposes.  Data was filtered so only data for song of the year and years 1999-2019 remained.
* The winners and losers dataframes were concatenated.
* The "Name" column inthe song attribute data set was changed to "song_name" for merge purposes
* The winners and losers dataframe was then merged with the song attributes dataset.  Unfortunately, the code to completely clean various song and artist name misspellings or variations would have taken far too much time.  A "songdatadirty" dataframe was created, and then manually reviewed in Excel to ensure accurate paring of songs with song attributes.  As the final data set was not excessively large, this was the most efficient method.  The manually cleaned dataset was then saved and referenced as "songdata.csv".  See comments in code.
* Rows with no attribute data (songs that could not be matched with attribute data) were dropped, and text values were dropped that would have no bearing on winning potential such as song name, artist, year released, etc.
* Textual boolean values were converted to integers for machine learning models.
* Finally, the cleaned dataframe was created and exported as a usable dataset for machine learning models.

##  How was data split into training and testing sets
* Data was split using standard sklearn.model_selection's train_test_split.
* Features were scaled as data such as "duration" were excessively larger than other features and could have caused confusion in the models.

##  Model Choice
Multiple supervised models were explored.  It was determined Gradient Boosting Tree was the most accurate and reliable model to use for this data as other models did not provide sufficient accuracy, and performs well in training and testing (there can be a tendency to overfit in this model without appropriate learning rates the lowest rate tested that had high accuracy in training and validation was used).  This model can be used for larger datasets going back to the start of the Grammy Awards, and future awards as well. 

### Feature Selection
After determining that several features had little impact on the model, we selected features that were greater than .11 in importance.  This accounted for the vast majority of determining attributes.  The model was retrained after removal of the unimportant features.

## Confusion Matrix and Accuracy Score
The model correctly predicted all losers and 67% of the winners.  While this resulted in an overall accuracy score of .93, the final data set used was very small.  

## Description of Accuracy & Limitations of the Model.
The model appears to be ~93% accurate; however, the dataset is small.  Had we access to a larger dataset or more matched song and song characteristics, we would likely be able to have a more objective model.  As art, however, music is by nature subjective, and even some evaluations of the music in 2021 may not have been the same evaluation during the awards year in question.  This is a "for fun," kind of model.

##  Does this answer our question?
Indeed it does.  After evaluating importances and the success of the model, we can predict that (when compared with other nominees only), songs that tend to have comparatively higher:
* Valence (positivity, happiness, etc.)
* Length
* Instrumentalness (more instrumentation than their counterparts [as opposed to vocals])

And comparatively lower:
* Energy (speed, "noise")
* Loudness (recording volume of a song)

tend to win over the other nominees.

## Would we have done anything differently?
A more appropriate cleaning of the data for efficient matching of song titles with song attributes could have been done, had time allowed.  With the time alotted, a manual matching inside a .csv file made more sense, but would ultimately be too time consuming with larger data sets.  Toward the end of the project, it was discovered that while the data for our project was sourced from kaggle.com, the song attribute data originally came from a spotify API, while grammy nominee and winner information was originally scraped from grammy.com.  We discovered this too late in the process to perform the appropriate data scraping and API usage in time.  A larger dataset of all winners, losers, with all available Spotify attribute data from the history of the Grammy awards could potentially yield a more reliable model.  While again, this is a "fun" model, we would not necessarily use it to place large bets in Vegas for "Song of the Year" winner...The resulting dataset was sufficient to perform the tasks of the project, but ultimately too small to be anything other than, well, interesting and fun!
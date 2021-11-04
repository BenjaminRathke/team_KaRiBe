# Do Certain Song Characteristics Impact Likelihood of Winning a Grammy Award?

## Our Selected Topic
Using datasets scraped from grammy.com, a graduate music and data analysis project at California Polytechnic State University in San Luis Obispo, and sourced from kaggle.com, we set out to determine whether or not certain song characteristics could predict whether or not a song, if nominated, is likely to win "Song of the Year."

## Reason for Data Selection
While one group member is a musician, the saying goes that music is a universal language.  It may be both useful and fascinating to determine whether or not certain objective and subjective song factors can help predict whether nominated songs will win.

## Source Data
Source data was originally scraped from grammy.com, compiled by a graduate music and data analysis project at California Polytechnic State University in San Luis Obispo, and these and a few other tables were sourced from kaggle.com.

## Communication Protocols
We will primarily communicate utilizing an iMessage thread titled Team KaRiBe, updating each other as deliverable progress is made.  Zoom is also used for more direct communciation and explanation, while easy link and file sharing is done through Slack.

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

## Description of Accuracy & Limitations of the Model.
The model appears to be ~93% accurate; however, the dataset is small.  Had we access to a larger dataset or more matched song and song characteristics, we would likely be able to have a more objective model.  As art, however, music is by nature subjective, and even some evaluations of the music in 2021 may not have been the same evaluation during the awards year in question.  This is a "for fun," kind of model.

However, with the relatively small dataset we ended up with here, accuracy scores may not reflect reality.  

##  Does this answer our question?
Indeed it does.  After evaluating importances and the success of the model, we can predict that (when compared with other nominees only), songs that tend to have comparatively higher:
* Valence (positivity, happiness, etc.)
* Length
* Instrumentalness (more instrumentation than their counterparts [as opposed to vocals])
* Energy (speed, "noise")
* Loudness (recording volume of a song)

tend to win over the other nominees.

### Note:  this was not our original project idea.  Benjamin Rathke (author of this readme) originally sourced data from COVID-19 data and statistics, but that data did not lend itself well to the machine learning models the group wished to employ.

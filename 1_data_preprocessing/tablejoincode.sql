--This join was also created in Python.  It is done in SQL here to satisfy the requirement.
SELECT winnerslosers.song_name,  
	winnerslosers.artist, 
	winnerslosers.year, 
	winnerslosers.winner, 
	winnerslosers.title,
	winnerslosers.published_at,
	winnerslosers.updated_at,
	winnerslosers.category,
	winnerslosers.workers,
	winnerslosers.img,
	attributes."Acousticness",
	attributes."Artist",
	attributes."Danceability",
	attributes."Duration",
	attributes."Energy",
	attributes."Explicit",
	attributes."Instrumentalness",
	attributes."Liveness",
	attributes."Loudness",
	attributes."Mode",
	attributes."Popularity",
	attributes."Speechiness",
	attributes."Tempo",
	attributes."TimeSignature",
	attributes."Valence"
INTO songdatadirty
FROM winnerslosers
INNER JOIN attributes
ON winnerslosers.song_name = attributes.song_name

SELECT * FROM songdatadirty
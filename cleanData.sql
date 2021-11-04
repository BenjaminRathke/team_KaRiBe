create table if not exists grammyNominees (
	songName varchar(500),
	artist varchar,
	yearNom varchar,
	winner bool
);

copy grammyNominees
	from 'C:\Users\riley\Documents\Data Analytics\team_KaRiBe\Resources\Data\songOfTheYearAward.csv'
	delimiter ','
	csv header;

create table if not exists allSongs (
	acousticness varchar,
	album varchar,
	artist varchar,
	danceability varchar,
	duration varchar,
	energy varchar,
	explicit varchar,
	instrumentness varchar,
	liveness varchar,
	loudness varchar,
	songMode varchar,
	songName varchar,
	popularity varchar,
	speechiness varchar,
	tempo varchar,
	timeSignature varchar,
	valence varchar
);

copy allSongs
	from 'C:\Users\riley\Documents\Data Analytics\team_KaRiBe\Resources\Data\songAttributes_1999-2019.csv'
	delimiter ','
	csv header;
	
create table if not exists songData (
	songName varchar,
	artist varchar,
	yearNom varchar,
	winner bool,
	title varchar,
	category varchar,
	workers varchar,
	img	varchar,
	unnamedCol varchar,
	Acousticness varchar,
	Album varchar,
	primaryArtist varchar,
	Danceability varchar,
	Duration varchar,
	Energy varchar,
	Explicit varchar,
	Instrumentalness varchar,
	Liveness varchar,
	Loudness varchar,
	songMode int,
	Popularity varchar,
	Speechiness varchar,
	Tempo varchar,
	TimeSignature varchar,
	Valence varchar
);

copy songData
	from 'C:\Users\riley\Documents\Data Analytics\team_KaRiBe\Resources\Data\songdata.csv'
	delimiter ','
	csv header;
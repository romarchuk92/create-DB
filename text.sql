create table if not exists Genre (
	genre_id serial primary key,
	genre_name varchar(40) not null unique 
);

create table if not exists Artist (
	artist_id serial primary key,
	artist_name varchar(40) not null unique
);

create table if not exists GenerArtist (
	primary key(genere_id, artist_id),
	genere_id integer not null references Genre(genre_ID),
	artist_id integer not null references Artist(artist_ID)
);

create table if not exists Album (
	album_id serial primary key,
	album_name varchar(40) not null,
	album_year integer check (album_year >= 1979 and album_year <= 2023)	
);

create table if not exists ArtistAlbum (
	primary key(album_id, artist_id),
	album_id integer not null references Album(album_ID),
	artist_id integer not null references Artist(artist_ID)
);

create table if not exists Track (
	track_id serial primary key,
	track_name varchar(40) not null,
	track_time integer not null,
	album_id integer not null references Album(album_ID)	
);

create table if not exists Digest (
	digest_id serial primary key,
	digest_name varchar(40) not null,
	digest_year integer check (digest_year >= 1979 and digest_year <= 2023)  
);

create table if not exists TrackDigest (
	primary key(track_id, digest_id),
	track_id integer not null references Track(track_ID),
	digest_id integer not null references Digest(digest_ID)
);
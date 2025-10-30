-- ------------------------- DATABASE SPOTIFY ------------------------------

-- Create database 
Create database Spotify;

Use Spotify; 

Drop database Spotify; 

-- ------------------------TABLE 1 USERS ----------------------------------

CREATE TABLE users (
    user_id INT PRIMARY KEY,                         
    username VARCHAR(50) NOT NULL UNIQUE,            
    email VARCHAR(100) NOT NULL UNIQUE,              
    full_name VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,            
    country VARCHAR(50) DEFAULT 'India',             
    dob DATE CHECK (dob <= CURRENT_DATE),            
    signup_date DATE NOT NULL DEFAULT CURRENT_DATE,  
    is_premium BOOLEAN NOT NULL DEFAULT FALSE,       
    preferred_lang VARCHAR(10) NOT NULL DEFAULT 'en' 
); 


INSERT INTO users (user_id, username, email, full_name, password_hash, country, dob, signup_date, is_premium, preferred_lang) VALUES
(1, 'ajay', 'ajay0@example.com', 'Ajay Kumar', 'hash00', 'Canada', '1985-01-01', '2020-01-01', TRUE, 'hi'),
(2, 'maya', 'maya1@example.com', 'Maya Sharma', 'hash01', 'US', '1986-02-02', '2021-02-02', FALSE, 'hi'),
(3, 'zoe', 'zoe2@example.com', 'Zoe Adams', 'hash02', 'India', '1987-03-03', '2022-03-03', FALSE, 'fr'),
(4, 'liama', 'liam3@example.com', 'Liam Patel', 'hash03', 'US', '1988-04-04', '2023-04-04', FALSE, 'fr'),
(5, 'sara', 'sara4@example.com', 'Sara Mehra', 'hash04', 'UK', '1989-05-05', '2020-05-05', FALSE, 'de'),
(6, 'karan', 'karan5@example.com', 'Karan Singh', 'hash05', 'Canada', '1990-06-06', '2021-06-06', FALSE, 'fr'),
(7, 'anita', 'anita6@example.com', 'Anita Verma', 'hash06', 'US', '1991-07-07', '2022-07-07', FALSE, 'fr'),
(8, 'raj', 'raj7@example.com', 'Raj Gupta', 'hash07', 'Canada', '1992-08-08', '2023-08-08', FALSE, 'fr'),
(9, 'nina', 'nina8@example.com', 'Nina Iyer', 'hash08', 'India', '1993-09-09', '2020-09-09', TRUE, 'es'),
(10, 'vikram', 'vikram9@example.com', 'Vikram Nair', 'hash09', 'Germany', '1994-10-10', '2021-10-10', TRUE, 'hi'),
(11, 'asha', 'asha10@example.com', 'Asha Joshi', 'hash10', 'Canada', '1995-11-11', '2022-11-11', TRUE, 'en'),
(12, 'arjun', 'arjun11@example.com', 'Arjun Kapoor', 'hash11', 'UK', '1996-12-12', '2023-12-12', FALSE, 'fr'),
(13, 'leela', 'leela12@example.com', 'Leela Bose', 'hash12', 'India', '1997-01-13', '2020-01-13', TRUE, 'hi'),
(14, 'ravi', 'ravi13@example.com', 'Ravi Chopra', 'hash13', 'Germany', '1998-02-14', '2021-02-14', FALSE, 'de'),
(15, 'tara', 'tara14@example.com', 'Tara Reddy', 'hash14', 'US', '1999-03-15', '2022-03-15', TRUE, 'fr'),
(16, 'dev', 'dev15@example.com', 'Dev Das', 'hash15', 'India', '2000-04-16', '2023-04-16', TRUE, 'es'),
(17, 'meera', 'meera16@example.com', 'Meera Menon', 'hash16', 'Canada', '2001-05-17', '2020-05-17', FALSE, 'en'),
(18, 'kabir', 'kabir17@example.com', 'Kabir Roy', 'hash17', 'UK', '2002-06-18', '2021-06-18', TRUE, 'en'),
(19, 'simran', 'simran18@example.com', 'Simran Banerjee', 'hash18', 'India', '2003-07-19', '2022-07-19', FALSE, 'hi'),
(20, 'ishaan', 'ishaan19@example.com', 'Ishaan Malik', 'hash19', 'Germany', '2004-08-20', '2023-08-20', TRUE, 'fr');


Select* from users ;

Drop table users ; 

Truncate table users;


-- ------------------------------------------- Table - 2 artists ----------------------------------------------


CREATE TABLE artists (
    artist_id INT PRIMARY KEY,
    stage_name VARCHAR(100) NOT NULL UNIQUE,
    real_name VARCHAR(150),
    country VARCHAR(50) NOT NULL,
    debut_year INT CHECK (debut_year >= 1900 AND debut_year <= YEAR(CURDATE())),
    genre VARCHAR(50) NOT NULL,
    monthly_listeners INT DEFAULT 0 CHECK (monthly_listeners >= 0),
    followers INT DEFAULT 0 CHECK (followers >= 0),
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    label VARCHAR(100)
);

INSERT INTO artists (artist_id, stage_name, real_name, country, debut_year, genre, monthly_listeners, followers, is_verified, label) VALUES
(1, 'Arijit Singh', 'Arijit Singh', 'India', 2005, 'Bollywood', 75000000, 50000000, TRUE, 'T-Series'),
(2, 'Taylor Swift', 'Taylor Alison Swift', 'USA', 2006, 'Pop', 92000000, 70000000, TRUE, 'Republic Records'),
(3, 'Ed Sheeran', 'Edward Christopher Sheeran', 'UK', 2011, 'Pop', 85000000, 65000000, TRUE, 'Atlantic Records'),
(4, 'Shreya Ghoshal', 'Shreya Ghoshal', 'India', 2002, 'Bollywood', 45000000, 30000000, TRUE, 'Sony Music India'),
(5, 'Badshah', 'Aditya Prateek Singh Sisodia', 'India', 2012, 'Hip-Hop', 38000000, 25000000, TRUE, 'Universal Music India'),
(6, 'BTS', 'Bangtan Boys', 'South Korea', 2013, 'K-Pop', 110000000, 90000000, TRUE, 'BigHit Music'),
(7, 'Diljit Dosanjh', 'Diljit Dosanjh', 'India', 2010, 'Punjabi', 25000000, 18000000, TRUE, 'Warner Music'),
(8, 'Drake', 'Aubrey Drake Graham', 'Canada', 2009, 'Hip-Hop', 87000000, 68000000, TRUE, 'OVO Sound'),
(9, 'The Weeknd', 'Abel Tesfaye', 'Canada', 2010, 'R&B', 95000000, 75000000, TRUE, 'XO/Republic'),
(10, 'Selena Gomez', 'Selena Marie Gomez', 'USA', 2009, 'Pop', 62000000, 48000000, TRUE, 'Interscope'),
(11, 'Armaan Malik', 'Armaan Malik', 'India', 2011, 'Bollywood', 30000000, 20000000, TRUE, 'Universal Music India'),
(12, 'Charlie Puth', 'Charles Otto Puth Jr.', 'USA', 2015, 'Pop', 45000000, 32000000, TRUE, 'Atlantic Records'),
(13, 'Neha Kakkar', 'Neha Kakkar Singh', 'India', 2008, 'Bollywood', 42000000, 29000000, TRUE, 'T-Series'),
(14, 'Post Malone', 'Austin Richard Post', 'USA', 2016, 'Hip-Hop', 61000000, 44000000, TRUE, 'Republic Records'),
(15, 'Adele', 'Adele Laurie Blue Adkins', 'UK', 2008, 'Soul', 58000000, 40000000, TRUE, 'Columbia'),
(16, 'Jubin Nautiyal', 'Jubin Nautiyal', 'India', 2014, 'Bollywood', 27000000, 19000000, TRUE, 'T-Series'),
(17, 'Billie Eilish', 'Billie Eilish Pirate Baird O’Connell', 'USA', 2016, 'Pop', 99000000, 82000000, TRUE, 'Darkroom/Interscope'),
(18, 'Shawn Mendes', 'Shawn Peter Raul Mendes', 'Canada', 2014, 'Pop', 55000000, 42000000, TRUE, 'Island Records'),
(19, 'Yo Yo Honey Singh', 'Hirdesh Singh', 'India', 2005, 'Hip-Hop', 24000000, 17000000, TRUE, 'T-Series'),
(20, 'Dua Lipa', 'Dua Lipa', 'UK', 2015, 'Pop', 78000000, 60000000, TRUE, 'Warner Records');

Select* from artists ;

Drop table artists ; 

Truncate table artists ;


-- ------------------------------------------- Table - 3 artist_members  ----------------------------------------------

CREATE TABLE artist_members (
    member_id INT PRIMARY KEY,
    artist_id INT NOT NULL,
    member_name VARCHAR(150) NOT NULL,
    role VARCHAR(100) NOT NULL,
    join_year INT CHECK (join_year >= 1900 AND join_year <= YEAR(CURDATE())),
    country VARCHAR(50),
    dob DATE,
    is_active BOOLEAN DEFAULT TRUE,
    instrument VARCHAR(100),
    social_handle VARCHAR(100) UNIQUE,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO artist_members (member_id, artist_id, member_name, role, join_year, country, dob, is_active, instrument, social_handle) VALUES
(1, 6, 'RM', 'Leader/Rapper', 2013, 'South Korea', '1994-09-12', TRUE, 'Vocals', '@rkive'),
(2, 6, 'Jin', 'Vocalist', 2013, 'South Korea', '1992-12-04', TRUE, 'Vocals', '@jin'),
(3, 6, 'Suga', 'Rapper', 2013, 'South Korea', '1993-03-09', TRUE, 'Vocals', '@agustd'),
(4, 6, 'J-Hope', 'Rapper/Dancer', 2013, 'South Korea', '1994-02-18', TRUE, 'Vocals', '@uarmyhope'),
(5, 6, 'Jimin', 'Vocalist/Dancer', 2013, 'South Korea', '1995-10-13', TRUE, 'Vocals', '@j.m'),
(6, 6, 'V', 'Vocalist', 2013, 'South Korea', '1995-12-30', TRUE, 'Vocals', '@thv'),
(7, 6, 'Jungkook', 'Main Vocalist', 2013, 'South Korea', '1997-09-01', TRUE, 'Vocals', '@jungkook97'),
(8, 8, 'Drake', 'Rapper/Singer', 2009, 'Canada', '1986-10-24', TRUE, 'Vocals', '@champagnepapi'),
(9, 9, 'The Weeknd', 'Singer', 2010, 'Canada', '1990-02-16', TRUE, 'Vocals', '@theweeknd'),
(10, 2, 'Taylor Swift', 'Singer-Songwriter', 2006, 'USA', '1989-12-13', TRUE, 'Vocals/Guitar', '@taylorswift13');


Select* from artist_members ;

Drop table artist_members ; 

Truncate table artist_members ;


-- ------------------------------------------- Table - 4 albums   ----------------------------------------------

CREATE TABLE albums (
    album_id INT PRIMARY KEY,
    artist_id INT NOT NULL,
    album_name VARCHAR(150) NOT NULL,
    release_date DATE NOT NULL,
    genre VARCHAR(50) NOT NULL,
    total_tracks INT CHECK (total_tracks > 0),
    duration_min INT CHECK (duration_min > 0),
    label VARCHAR(100),
    streams BIGINT DEFAULT 0 CHECK (streams >= 0),
    is_explicit BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);


INSERT INTO albums (album_id, artist_id, album_name, release_date, genre, total_tracks, duration_min, label, streams, is_explicit) VALUES
(1, 1, 'Tum Hi Ho Collection', '2013-04-10', 'Bollywood', 12, 48, 'T-Series', 500000000, FALSE),
(2, 2, '1989', '2014-10-27', 'Pop', 16, 60, 'Republic Records', 1500000000, FALSE),
(3, 2, 'Midnights', '2022-10-21', 'Pop', 13, 55, 'Republic Records', 2000000000, FALSE),
(4, 3, 'Divide (÷)', '2017-03-03', 'Pop', 16, 59, 'Atlantic Records', 2500000000, FALSE),
(5, 3, 'Equals (=)', '2021-10-29', 'Pop', 14, 58, 'Atlantic Records', 1200000000, FALSE),
(6, 4, 'Shreya Ghoshal Hits', '2010-05-15', 'Bollywood', 15, 62, 'Sony Music India', 450000000, FALSE),
(7, 5, 'O.N.E', '2018-08-17', 'Hip-Hop', 10, 40, 'Universal Music India', 300000000, TRUE),
(8, 6, 'Love Yourself: Tear', '2018-05-18', 'K-Pop', 11, 45, 'BigHit Music', 1800000000, FALSE),
(9, 6, 'Map of the Soul: 7', '2020-02-21', 'K-Pop', 20, 75, 'BigHit Music', 2100000000, FALSE),
(10, 7, 'G.O.A.T', '2020-07-30', 'Punjabi', 16, 64, 'Warner Music', 600000000, FALSE),
(11, 8, 'Scorpion', '2018-06-29', 'Hip-Hop', 25, 90, 'OVO Sound', 2200000000, TRUE),
(12, 8, 'Certified Lover Boy', '2021-09-03', 'Hip-Hop', 21, 85, 'OVO Sound', 1800000000, TRUE),
(13, 9, 'After Hours', '2020-03-20', 'R&B', 14, 56, 'XO/Republic', 2500000000, TRUE),
(14, 9, 'Dawn FM', '2022-01-07', 'R&B', 16, 68, 'XO/Republic', 1500000000, TRUE),
(15, 10, 'Rare', '2020-01-10', 'Pop', 13, 52, 'Interscope', 700000000, FALSE),
(16, 12, 'Voicenotes', '2018-05-11', 'Pop', 13, 50, 'Atlantic Records', 800000000, FALSE),
(17, 14, 'Hollywood’s Bleeding', '2019-09-06', 'Hip-Hop', 17, 62, 'Republic Records', 1900000000, TRUE),
(18, 15, '21', '2011-01-24', 'Soul', 11, 48, 'Columbia', 2200000000, FALSE),
(19, 17, 'Happier Than Ever', '2021-07-30', 'Pop', 16, 56, 'Darkroom/Interscope', 1700000000, TRUE),
(20, 20, 'Future Nostalgia', '2020-03-27', 'Pop', 11, 47, 'Warner Records', 1600000000, FALSE);


Select* from albums ;

Drop table albums ; 

Truncate table albums ;


-- ------------------------------------------- Table - 5 album_artists   ----------------------------------------------
CREATE TABLE album_artists (
    album_artist_id INT PRIMARY KEY,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    role VARCHAR(50) NOT NULL,
    contribution VARCHAR(100),
    featured BOOLEAN DEFAULT FALSE,
    sequence_order INT DEFAULT 1,
    royalties_share DECIMAL(5,2) CHECK (royalties_share >= 0),
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO album_artists (album_artist_id, album_id, artist_id, role, contribution, featured, sequence_order, royalties_share, is_active, created_at) VALUES
(1, 1, 1, 'Primary', 'Vocals', FALSE, 1, 70.00, TRUE, '2013-04-10'),
(2, 2, 2, 'Primary', 'Vocals', FALSE, 1, 80.00, TRUE, '2014-10-27'),
(3, 3, 2, 'Primary', 'Vocals', FALSE, 1, 85.00, TRUE, '2022-10-21'),
(4, 4, 3, 'Primary', 'Vocals/Guitar', FALSE, 1, 90.00, TRUE, '2017-03-03'),
(5, 5, 3, 'Primary', 'Vocals/Guitar', FALSE, 1, 88.00, TRUE, '2021-10-29'),
(6, 6, 4, 'Primary', 'Vocals', FALSE, 1, 75.00, TRUE, '2010-05-15'),
(7, 7, 5, 'Primary', 'Rap', FALSE, 1, 70.00, TRUE, '2018-08-17'),
(8, 8, 6, 'Primary', 'Vocals', FALSE, 1, 85.00, TRUE, '2018-05-18'),
(9, 9, 6, 'Primary', 'Vocals', FALSE, 1, 85.00, TRUE, '2020-02-21'),
(10, 10, 7, 'Primary', 'Vocals', FALSE, 1, 80.00, TRUE, '2020-07-30'),
(11, 11, 8, 'Primary', 'Rap', FALSE, 1, 90.00, TRUE, '2018-06-29'),
(12, 12, 8, 'Primary', 'Rap', FALSE, 1, 92.00, TRUE, '2021-09-03'),
(13, 13, 9, 'Primary', 'Vocals', FALSE, 1, 95.00, TRUE, '2020-03-20'),
(14, 14, 9, 'Primary', 'Vocals', FALSE, 1, 94.00, TRUE, '2022-01-07'),
(15, 15, 10, 'Primary', 'Vocals', FALSE, 1, 78.00, TRUE, '2020-01-10'),
(16, 16, 12, 'Primary', 'Vocals', FALSE, 1, 82.00, TRUE, '2018-05-11'),
(17, 17, 14, 'Primary', 'Vocals', FALSE, 1, 88.00, TRUE, '2019-09-06'),
(18, 18, 15, 'Primary', 'Vocals', FALSE, 1, 96.00, TRUE, '2011-01-24'),
(19, 19, 17, 'Primary', 'Vocals', FALSE, 1, 93.00, TRUE, '2021-07-30'),
(20, 20, 20, 'Primary', 'Vocals', FALSE, 1, 89.00, TRUE, '2020-03-27');


Select* from album_artists ;

Drop table album_artists ; 

Truncate table album_artists ;


-- ------------------------------------------- Table -6 tracks   ----------------------------------------------

CREATE TABLE tracks (
    track_id INT PRIMARY KEY,
    album_id INT NOT NULL,
    track_title VARCHAR(150) NOT NULL,
    duration_seconds INT CHECK (duration_seconds > 0),
    track_number INT NOT NULL,
    genre VARCHAR(50),
    language VARCHAR(20) DEFAULT 'English',
    release_date DATE NOT NULL,
    popularity_score INT CHECK (popularity_score BETWEEN 0 AND 100),
    is_explicit BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

INSERT INTO tracks (track_id, album_id, track_title, duration_seconds, track_number, genre, language, release_date, popularity_score, is_explicit) VALUES
(1, 1, 'Welcome to New York', 211, 1, 'Pop', 'English', '2017-11-10', 82, FALSE),
(2, 1, 'Delicate', 232, 5, 'Pop', 'English', '2017-11-10', 95, FALSE),
(3, 2, 'Shape of You', 233, 4, 'Pop', 'English', '2017-03-03', 100, FALSE),
(4, 2, 'Perfect', 263, 5, 'Pop', 'English', '2017-03-03', 97, FALSE),
(5, 3, 'Anti-Hero', 200, 3, 'Pop', 'English', '2022-10-21', 98, FALSE),
(6, 3, 'Lavender Haze', 202, 1, 'Pop', 'English', '2022-10-21', 85, FALSE),
(7, 4, 'Castle on the Hill', 261, 1, 'Pop Rock', 'English', '2017-03-03', 90, FALSE),
(8, 5, 'Shivers', 207, 2, 'Pop', 'English', '2021-10-29', 93, FALSE),
(9, 6, 'Love Story', 235, 2, 'Country', 'English', '2008-09-15', 96, FALSE),
(10, 7, 'SICKO MODE', 312, 3, 'Hip-Hop', 'English', '2018-08-03', 100, TRUE),
(11, 8, 'God’s Plan', 210, 1, 'Hip-Hop', 'English', '2018-01-19', 99, TRUE),
(12, 9, 'Blinding Lights', 200, 9, 'Synthpop', 'English', '2019-11-29', 100, FALSE),
(13, 10, 'Watermelon Sugar', 174, 4, 'Pop', 'English', '2019-11-16', 92, FALSE),
(14, 11, 'Without Me', 218, 2, 'Rap', 'English', '2018-09-17', 88, TRUE),
(15, 12, 'Industry Baby', 212, 1, 'Hip-Hop', 'English', '2021-07-23', 95, TRUE),
(16, 13, 'Break My Heart', 221, 3, 'Pop', 'English', '2020-03-25', 89, FALSE),
(17, 14, 'Levitating', 203, 2, 'Pop', 'English', '2020-08-13', 97, FALSE),
(18, 15, 'Someone You Loved', 182, 1, 'Pop', 'English', '2018-11-08', 94, FALSE),
(19, 16, 'Havana', 217, 1, 'Latin Pop', 'English', '2018-08-03', 95, FALSE),
(20, 17, 'Señorita', 191, 1, 'Latin Pop', 'English', '2019-06-21', 99, FALSE);

Select* from tracks ;

Drop table tracks ; 

Truncate table tracks ;


-- ------------------------------------------- Table -7 track_genres  ----------------------------------------------

CREATE TABLE track_genres (
    track_genre_id INT PRIMARY KEY,
    track_id INT NOT NULL,
    genre_id INT NOT NULL,
    genre_role VARCHAR(50) NOT NULL,
    influence_score INT CHECK (influence_score BETWEEN 0 AND 100),
    is_primary BOOLEAN DEFAULT FALSE,
    sequence_order INT DEFAULT 1,
    added_by VARCHAR(100) DEFAULT 'system',
    created_at DATE DEFAULT CURRENT_DATE,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (track_id) REFERENCES tracks(track_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

INSERT INTO track_genres (track_genre_id, track_id, genre_id, genre_role, influence_score, is_primary, sequence_order, added_by, created_at, is_active) VALUES
(1, 1, 1, 'Primary', 90, TRUE, 1, 'system', '2017-11-10', TRUE),
(2, 2, 1, 'Primary', 95, TRUE, 1, 'system', '2017-11-10', TRUE),
(3, 3, 1, 'Primary', 100, TRUE, 1, 'system', '2017-03-03', TRUE),
(4, 4, 1, 'Primary', 97, TRUE, 1, 'system', '2017-03-03', TRUE),
(5, 5, 1, 'Primary', 98, TRUE, 1, 'system', '2022-10-21', TRUE),
(6, 6, 1, 'Primary', 85, TRUE, 1, 'system', '2022-10-21', TRUE),
(7, 7, 2, 'Primary', 90, TRUE, 1, 'system', '2017-03-03', TRUE),
(8, 8, 1, 'Primary', 93, TRUE, 1, 'system', '2021-10-29', TRUE),
(9, 9, 3, 'Primary', 96, TRUE, 1, 'system', '2008-09-15', TRUE),
(10, 10, 4, 'Primary', 100, TRUE, 1, 'system', '2018-08-03', TRUE),
(11, 11, 4, 'Primary', 99, TRUE, 1, 'system', '2018-01-19', TRUE),
(12, 12, 5, 'Primary', 100, TRUE, 1, 'system', '2019-11-29', TRUE),
(13, 13, 1, 'Primary', 92, TRUE, 1, 'system', '2019-11-16', TRUE),
(14, 14, 4, 'Primary', 88, TRUE, 1, 'system', '2018-09-17', TRUE),
(15, 15, 4, 'Primary', 95, TRUE, 1, 'system', '2021-07-23', TRUE),
(16, 16, 1, 'Primary', 89, TRUE, 1, 'system', '2020-03-25', TRUE),
(17, 17, 1, 'Primary', 97, TRUE, 1, 'system', '2020-08-13', TRUE),
(18, 18, 1, 'Primary', 94, TRUE, 1, 'system', '2018-11-08', TRUE),
(19, 19, 6, 'Primary', 95, TRUE, 1, 'system', '2018-08-03', TRUE),
(20, 20, 6, 'Primary', 99, TRUE, 1, 'system', '2019-06-21', TRUE);

Select* from track_genres ;

Drop table track_genres ; 

Truncate table track_genres ;


-- ------------------------------------------- Table -8 genres  ----------------------------------------------


CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    origin_country VARCHAR(50),
    popularity_rank INT CHECK (popularity_rank > 0),
    cultural_influence_score INT CHECK (cultural_influence_score BETWEEN 0 AND 100),
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATE DEFAULT CURRENT_DATE,
    updated_at DATE,
    added_by VARCHAR(100) DEFAULT 'system'
);

INSERT INTO genres (genre_id, genre_name, description, origin_country, popularity_rank, cultural_influence_score, is_active, created_at, updated_at, added_by) VALUES
(1, 'Pop', 'Mainstream popular music with catchy melodies', 'USA', 1, 95, TRUE, '2000-01-01', NULL, 'system'),
(2, 'Rock', 'Guitar-driven genre with energetic rhythms', 'UK', 2, 92, TRUE, '2000-01-01', NULL, 'system'),
(3, 'Country', 'Traditional American folk and storytelling music', 'USA', 6, 80, TRUE, '2000-01-01', NULL, 'system'),
(4, 'Hip-Hop', 'Rap-based music with beats and lyrical flow', 'USA', 3, 98, TRUE, '2000-01-01', NULL, 'system'),
(5, 'Synthpop', 'Electronic pop with synthesizers', 'Germany', 12, 75, TRUE, '2000-01-01', NULL, 'system'),
(6, 'Latin Pop', 'Latin-influenced upbeat pop music', 'Spain', 5, 90, TRUE, '2000-01-01', NULL, 'system'),
(7, 'Jazz', 'Improvised instrumental music with complex harmonies', 'USA', 10, 85, TRUE, '2000-01-01', NULL, 'system'),
(8, 'Classical', 'Orchestral and instrumental compositions', 'Italy', 15, 70, TRUE, '2000-01-01', NULL, 'system'),
(9, 'R&B', 'Rhythm and blues with soulful vocals', 'USA', 4, 93, TRUE, '2000-01-01', NULL, 'system'),
(10, 'Reggae', 'Jamaican music with offbeat rhythms', 'Jamaica', 14, 77, TRUE, '2000-01-01', NULL, 'system'),
(11, 'Metal', 'Heavy, aggressive rock subgenre', 'UK', 9, 82, TRUE, '2000-01-01', NULL, 'system'),
(12, 'Folk', 'Traditional and acoustic storytelling music', 'Ireland', 16, 65, TRUE, '2000-01-01', NULL, 'system'),
(13, 'Blues', 'Emotional music rooted in African-American history', 'USA', 11, 78, TRUE, '2000-01-01', NULL, 'system'),
(14, 'EDM', 'Electronic dance music for clubs and festivals', 'Netherlands', 7, 88, TRUE, '2000-01-01', NULL, 'system'),
(15, 'K-Pop', 'Korean pop music with global influence', 'South Korea', 8, 91, TRUE, '2000-01-01', NULL, 'system'),
(16, 'Soul', 'Emotion-driven music from gospel and R&B roots', 'USA', 13, 76, TRUE, '2000-01-01', NULL, 'system'),
(17, 'Punk', 'Fast-paced rebellious rock style', 'USA', 17, 60, TRUE, '2000-01-01', NULL, 'system'),
(18, 'Gospel', 'Christian worship music with choirs and harmony', 'USA', 18, 55, TRUE, '2000-01-01', NULL, 'system'),
(19, 'Opera', 'Theatrical vocal-driven classical music', 'Italy', 19, 50, TRUE, '2000-01-01', NULL, 'system'),
(20, 'Afrobeats', 'West African rhythmic pop fusion', 'Nigeria', 20, 83, TRUE, '2000-01-01', NULL, 'system');

Select* from genres ;

Drop table genres ; 

Truncate table genres ;


-- ------------------------------------------- Table -9 playlists  ----------------------------------------------

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    playlist_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    created_at DATE DEFAULT CURRENT_DATE,
    updated_at DATE,
    is_public BOOLEAN DEFAULT TRUE,
    total_tracks INT DEFAULT 0 CHECK (total_tracks >= 0),
    followers_count INT DEFAULT 0 CHECK (followers_count >= 0),
    status VARCHAR(20) DEFAULT 'Active' CHECK (status IN ('Active','Deleted','Archived')),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO playlists (playlist_id, user_id, playlist_name, description, created_at, updated_at, is_public, total_tracks, followers_count, status) VALUES
(1, 1, 'Morning Vibes', 'Soft pop for mornings', '2023-01-01', NULL, TRUE, 15, 1200, 'Active'),
(2, 2, 'Workout Mix', 'High energy tracks', '2023-02-10', NULL, TRUE, 20, 980, 'Active'),
(3, 3, 'Chill Hits', 'Relaxing evening songs', '2023-03-05', NULL, TRUE, 18, 750, 'Active'),
(4, 4, 'Romantic Tunes', 'Love songs collection', '2023-04-14', NULL, TRUE, 22, 640, 'Active'),
(5, 5, 'Rap God', 'Best rap songs ever', '2023-05-09', NULL, TRUE, 25, 2100, 'Active'),
(6, 6, 'Classical Gems', 'Timeless orchestral pieces', '2023-06-01', NULL, TRUE, 30, 430, 'Active'),
(7, 7, 'EDM Party', 'Electronic dance anthems', '2023-06-15', NULL, TRUE, 28, 1600, 'Active'),
(8, 8, 'Sad Songs', 'For heartbreak moments', '2023-07-07', NULL, TRUE, 12, 890, 'Active'),
(9, 9, 'Top Hits 2023', 'Chart-topping singles', '2023-07-20', NULL, TRUE, 35, 3200, 'Active'),
(10, 10, 'Travel Beats', 'Songs for road trips', '2023-08-02', NULL, TRUE, 27, 670, 'Active'),
(11, 11, 'Party Starter', 'Ultimate party hits', '2023-08-18', NULL, TRUE, 40, 2500, 'Active'),
(12, 12, 'Indie Mix', 'Best of indie music', '2023-09-01', NULL, TRUE, 22, 540, 'Active'),
(13, 13, 'Focus Mode', 'Instrumentals to concentrate', '2023-09-15', NULL, TRUE, 18, 460, 'Active'),
(14, 14, 'K-Pop Wave', 'Trending Korean pop songs', '2023-09-30', NULL, TRUE, 26, 2100, 'Active'),
(15, 15, 'Latin Fire', 'Hot Latin beats', '2023-10-12', NULL, TRUE, 24, 1250, 'Active'),
(16, 16, 'Jazz Nights', 'Smooth jazz for evenings', '2023-10-25', NULL, TRUE, 19, 340, 'Active'),
(17, 17, 'Golden Oldies', 'Classics from the 70s & 80s', '2023-11-05', NULL, TRUE, 32, 580, 'Active'),
(18, 18, 'Trending Now', 'Viral songs on Spotify', '2023-11-19', NULL, TRUE, 29, 4000, 'Active'),
(19, 19, 'Sleep Sounds', 'Calm music for better sleep', '2023-12-01', NULL, TRUE, 15, 620, 'Active'),
(20, 20, 'Festival Hits', 'Songs for celebrations', '2023-12-15', NULL, TRUE, 34, 1800, 'Active');


Select* from playlists ;

Drop table playlists ; 

Truncate table playlists ;


-- ------------------------------------------- Table -10 playlist_tracks  ----------------------------------------------

CREATE TABLE playlist_tracks (
    playlist_track_id INT PRIMARY KEY,
    playlist_id INT NOT NULL,
    track_id INT NOT NULL,
    added_by INT NOT NULL,
    added_at DATE DEFAULT CURRENT_DATE,
    sequence_order INT DEFAULT 1,
    is_favorite BOOLEAN DEFAULT FALSE,
    play_count INT DEFAULT 0 CHECK (play_count >= 0),
    status VARCHAR(20) DEFAULT 'Active' CHECK (status IN ('Active','Removed')),
    last_played DATE,
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id),
    FOREIGN KEY (added_by) REFERENCES users(user_id)
);

INSERT INTO playlist_tracks (playlist_track_id, playlist_id, track_id, added_by, added_at, sequence_order, is_favorite, play_count, status, last_played) VALUES
(1, 1, 2, 1, '2023-01-02', 1, TRUE, 15, 'Active', '2023-02-01'),
(2, 1, 3, 1, '2023-01-03', 2, FALSE, 10, 'Active', '2023-02-02'),
(3, 2, 7, 2, '2023-02-11', 1, TRUE, 25, 'Active', '2023-02-20'),
(4, 2, 10, 2, '2023-02-12', 2, FALSE, 18, 'Active', '2023-02-22'),
(5, 3, 6, 3, '2023-03-06', 1, TRUE, 12, 'Active', '2023-03-10'),
(6, 3, 9, 3, '2023-03-07', 2, FALSE, 8, 'Active', '2023-03-12'),
(7, 4, 4, 4, '2023-04-15', 1, TRUE, 20, 'Active', '2023-04-20'),
(8, 4, 5, 4, '2023-04-16', 2, TRUE, 16, 'Active', '2023-04-21'),
(9, 5, 10, 5, '2023-05-10', 1, TRUE, 30, 'Active', '2023-05-15'),
(10, 5, 11, 5, '2023-05-11', 2, TRUE, 28, 'Active', '2023-05-18'),
(11, 6, 9, 6, '2023-06-02', 1, FALSE, 14, 'Active', '2023-06-10'),
(12, 6, 13, 6, '2023-06-03', 2, FALSE, 11, 'Active', '2023-06-12'),
(13, 7, 7, 7, '2023-06-16', 1, TRUE, 35, 'Active', '2023-06-25'),
(14, 7, 14, 7, '2023-06-17', 2, FALSE, 22, 'Active', '2023-06-28'),
(15, 8, 8, 8, '2023-07-08', 1, TRUE, 19, 'Active', '2023-07-15'),
(16, 8, 12, 8, '2023-07-09', 2, FALSE, 17, 'Active', '2023-07-16'),
(17, 9, 3, 9, '2023-07-21', 1, TRUE, 40, 'Active', '2023-07-30'),
(18, 9, 15, 9, '2023-07-22', 2, FALSE, 32, 'Active', '2023-07-31'),
(19, 10, 16, 10, '2023-08-03', 1, TRUE, 26, 'Active', '2023-08-10'),
(20, 10, 18, 10, '2023-08-04', 2, TRUE, 24, 'Active', '2023-08-12');


Select* from playlist_tracks ;

Drop table playlist_tracks ; 

Truncate table playlist_tracks ;


-- ------------------------------------------- Table -11 user_followers  ----------------------------------------------

CREATE TABLE user_followers (
    follower_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    follower_user_id INT NOT NULL,
    followed_at DATE DEFAULT CURRENT_DATE,
    is_close_friend BOOLEAN DEFAULT FALSE,
    notifications_enabled BOOLEAN DEFAULT TRUE,
    status VARCHAR(20) DEFAULT 'Active' CHECK (status IN ('Active','Blocked','Removed')),
    interaction_score INT DEFAULT 0 CHECK (interaction_score >= 0),
    last_interaction DATE,
    added_by VARCHAR(100) DEFAULT 'system',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (follower_user_id) REFERENCES users(user_id)
);

INSERT INTO user_followers (follower_id, user_id, follower_user_id, followed_at, is_close_friend, notifications_enabled, status, interaction_score, last_interaction, added_by) VALUES
(1, 1, 2, '2023-01-05', FALSE, TRUE, 'Active', 15, '2023-02-01', 'system'),
(2, 1, 3, '2023-01-07', TRUE, TRUE, 'Active', 20, '2023-02-02', 'system'),
(3, 2, 1, '2023-02-10', FALSE, TRUE, 'Active', 12, '2023-02-15', 'system'),
(4, 2, 4, '2023-02-12', FALSE, TRUE, 'Active', 8, '2023-02-20', 'system'),
(5, 3, 5, '2023-03-01', TRUE, TRUE, 'Active', 25, '2023-03-05', 'system'),
(6, 3, 6, '2023-03-04', FALSE, TRUE, 'Active', 10, '2023-03-08', 'system'),
(7, 4, 7, '2023-04-02', FALSE, TRUE, 'Active', 18, '2023-04-05', 'system'),
(8, 4, 8, '2023-04-06', TRUE, TRUE, 'Active', 22, '2023-04-10', 'system'),
(9, 5, 9, '2023-05-01', FALSE, TRUE, 'Active', 16, '2023-05-03', 'system'),
(10, 5, 10, '2023-05-05', FALSE, TRUE, 'Active', 14, '2023-05-09', 'system'),
(11, 6, 11, '2023-06-01', FALSE, TRUE, 'Active', 19, '2023-06-04', 'system'),
(12, 6, 12, '2023-06-03', TRUE, TRUE, 'Active', 23, '2023-06-07', 'system'),
(13, 7, 13, '2023-07-02', FALSE, TRUE, 'Active', 17, '2023-07-06', 'system'),
(14, 7, 14, '2023-07-05', FALSE, TRUE, 'Active', 15, '2023-07-08', 'system'),
(15, 8, 15, '2023-08-01', TRUE, TRUE, 'Active', 28, '2023-08-04', 'system'),
(16, 8, 16, '2023-08-03', FALSE, TRUE, 'Active', 12, '2023-08-06', 'system'),
(17, 9, 17, '2023-09-01', FALSE, TRUE, 'Active', 20, '2023-09-04', 'system'),
(18, 9, 18, '2023-09-05', FALSE, TRUE, 'Active', 11, '2023-09-08', 'system'),
(19, 10, 19, '2023-10-01', TRUE, TRUE, 'Active', 30, '2023-10-04', 'system'),
(20, 10, 20, '2023-10-05', FALSE, TRUE, 'Active', 13, '2023-10-08', 'system');


Select* from user_followers ;

Drop table user_followers ; 

Truncate table user_followers ;


-- ------------------------------------------- Table -12 user_library  ----------------------------------------------

CREATE TABLE user_library (
    library_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    track_id INT,
    album_id INT,
    playlist_id INT,
    added_at DATE DEFAULT CURRENT_DATE,
    is_favorite BOOLEAN DEFAULT FALSE,
    play_count INT DEFAULT 0 CHECK (play_count >= 0),
    last_played DATE,
    source VARCHAR(50) DEFAULT 'manual',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id)
);

INSERT INTO user_library (library_id, user_id, track_id, album_id, playlist_id, added_at, is_favorite, play_count, last_played, source) VALUES
(1, 1, 1, 1, 1, '2023-01-10', TRUE, 25, '2023-02-01', 'manual'),
(2, 1, 2, 1, NULL, '2023-01-12', FALSE, 10, '2023-02-03', 'import'),
(3, 2, 3, 2, 2, '2023-02-05', TRUE, 18, '2023-02-20', 'manual'),
(4, 2, 4, 2, NULL, '2023-02-07', FALSE, 8, '2023-02-15', 'manual'),
(5, 3, 5, 3, 3, '2023-03-01', TRUE, 30, '2023-03-10', 'manual'),
(6, 3, 6, 3, NULL, '2023-03-04', FALSE, 12, '2023-03-08', 'import'),
(7, 4, 7, 4, 4, '2023-04-02', TRUE, 22, '2023-04-07', 'manual'),
(8, 4, 8, 4, NULL, '2023-04-05', FALSE, 9, '2023-04-12', 'manual'),
(9, 5, 9, 5, 5, '2023-05-01', TRUE, 40, '2023-05-08', 'import'),
(10, 5, 10, 5, NULL, '2023-05-06', FALSE, 14, '2023-05-11', 'manual'),
(11, 6, 11, 6, 6, '2023-06-01', TRUE, 27, '2023-06-05', 'manual'),
(12, 6, 12, 6, NULL, '2023-06-04', FALSE, 16, '2023-06-10', 'import'),
(13, 7, 13, 7, 7, '2023-07-01', TRUE, 35, '2023-07-08', 'manual'),
(14, 7, 14, 7, NULL, '2023-07-03', FALSE, 13, '2023-07-09', 'manual'),
(15, 8, 15, 8, 8, '2023-08-01', TRUE, 29, '2023-08-06', 'manual'),
(16, 8, 16, 8, NULL, '2023-08-04', FALSE, 11, '2023-08-10', 'import'),
(17, 9, 17, 9, 9, '2023-09-01', TRUE, 33, '2023-09-07', 'manual'),
(18, 9, 18, 9, NULL, '2023-09-05', FALSE, 12, '2023-09-10', 'manual'),
(19, 10, 19, 10, 10, '2023-10-01', TRUE, 37, '2023-10-05', 'import'),
(20, 10, 20, 10, NULL, '2023-10-04', FALSE, 15, '2023-10-09', 'manual');


Select* from user_library ;

Drop table user_library ; 

Truncate table user_library ;


-- ------------------------------------------- Table -13 subscriptions ----------------------------------------------


CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    plan_name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    renewal_type VARCHAR(20) DEFAULT 'Auto' CHECK (renewal_type IN ('Auto','Manual')),
    price DECIMAL(6,2) NOT NULL CHECK (price >= 0),
    payment_method VARCHAR(50) DEFAULT 'Card',
    last_payment_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO subscriptions (subscription_id, user_id, plan_name, start_date, end_date, is_active, renewal_type, price, payment_method, last_payment_date) VALUES
(1, 1, 'Premium Monthly', '2023-01-01', '2023-01-31', TRUE, 'Auto', 9.99, 'Card', '2023-01-01'),
(2, 2, 'Premium Yearly', '2023-01-10', '2024-01-09', TRUE, 'Auto', 99.99, 'UPI', '2023-01-10'),
(3, 3, 'Free', '2023-02-01', NULL, TRUE, 'Manual', 0.00, 'N/A', NULL),
(4, 4, 'Premium Monthly', '2023-02-05', '2023-03-04', TRUE, 'Auto', 9.99, 'Card', '2023-02-05'),
(5, 5, 'Premium Student', '2023-03-01', '2023-08-31', TRUE, 'Auto', 4.99, 'UPI', '2023-03-01'),
(6, 6, 'Premium Family', '2023-03-10', '2023-09-09', TRUE, 'Auto', 14.99, 'Card', '2023-03-10'),
(7, 7, 'Premium Monthly', '2023-04-01', '2023-04-30', TRUE, 'Manual', 9.99, 'Wallet', '2023-04-01'),
(8, 8, 'Free', '2023-04-05', NULL, TRUE, 'Manual', 0.00, 'N/A', NULL),
(9, 9, 'Premium Yearly', '2023-05-01', '2024-04-30', TRUE, 'Auto', 99.99, 'Card', '2023-05-01'),
(10, 10, 'Premium Monthly', '2023-05-05', '2023-06-04', TRUE, 'Auto', 9.99, 'UPI', '2023-05-05'),
(11, 11, 'Premium Duo', '2023-06-01', '2023-12-01', TRUE, 'Auto', 12.99, 'Card', '2023-06-01'),
(12, 12, 'Premium Monthly', '2023-06-10', '2023-07-09', TRUE, 'Auto', 9.99, 'Wallet', '2023-06-10'),
(13, 13, 'Free', '2023-07-01', NULL, TRUE, 'Manual', 0.00, 'N/A', NULL),
(14, 14, 'Premium Student', '2023-07-05', '2024-01-04', TRUE, 'Auto', 4.99, 'UPI', '2023-07-05'),
(15, 15, 'Premium Family', '2023-08-01', '2024-01-31', TRUE, 'Auto', 14.99, 'Card', '2023-08-01'),
(16, 16, 'Premium Monthly', '2023-08-10', '2023-09-09', TRUE, 'Auto', 9.99, 'UPI', '2023-08-10'),
(17, 17, 'Premium Monthly', '2023-09-01', '2023-09-30', TRUE, 'Manual', 9.99, 'Wallet', '2023-09-01'),
(18, 18, 'Free', '2023-09-05', NULL, TRUE, 'Manual', 0.00, 'N/A', NULL),
(19, 19, 'Premium Duo', '2023-10-01', '2024-04-01', TRUE, 'Auto', 12.99, 'Card', '2023-10-01'),
(20, 20, 'Premium Monthly', '2023-10-05', '2023-11-04', TRUE, 'Auto', 9.99, 'UPI', '2023-10-05');


Select* from subscriptions ;

Drop table subscriptions ; 

Truncate table subscriptions ;


-- ------------------------------------------- Table -14 subscription_plans  ----------------------------------------------



CREATE TABLE subscription_plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    price DECIMAL(6,2) NOT NULL CHECK (price >= 0),
    duration_days INT NOT NULL CHECK (duration_days > 0),
    max_devices INT DEFAULT 1 CHECK (max_devices > 0),
    is_student_plan BOOLEAN DEFAULT FALSE,
    is_family_plan BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATE DEFAULT CURRENT_DATE
);

INSERT INTO subscription_plans (plan_id, plan_name, description, price, duration_days, max_devices, is_student_plan, is_family_plan, is_active, created_at) VALUES
(1, 'Free', 'Ad-supported free plan', 0.00, 3650, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(2, 'Premium Monthly', 'Ad-free music with offline downloads', 9.99, 30, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(3, 'Premium Yearly', 'Ad-free yearly subscription', 99.99, 365, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(4, 'Premium Duo', 'Two accounts for couples', 12.99, 30, 2, FALSE, FALSE, TRUE, '2023-01-01'),
(5, 'Premium Family', 'Up to 6 accounts for family', 14.99, 30, 6, FALSE, TRUE, TRUE, '2023-01-01'),
(6, 'Premium Student', 'Discounted plan for students', 4.99, 30, 1, TRUE, FALSE, TRUE, '2023-01-01'),
(7, 'Premium 3-Month', '3-month discounted plan', 27.99, 90, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(8, 'Premium 6-Month', '6-month discounted plan', 54.99, 180, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(9, 'Premium Lifetime', 'One-time purchase, unlimited duration', 499.99, 9999, 1, FALSE, FALSE, FALSE, '2023-01-01'),
(10, 'Premium Plus Monthly', 'Higher quality streaming', 12.99, 30, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(11, 'Premium Plus Yearly', 'Higher quality annual plan', 129.99, 365, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(12, 'Premium Mini', 'Daily plan with limited features', 0.99, 1, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(13, 'Premium Weekly', 'Affordable weekly subscription', 2.99, 7, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(14, 'Premium Duo Yearly', 'Annual subscription for two', 139.99, 365, 2, FALSE, FALSE, TRUE, '2023-01-01'),
(15, 'Premium Family Yearly', 'Annual subscription for family', 199.99, 365, 6, FALSE, TRUE, TRUE, '2023-01-01'),
(16, 'Premium Student Yearly', 'Annual discounted plan for students', 49.99, 365, 1, TRUE, FALSE, TRUE, '2023-01-01'),
(17, 'Premium Business', 'For office/enterprise use', 29.99, 30, 10, FALSE, FALSE, TRUE, '2023-01-01'),
(18, 'Premium Business Yearly', 'Enterprise annual subscription', 299.99, 365, 10, FALSE, FALSE, TRUE, '2023-01-01'),
(19, 'Premium Trial', 'Free trial for new users', 0.00, 30, 1, FALSE, FALSE, TRUE, '2023-01-01'),
(20, 'Premium Regional', 'Discounted plan for specific regions', 5.99, 30, 1, FALSE, FALSE, TRUE, '2023-01-01');

Select* from subscription_plans ;

Drop table subscription_plans ; 

Truncate table subscription_plans ;


-- ------------------------------------------- Table - 15 payments ----------------------------------------------

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    subscription_id INT NOT NULL,
    user_id INT NOT NULL,
    amount DECIMAL(7,2) NOT NULL CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Success','Pending','Failed','Refunded')),
    transaction_id VARCHAR(100) UNIQUE NOT NULL,
    currency VARCHAR(10) DEFAULT 'USD',
    invoice_url VARCHAR(255),
    FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO payments (payment_id, subscription_id, user_id, amount, payment_date, payment_method, status, transaction_id, currency, invoice_url) VALUES
(1, 1, 1, 9.99, '2023-01-01', 'Card', 'Success', 'TXN1001', 'USD', 'https://pay.com/invoice/1001'),
(2, 2, 2, 99.99, '2023-01-10', 'UPI', 'Success', 'TXN1002', 'USD', 'https://pay.com/invoice/1002'),
(3, 3, 3, 0.00, '2023-02-01', 'N/A', 'Success', 'TXN1003', 'USD', 'https://pay.com/invoice/1003'),
(4, 4, 4, 9.99, '2023-02-05', 'Card', 'Success', 'TXN1004', 'USD', 'https://pay.com/invoice/1004'),
(5, 5, 5, 4.99, '2023-03-01', 'UPI', 'Success', 'TXN1005', 'USD', 'https://pay.com/invoice/1005'),
(6, 6, 6, 14.99, '2023-03-10', 'Card', 'Success', 'TXN1006', 'USD', 'https://pay.com/invoice/1006'),
(7, 7, 7, 9.99, '2023-04-01', 'Wallet', 'Pending', 'TXN1007', 'USD', 'https://pay.com/invoice/1007'),
(8, 8, 8, 0.00, '2023-04-05', 'N/A', 'Success', 'TXN1008', 'USD', 'https://pay.com/invoice/1008'),
(9, 9, 9, 99.99, '2023-05-01', 'Card', 'Success', 'TXN1009', 'USD', 'https://pay.com/invoice/1009'),
(10, 10, 10, 9.99, '2023-05-05', 'UPI', 'Failed', 'TXN1010', 'USD', 'https://pay.com/invoice/1010'),
(11, 11, 11, 12.99, '2023-06-01', 'Card', 'Success', 'TXN1011', 'USD', 'https://pay.com/invoice/1011'),
(12, 12, 12, 9.99, '2023-06-10', 'Wallet', 'Refunded', 'TXN1012', 'USD', 'https://pay.com/invoice/1012'),
(13, 13, 13, 0.00, '2023-07-01', 'N/A', 'Success', 'TXN1013', 'USD', 'https://pay.com/invoice/1013'),
(14, 14, 14, 4.99, '2023-07-05', 'UPI', 'Success', 'TXN1014', 'USD', 'https://pay.com/invoice/1014'),
(15, 15, 15, 14.99, '2023-08-01', 'Card', 'Success', 'TXN1015', 'USD', 'https://pay.com/invoice/1015'),
(16, 16, 16, 9.99, '2023-08-10', 'UPI', 'Pending', 'TXN1016', 'USD', 'https://pay.com/invoice/1016'),
(17, 17, 17, 9.99, '2023-09-01', 'Wallet', 'Success', 'TXN1017', 'USD', 'https://pay.com/invoice/1017'),
(18, 18, 18, 0.00, '2023-09-05', 'N/A', 'Success', 'TXN1018', 'USD', 'https://pay.com/invoice/1018'),
(19, 19, 19, 12.99, '2023-10-01', 'Card', 'Success', 'TXN1019', 'USD', 'https://pay.com/invoice/1019'),
(20, 20, 20, 9.99, '2023-10-05', 'UPI', 'Success', 'TXN1020', 'USD', 'https://pay.com/invoice/1020');

Select* from payments ;

Drop table payments ; 

Truncate table payments ;


-- ------------------------------------------- Table - 16 devices  ----------------------------------------------


CREATE TABLE devices (
    device_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    device_name VARCHAR(100) NOT NULL,
    device_type VARCHAR(50) NOT NULL,
    os VARCHAR(50),
    app_version VARCHAR(20),
    last_login DATE,
    is_active BOOLEAN DEFAULT TRUE,
    ip_address VARCHAR(50),
    location VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO devices (device_id, user_id, device_name, device_type, os, app_version, last_login, is_active, ip_address, location) VALUES
(1, 1, 'iPhone 13', 'Mobile', 'iOS 16', '8.5.1', '2023-01-05', TRUE, '192.168.1.10', 'New York, USA'),
(2, 2, 'Samsung Galaxy S21', 'Mobile', 'Android 13', '8.5.1', '2023-01-10', TRUE, '192.168.1.11', 'London, UK'),
(3, 3, 'MacBook Pro', 'Laptop', 'macOS Ventura', '8.5.1', '2023-02-01', TRUE, '192.168.1.12', 'Toronto, Canada'),
(4, 4, 'Windows PC', 'Desktop', 'Windows 11', '8.5.0', '2023-02-07', TRUE, '192.168.1.13', 'Berlin, Germany'),
(5, 5, 'iPad Air', 'Tablet', 'iPadOS 16', '8.5.1', '2023-03-01', TRUE, '192.168.1.14', 'Paris, France'),
(6, 6, 'Google Pixel 7', 'Mobile', 'Android 13', '8.5.1', '2023-03-10', TRUE, '192.168.1.15', 'Sydney, Australia'),
(7, 7, 'Dell XPS 15', 'Laptop', 'Windows 11', '8.5.1', '2023-04-01', TRUE, '192.168.1.16', 'Mumbai, India'),
(8, 8, 'Amazon Echo', 'Smart Speaker', 'FireOS', '8.5.1', '2023-04-05', TRUE, '192.168.1.17', 'Los Angeles, USA'),
(9, 9, 'PlayStation 5', 'Console', 'PSOS', '8.5.1', '2023-05-01', TRUE, '192.168.1.18', 'Rome, Italy'),
(10, 10, 'Apple Watch', 'Wearable', 'watchOS 9', '8.5.1', '2023-05-05', TRUE, '192.168.1.19', 'Tokyo, Japan'),
(11, 11, 'OnePlus 11', 'Mobile', 'Android 13', '8.5.1', '2023-06-01', TRUE, '192.168.1.20', 'Singapore'),
(12, 12, 'Surface Pro 9', 'Tablet', 'Windows 11', '8.5.0', '2023-06-10', TRUE, '192.168.1.21', 'Dubai, UAE'),
(13, 13, 'LG Smart TV', 'Smart TV', 'WebOS', '8.5.1', '2023-07-01', TRUE, '192.168.1.22', 'Mexico City, Mexico'),
(14, 14, 'HP Envy', 'Laptop', 'Windows 11', '8.5.1', '2023-07-05', TRUE, '192.168.1.23', 'Cape Town, South Africa'),
(15, 15, 'Xbox Series X', 'Console', 'XboxOS', '8.5.1', '2023-08-01', TRUE, '192.168.1.24', 'Chicago, USA'),
(16, 16, 'Huawei P50', 'Mobile', 'HarmonyOS', '8.5.1', '2023-08-10', TRUE, '192.168.1.25', 'Beijing, China'),
(17, 17, 'Oculus Quest 2', 'VR Headset', 'MetaOS', '8.5.1', '2023-09-01', TRUE, '192.168.1.26', 'San Francisco, USA'),
(18, 18, 'Raspberry Pi 4', 'Microcomputer', 'Raspberry Pi OS', '8.5.1', '2023-09-05', TRUE, '192.168.1.27', 'Moscow, Russia'),
(19, 19, 'Asus ROG Phone 6', 'Mobile', 'Android 13', '8.5.1', '2023-10-01', TRUE, '192.168.1.28', 'Seoul, South Korea'),
(20, 20, 'Lenovo ThinkPad', 'Laptop', 'Windows 11', '8.5.1', '2023-10-05', TRUE, '192.168.1.29', 'Bangkok, Thailand');


Select* from devices ;

Drop table devices ; 

Truncate table devices ;


-- ------------------------------------------- Table - 17 listening_history ----------------------------------------------

CREATE TABLE listening_history (
    history_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    track_id INT NOT NULL,
    played_at TIMESTAMP NOT NULL,
    device_id INT,
    duration_played INT CHECK (duration_played >= 0),
    is_skipped BOOLEAN DEFAULT FALSE,
    is_repeat BOOLEAN DEFAULT FALSE,
    mood_tag VARCHAR(50),
    location VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id),
    FOREIGN KEY (device_id) REFERENCES devices(device_id)
);

INSERT INTO listening_history (history_id, user_id, track_id, played_at, device_id, duration_played, is_skipped, is_repeat, mood_tag, location) VALUES
(1, 1, 1, '2023-01-01 08:00:00', 1, 180, FALSE, TRUE, 'Happy', 'New York, USA'),
(2, 1, 2, '2023-01-01 08:05:00', 1, 200, FALSE, FALSE, 'Energetic', 'New York, USA'),
(3, 2, 3, '2023-02-10 18:00:00', 2, 240, TRUE, FALSE, 'Chill', 'London, UK'),
(4, 2, 4, '2023-02-10 18:10:00', 2, 220, FALSE, TRUE, 'Workout', 'London, UK'),
(5, 3, 5, '2023-03-05 12:00:00', 3, 210, FALSE, FALSE, 'Relax', 'Toronto, Canada'),
(6, 3, 6, '2023-03-05 12:04:00', 3, 190, TRUE, FALSE, 'Sad', 'Toronto, Canada'),
(7, 4, 7, '2023-04-14 20:00:00', 4, 230, FALSE, TRUE, 'Romantic', 'Berlin, Germany'),
(8, 4, 8, '2023-04-14 20:05:00', 4, 180, FALSE, FALSE, 'Calm', 'Berlin, Germany'),
(9, 5, 9, '2023-05-09 09:00:00', 5, 250, FALSE, TRUE, 'Motivated', 'Paris, France'),
(10, 5, 10, '2023-05-09 09:05:00', 5, 210, TRUE, FALSE, 'Energetic', 'Paris, France'),
(11, 6, 11, '2023-06-01 14:00:00', 6, 200, FALSE, FALSE, 'Focus', 'Sydney, Australia'),
(12, 6, 12, '2023-06-01 14:04:00', 6, 180, FALSE, FALSE, 'Relax', 'Sydney, Australia'),
(13, 7, 13, '2023-06-15 19:00:00', 7, 240, TRUE, FALSE, 'Party', 'Mumbai, India'),
(14, 7, 14, '2023-06-15 19:05:00', 7, 230, FALSE, TRUE, 'Energetic', 'Mumbai, India'),
(15, 8, 15, '2023-07-07 22:00:00', 8, 210, FALSE, FALSE, 'Sad', 'Los Angeles, USA'),
(16, 8, 16, '2023-07-07 22:04:00', 8, 190, FALSE, FALSE, 'Relax', 'Los Angeles, USA'),
(17, 9, 3, '2023-07-20 10:00:00', 9, 240, TRUE, FALSE, 'Chill', 'Rome, Italy'),
(18, 9, 15, '2023-07-20 10:05:00', 9, 230, FALSE, TRUE, 'Happy', 'Rome, Italy'),
(19, 10, 16, '2023-08-02 16:00:00', 10, 200, FALSE, FALSE, 'Focus', 'Tokyo, Japan'),
(20, 10, 18, '2023-08-02 16:03:00', 10, 180, TRUE, FALSE, 'Calm', 'Tokyo, Japan');


Select* from listening_history ;

Drop table listening_history ; 

Truncate table listening_history ;


-- ------------------------------------------- Table - 18 podcasts ----------------------------------------------


CREATE TABLE podcasts (
    podcast_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    host_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    language VARCHAR(50),
    category VARCHAR(50),
    release_date DATE,
    duration_minutes INT CHECK (duration_minutes > 0),
    is_explicit BOOLEAN DEFAULT FALSE,
    total_episodes INT DEFAULT 1 CHECK (total_episodes >= 1)
);

INSERT INTO podcasts (podcast_id, title, host_name, description, language, category, release_date, duration_minutes, is_explicit, total_episodes) VALUES
(1, 'Tech Talks', 'Alice Johnson', 'Latest trends in tech', 'English', 'Technology', '2023-01-01', 45, FALSE, 12),
(2, 'Daily News', 'Bob Smith', 'Top news of the day', 'English', 'News', '2023-01-05', 30, FALSE, 50),
(3, 'History Hour', 'Catherine Lee', 'Deep dives into history', 'English', 'Education', '2023-01-10', 60, FALSE, 20),
(4, 'Health Matters', 'David Brown', 'Tips for a healthy life', 'English', 'Health', '2023-02-01', 40, FALSE, 15),
(5, 'Comedy Central', 'Eve Clark', 'Laugh out loud', 'English', 'Comedy', '2023-02-05', 50, TRUE, 25),
(6, 'Fitness Focus', 'Frank White', 'Workout and fitness tips', 'English', 'Health', '2023-03-01', 35, FALSE, 18),
(7, 'Science Weekly', 'Grace Miller', 'Exploring scientific discoveries', 'English', 'Science', '2023-03-10', 55, FALSE, 22),
(8, 'Music Insights', 'Henry Davis', 'Music industry analysis', 'English', 'Music', '2023-04-01', 40, FALSE, 16),
(9, 'Travel Diaries', 'Ivy Wilson', 'Stories from around the world', 'English', 'Travel', '2023-04-10', 50, FALSE, 20),
(10, 'Mindfulness Minutes', 'Jack Moore', 'Meditation and mental health', 'English', 'Health', '2023-05-01', 20, FALSE, 30),
(11, 'Startup Stories', 'Karen Taylor', 'Interviews with startup founders', 'English', 'Business', '2023-05-05', 45, FALSE, 14),
(12, 'Gaming Zone', 'Leo Martin', 'Video game reviews and news', 'English', 'Gaming', '2023-06-01', 50, TRUE, 12),
(13, 'Book Club', 'Mia Thompson', 'Book discussions and reviews', 'English', 'Literature', '2023-06-10', 60, FALSE, 18),
(14, 'Cooking Corner', 'Nina Harris', 'Recipes and cooking tips', 'English', 'Food', '2023-07-01', 30, FALSE, 20),
(15, 'Language Lab', 'Oliver Lewis', 'Learn new languages', 'English', 'Education', '2023-07-05', 25, FALSE, 15),
(16, 'True Crime Tales', 'Paula Walker', 'Investigating real crimes', 'English', 'True Crime', '2023-08-01', 60, TRUE, 22),
(17, 'Eco Talk', 'Quinn Young', 'Environment and sustainability', 'English', 'Environment', '2023-08-10', 35, FALSE, 10),
(18, 'Finance 101', 'Ryan King', 'Personal finance advice', 'English', 'Finance', '2023-09-01', 40, FALSE, 16),
(19, 'Movie Reviews', 'Sophia Scott', 'Latest movies and reviews', 'English', 'Entertainment', '2023-09-05', 50, TRUE, 14),
(20, 'Daily Motivation', 'Tom Green', 'Inspiring daily stories', 'English', 'Motivation', '2023-10-01', 15, FALSE, 25);


Select* from podcasts ;

Drop table podcasts ; 

Truncate table podcasts ;


-- ------------------------------------------- Table - 19 podcast_episodes  ----------------------------------------------


CREATE TABLE podcast_episodes (
    episode_id INT PRIMARY KEY,
    podcast_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description VARCHAR(255),
    duration_minutes INT CHECK (duration_minutes > 0),
    release_date DATE NOT NULL,
    episode_number INT NOT NULL CHECK (episode_number > 0),
    is_explicit BOOLEAN DEFAULT FALSE,
    language VARCHAR(50) DEFAULT 'English',
    plays_count INT DEFAULT 0 CHECK (plays_count >= 0),
    FOREIGN KEY (podcast_id) REFERENCES podcasts(podcast_id)
);

INSERT INTO podcast_episodes (episode_id, podcast_id, title, description, duration_minutes, release_date, episode_number, is_explicit, language, plays_count) VALUES
(1, 1, 'AI Revolution', 'Discussion on AI trends', 45, '2023-01-02', 1, FALSE, 'English', 120),
(2, 1, 'Quantum Computing', 'Basics of quantum computing', 50, '2023-01-09', 2, FALSE, 'English', 95),
(3, 2, 'Morning Headlines', 'Daily top news', 30, '2023-01-06', 1, FALSE, 'English', 200),
(4, 2, 'Evening Recap', 'Summary of daily news', 25, '2023-01-07', 2, FALSE, 'English', 180),
(5, 3, 'Ancient Civilizations', 'Exploring early civilizations', 60, '2023-01-11', 1, FALSE, 'English', 85),
(6, 3, 'Medieval Times', 'History of the middle ages', 55, '2023-01-18', 2, FALSE, 'English', 90),
(7, 4, 'Healthy Eating', 'Nutrition tips', 40, '2023-02-02', 1, FALSE, 'English', 75),
(8, 4, 'Exercise Tips', 'Best practices for workouts', 35, '2023-02-09', 2, FALSE, 'English', 80),
(9, 5, 'Stand-Up Special', 'Comedy skits', 50, '2023-02-06', 1, TRUE, 'English', 110),
(10, 5, 'Improv Night', 'Improvised comedy', 55, '2023-02-13', 2, TRUE, 'English', 95),
(11, 6, 'Morning Yoga', 'Yoga for beginners', 30, '2023-03-02', 1, FALSE, 'English', 70),
(12, 6, 'Advanced Workout', 'High intensity workout', 40, '2023-03-09', 2, FALSE, 'English', 65),
(13, 7, 'Space Discoveries', 'Recent astronomy findings', 55, '2023-03-11', 1, FALSE, 'English', 100),
(14, 7, 'Physics Insights', 'Exploring new physics theories', 50, '2023-03-18', 2, FALSE, 'English', 90),
(15, 8, 'Top Hits', 'Music chart analysis', 40, '2023-04-02', 1, FALSE, 'English', 130),
(16, 8, 'Music Industry Secrets', 'Behind the scenes', 45, '2023-04-09', 2, FALSE, 'English', 115),
(17, 9, 'Travel Italy', 'Best places to visit', 50, '2023-04-11', 1, FALSE, 'English', 95),
(18, 9, 'Travel Japan', 'Cultural experiences', 55, '2023-04-18', 2, FALSE, 'English', 100),
(19, 10, 'Meditation Basics', 'Learn to meditate', 20, '2023-05-02', 1, FALSE, 'English', 140),
(20, 10, 'Advanced Meditation', 'Deep meditation techniques', 25, '2023-05-09', 2, FALSE, 'English', 125);


Select* from podcast_episodes ;

Drop table podcast_episodes ; 

Truncate table podcast_episodes ;


-- ------------------------------------------- Table - 20 episode_hosts  ----------------------------------------------


CREATE TABLE episode_hosts (
    episode_host_id INT PRIMARY KEY,
    episode_id INT NOT NULL,
    host_id INT NOT NULL,
    host_name VARCHAR(100) NOT NULL,
    role VARCHAR(50) DEFAULT 'Host',
    joined_date DATE DEFAULT CURRENT_DATE,
    is_guest BOOLEAN DEFAULT FALSE,
    experience_years INT DEFAULT 0 CHECK (experience_years >= 0),
    rating DECIMAL(3,2) DEFAULT 5.00 CHECK (rating >= 0 AND rating <= 5),
    country VARCHAR(50),
    FOREIGN KEY (episode_id) REFERENCES podcast_episodes(episode_id)
);

INSERT INTO episode_hosts (episode_host_id, episode_id, host_id, host_name, role, joined_date, is_guest, experience_years, rating, country) VALUES
(1, 1, 1, 'Alice Johnson', 'Host', '2023-01-01', FALSE, 5, 4.90, 'USA'),
(2, 2, 1, 'Alice Johnson', 'Host', '2023-01-01', FALSE, 5, 4.90, 'USA'),
(3, 3, 2, 'Bob Smith', 'Host', '2023-01-05', FALSE, 4, 4.80, 'UK'),
(4, 4, 2, 'Bob Smith', 'Host', '2023-01-05', FALSE, 4, 4.80, 'UK'),
(5, 5, 3, 'Catherine Lee', 'Host', '2023-01-10', FALSE, 6, 4.85, 'USA'),
(6, 6, 3, 'Catherine Lee', 'Host', '2023-01-10', FALSE, 6, 4.85, 'USA'),
(7, 7, 4, 'David Brown', 'Host', '2023-02-01', FALSE, 7, 4.70, 'USA'),
(8, 8, 5, 'Eve Clark', 'Host', '2023-02-05', FALSE, 3, 4.75, 'USA'),
(9, 9, 6, 'Frank White', 'Host', '2023-03-01', FALSE, 4, 4.80, 'USA'),
(10, 10, 7, 'Grace Miller', 'Host', '2023-03-10', FALSE, 5, 4.90, 'USA'),
(11, 11, 8, 'Henry Davis', 'Host', '2023-04-01', FALSE, 6, 4.85, 'USA'),
(12, 12, 9, 'Ivy Wilson', 'Host', '2023-04-10', FALSE, 4, 4.75, 'USA'),
(13, 13, 10, 'Jack Moore', 'Host', '2023-05-01', FALSE, 5, 4.80, 'USA'),
(14, 14, 11, 'Karen Taylor', 'Host', '2023-05-05', FALSE, 3, 4.70, 'USA'),
(15, 15, 12, 'Leo Martin', 'Host', '2023-06-01', FALSE, 6, 4.85, 'USA'),
(16, 16, 13, 'Mia Thompson', 'Host', '2023-06-10', FALSE, 4, 4.80, 'USA'),
(17, 17, 14, 'Nina Harris', 'Host', '2023-07-01', FALSE, 5, 4.75, 'USA'),
(18, 18, 15, 'Oliver Lewis', 'Host', '2023-07-05', FALSE, 4, 4.70, 'USA'),
(19, 19, 16, 'Paula Walker', 'Host', '2023-08-01', FALSE, 6, 4.90, 'USA'),
(20, 20, 17, 'Quinn Young', 'Host', '2023-08-10', FALSE, 5, 4.85, 'USA');


Select* from episode_hosts ;

Drop table episode_hosts ; 

Truncate table episode_hosts ;


-- ------------------------------------------- Table - 21 concerts  ----------------------------------------------


CREATE TABLE concerts (
    concert_id INT PRIMARY KEY,
    concert_name VARCHAR(150) NOT NULL,
    artist_id INT NOT NULL,
    venue VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(50),
    concert_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    ticket_price DECIMAL(7,2) CHECK (ticket_price >= 0),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO concerts (concert_id, concert_name, artist_id, venue, city, country, concert_date, start_time, end_time, ticket_price) VALUES
(1, 'Summer Vibes', 1, 'Madison Square Garden', 'New York', 'USA', '2023-06-10', '19:00:00', '22:00:00', 120.00),
(2, 'Rock Night', 2, 'Staples Center', 'Los Angeles', 'USA', '2023-07-05', '18:30:00', '21:30:00', 150.00),
(3, 'Acoustic Evening', 3, 'Royal Albert Hall', 'London', 'UK', '2023-07-20', '20:00:00', '22:00:00', 100.00),
(4, 'Pop Fiesta', 4, 'Sydney Opera House', 'Sydney', 'Australia', '2023-08-01', '19:00:00', '21:30:00', 130.00),
(5, 'Jazz Gala', 5, 'Blue Note', 'New York', 'USA', '2023-08-10', '20:00:00', '23:00:00', 110.00),
(6, 'Indie Night', 6, 'The O2 Arena', 'London', 'UK', '2023-09-01', '19:30:00', '22:00:00', 140.00),
(7, 'Electronic Fest', 7, 'Tokyo Dome', 'Tokyo', 'Japan', '2023-09-10', '18:00:00', '22:00:00', 160.00),
(8, 'Classical Harmony', 8, 'Sydney Opera House', 'Sydney', 'Australia', '2023-10-05', '19:00:00', '21:30:00', 120.00),
(9, 'Rock Legends', 9, 'Wembley Stadium', 'London', 'UK', '2023-10-15', '18:30:00', '22:30:00', 180.00),
(10, 'Pop Extravaganza', 10, 'Madison Square Garden', 'New York', 'USA', '2023-11-01', '19:00:00', '22:00:00', 150.00),
(11, 'Summer Vibes 2', 1, 'Barclays Center', 'New York', 'USA', '2023-11-10', '19:00:00', '22:00:00', 125.00),
(12, 'Rock Night 2', 2, 'Staples Center', 'Los Angeles', 'USA', '2023-11-20', '18:30:00', '21:30:00', 155.00),
(13, 'Acoustic Evening 2', 3, 'Royal Albert Hall', 'London', 'UK', '2023-12-01', '20:00:00', '22:00:00', 105.00),
(14, 'Pop Fiesta 2', 4, 'Sydney Opera House', 'Sydney', 'Australia', '2023-12-05', '19:00:00', '21:30:00', 135.00),
(15, 'Jazz Gala 2', 5, 'Blue Note', 'New York', 'USA', '2023-12-10', '20:00:00', '23:00:00', 115.00),
(16, 'Indie Night 2', 6, 'The O2 Arena', 'London', 'UK', '2023-12-15', '19:30:00', '22:00:00', 145.00),
(17, 'Electronic Fest 2', 7, 'Tokyo Dome', 'Tokyo', 'Japan', '2024-01-05', '18:00:00', '22:00:00', 165.00),
(18, 'Classical Harmony 2', 8, 'Sydney Opera House', 'Sydney', 'Australia', '2024-01-10', '19:00:00', '21:30:00', 125.00),
(19, 'Rock Legends 2', 9, 'Wembley Stadium', 'London', 'UK', '2024-01-15', '18:30:00', '22:30:00', 185.00),
(20, 'Pop Extravaganza 2', 10, 'Madison Square Garden', 'New York', 'USA', '2024-02-01', '19:00:00', '22:00:00', 155.00);


Select* from concerts ;

Drop table concerts ; 

Truncate table concerts ;


-- ------------------------------------------- Table - 22 tickets  ----------------------------------------------


CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY,
    concert_id INT NOT NULL,
    user_id INT NOT NULL,
    seat_number VARCHAR(20),
    purchase_date DATE NOT NULL,
    price DECIMAL(7,2) CHECK (price >= 0),
    ticket_type VARCHAR(50) DEFAULT 'General Admission',
    status VARCHAR(20) DEFAULT 'Booked' CHECK (status IN ('Booked','Cancelled','Used')),
    payment_method VARCHAR(50) DEFAULT 'Card',
    qr_code VARCHAR(255) UNIQUE,
    FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO tickets (ticket_id, concert_id, user_id, seat_number, purchase_date, price, ticket_type, status, payment_method, qr_code) VALUES
(1, 1, 1, 'A1', '2023-05-01', 120.00, 'VIP', 'Booked', 'Card', 'QR1001'),
(2, 1, 2, 'A2', '2023-05-02', 120.00, 'VIP', 'Booked', 'UPI', 'QR1002'),
(3, 2, 3, 'B1', '2023-06-01', 150.00, 'General', 'Booked', 'Card', 'QR1003'),
(4, 2, 4, 'B2', '2023-06-02', 150.00, 'General', 'Booked', 'Wallet', 'QR1004'),
(5, 3, 5, 'C1', '2023-06-20', 100.00, 'VIP', 'Booked', 'Card', 'QR1005'),
(6, 3, 6, 'C2', '2023-06-21', 100.00, 'VIP', 'Booked', 'UPI', 'QR1006'),
(7, 4, 7, 'D1', '2023-07-01', 130.00, 'General', 'Booked', 'Card', 'QR1007'),
(8, 4, 8, 'D2', '2023-07-02', 130.00, 'General', 'Booked', 'Wallet', 'QR1008'),
(9, 5, 9, 'E1', '2023-07-10', 110.00, 'VIP', 'Booked', 'Card', 'QR1009'),
(10, 5, 10, 'E2', '2023-07-11', 110.00, 'VIP', 'Booked', 'UPI', 'QR1010'),
(11, 6, 11, 'F1', '2023-08-01', 140.00, 'General', 'Booked', 'Card', 'QR1011'),
(12, 6, 12, 'F2', '2023-08-02', 140.00, 'General', 'Booked', 'Wallet', 'QR1012'),
(13, 7, 13, 'G1', '2023-08-10', 160.00, 'VIP', 'Booked', 'Card', 'QR1013'),
(14, 7, 14, 'G2', '2023-08-11', 160.00, 'VIP', 'Booked', 'UPI', 'QR1014'),
(15, 8, 15, 'H1', '2023-09-01', 120.00, 'General', 'Booked', 'Card', 'QR1015'),
(16, 8, 16, 'H2', '2023-09-02', 120.00, 'General', 'Booked', 'Wallet', 'QR1016'),
(17, 9, 17, 'I1', '2023-09-10', 180.00, 'VIP', 'Booked', 'Card', 'QR1017'),
(18, 9, 18, 'I2', '2023-09-11', 180.00, 'VIP', 'Booked', 'UPI', 'QR1018'),
(19, 10, 19, 'J1', '2023-10-01', 150.00, 'General', 'Booked', 'Card', 'QR1019'),
(20, 10, 20, 'J2', '2023-10-02', 150.00, 'General', 'Booked', 'Wallet', 'QR1020');


Select* from tickets ;

Drop table tickets ; 

Truncate table tickets ;


-- ------------------------------------------- Table - 23 reviews ----------------------------------------------


CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    item_type VARCHAR(50) NOT NULL CHECK (item_type IN ('Track', 'Album', 'Podcast', 'Concert', 'Playlist')),
    item_id INT NOT NULL,
    rating DECIMAL(2,1) CHECK (rating >= 0 AND rating <= 5),
    review_text VARCHAR(255),
    review_date DATE NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    likes INT DEFAULT 0 CHECK (likes >= 0),
    replies INT DEFAULT 0 CHECK (replies >= 0),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO reviews (review_id, user_id, item_type, item_id, rating, review_text, review_date, is_verified, likes, replies) VALUES
(1, 1, 'Track', 1, 4.5, 'Great track!', '2023-01-02', TRUE, 10, 2),
(2, 2, 'Track', 2, 4.0, 'Loved it', '2023-01-05', TRUE, 8, 1),
(3, 3, 'Album', 1, 5.0, 'Amazing album', '2023-01-10', TRUE, 15, 3),
(4, 4, 'Album', 2, 4.2, 'Good songs', '2023-01-15', TRUE, 7, 0),
(5, 5, 'Podcast', 1, 4.8, 'Very informative', '2023-02-01', TRUE, 12, 2),
(6, 6, 'Podcast', 2, 4.1, 'Nice discussion', '2023-02-05', TRUE, 6, 1),
(7, 7, 'Concert', 1, 5.0, 'Amazing live show', '2023-03-01', TRUE, 20, 5),
(8, 8, 'Concert', 2, 4.5, 'Loved the performance', '2023-03-05', TRUE, 14, 3),
(9, 9, 'Playlist', 1, 4.3, 'Perfect vibes', '2023-03-10', TRUE, 9, 1),
(10, 10, 'Playlist', 2, 4.0, 'Good selection', '2023-03-15', TRUE, 7, 0),
(11, 11, 'Track', 3, 4.7, 'Very catchy', '2023-04-01', TRUE, 11, 2),
(12, 12, 'Track', 4, 4.1, 'Nice rhythm', '2023-04-05', TRUE, 8, 1),
(13, 13, 'Album', 3, 5.0, 'Masterpiece', '2023-04-10', TRUE, 16, 4),
(14, 14, 'Album', 4, 4.2, 'Good listening', '2023-04-15', TRUE, 9, 1),
(15, 15, 'Podcast', 3, 4.9, 'Highly engaging', '2023-05-01', TRUE, 13, 3),
(16, 16, 'Podcast', 4, 4.0, 'Interesting topics', '2023-05-05', TRUE, 7, 0),
(17, 17, 'Concert', 3, 5.0, 'Unforgettable', '2023-06-01', TRUE, 18, 4),
(18, 18, 'Concert', 4, 4.6, 'Really enjoyed', '2023-06-05', TRUE, 12, 2),
(19, 19, 'Playlist', 3, 4.4, 'Nice mix', '2023-06-10', TRUE, 10, 1),
(20, 20, 'Playlist', 4, 4.0, 'Good variety', '2023-06-15', TRUE, 8, 0);



Select* from reviews ;

Drop table reviews ; 

Truncate table reviews ;


-- ------------------------------------------- Table - 24 advertisers  ----------------------------------------------


CREATE TABLE advertisers (
    advertiser_id INT PRIMARY KEY,
    company_name VARCHAR(150) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    website VARCHAR(150),
    country VARCHAR(50),
    ad_type VARCHAR(50) CHECK (ad_type IN ('Banner','Audio','Video','Sponsored Playlist')),
    budget DECIMAL(12,2) CHECK (budget >= 0),
    start_date DATE,
    end_date DATE
);

INSERT INTO advertisers (advertiser_id, company_name, contact_person, email, phone_number, website, country, ad_type, budget, start_date, end_date) VALUES
(1, 'TechCorp', 'Alice Johnson', 'alice@techcorp.com', '+1-555-1010', 'https://techcorp.com', 'USA', 'Banner', 50000.00, '2023-01-01', '2023-06-30'),
(2, 'HealthPlus', 'Bob Smith', 'bob@healthplus.com', '+1-555-1020', 'https://healthplus.com', 'USA', 'Audio', 30000.00, '2023-02-01', '2023-07-31'),
(3, 'TravelWorld', 'Catherine Lee', 'catherine@travelworld.com', '+1-555-1030', 'https://travelworld.com', 'UK', 'Video', 75000.00, '2023-03-01', '2023-08-31'),
(4, 'Foodies', 'David Brown', 'david@foodies.com', '+1-555-1040', 'https://foodies.com', 'USA', 'Sponsored Playlist', 40000.00, '2023-04-01', '2023-09-30'),
(5, 'EcoGreen', 'Eve Clark', 'eve@ecogreen.com', '+1-555-1050', 'https://ecogreen.com', 'Canada', 'Banner', 35000.00, '2023-05-01', '2023-10-31'),
(6, 'GameZone', 'Frank White', 'frank@gamezone.com', '+1-555-1060', 'https://gamezone.com', 'USA', 'Audio', 45000.00, '2023-06-01', '2023-11-30'),
(7, 'MusicLife', 'Grace Miller', 'grace@musiclife.com', '+1-555-1070', 'https://musiclife.com', 'UK', 'Video', 60000.00, '2023-07-01', '2023-12-31'),
(8, 'FitnessFirst', 'Henry Davis', 'henry@fitnessfirst.com', '+1-555-1080', 'https://fitnessfirst.com', 'Australia', 'Sponsored Playlist', 55000.00, '2023-08-01', '2024-01-31'),
(9, 'MovieTime', 'Ivy Wilson', 'ivy@movietime.com', '+1-555-1090', 'https://movietime.com', 'USA', 'Banner', 70000.00, '2023-09-01', '2024-02-28'),
(10, 'BookWorld', 'Jack Moore', 'jack@bookworld.com', '+1-555-1100', 'https://bookworld.com', 'UK', 'Audio', 25000.00, '2023-10-01', '2024-03-31'),
(11, 'AutoDrive', 'Karen Taylor', 'karen@autodrive.com', '+1-555-1110', 'https://autodrive.com', 'Germany', 'Video', 80000.00, '2023-11-01', '2024-04-30'),
(12, 'TravelMate', 'Leo Martin', 'leo@travelmate.com', '+1-555-1120', 'https://travelmate.com', 'Canada', 'Sponsored Playlist', 30000.00, '2023-12-01', '2024-05-31'),
(13, 'FoodiesPro', 'Mia Thompson', 'mia@foodiespro.com', '+1-555-1130', 'https://foodiespro.com', 'USA', 'Banner', 45000.00, '2024-01-01', '2024-06-30'),
(14, 'EcoLife', 'Nina Harris', 'nina@ecolife.com', '+1-555-1140', 'https://ecolife.com', 'UK', 'Audio', 35000.00, '2024-02-01', '2024-07-31'),
(15, 'GameHub', 'Oliver Lewis', 'oliver@gamehub.com', '+1-555-1150', 'https://gamehub.com', 'USA', 'Video', 60000.00, '2024-03-01', '2024-08-31'),
(16, 'MusicBeat', 'Paula Walker', 'paula@musicbeat.com', '+1-555-1160', 'https://musicbeat.com', 'Australia', 'Sponsored Playlist', 55000.00, '2024-04-01', '2024-09-30'),
(17, 'CineWorld', 'Quinn Young', 'quinn@cineworld.com', '+1-555-1170', 'https://cineworld.com', 'USA', 'Banner', 70000.00, '2024-05-01', '2024-10-31'),
(18, 'BookShelf', 'Ryan King', 'ryan@bookshelf.com', '+1-555-1180', 'https://bookshelf.com', 'UK', 'Audio', 25000.00, '2024-06-01', '2024-11-30'),
(19, 'AutoDrivePro', 'Sophia Scott', 'sophia@autodrivepro.com', '+1-555-1190', 'https://autodrivepro.com', 'Germany', 'Video', 80000.00, '2024-07-01', '2024-12-31'),
(20, 'TravelExplore', 'Tom Green', 'tom@travelexplore.com', '+1-555-1200', 'https://travelexplore.com', 'Canada', 'Sponsored Playlist', 30000.00, '2024-08-01', '2025-01-31');


Select* from advertisers ;

Drop table advertisers ; 

Truncate table advertisers ;


-- ------------------------------------------- Table - 25 ad_plays  ----------------------------------------------


CREATE TABLE ad_plays (
    ad_play_id INT PRIMARY KEY,
    advertiser_id INT NOT NULL,
    user_id INT NOT NULL,
    content_type VARCHAR(50) NOT NULL CHECK (content_type IN ('Track','Album','Podcast','Playlist','Concert')),
    content_id INT NOT NULL,
    play_time TIMESTAMP NOT NULL,
    device_id INT,
    duration_seconds INT CHECK (duration_seconds >= 0),
    revenue_generated DECIMAL(10,2) CHECK (revenue_generated >= 0),
    is_skipped BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (advertiser_id) REFERENCES advertisers(advertiser_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (device_id) REFERENCES devices(device_id)
);

INSERT INTO ad_plays (ad_play_id, advertiser_id, user_id, content_type, content_id, play_time, device_id, duration_seconds, revenue_generated, is_skipped) VALUES
(1, 1, 1, 'Track', 1, '2023-01-01 08:00:00', 1, 30, 2.50, FALSE),
(2, 1, 2, 'Track', 2, '2023-01-01 09:00:00', 2, 25, 2.50, TRUE),
(3, 2, 3, 'Album', 1, '2023-01-05 10:00:00', 3, 45, 3.00, FALSE),
(4, 2, 4, 'Album', 2, '2023-01-05 11:00:00', 4, 50, 3.00, FALSE),
(5, 3, 5, 'Podcast', 1, '2023-01-10 12:00:00', 5, 60, 4.00, TRUE),
(6, 3, 6, 'Podcast', 2, '2023-01-10 13:00:00', 6, 55, 4.00, FALSE),
(7, 4, 7, 'Playlist', 1, '2023-01-15 14:00:00', 7, 40, 3.50, FALSE),
(8, 4, 8, 'Playlist', 2, '2023-01-15 15:00:00', 8, 35, 3.50, TRUE),
(9, 5, 9, 'Track', 3, '2023-01-20 16:00:00', 9, 30, 2.75, FALSE),
(10, 5, 10, 'Track', 4, '2023-01-20 17:00:00', 10, 25, 2.75, FALSE),
(11, 6, 11, 'Album', 3, '2023-01-25 18:00:00', 11, 50, 3.25, TRUE),
(12, 6, 12, 'Album', 4, '2023-01-25 19:00:00', 12, 45, 3.25, FALSE),
(13, 7, 13, 'Podcast', 3, '2023-02-01 08:00:00', 13, 60, 4.50, FALSE),
(14, 7, 14, 'Podcast', 4, '2023-02-01 09:00:00', 14, 55, 4.50, TRUE),
(15, 8, 15, 'Playlist', 3, '2023-02-05 10:00:00', 15, 40, 3.75, FALSE),
(16, 8, 16, 'Playlist', 4, '2023-02-05 11:00:00', 16, 35, 3.75, FALSE),
(17, 9, 17, 'Track', 5, '2023-02-10 12:00:00', 17, 30, 2.90, TRUE),
(18, 9, 18, 'Track', 6, '2023-02-10 13:00:00', 18, 25, 2.90, FALSE),
(19, 10, 19, 'Album', 5, '2023-02-15 14:00:00', 19, 50, 3.60, FALSE),
(20, 10, 20, 'Album', 6, '2023-02-15 15:00:00', 20, 45, 3.60, TRUE);


Select* from ad_plays ;

Drop table ad_plays ; 

Truncate table ad_plays ;


-- -----------------------------------------------------------------------------------------------------------------------------------------
































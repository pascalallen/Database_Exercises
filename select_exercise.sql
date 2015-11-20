USE codeup_test_db;
SELECT 'Albums:' AS 'Pink Floyd';
SELECT * FROM albums WHERE artist = 'Pink Floyd';

SELECT 'Release Year:' AS 'Their Greatest Hits (1971–1975)';
SELECT release_date FROM albums WHERE artist = 'Eagles';

SELECT 'Genre:' AS 'Thriller';
SELECT genre FROM albums WHERE name = 'Thriller';

SELECT 'Released Albums:' AS '1990\'s';
SELECT name FROM albums WHERE release_date >= 1990;

SELECT 'Albums:' AS 'Less than 20k';
SELECT name FROM albums WHERE sales <= 20;

SELECT 'Albums: ' AS 'Rock';
SELECT name  FROM albums WHERE genre = 'Rock';
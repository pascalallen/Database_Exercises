USE codeup_test_db;
select name as "All albums in the table:"
from albums;

select name as "All albums released before 1980:"
from albums
where release_date < 1980;

select name as "All albums by Michael Jackson:"
from albums
where artist = "Michael Jackson";

update albums
set sales = sales * 10;
select sales from albums;

update albums
set release_date = FLOOR(RAND() * (1899 - 1800 + 1) + 1800)
where release_date < 1980;
select release_date from albums;

update albums
set artist = "Peter Jackson"
where artist = "Michael Jackson";
select artist from albums where artist = "Peter Jackson";

CREATE EXTENSION postgis;

CREATE TABLE MAP_LOCATIONS (
     name VARCHAR(255) PRIMARY KEY,
     coordinate geometry(POINT) NOT NULL
);
INSERT INTO MAP_LOCATIONS (name, coordinate)
VALUES
    ('Leavy Library',ST_GeomFromText('POINT(-118.282925183241 34.02199598099407)')),
    ('Doheny Library',ST_GeomFromText('POINT(-118.28374733274079 34.02030403799224)')),
    ('Science and Engineering Library',ST_GeomFromText('POINT(-118.28875651022642 34.01986019515823)')),
    ('Tutor Hall Cafe',ST_GeomFromText('POINT(-118.28996443461222 34.02088608336268)')),
    ('USC Law Cafe',ST_GeomFromText('POINT(-118.2845571013266 34.019569994934315)')),
    ('Little Galen Cafe',ST_GeomFromText('POINT(-118.28708923095672 34.02290479883183)')),
    ('USC School of Cinematic Arts',ST_GeomFromText('POINT(-118.2864198143773 34.02414514757435)')),
    ('USC Department of Mathematics',ST_GeomFromText('POINT(-118.29060973876254 34.022612080584764)')),
    ('USC School of Architecture',ST_GeomFromText('POINT(-118.28801439994476 34.01936305118736)')),
    ('Epstein Family Plaza Fountain',ST_GeomFromText('POINT(-118.28885641165677 34.020457386430294)')),
    ('Patsy and Forrest Shumway Fountain',ST_GeomFromText('POINT(-118.28519701180892 34.02021281338729)')),
    ('Fubon Fountain',ST_GeomFromText('POINT(-118.28507108766108 34.02547699595332)')),
    ('Home',ST_GeomFromText('POINT(-118.28817556080034 34.032179097981505)'));

--Convex Hull
SELECT ST_AsText(ST_ConvexHull(
    ST_Collect(ARRAY( SELECT coordinate FROM MAP_LOCATIONS ))
));

--4 Nearest Neighbors from Home
SELECT name, ST_AsText(coordinate) FROM MAP_LOCATIONS
WHERE name != 'Home'
ORDER BY ST_Distance(MAP_LOCATIONS.coordinate, ST_GeomFromText('POINT(-118.28817556080034 34.032179097981505)'))
LIMIT 4;



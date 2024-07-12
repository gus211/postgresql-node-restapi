DROP DATABASE IF EXISTS social_media_3;

CREATE DATABASE social_media_3;

USE DATABASE social_media_3;

CREATE TABLE countries(
    id SERIAL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id SERIAL,
    country_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    username VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(254) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    birthday DATE NOT NULL,
    password VARCHAR(255) NOT NULL,
    profile_photo_id VARCHAR(255),
    description VARCHAR(255),
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES countries (id)
);

CREATE TABLE follows (
    id SERIAL,
    follower_id INT NOT NULL,
    followed_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followed_id) REFERENCES users (id),
    CONSTRAINT unique_follow UNIQUE (follower_id, followed_id)
);

CREATE TABLE images (
    id SERIAL,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    filepath VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE posts (
    id SERIAL,
    user_id INT NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE posts_images (
    id SERIAL,
    post_id INT NOT NULL,
    image_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts (id),
    FOREIGN KEY (image_id) REFERENCES images (id)
);

CREATE TABLE posts_likes (
    id SERIAL,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT unique_like UNIQUE (post_id, user_id)
);

CREATE TABLE posts_comments (
    id SERIAL,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE favorites (
    id SERIAL,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO countries (name)
VALUES
    ('Afghanistan'),
    ('Albania'),
    ('Algeria'),
    ('Andorra'),
    ('Angola'),
    ('Antigua and Barbuda'),
    ('Argentina'),
    ('Armenia'),
    ('Australia'),
    ('Austria'),
    ('Azerbaijan'),
    ('Bahamas'),
    ('Bahrain'),
    ('Bangladesh'),
    ('Barbados'),
    ('Belarus'),
    ('Belgium'),
    ('Belize'),
    ('Benin'),
    ('Bhutan'),
    ('Bolivia'),
    ('Bosnia and Herzegovina'),
    ('Botswana'),
    ('Brazil'),
    ('Brunei'),
    ('Bulgaria'),
    ('Burkina Faso'),
    ('Burundi'),
    ('Cabo Verde'),
    ('Cambodia'),
    ('Cameroon'),
    ('Canada'),
    ('Central African Republic'),
    ('Chad'),
    ('Chile'),
    ('China'),
    ('Colombia'),
    ('Comoros'),
    ('Congo'),
    ('Costa Rica'),
    ('Croatia'),
    ('Cuba'),
    ('Cyprus'),
    ('Czech Republic'),
    ('Democratic Republic of the Congo'),
    ('Denmark'),
    ('Djibouti'),
    ('Dominica'),
    ('Dominican Republic'),
    ('East Timor'),
    ('Ecuador'),
    ('Egypt'),
    ('El Salvador'),
    ('Equatorial Guinea'),
    ('Eritrea'),
    ('Estonia'),
    ('Eswatini'),
    ('Ethiopia'),
    ('Fiji'),
    ('Finland'),
    ('France'),
    ('Gabon'),
    ('Gambia'),
    ('Georgia'),
    ('Germany'),
    ('Ghana'),
    ('Greece'),
    ('Grenada'),
    ('Guatemala'),
    ('Guinea'),
    ('Guinea-Bissau'),
    ('Guyana'),
    ('Haiti'),
    ('Honduras'),
    ('Hungary'),
    ('Iceland'),
    ('India'),
    ('Indonesia'),
    ('Iran'),
    ('Iraq'),
    ('Ireland'),
    ('Israel'),
    ('Italy'),
    ('Ivory Coast'),
    ('Jamaica'),
    ('Japan'),
    ('Jordan'),
    ('Kazakhstan'),
    ('Kenya'),
    ('Kiribati'),
    ('Kuwait'),
    ('Kyrgyzstan'),
    ('Laos'),
    ('Latvia'),
    ('Lebanon'),
    ('Lesotho'),
    ('Liberia'),
    ('Libya'),
    ('Liechtenstein'),
    ('Lithuania'),
    ('Luxembourg'),
    ('Madagascar'),
    ('Malawi'),
    ('Malaysia'),
    ('Maldives'),
    ('Mali'),
    ('Malta'),
    ('Marshall Islands'),
    ('Mauritania'),
    ('Mauritius'),
    ('Mexico'),
    ('Micronesia'),
    ('Moldova'),
    ('Monaco'),
    ('Mongolia'),
    ('Montenegro'),
    ('Morocco'),
    ('Mozambique'),
    ('Myanmar'),
    ('Namibia'),
    ('Nauru'),
    ('Nepal'),
    ('Netherlands'),
    ('New Zealand'),
    ('Nicaragua'),
    ('Niger'),
    ('Nigeria'),
    ('North Korea'),
    ('North Macedonia'),
    ('Norway'),
    ('Oman'),
    ('Pakistan'),
    ('Palau'),
    ('Palestine'),
    ('Panama'),
    ('Papua New Guinea'),
    ('Paraguay'),
    ('Peru'),
    ('Philippines'),
    ('Poland'),
    ('Portugal'),
    ('Qatar'),
    ('Romania'),
    ('Russia'),
    ('Rwanda'),
    ('Saint Kitts and Nevis'),
    ('Saint Lucia'),
    ('Saint Vincent and the Grenadines'),
    ('Samoa'),
    ('San Marino'),
    ('Sao Tome and Principe'),
    ('Saudi Arabia'),
    ('Senegal'),
    ('Serbia'),
    ('Seychelles'),
    ('Sierra Leone'),
    ('Singapore'),
    ('Slovakia'),
    ('Slovenia'),
    ('Solomon Islands'),
    ('Somalia'),
    ('South Africa'),
    ('South Korea'),
    ('South Sudan'),
    ('Spain'),
    ('Sri Lanka'),
    ('Sudan'),
    ('Suriname'),
    ('Sweden'),
    ('Switzerland'),
    ('Syria'),
    ('Tajikistan'),
    ('Tanzania'),
    ('Thailand'),
    ('Togo'),
    ('Tonga'),
    ('Trinidad and Tobago'),
    ('Tunisia'),
    ('Turkey'),
    ('Turkmenistan'),
    ('Tuvalu'),
    ('Uganda'),
    ('Ukraine'),
    ('United Arab Emirates'),
    ('United Kingdom'),
    ('United States'),
    ('Uruguay'),
    ('Uzbekistan'),
    ('Vanuatu'),
    ('Vatican City'),
    ('Venezuela'),
    ('Vietnam'),
    ('Yemen'),
    ('Zambia'),
    ('Zimbabwe');

INSERT INTO users (country_id, first_name, last_name, username, email, phone_number, birthday, password, description, address)
VALUES
(1, 'John', 'Smith', 'john20', 'john@gmail.com', '57893213456231', '01-01-2000', 'john123.', '24 y/o', '34 Street'),
(5, 'Anne', 'Gordon', 'anne30', 'anne@gmail.com', '57893213456221', '01-01-2000', 'anne123.', '24 y/o', '34 Street'),
(10, 'Rachell', 'Green', 'rachellicon', 'rachell@gmail.com', '57873213456231', '01-01-2000', 'rachell123.', '24 y/o', '34 Street'),
(56, 'Ross', 'Geller', 'rossdr', 'ross@gmail.com', '57893213456230', '01-01-2000', 'ross123.', '24 y/o', '34 Street'),
(181, 'Chandler', 'Bing', 'chandlerFunny', 'chandler@gmail.com', '56893213456231', '01-01-2000', 'chandler123.', '24 y/o', '34 Street');

INSERT INTO follows (follower_id, followed_id)
VALUES
(11, 12),
(11, 13),
(12, 11),
(14, 13),
(14, 15);

INSERT INTO images (user_id, name, filepath)
VALUES
(11, 'soccer.png', 'amazon/api/user/1/images/'),
(11, 'soccer2.png', 'amazon/api/user/2/images/'),
(13, 'baseball.png', 'amazon/api/user/3/images/'),
(14, 'college.png', 'amazon/api/user/4/images/');

INSERT INTO posts (user_id, description, created_at)
VALUES
(1, 'Enjoy. England vs Spain', '2024-07-10 10:23:54'),
(3, 'Enjoy. Detroit vs Dodgers', '2024-06-10 10:23:54');

INSERT INTO posts_images (post_id, image_id)
VALUES
(1, 1),
(1, 2),
(2, 3);

INSERT INTO posts_likes (post_id, user_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

INSERT INTO posts_comments (post_id, user_id, comment)
VALUES
(1, 1, 'Great'),
(1, 2, 'Nice'),
(2, 3, 'Good to see you!');

INSERT INTO favorites (post_id, user_id)
VALUES
(1, 2),
(1, 5);

SELECT * FROM users;

SELECT countries.name, users.first_name, users.last_name, users.username, users.email, users.phone_number, users.birthday, users.description, users.address
FROM countries
JOIN users
ON countries.id=users.country_id;

SELECT * FROM follows WHERE followed_id = 3;

-- Saber los usernames de los seguidores de un determinado usuario

SELECT users.username AS "Seguidores del usuario 3 Rachell"
FROM users
JOIN follows
ON users.id = follows.follower_id
WHERE follows.followed_id = 3;

-- Saber a qué usuarios (username) sigue un determinado usuario (id)
SELECT users.username AS "Seguidos del usuario 4 Ross"
FROM users
JOIN follows
ON users.id = follows.followed_id
WHERE follows.follower_id = 4;

-- Saber la cantidad de seguidores de un usuario por su id
SELECT COUNT(*) AS "Cantidad de seguidores de Rachell" FROM follows WHERE followed_id = 3;

SELECT * FROM images;

SELECT * FROM posts;


-- saber qué imagenes pertenecen a un determinado post

SELECT images.name, posts_images.post_id
FROM images
JOIN posts_images
ON images.id = posts_images.image_id
WHERE posts_images.post_id = 1;

-- saber qué comentarios pertenecen a un determinado post

SELECT posts_comments.comment
FROM posts_comments
WHERE post_id = 2;

-- saber la cantidad de comentarios de un determinado post

SELECT COUNT(*)
FROM posts_comments
WHERE post_id = 1;

-- Saber que usuarios le dieron like a un determinado post

SELECT users.username
FROM users
JOIN posts_likes
ON users.id = posts_likes.user_id
WHERE posts_likes.post_id = 1;


-- Saber la cantidad de likes de un post

SELECT COUNT(*)
FROM posts_likes
WHERE post_id = 1;

-- Saber los posts que guardó como favoritos un usuario

SELECT users.username, favorites.post_id
FROM users
JOIN favorites
ON users.id = favorites.user_id
WHERE favorites.user_id = 2;

-- Saber la cantidad de posts guardados como favoritos que tiene un usuario

SELECT COUNT(*)
FROM favorites
WHERE user_id = 5;

-- actualizar la foto de perfil de un usuario
-- 1 el usuario sube la foto
-- se obtiene el path/name de la foto
-- y se actualiza el campo profile_photo en la tabla users
-- Supongamos que el usuario ya subió la foto
-- se obtiene la ruta de la imagen
-- path = SELECT path FROM images WHERE images.user_id = [id]
-- se obtiene el nombre de la fotpo
-- name = SELECT name FROM images WHERE
-- se concatena

UPDATE users
SET profile_photo_id = `path + / + name`
WHERE id = [id]

-- por lo que creo que quedaría algo así

UPDATE users
SET profile_photo_id = 'amazon/api/user/1/images/soccer.png'
WHERE id = [id]

-- o así

UPDATE users
SET profile_photo_id = 'soccer.png'
WHERE id = [id]

-- prueba
-- actualizando la foto de perfil del usuario 1
SELECT * FROM users WHERE id = 1;

UPDATE users
SET profile_photo_id = 'amazon/api/user/1/images/soccer.png'
WHERE id = 1;

SELECT * FROM users WHERE id = 1;
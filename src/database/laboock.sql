-- Active: 1701217158719@@127.0.0.1@3306

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL
    );

INSERT into
    users(id, name, email, password, role)
VALUES -- senha fulano: fulano123
(
        'u001',
        'Fulano',
        'fulano@email.com',
        'fulano123',
        'NORMAL'
    ), -- senha beltrana: beltrana123
    (
        'u002',
        'Beltrana',
        'beltrana@email.com',
        '$2a$12$403HVkfVSUbDioyciv9IC.oBlgMqudbnQL8ubebJIXScNs8E3jYe2',
        'NORMAL'
    ), 
    -- senha astrodev: astrodev123
    (
        'u003',
        'Astrodev',
        'astrodev@email.com',
        '$2a$12$m9TH6NseIwCEb0g8/zq7ZOdQYN2AoMBpkvOeyz4BG9fwL7aq855u',
        'ADMIN'
    );

CREATE TABLE
    posts (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        creator_id TEXT UNIQUE NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER DEFAULT (0) NOT NULL,
        dislikes INTEGER DEFAULT (0) NOT NULL,
        created_at TEXT DEFAULT (DATETIME()) NOT NULL,
        updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
        FOREIGN KEY (creator_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE
    );

INSERT INTO
    posts (id, creator_id, content)
VALUES (
        'p001',
        'u001',
        'Bora estudar galera!'
    ), ('p002', 'u002', 'Bora Codar!!');

CREATE TABLE
    likes_dislikes (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts (id) ON UPDATE CASCADE ON DELETE CASCADE
    );

INSERT INTO
    likes_dislikes (user_id, post_id, like)
VALUES ('u002', 'p001', 1), ('u003', 'p001', 1), ('u001', 'p002', 1), ('u003', 'p002', 0);

UPDATE posts SET likes = 2 WHERE id = 'p001';

UPDATE posts SET likes = 1, dislikes = 1 WHERE id = 'p002';

DROP TABLE likes_dislikes;

DROP TABLE posts;

DROP TABLE users;
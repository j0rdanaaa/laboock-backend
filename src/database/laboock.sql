-- Active: 1698630652166@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);
CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT UNIQUE NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE likes_dislikes (
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    like INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts (id) ON UPDATE CASCADE ON DELETE CASCADE
);



INSERT into users(id, name, email, password, role, created_at)
VALUES
("u001", "Jordana", "jordana@email.com", "124572", "admin", DATETIME('now')),
("u002", "Diogo", "diogo@email.com", "12588832", "student", DATETIME('now')),
("u003", "Doritos", "doritos@email.com", "doridori", "moderator", DATETIME('now')),
("u004", "Belchior", "belchior@gmail.com.br", "senha123", "student", DATETIME('now')),
("u005", "Brianna", "brianna@email.com", "bribri123", "student", DATETIME('now'));
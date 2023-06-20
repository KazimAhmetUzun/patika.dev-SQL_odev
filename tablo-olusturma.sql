-- users tablosu
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    creation_date TIMESTAMP DEFAULT NOW(),
    is_active BOOLEAN
);


-- categories tablosu
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    creation_date TIMESTAMP DEFAULT NOW()
); 


-- posts tablosu
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    category_id INTEGER REFERENCES categories(category_id),
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    view_count INTEGER DEFAULT 0,
    creation_date TIMESTAMP DEFAULT NOW(),
    is_published BOOLEAN

); 


-- comments tablosu
CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(post_id),
    user_id INTEGER REFERENCES users(user_id),
    comment TEXT NOT NULL,
    creation_date TIMESTAMP DEFAULT NOW(),
    is_confirmed BOOLEAN
);

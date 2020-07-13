DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS yoga_sessions;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS yoga_classes;


CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) not null,
    last_name VARCHAR(255) not null,
    street VARCHAR(255),
    postcode VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(255),
    start_membership VARCHAR(255)
);

CREATE TABLE yoga_classes (
    id SERIAL PRIMARY KEY,
    category VARCHAR(255) not null,
    title VARCHAR(255) not null
);

CREATE TABLE yoga_sessions (
    id SERIAL PRIMARY KEY,
    yoga_class_id INT REFERENCES yoga_classes(id) ON DELETE CASCADE,
    wday VARCHAR(255) not null,
    schedule VARCHAR(255) not null,
    instructor VARCHAR(255) not null
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id) ON DELETE CASCADE,
    yoga_session_id INT REFERENCES yoga_sessions(id) ON DELETE CASCADE
);
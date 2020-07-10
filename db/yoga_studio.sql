DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS yoga_sessions;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS yoga_classes;


CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) not null,
    first_name VARCHAR(255) not null,
    last_name VARCHAR(255) not null,
    start_membership VARCHAR(255) not null
);

CREATE TABLE yoga_classes (
    id SERIAL PRIMARY KEY,
    category VARCHAR(255) not null,
    title VARCHAR(255) not null,
    duration INT not null
);

CREATE TABLE yoga_sessions (
    id SERIAL PRIMARY KEY,
    yoga_class_id INT REFERENCES yoga_classes(id),
    wday VARCHAR(255) not null,
    schedule VARCHAR(255) not null
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(id),
    yoga_session_id INT REFERENCES yoga_sessions(id)
);
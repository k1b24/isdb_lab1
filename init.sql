CREATE TABLE IF NOT EXISTS locations
(
    id              BIGSERIAL NOT NULL PRIMARY KEY,
    name            VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS characters
(
    id              BIGSERIAL NOT NULL PRIMARY KEY,
    name            VARCHAR(255) NOT NULL,
    description     VARCHAR(255),
    location_id     BIGINT NOT NULL,
    CONSTRAINT locations_id_fk
    FOREIGN KEY(location_id)
    REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS actions
(
    id              BIGSERIAL NOT NULL PRIMARY KEY,
    description     TEXT NOT NULL,
    performer_id    BIGINT NOT NULL,
    timestamp       TIMESTAMPTZ NOT NULL,
    CONSTRAINT performer_id_fk
    FOREIGN KEY(performer_id)
    REFERENCES characters(id)
);

CREATE TABLE IF NOT EXISTS emotions
(
    id      BIGSERIAL NOT NULL PRIMARY KEY,
    name    TEXT NOT NULL,
);

CREATE TABLE IF NOT EXISTS characters_emotions_log
(
    character_id    BIGINT NOT NULL,
    emotion_id      BIGINT NOT NULL,
    timestamp       TIMESTAMPTZ NOT NULL,
    CONSTRAINT character_id_fk
    FOREIGN KEY(character_id)
    REFERENCES characters(id),
    CONSTRAINT emotion_id_fk
    FOREIGN KEY(emotion_id)
    REFERENCES emotions(id),
    PRIMARY KEY(character_id, emotion_id, timestamp)
);

-- Run this file once, as a PostgreSQL superuser, to create the user, the
-- database and the table that the application needs. Give it to psql with <,
-- for example:
--
--   sudo -u postgres psql < schema.sql   # PostgreSQL installed with apt
--   psql postgres < schema.sql           # Postgres.app, or Homebrew
--
-- Run it with psql, not with a graphical client such as pgAdmin: the \connect
-- line below is a psql command, which they do not understand.
--
-- Change the password below before you run it. Prefer a password made only of
-- letters, digits and dashes: it goes into the connection URL at the top of
-- server.js, and characters such as @, :, / or spaces are reserved in a URL and
-- would have to be percent-encoded there. For example, a password containing a
-- space would need that space written as %20 in the URL:
--
--   postgresql://guessit:pass%20word@localhost:5432/guessit

CREATE USER guessit WITH PASSWORD 'guessit-2026';

CREATE DATABASE guessit OWNER guessit;

-- Connect to the new database before creating the table in it.
\connect guessit

CREATE TABLE game (
  id         TEXT PRIMARY KEY,
  name       TEXT NOT NULL,
  secret     INTEGER NOT NULL,
  attempts   INTEGER NOT NULL DEFAULT 0,
  found_at   TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE game OWNER TO guessit;

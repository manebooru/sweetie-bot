CREATE TABLE IF NOT EXISTS "quotes" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user" varchar, "channel" varchar, "body" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "admin" boolean, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE INDEX "index_quotes_on_user" ON "quotes" ("user");
CREATE INDEX "index_quotes_on_channel" ON "quotes" ("channel");
CREATE INDEX "index_users_on_name" ON "users" ("name");
CREATE INDEX "index_users_on_admin" ON "users" ("admin");
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE UNIQUE INDEX "index_quotes_on_body_and_user" ON "quotes" ("body", "user");


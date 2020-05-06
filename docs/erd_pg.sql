CREATE TABLE "Users" (
  "id" integer,
  "Email" String,
  "password" string,
  "name" string,
  "gravatat_url" string,
  PRIMARY KEY ("id")
);

CREATE TABLE "Posts" (
  "id" integer,
  "user_id" integer,
  "content" text,
  PRIMARY KEY ("id")
);

CREATE INDEX "FK" ON  "Posts" ("user_id");

CREATE TABLE "Comments" (
  "id" integer,
  "user_id" integer,
  "post_id" integer,
  "content" string,
  PRIMARY KEY ("id")
);

CREATE INDEX "FK" ON  "Comments" ("user_id", "post_id");

CREATE TABLE "Likes" (
  "id" Type,
  "post_id" Type,
  "user_id" Type,
  PRIMARY KEY ("id")
);

CREATE INDEX "FK" ON  "Likes" ("post_id", "user_id");

CREATE TABLE "Friendships" (
  "id" integer,
  "inviter_id" integer,
  "invitee_id" integer,
  PRIMARY KEY ("id")
);

CREATE INDEX "FK" ON  "Friendships" ("inviter_id", "invitee_id");


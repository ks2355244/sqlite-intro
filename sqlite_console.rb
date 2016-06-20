DLKS% cat << EOF >~/.sqliterc
heredoc> .headers on
heredoc> .mode column
heredoc> EOF
DLKS% ls      
sqlite_console.rb
DLKS% sqlite3 dummy.db 
-- Loading resources from /Users/mac/.sqliterc

SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for usage hints.
sqlite> CREATE TABLE users (
   ...> id INTEGER PRIMARY KET AUTO INCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL,
   ...> );
Error: near "KET": syntax error
sqlite>  CREATE TABLE users (
   ...>    ...> id INTEGER PRIMARY KET AUTO INCREMENT,
   ...>    ...> first_name VARCHAR(64) NOT NULL,
   ...>    ...> last_name VARCHAR(64) NOT NULL,
   ...>    ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...>    ...> created_at DATETIME NOT NULL,
   ...>    ...> updated_at DATETIME NOT NULL,
   ...>    ...> );
Error: near ".": syntax error
sqlite>    ...> id INTEGER PRIMARY KEY AUTO INCREMENT,
   ...> CREATE TABLE users (
   ...> id INTEGER PRIMARY KET AUTO INCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...>  email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL,
   ...> );
Error: near ".": syntax error
sqlite> CREATE TABLE users (
   ...> id INTEGER PRIMARY KEY AUTO INCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL,
   ...> );
Error: near "AUTO": syntax error
sqlite> CREATE TABLE users (
   ...> id INTEGER PRIMARY KEY AUTOINCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL,
   ...> );
Error: near ")": syntax error
sqlite> CREATE TABLE users (
   ...> id INTEGER PRIMARY KEY AUTOINCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL,
   ...> );
Error: near ")": syntax error
sqlite> CREATE TABLE users (
   ...> id INTEGER PRIMARY KEY AUTOINCREMENT,
   ...> first_name VARCHAR(64) NOT NULL,
   ...> last_name VARCHAR(64) NOT NULL,
   ...> email VARCHAR(128) UNIQUE NOT NULL,
   ...> created_at DATETIME NOT NULL,
   ...> updated_at DATETIME NOT NULL
   ...> );
sqlite> INSERT INTO users
   ...> (first_name, last_name, email, created_at)
   ...> VALUES
   ...> ('Joshua', 'Teng', 'jedicoder@example.com', DATETIME('now'), DATETIME('now'));
Error: 5 values for 4 columns
sqlite> INSERT INTO users
   ...> (first_name, last_name, email, created_at, updated_at)
   ...> VALUES
   ...> ('Joshua', 'Teng', 'jedicoder@example.com', DATETIME('now'), DATETIME('now'));
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at         
----------  ----------  ----------  ---------------------  -------------------  -------------------
1           Joshua      Teng        jedicoder@example.com  2016-06-20 05:58:17  2016-06-20 05:58:17
sqlite> INSERT INTO users
   ...> VALUES
   ...> ('David', 'Lee', 'jedicoder@example2.com', DATETIME('now'), DATETIME('now'));
Error: table users has 6 columns but 5 values were supplied
sqlite> INSERT INTO users
   ...> (first_name, last_name, email, created_at, updated_at)
   ...> VALUES
   ...> ('David', 'Lee', 'jedicoder@example2.com', DATETIME('now'), DATETIME('now'));
sqlite> SELECT * FROM users;
id          first_name  last_name   email                  created_at           updated_at         
----------  ----------  ----------  ---------------------  -------------------  -------------------
1           Joshua      Teng        jedicoder@example.com  2016-06-20 05:58:17  2016-06-20 05:58:17
2           David       Lee         jedicoder@example2.co  2016-06-20 06:02:49  2016-06-20 06:02:49
sqlite> CREATE TABLE "Nickname"(first_name, last_name, email, created_at, updated_at, nickname);
sqlite> .schema
CREATE TABLE users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL,
email VARCHAR(128) UNIQUE NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
);
CREATE TABLE "Nickname"(first_name, last_name, email, created_at, updated_at, nickname);
sqlite> ALTER TABLE users ADD COLUMN nicknames VARCHAR(64) NOT NULL;
Error: Cannot add a NOT NULL column with default value NULL
sqlite> .schema
CREATE TABLE users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL,
email VARCHAR(128) UNIQUE NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
);
CREATE TABLE "Nickname"(first_name, last_name, email, created_at, updated_at, nickname);
sqlite> ALTER TABLE users ADD COLUMN nicknames VARCHAR(64) NOT NULL DEFAULT;
Error: near ";": syntax error
sqlite> ALTER TABLE users ADD COLUMN nicknames VARCHAR(64) NOT NULL DEFAULT "not applicable";
sqlite> .schema
CREATE TABLE users (
id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(64) NOT NULL,
last_name VARCHAR(64) NOT NULL,
email VARCHAR(128) UNIQUE NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL
, nicknames VARCHAR(64) NOT NULL DEFAULT "not applicable");
CREATE TABLE "Nickname"(first_name, last_name, email, created_at, updated_at, nickname);
sqlite> select * from users;
id          first_name  last_name   email                  created_at           updated_at           nicknames     
----------  ----------  ----------  ---------------------  -------------------  -------------------  --------------
1           Joshua      Teng        jedicoder@example.com  2016-06-20 05:58:17  2016-06-20 05:58:17  not applicable
2           David       Lee         jedicoder@example2.co  2016-06-20 06:02:49  2016-06-20 06:02:49  not applicable
sqlite> UPDATE users SET nicknames='Ninja Coder' WHERE Id=2;
sqlite> select * from users;
id          first_name  last_name   email                  created_at           updated_at           nicknames     
----------  ----------  ----------  ---------------------  -------------------  -------------------  --------------
1           Joshua      Teng        jedicoder@example.com  2016-06-20 05:58:17  2016-06-20 05:58:17  not applicable
2           David       Lee         jedicoder@example2.co  2016-06-20 06:02:49  2016-06-20 06:02:49  Ninja Coder   
sqlite> 

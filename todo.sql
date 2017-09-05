Kyles-MacBook-Air:use_a_postgresql_database kylearora$ createdb todolist
Kyles-MacBook-Air:use_a_postgresql_database kylearora$ psql todolist
psql (9.6.5)
Type "help" for help.

todolist=# CREATE TABLE todos (
todolist(# id SERIAL PRIMARY KEY,
todolist(# title VARCHAR(255) NOT NULL,
todolist(# details TEXT NULL,
todolist(# priority INTEGER NOT NULL DEFAULT 1,
todolist(# created_at timestamp NOT NULL,
todolist(# completed_at timestamp
todolist(# );
CREATE TABLE
todolist=# \dt
         List of relations
 Schema | Name  | Type  |   Owner
--------+-------+-------+-----------
 public | todos | table | kylearora
(1 row)

todolist=# select * from todos;
 id | title | details | priority | created_at | completed_at
----+-------+---------+----------+------------+--------------
(0 rows)

todolist=#
INSERT INTO todos(title,details,priority,created_at) VALUES('Fix Car', 'Get car reupholstered', 2, current_timestamp);
INSERT 0 1
todolist=# select * from todos;
 id |  title  |        details        | priority |         created_at         | completed_at
----+---------+-----------------------+----------+----------------------------+--------------
  1 | Fix Car | Get car reupholstered |        2 | 2017-09-05 14:42:31.469832 |
(1 row)

todolist=#
INSERT INTO todos(title,details,priority,created_at) VALUES('Renew Energy Contract', 'Call up Infinite and Renew Energy Contract', 4, current_timestamp);
INSERT 0 1
todolist=#
INSERT INTO todos(title,details,priority,created_at, completed_at) VALUES('Create Postgresql Database Daily Project', 'Create Todo list in Postgresql Database via the terminal', 1, current_timestamp, current_timestamp);
INSERT 0 1

todolist=# select * from todos;
 id |                  title                   |                         details                          | priority |         created_at         |        completed_at
----+------------------------------------------+----------------------------------------------------------+----------+----------------------------+----------------------------
  1 | Fix Car                                  | Get car reupholstered                                    |        2 | 2017-09-05 14:42:31.469832 |
  2 | Renew Energy Contract                    | Call up Infinite and Renew Energy Contract               |        4 | 2017-09-05 14:43:24.054196 |
  3 | Create Postgresql Database Daily Project | Create Todo list in Postgresql Database via the terminal |        1 | 2017-09-05 14:47:34.637055 | 2017-09-05 14:47:34.637055
(3 rows)

todolist=#
INSERT INTO todos(title,details,priority,created_at) VALUES('Catch up on TIY', 'Finish old projects that were delayed due to Hurricane Harvey', 3, current_timestamp);
INSERT 0 1
todolist=# select * from todos;
 id |                  title                   |                            details                            | priority |         created_at         |        completed_at
----+------------------------------------------+---------------------------------------------------------------+----------+----------------------------+----------------------------
  1 | Fix Car                                  | Get car reupholstered                                         |        2 | 2017-09-05 14:42:31.469832 |
  2 | Renew Energy Contract                    | Call up Infinite and Renew Energy Contract                    |        4 | 2017-09-05 14:43:24.054196 |
  3 | Create Postgresql Database Daily Project | Create Todo list in Postgresql Database via the terminal      |        1 | 2017-09-05 14:47:34.637055 | 2017-09-05 14:47:34.637055
  4 | Catch up on TIY                          | Finish old projects that were delayed due to Hurricane Harvey |        3 | 2017-09-05 14:50:27.92945  |
(4 rows)

todolist=#
INSERT INTO todos(title,details,priority,created_at) VALUES('Ship out Sold Itmes', 'Ship out items that you sold on eBay', 5, current_timestamp);
INSERT 0 1
todolist=# select * from todos;
 id |                  title                   |                            details                            | priority |         created_at         |        completed_at
----+------------------------------------------+---------------------------------------------------------------+----------+----------------------------+----------------------------
  1 | Fix Car                                  | Get car reupholstered                                         |        2 | 2017-09-05 14:42:31.469832 |
  2 | Renew Energy Contract                    | Call up Infinite and Renew Energy Contract                    |        4 | 2017-09-05 14:43:24.054196 |
  3 | Create Postgresql Database Daily Project | Create Todo list in Postgresql Database via the terminal      |        1 | 2017-09-05 14:47:34.637055 | 2017-09-05 14:47:34.637055
  4 | Catch up on TIY                          | Finish old projects that were delayed due to Hurricane Harvey |        3 | 2017-09-05 14:50:27.92945  |
  5 | Ship out Sold Itmes                      | Ship out items that you sold on eBay                          |        5 | 2017-09-05 14:52:12.712375 |
(5 rows)

todolist=# select * from todos WHERE completed_at IS NULL;
 id |         title         |                            details                            | priority |         created_at         | completed_at
----+-----------------------+---------------------------------------------------------------+----------+----------------------------+--------------
  1 | Fix Car               | Get car reupholstered                                         |        2 | 2017-09-05 14:42:31.469832 |
  2 | Renew Energy Contract | Call up Infinite and Renew Energy Contract                    |        4 | 2017-09-05 14:43:24.054196 |
  4 | Catch up on TIY       | Finish old projects that were delayed due to Hurricane Harvey |        3 | 2017-09-05 14:50:27.92945  |
  5 | Ship out Sold Itmes   | Ship out items that you sold on eBay                          |        5 | 2017-09-05 14:52:12.712375 |
(4 rows)

todolist=# select * from todos WHERE priority > 1;
 id |         title         |                            details                            | priority |         created_at         | completed_at
----+-----------------------+---------------------------------------------------------------+----------+----------------------------+--------------
  1 | Fix Car               | Get car reupholstered                                         |        2 | 2017-09-05 14:42:31.469832 |
  2 | Renew Energy Contract | Call up Infinite and Renew Energy Contract                    |        4 | 2017-09-05 14:43:24.054196 |
  4 | Catch up on TIY       | Finish old projects that were delayed due to Hurricane Harvey |        3 | 2017-09-05 14:50:27.92945  |
  5 | Ship out Sold Itmes   | Ship out items that you sold on eBay                          |        5 | 2017-09-05 14:52:12.712375 |
(4 rows)

todolist=# UPDATE todos set completed_at = current_timestamp WHERE priority = 2;
UPDATE 1
todolist=# select * from todos;
 id |                  title                   |                            details                            | priority |         created_at         |        completed_at
----+------------------------------------------+---------------------------------------------------------------+----------+----------------------------+----------------------------
  2 | Renew Energy Contract                    | Call up Infinite and Renew Energy Contract                    |        4 | 2017-09-05 14:43:24.054196 |
  3 | Create Postgresql Database Daily Project | Create Todo list in Postgresql Database via the terminal      |        1 | 2017-09-05 14:47:34.637055 | 2017-09-05 14:47:34.637055
  4 | Catch up on TIY                          | Finish old projects that were delayed due to Hurricane Harvey |        3 | 2017-09-05 14:50:27.92945  |
  5 | Ship out Sold Itmes                      | Ship out items that you sold on eBay                          |        5 | 2017-09-05 14:52:12.712375 |
  1 | Fix Car                                  | Get car reupholstered                                         |        2 | 2017-09-05 14:42:31.469832 | 2017-09-05 15:04:12.526253
(5 rows)

todolist=# DELETE FROM todos where completed_at is NOT NULL;
DELETE 2
todolist=# select * from todos;
 id |         title         |                            details                            | priority |         created_at         | completed_at
----+-----------------------+---------------------------------------------------------------+----------+----------------------------+--------------
  2 | Renew Energy Contract | Call up Infinite and Renew Energy Contract                    |        4 | 2017-09-05 14:43:24.054196 |
  4 | Catch up on TIY       | Finish old projects that were delayed due to Hurricane Harvey |        3 | 2017-09-05 14:50:27.92945  |
  5 | Ship out Sold Itmes   | Ship out items that you sold on eBay                          |        5 | 2017-09-05 14:52:12.712375 |
(3 rows)

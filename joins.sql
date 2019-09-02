--1
SELECT * FROM users;

--2
SELECT * FROM posts
    WHERE user_id=100;
    --(1 rows)

--3
SELECT
    posts.*, users.first_name, users.last_name

    FROM posts

    INNER JOIN users ON posts.user_id = users.id

    WHERE users.id =200;
    -- (1 rows)

--4
SELECT
    posts.*, users.username

    FROM posts

    INNER JOIN users ON posts.user_id = users.id
    WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';
    --(1 rows)

--5
SELECT
    users.username,
    posts.created_at
    
    FROM users

    INNER JOIN posts ON posts.user_id = users.id

    WHERE posts.created_at > '2015-01-01';
    --(26598 rows)

--6
SELECT
    posts.title, posts.content, users.username

    FROM posts

    INNER JOIN users ON posts.user_id = users.id

    WHERE users.created_at < '2015-01-01';
    --(23488 rows)

--7
SELECT
    comments.*,
    posts.title AS "Post Title"

    FROM comments
    INNER JOIN posts ON comments.post_id = posts.id;
    --(19729 rows)

--8
SELECT
comments.*,
posts.title AS post_title,
posts.url AS post_url,
comments.body AS comment_body

FROM comments

INNER JOIN posts ON comments.post_id = posts.id

WHERE posts.created_at > '2015-01-01';
--(10603 rows)

--9
SELECT
comments.*,
posts.title AS post_title,
posts.url AS post_url,
comments.body AS comment_body

FROM comments

INNER JOIN posts ON comments.post_id = posts.id

WHERE posts.created_at < '2015-01-01';
--(9126 rows)

--10
SELECT
comments.*, posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body

FROM comments

INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%USB%';
--(728 rows)

--11
SELECT
posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body

FROM posts

INNER JOIN users ON posts.user_id = users.id

INNER JOIN comments ON comments.post_id = posts.id

WHERE comments.body LIKE '%matrix%';
--(855 rows)

--12
SELECT
users.first_name, users.last_name, comments.body AS comment_body

FROM users

INNER JOIN comments ON comments.user_id = users.id

INNER JOIN posts ON comments.post_id = posts.id

WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';
--(102 rows)

--13
SELECT
    u1.first_name AS post_author_first_name,
    u1.last_name AS post_author_last_name,
    posts.title AS post_title,
    u.username AS comment_author_username,
    comments.body AS comment_body,
    posts.content

    FROM posts

    INNER JOIN comments ON comments.post_id = posts.id
    INNER JOIN users AS u ON comments.user_id = u.id
    INNER JOIN users AS u1 ON posts.user_id = u1.id

    WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';

Additional Queries

--1
SELECT
    COUNT (comments.id)

    FROM posts

    INNER JOIN comments ON comments.post_id = posts.id

    WHERE
    posts.created_at > '2015-07-14';

--2
SELECT * FROM users
    
    INNER JOIN comments ON comments.user_id = users.id

    WHERE comments.body LIKE '%programming%';
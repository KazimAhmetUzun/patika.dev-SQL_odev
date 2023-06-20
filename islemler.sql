-- 1. Tüm blog yazılarını başlıkları, yazarları ve kategorileriyle birlikte getirin.

SELECT posts.title, users.username, categories.name FROM posts
JOIN users ON posts.user_id = users.user_id
JOIN categories ON posts.category_id = categories.category_id; 

-- 2. En son yayınlanan 5 blog yazısını başlıkları, yazarları ve yayın tarihleriyle birlikte alın.

SELECT posts.title, users.username, posts.creation_date FROM posts
JOIN users ON posts.user_id = users.user_id
ORDER BY posts.creation_date DESC
LIMIT 5; 

-- 3. Her blog yazısı için yorum sayısını gösterin.

SELECT posts.title, COUNT(comments.comment_id) AS yorum_sayisi FROM posts
JOIN comments ON posts.post_id = comments.post_id
GROUP BY posts.title; 

-- 4. Tüm kayıtlı kullanıcıların kullanıcı adlarını ve e-posta adreslerini gösterin.

SELECT username, email FROM users;

-- 5. En son 10 yorumu, ilgili gönderi başlıklarıyla birlikte alın.

SELECT comments.comment, posts.title FROM comments
JOIN posts ON comments.post_id = posts.post_id
ORDER BY comments.creation_date DESC
LIMIT 10;

-- 6. Belirli bir kullanıcı tarafından yazılan tüm blog yazılarını bulun.

SELECT title FROM posts
JOIN users ON posts.user_id = users.user_id
WHERE users.user_id = 1;

-- 7. Her kullanıcının yazdığı toplam gönderi sayısını alın.

SELECT username, COUNT(post_id) AS gonderi_sayisi FROM users
LEFT JOIN posts ON users.user_id = posts.user_id
GROUP BY users.username;

-- 8. Her kategoriyi, kategorideki gönderi sayısıyla birlikte gösterin.

SELECT name, COUNT(post_id) AS gonderi_sayisi FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.name;

-- 9. Gönderi sayısına göre en popüler kategoriyi bulun.

SELECT name, COUNT(post_id) AS gonderi_sayisi FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.name
ORDER BY gonderi_sayisi DESC
LIMIT 1;

-- 10. Gönderilerindeki toplam görüntülenme sayısına göre en popüler kategoriyi bulun.

SELECT name, SUM(view_count) AS toplam_goruntulenme FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.name
ORDER BY toplam_goruntulenme DESC
LIMIT 1;

-- 11. En fazla yoruma sahip gönderiyi alın.

SELECT title, COUNT(comment_id) AS yorum_sayisi FROM posts 
JOIN comments categories ON posts.post_id = categories.post_id
GROUP BY posts.post_id, posts.title
ORDER BY yorum_sayisi DESC
LIMIT 1;

-- 12. Belirli bir gönderinin yazarının kullanıcı adını ve e-posta adresini gösterin.

SELECT username, email FROM users 
JOIN posts  ON users.user_id = posts.user_id
WHERE posts.post_id = 1;

-- 13. Başlık veya içeriklerinde belirli bir anahtar kelime bulunan tüm gönderileri bulun.
SELECT title, content FROM posts 
WHERE title LIKE '%key%' OR content LIKE '%key%';

-- 14. Belirli bir kullanıcının en son yorumunu gösterin.
SELECT comment FROM comments 
WHERE user_id = 101
ORDER BY creation_date DESC
LIMIT 1;

-- 15. Gönderi başına ortalama yorum sayısını bulun.

SELECT AVG(yorum_sayisi) AS ortalama_yorum_sayisi FROM (
    SELECT posts.post_id, COUNT(comment_id) AS yorum_sayisi FROM posts
    JOIN comments ON posts.post_id = comments.post_id
    GROUP BY posts.post_id
) 
AS yorum_sayilari;

-- 16. Son 30 günde yayınlanan gönderileri gösterin.

SELECT * FROM posts
WHERE creation_date >= NOW() - INTERVAL '30 days';

-- 17. Belirli bir kullanıcının yaptığı yorumları alın.

SELECT comment FROM comments 
WHERE user_id = 1;

-- 18. Belirli bir kategoriye ait tüm gönderileri bulun.

SELECT user_id, title, content, view_count, posts.creation_date, is_published FROM posts 
JOIN categories  ON posts.category_id = categories.category_id
WHERE categories.category_id = 1;

-- 19. 5'ten az yazıya sahip kategorileri bulun.

SELECT name, COUNT(post_id) AS gonderi_sayisi FROM categories 
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.category_id, categories.name
HAVING COUNT(posts.post_id) < 5;

-- 20. Hem bir yazı hem de bir yoruma sahip olan kullanıcıları gösterin.

SELECT username FROM users 
JOIN posts  ON users.user_id = posts.user_id
JOIN comments  ON users.user_id = comments.user_id;

-- 21. En az 2 farklı yazıya yorum yapmış kullanıcıları alın.

SELECT username FROM users 
JOIN comments  ON users.user_id = comments.user_id
GROUP BY users.user_id, users.username
HAVING COUNT(DISTINCT comments.post_id) >= 2;

-- 22. En az 3 yazıya sahip kategorileri görüntüleyin.

SELECT name FROM categories
JOIN posts ON categories.category_id = posts.category_id
GROUP BY categories.name
HAVING COUNT(DISTINCT posts.post_id) >= 3;

-- 23. 5'ten fazla blog yazısı yazan yazarları bulun.

SELECT username FROM users 
JOIN posts  ON users.user_id = posts.user_id
GROUP BY users.user_id, users.username
HAVING COUNT(posts.post_id) > 5;

-- 24. Bir blog yazısı yazmış veya bir yorum yapmış kullanıcıların e-posta adreslerini görüntüleyin. (UNION kullanarak)

SELECT email FROM users 
JOIN posts ON users.user_id = posts.user_id
UNION
SELECT email FROM users 
JOIN comments ON users.user_id = comments.user_id;

-- 25. Bir blog yazısı yazmış ancak hiç yorum yapmamış yazarları bulun.

SELECT username FROM users 
JOIN posts ON users.user_id = posts.user_id
JOIN comments ON posts.post_id = comments.post_id
WHERE comments.comment_id IS NULL;






























































































































































































































































































































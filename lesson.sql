

-- MySQLへの接続と切断
mysql -u root
-- 抜ける時は
exit

source /home/ubuntu/sakila-schema.sql
source /home/ubuntu/sakila-data.sql
show tables;

-- 都道府県の情報が格納されている、 prefectures テーブルのみをもつデータベースが与えられます。
-- prefectures テーブルに含まれる、人口が 1,000,000 人未満 の
-- 都道府県の情報を全て表示するクエリを作成してください。
SELECT * FROM prefectures WHERE population <= 1000000;
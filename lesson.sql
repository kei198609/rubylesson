

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

-- 都道府県の情報が格納されている、 prefectures テーブルのみをもつデータベースが与えられます。
-- prefectures テーブルに含まれるデータを、
-- 面積が大きい順に並び替えたときの上位 10 件を出力するクエリを作成してください。
SELECT * FROM prefectures
ORDER BY area DESC --テーブルのデータを並び替えるには ORDER BY 句を使います。
LIMIT 10;



-- 都道府県の情報が格納されている、
-- prefectures テーブルのみをもつデータベースが与えられます。
-- prefectures テーブルに含まれるデータのうち、
-- 都道府県名に「島」が含まれる都道府県を抽出して、
-- すべての情報を表示するクエリを作成してください。
SELECT * FROM prefectures
WHERE name LIKE %島%;
-- 文字列の部分一致検索にはLIKE 演算子とパターン文字を用います。
-- パターン文字には % と _ の 2 種類があります。
USE master
CREATE TABLE bitop
(
	a int NOT NULL,
	b int NOT NULL
)
INSERT bitop VALUES(168,73)
SELECT a&b, a|b, a^b
	FROM bitop
GO

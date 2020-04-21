-- schema.sql - the data model for information on churches in Rome

CREATE TABLE churches (

	cid          INT PRIMARY KEY,
	name         TEXT,

	address      TEXT,
	architect    TEXT,
	artists      TEXT,
	built        TEXT,
	caption      TEXT,
	clergy       TEXT,
	consecrated  TEXT,
	dedication   TEXT,
	denomination TEXT,
	englishname  TEXT,
	fax          TEXT,
	image        TEXT,
	national     TEXT,
	phone        TEXT,
	titular      TEXT,
	type         TEXT,
	url          TEXT

);


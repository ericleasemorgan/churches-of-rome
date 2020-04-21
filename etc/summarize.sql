-- summarize.sql - query the database to create a simple report

-- Eric Lease Morgan <emorgan@nd.edu>
-- (c) University of Notre Dame; distributed under a GNU Public License

-- April 21, 2020 - first cut; during a pandemic


-- configure
.mode tabs

SELECT '';
SELECT '';
SELECT 'Churches of Rome';
SELECT '================';
SELECT '';
SELECT 'This text summarizes the contents of a database, specifically a';
SELECT 'database of churches in Rome. On one hand, the database is rich';
SELECT 'with information. On the other hand, the values in the given';
SELECT 'fields need to be normalized. Can you say "authority control"?';
SELECT '';
SELECT '                                                             --';
SELECT '                             Eric Lease Morgan <emorgan@nd.edu>';
SELECT '                                                 April 21, 2020';
SELECT '';
SELECT '';

SELECT 'Database schema - What fields are here?';
SELECT '---------------------------------------';
.schema
SELECT '';
SELECT '';

SELECT 'Number of records - How many churches do we know about?';
SELECT '-------------------------------------------------------';
SELECT COUNT( cid ) FROM churches;
SELECT '';
SELECT '';

SELECT 'Number of churches with English names - What are these churches called?';
SELECT '-----------------------------------------------------------------------';
SELECT COUNT( englishname ) FROM churches WHERE englishname > '';
SELECT '';
SELECT '';

SELECT 'Number of churches with addresses - Where are the churches?';
SELECT '-----------------------------------------------------------';
SELECT COUNT( address ) FROM churches WHERE address > '';
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of dates - When were the churches built?';
SELECT '-------------------------------------------------------------';
SELECT COUNT( built ) AS c, built FROM churches GROUP BY built ORDER BY c DESC;
SELECT '';

SELECT 'Counts & tabulations of architects - Who designed these churches?';
SELECT '-----------------------------------------------------------------';
SELECT COUNT( architect ) AS c, architect FROM churches GROUP BY architect ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of artists';
SELECT '-------------------------------';
SELECT COUNT( artists ) AS c, artists FROM churches GROUP BY artists ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of clergy';
SELECT '------------------------------';
SELECT COUNT( clergy ) AS c, clergy FROM churches GROUP BY clergy ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of consecrated';
SELECT '-----------------------------------';
SELECT COUNT( consecrated ) AS c, consecrated FROM churches GROUP BY consecrated ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of dedication';
SELECT '----------------------------------';
SELECT COUNT( dedication ) AS c, dedication FROM churches GROUP BY dedication ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of denomination';
SELECT '------------------------------------';
SELECT COUNT( denomination ) AS c, denomination FROM churches GROUP BY denomination ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of national';
SELECT '--------------------------------';
SELECT COUNT( national ) AS c, national FROM churches GROUP BY national ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of titular';
SELECT '-------------------------------';
SELECT COUNT( titular ) AS c, titular FROM churches GROUP BY titular ORDER BY c DESC;
SELECT '';
SELECT '';

SELECT 'Counts & tabulations of type';
SELECT '----------------------------';
SELECT COUNT( type ) AS c, type FROM churches GROUP BY type ORDER BY c DESC;
SELECT '';




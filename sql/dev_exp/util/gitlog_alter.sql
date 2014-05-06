ALTER TABLE gitlog ADD COLUMN  AuthorFirstDate timestamp NULL DEFAULT '0000-00-00 00:00:00' ;
ALTER TABLE gitlog ADD COLUMN  majorReleases int(10) unsigned DEFAULT NULL ;
ALTER TABLE gitlog ADD COLUMN  TimePeriod int(10) unsigned DEFAULT NULL ;
ALTER TABLE gitlog ADD COLUMN  ProjCommits int(10) DEFAULT NULL;
ALTER TABLE gitlog ADD COLUMN  securityFix int(10) DEFAULT NULL;


ALTER TABLE gitlog
ADD INDEX `commit_idx` (`commit`), 
ADD INDEX `GitLogFilesIndex` (`AuthorDate`,`AuthorEmail`) USING BTREE,
ADD INDEX `authoremail_idx` (`AuthorEmail`,`AuthorDate`),
ADD INDEX `commit_email_date_idx` (`AuthorDate`);


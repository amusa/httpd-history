ALTER TABLE gitlogfiles ADD COLUMN  authoremail varchar(50) NOT NULL;
ALTER TABLE gitlogfiles ADD COLUMN  filecommits bigint(21) DEFAULT NULL;
ALTER TABLE gitlogfiles ADD COLUMN  directoryexperience int(11) DEFAULT NULL;
ALTER TABLE gitlogfiles ADD COLUMN  authordate timestamp NOT NULL DEFAULT '0000-00-00 00:00:00';

ALTER TABLE gitlogfiles
ADD INDEX `primary_idx` (`authordate`,`commit`,`authoremail`,`filepath`), 
ADD INDEX `authorDate_IDX` (`authordate`),
ADD INDEX `commit_IDX` (`commit`),
ADD INDEX `filepath_IDX` (`filepath`),
ADD INDEX `authoremail_IDX` (`authoremail`,`authordate`);
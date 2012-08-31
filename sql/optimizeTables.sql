CREATE UNIQUE INDEX CVEIndex USING BTREE ON CVE(CVE);
CREATE UNIQUE INDEX CVEGroundedTheoryIndex USING BTREE ON CVEGroundedTheory(CVE);
CREATE INDEX FilepathIndex USING BTREE ON Filepaths(Filepath);
CREATE INDEX SVNLogRevisionIndex USING BTREE ON SVNLog(Revision);
CREATE INDEX SVNLogFilesRevisionIndex USING BTREE ON SVNLogFiles(Revision);
CREATE INDEX SVNLogFilesFilepathIndex USING BTREE ON SVNLogFiles(Filepath);

OPTIMIZE TABLE SVNLog;
OPTIMIZE TABLE SVNLogFiles;
OPTIMIZE TABLE Filepaths;
OPTIMIZE TABLE CVE;
OPTIMIZE TABLE CVESVNFix;
OPTIMIZE TABLE CVEGroundedTheory;
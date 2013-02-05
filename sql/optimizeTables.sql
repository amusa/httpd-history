CREATE UNIQUE INDEX CVEIndex USING BTREE ON CVE(CVE);
CREATE UNIQUE INDEX CVEGroundedTheoryIndex USING BTREE ON CVEGroundedTheory(CVE);
CREATE INDEX FilepathIndex USING BTREE ON Filepaths(Filepath);
CREATE UNIQUE INDEX GitLogCommitIndex USING BTREE ON GitLog(Commit);
CREATE UNIQUE INDEX GitLogFilesIndex USING BTREE ON GitLogFiles(Commit,Filepath);
CREATE UNIQUE INDEX GitLogAuthorDateIndex USING BTREE ON GitLog(commit,AuthorDate);
CREATE INDEX GitLogFilesFilepathIndex USING BTREE ON GitLogFiles(Filepath);
CREATE INDEX GitChurnEffectiveAuthorsAuthor USING BTREE ON GitChurnEffectiveAuthors(EffectiveAuthor);
CREATE INDEX GitChurnEffectiveACommitIndex USING BTREE ON GitChurnEffectiveAuthors(Commit);
CREATE INDEX GitChurnEffectiveAFilepathIndex USING BTREE ON GitChurnEffectiveAuthors(Filepath);
CREATE INDEX GitChurnAuthorsAffectedAuthor USING BTREE ON GitChurnAuthorsAffected(AuthorAffected);
CREATE INDEX GitChurnAuthorsCommitIndex USING BTREE ON GitChurnAuthorsAffected(commit);
CREATE INDEX GitChurnAuthorFilepathIndex USING BTREE ON GitChurnAuthorsAffected(filepath);
CREATE INDEX GitLogFilesComponent USING BTREE ON GitLogFiles(component);
CREATE INDEX CVEToGitIndex USING BTREE ON CVEToGit(CVE,Filepath);
CREATE INDEX CVEToGitCommitIntroduced USING BTREE ON CVEToGit(CommitIntroduced);
CREATE INDEX CVEToGitCommitFixed USING BTREE ON CVEToGit(CommitFixed);
CREATE INDEX ComponentPathIndex USING BTREE ON HttpdComponent(componentDesc); 

OPTIMIZE TABLE GitLog;
OPTIMIZE TABLE GitLogFiles;
OPTIMIZE TABLE Filepaths;
OPTIMIZE TABLE CVE;
OPTIMIZE TABLE CVEToGit;
OPTIMIZE TABLE CVEGroundedTheory;
OPTIMIZE TABLE GitChurnAuthorsAffected;
OPTIMIZE TABLE GitChurnEffectiveAuthors;
OPTIMIZE TABLE HttpdComponent;


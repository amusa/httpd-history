-- depends on gitlogfiles_alter.sql, and gitlog_alter.sql

update gitlogfiles f set authoremail = (SELECT authoremail from gitlog g WHERE g.commit = f.commit);

update gitlogfiles f set authordate = (SELECT authordate from gitlog g WHERE g.commit = f.commit);
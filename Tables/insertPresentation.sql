--Insert values into presentation
INSERT INTO presentation
(presentation_name, presentation_level, presentation_track, presentation_room, presentation_desc)
VALUES
('Advanced Security: Protecting Data from the DBA', 2, 5, 1,
'More and more regulated and audited industries have the problem that the DBA''s that manage SQL Server can access all the data. While application level encryption can solve the problem for special data like SSN sometimes encryption is not an option (keyword 3rd party application).
This session shows how to manage SQL Server without being a member of the sysadmin server role and how to audit SQL Server in cases where the DBA has to troubleshoot a problem as sysadmin.'
);
SELECT P.pid
FROM Parts P, Catalog C
WHERE P.pid = C.pid AND C.cost < 10;

SELECT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid AND C.cost < 10;

SELECT S.address
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.pname = 'Fire Hydrant Cap';

SELECT S.sname
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Green';

SELECT S.sname, P.pname
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid;

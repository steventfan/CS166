SELECT S.sname, COUNT(*)
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid
GROUP BY S.sid;

SELECT S.sname, COUNT(*)
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid
GROUP BY S.sid HAVING COUNT(*) > 2;

SELECT S.sname, COUNT(*)
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND S.sid IN(
													SELECT S.sid
													FROM Suppliers S, Parts P, Catalog C
													WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Green'
													EXCEPT
													SELECT S.sid
													FROM Suppliers S, Parts P, Catalog C
													WHERE S.sid = C.sid AND P.pid = C.pid AND P.color != 'Green')
GROUP BY S.sid;

SELECT S.sname, MAX(C.cost)
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid AND S.sid IN(
													SELECT S.sid
													FROM Suppliers S, Parts P, Catalog C
													WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Green'
													INTERSECT
													Select S.sid
													FROM Suppliers S, Parts P, Catalog C
													WHERE S.sid = C.sid AND P.pid = C.pid AND P.color = 'Red')
GROUP BY S.sid;

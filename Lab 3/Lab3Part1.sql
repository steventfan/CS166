DROP TABLE work_dept CASCADE;
DROP TABLE runs CASCADE;
DROP TABLE work_in CASCADE;
DROP TABLE manage CASCADE;
DROP TABLE major CASCADE;
DROP TABLE work_proj CASCADE;
DROP TABLE advise CASCADE;
DROP TABLE supervise CASCADE;
DROP TABLE Professor CASCADE;
DROP TABLE Dept CASCADE;
DROP TABLE Project CASCADE;
DROP TABLE Graduate CASCADE;

CREATE TABLE Professor 	(ssn CHAR(11) NOT NULL,
						name CHAR(32) NOT NULL,
						age INTEGER,
						rank CHAR(32) NOT NULL,
						specialty CHAR(32) NOT NULL,
						dno INTEGER,
						PRIMARY KEY(ssn) );

CREATE TABLE Dept	(dno INTEGER,
					dname CHAR(32) NOT NULL,
					office CHAR(32) NOT NULL,
					ssn CHAR(11) NOT NULL,
					PRIMARY KEY(dno),
					FOREIGN KEY(ssn) REFERENCES Professor(ssn) ON DELETE NO ACTION);

CREATE TABLE Project(pno INTEGER,
					sponsor CHAR(32) NOT NULL,
					start_date CHAR(8) NOT NULL,
					end_date CHAR(8) NOT NULL,
					budget INTEGER,
					ssn CHAR(11) NOT NULL,
					PRIMARY KEY(pno),
					FOREIGN KEY(ssn) REFERENCES Professor(ssn) ON DELETE NO ACTION);

CREATE TABLE Graduate	(SSN CHAR(11) NOT NULL,
						name CHAR(32) NOT NULL,
						age INTEGER,
						dep_pg CHAR(32) NOT NULL,
						dno INTEGER,
						PRIMARY KEY(SSN),
						FOREIGN KEY(dno) REFERENCES Dept(dno) );
			
CREATE TABLE work_dept	(ssn CHAR(11) NOT NULL,
						dno INTEGER,
						time_pc INTEGER,
						PRIMARY KEY(ssn, dno),
						FOREIGN KEY(ssn) REFERENCES Professor(ssn),
						FOREIGN KEY(dno) REFERENCES Dept(dno) );
						
CREATE TABLE runs	(ssn CHAR(11) NOT NULL,
					dno INTEGER,
					PRIMARY KEY(ssn, dno),
					FOREIGN KEY(ssn) REFERENCES Professor(ssn),
					FOREIGN KEY(dno) REFERENCES Dept(dno) );

CREATE TABLE work_in	(ssn CHAR(11) NOT NULL,
						pno INTEGER,
						PRIMARY KEY(ssn, pno),
						FOREIGN KEY(ssn) REFERENCES Professor(ssn),
						FOREIGN KEY(pno) REFERENCES Project(pno) );
						
CREATE TABLE manage	(ssn CHAR(11),
					pno INTEGER,
					PRIMARY KEY(ssn, pno),
					FOREIGN KEY(ssn) REFERENCES Professor(ssn),
					FOREIGN KEY(pno) REFERENCES Project(pno) );
					
CREATE TABLE major	(dno INTEGER,
					SSN CHAR(11) NOT NULL,
					PRIMARY KEY(dno, SSN),
					FOREIGN KEY(dno) REFERENCES Dept(dno),
					FOREIGN KEY(SSN) REFERENCES Graduate(SSN) );
					
CREATE TABLE work_proj	(pno INTEGER,
						SSN CHAR(11) NOT NULL,
						since CHAR(8) NOT NULL,
						ssn1 CHAR(11) NOT NULL,
						PRIMARY KEY(pno, SSN),
						FOREIGN KEY(pno) REFERENCES Project(pno),
						FOREIGN KEY(SSN) REFERENCES Graduate(SSN),
						FOREIGN KEY(ssn1) REFERENCES Professor(ssn) ON DELETE NO ACTION);
						
CREATE TABLE advise	(SSN CHAR(11) NOT NULL,
					SSN1 CHAR(11) NOT NULL,
					PRIMARY KEY(SSN, SSN1),
					FOREIGN KEY(SSN) REFERENCES Graduate(SSN),
					FOREIGN KEY(SSN1) REFERENCES Graduate(SSN) );

CREATE TABLE supervise	(ssn CHAR(11) NOT NULL,
						pno INTEGER,
						SSN1 CHAR(11) NOT NULL,
						PRIMARY KEY(ssn, pno, SSN1),
						FOREIGN KEY(ssn) REFERENCES Professor(ssn),
						FOREIGN KEY(pno) REFERENCES Project(pno),
						FOREIGN KEY(SSN1) REFERENCES Graduate(SSN) );

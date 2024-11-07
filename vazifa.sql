-- birinchisi

CREATE TABLE IF NOT EXISTS departments(
	department_id SERIAL PRIMARY KEY,
	nomi TEXT,
	joylashuv TEXT
);

CREATE TABLE IF NOT EXISTS xodimlar(
	xodim_id SERIAL PRIMARY KEY,
	ism TEXT,
	lavozim TEXT,
	department_id INTEGER REFERENCES departments(department_id)
);

CREATE TABLE IF NOT EXISTS loyhalar(
	loyha_id SERIAL PRIMARY KEY,
	nomi TEXT,
	department_id INTEGER REFERENCES departments(department_id)
);

CREATE TABLE IF NOT EXISTS vazifalar(
	vazifa_id SERIAL PRIMARY KEY,
	tavsif TEXT,
	xodim_id INTEGER REFERENCES xodimlar(xodim_id)
	loyha_id INTEGER REFERENCES loyhalar(loyha_id)
);

INSERT INTO departments(nomi, joylashuv) VALUES
('Python', 'Py xonasi'),
('JavaScript', 'JS xonasi'),
('C++', 'C+ xonasi'),
('C##', 'C# xonasi'),
('Java', 'Java xonasi');

INSERT INTO xodimlar(ism, lavozim, department_id) VALUES
('Ali', 'Boshliq O''rin B', 1),
('Jamshim', 'Ishchi', 5),
('Olim', 'Boshliq', 2),
('Asad', 'Ishchi', 4),
('Sardor', 'Boshliq O''rin B', 3);

INSERT INTO loyhalar(nomi, department_id) VALUES
('Yangi jadval', 2),
('yangi jadval2', 4)
('yangi jadval4', 1)
('yangi jadval3', 5)
('yangi jadval5', 3)

INSERT INTO vazifalar(tavsif, xodim_id, loyha_id) VALUES
('oddiy', 2, 1),
('murakkab', 3, 2)
('oddiy', 4, 3)
('murakkab', 4, 5)
('oddiy', 3, 5)

-- -----------------------------------------------------
-- ikkinchisi

ALTER TABLE xodimlar
ADD COLUMN IF NOT EXISTS email TEXT;

ALTER TABLE vazifalar
MODIFY tavsif VARCHAR(255);

-- ----------------------------------------------
-- uchinchisi

UPDATE xodimlar SET lavozim = 'Katta Dasturchi' WHERE xodim_id = 1;

UPDATE loyhalar SET nomi = 'Murakkab jadval' WHERE loyha_id = 2;

-- -----------------------------------------------------
-- tortinchisi

DELETE FROM loyhalar WHERE loyha_id = 3;

DELETE FROM xodimlar WHERE xodim_id = 4;




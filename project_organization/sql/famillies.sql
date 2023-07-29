INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_famillies', 'Famillies', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_famillies', 'Famillies', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_famillies', 'Famillies', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('famillies','Famillies')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('famillies', 0, 'recruit', 'Rekru', 0, '{}', '{}'),
('famillies', 1, 'recruit', 'Dealer', 0, '{}', '{}'),
('famillies', 2, 'employer', 'OG', 0, '{}', '{}'),
('famillies', 3, 'employer', 'Nadzorca', 0, '{}', '{}'),
('famillies', 4, 'employer', 'Lewa ręka', 0, '{}', '{}'),
('famillies', 5, 'viceboss', 'Prawa reka', 0, '{}', '{}'),
('famillies', 6, 'boss', 'Szef', 0, '{}', '{}');
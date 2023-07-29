INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_vagos', 'vagos', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_vagos', 'vagos', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_vagos', 'vagos', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('vagos','vagos')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('vagos', 0, 'recruit', 'Private', 0, '{}', '{}'),
('vagos', 1, 'employer', 'Soldier', 0, '{}', '{}'),
('vagos', 2, 'employer', 'Right Hand', 0, '{}', '{}'),
('vagos', 3, 'boss', 'Boss', 0, '{}', '{}');
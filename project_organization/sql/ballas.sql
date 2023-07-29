INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ballas', 'Ballas', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_ballas', 'Ballas', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ballas', 'Ballas', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('ballas','Ballas')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('ballas', 0, 'recruit', 'New Balla', 0, '{}', '{}'),
('ballas', 1, 'employer', 'Ballas', 0, '{}', '{}'),
('ballas', 2, 'employer', 'Dodger Gangsta', 0, '{}', '{}'),
('ballas', 3, 'employer', 'Young Original', 0, '{}', '{}'),
('ballas', 4, 'boss', 'Original Gangsta', 0, '{}', '{}');
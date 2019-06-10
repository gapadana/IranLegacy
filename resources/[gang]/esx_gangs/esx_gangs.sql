CREATE TABLE if not exists `gang` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,

  PRIMARY KEY (`id`)
);

INSERT INTO gang (name, label) VALUES
('none', 'Unaffiliated'),
('feketei', 'Az Utca Feketi'),
('nemzeti', 'Nemzeti Erök'); 

CREATE TABLE if not exists `gang_grades` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang_name` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,

  PRIMARY KEY (`id`)
);


INSERT INTO gang_grades (gang_name, grade, name, label) VALUES 
('none', 0, 'none', 'Nincs Bandd'), 
('feketei', 0, 'feketei2', 'jonc'),
('feketei', 1, 'feketei3', 'Niggerke'),
('feketei', 2, 'feketei4', 'Dealer'), 
('feketei', 3, 'feketei5', 'Hsges'), 
('feketei', 4, 'boss', 'Vezr'), 
('nemzeti', 0, 'nemzeti1', 'Hazafi'), 
('nemzeti', 1, 'nemzeti2', 'Betyr'), 
('nemzeti', 2, 'nemzeti3', 'Honfitrs'),
('nemzeti', 3, 'boss', 'Vezr'); 
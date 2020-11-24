USE icebaby;

CREATE TABLE users (
   id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   role TINYINT(1) UNSIGNED NOT NULL DEFAULT '1',
   create_at DATETIME NOT NULL DEFAULT NOW(),
   update_at DATETIME NOT NULL DEFAULT NOW(),
   `status` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
) AUTO_INCREMENT = 10001;

CREATE TABLE user_details (
   id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   user_id INT(11) UNSIGNED,
   nickname VARCHAR(10) UNIQUE NOT NULL DEFAULT '',
   avatar VARCHAR(50) NOT NULL DEFAULT '',
   intro VARCHAR(50) NOT NULL DEFAULT '',
   sex tinyint(1) NOT NULL DEFAULT '2',
   birthday DATE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL DEFAULT '',
	area VARCHAR(5) NOT NULL DEFAULT '',
	height tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
	weight tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
	favorite VARCHAR(50) NOT NULL DEFAULT '',
	smoke tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
	drink tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
   nvite_code VARCHAR(10) UNIQUE NOT NULL DEFAULT '',
	invite_user_id INT(11) UNSIGNED NOT NULL DEFAULT '0',
	CONSTRAINT fk_details_users FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_auths (
   id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	 user_id INT(11) UNSIGNED,
	 type TINYINT(1) UNSIGNED NOT NULL DEFAULT '1',
	 identifier VARCHAR(50) UNIQUE NOT NULL DEFAULT '',
	 `password` VARCHAR(10) NOT NULL DEFAULT '',
	CONSTRAINT fk_auths_users FOREIGN KEY (user_id) REFERENCES users(id)
);
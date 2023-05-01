use tripdb;

CREATE TABLE user (
  name varchar(20) NOT NULL,
  id varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  email varchar(20) NOT NULL,
  age int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from user;

CREATE TABLE `notice` (
  `article_no` int NOT NULL AUTO_INCREMENT,
  `id` varchar(16) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `hit` int DEFAULT '0',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`),
  KEY `notice_to_user_id_fk` (`id`),
  CONSTRAINT `notice_to_user_id_fk` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `review` (
  `article_no` int NOT NULL AUTO_INCREMENT,
  `id` varchar(16) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `hit` int DEFAULT '0',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`),
  KEY `review_to_user_id_fk` (`id`),
  CONSTRAINT `review_to_user_id_fk` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

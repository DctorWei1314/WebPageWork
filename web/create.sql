CREATE TABLE `user` (
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `imgFilePath` varchar(255) DEFAULT 'img/default.jpg',
  `email` varchar(30),
  `defaultAddress` varchar(200),
  `type` enum('buyer', 'saler', 'admin', 'unknown') NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `report` (
  `reportUserID` varchar(20) NOT NULL,
  `reportedShopID` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `reportTime` DateTime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tag` (
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `address` (
  `name` varchar(20) NOT NULL,
  `street` varchar(200) NOT NULL,
  `mobile` varchar(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ordersheet` (
  `order_id` int(6) NOT NULL AUTO_INCREMENT,
  `saleID` varchar(20) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `buyNumber` int(4) NOT NULL,
  `buyer` varchar(20) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `time` datetime DEFAULT NULL,
  `state` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `global_discount` (
  `discount` float(3,2) NOT NULL DEFAULT '1.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `product` (
  `name` varchar(30) NOT NULL,
  `saleID` varchar(20) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `score` decimal(3,2) DEFAULT NULL,
  `scoreNumber` int(11) DEFAULT '0',
  `saleNumber` int(11) DEFAULT '0',
  `leftNumber` int(11) DEFAULT '0',
  `price` decimal(5,2) NOT NULL,
  `discount` float(3,2) NOT NULL DEFAULT '1.00',
  `salePrice` decimal(5,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`name`,`saleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `product_tag` (
  `product_name` varchar(30) NOT NULL,
  `saleID` varchar(20) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `saleShop` (
  `saleID` varchar(20) NOT NULL,
  `saleAddress` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`saleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `product_name` varchar(30) NOT NULL,
  `saleID` varchar(30) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `commentContent` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE database cakeshop;
use cakeshop;
DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cover` varchar(45) DEFAULT NULL,
  `image1` varchar(45) DEFAULT NULL,
  `image2` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `intro` varchar(300) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_id_idx` (`type_id`),
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*Khóa ngoại này tham chiếu đến khóa chính của bảng type trên cột id`.*/


DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float DEFAULT NULL,
  `amount` int(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `paytype` tinyint(1) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/***3. ON DELETE NO ACTION :**

* Mệnh đề này trong các ràng buộc khóa ngoại chỉ định rằng việc xóa một hàng khỏi bảng được tham chiếu (ví dụ: `Order`) sẽ không tự động xóa bất kỳ order nào trong các bảng tham chiếu (ví dụ: `orderitem`) tham chiếu đến hàng đó.
 Điều này đảm bảo tính toàn vẹn dữ liệu và ngăn chặn việc xóa tầng không mong muốn.*/



DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_id_idx` (`order_id`),
  KEY `fk_orderitem_goods_id_idx` (`goods_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*Cụ thể, hai ràng buộc khóa ngoại fk_order_id và fk_orderitem_goods_id đều có mệnh đề ON DELETE NO ACTION.
 Mệnh đề này quy định rằng việc xóa một hàng từ các bảng được tham chiếu (order và goods) sẽ không tự động xóa bất kỳ hàng nào trong bảng orderitem 
 tham chiếu đến các hàng đó. Nói cách khác, ngay cả khi bạn cố gắng xóa một hàng hóa, bất kỳ đơn hàng nào tham chiếu đến hàng hóa đó sẽ vẫn còn trong cơ sở dữ liệu.
*/


LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (43,50.2,1,1,47);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_id_idx` (`goods_id`),
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `isadmin` bit(1) DEFAULT NULL,
  `isvalidate` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `user` (`username`, `email`, `password`, `name`, `phone`, `address`, `isadmin`, `isvalidate`)
VALUES 
('user1', 'user1@example.com', 'password1', 'User One', '1234567890', 'Address 1', b'0', b'1'),
('user2', 'admin@gmail.com', 'admin', 'User Two', '0987654321', 'Address 2', b'1', b'0');
/*## Giải thích câu lệnh SQL:

**2. Ràng buộc khóa ngoại:**

* **`goods`.`type_id` tham chiếu `type`.`id`:** Ràng buộc này đảm bảo rằng `type_id` trong bảng `goods` trỏ đến ID hợp lệ trong bảng `type`.
* **`order`.`user_id` tham chiếu `user`.`id`:** Ràng buộc này đảm bảo rằng `user_id` trong bảng `order` trỏ đến ID hợp lệ trong bảng `user`.
* **`orderitem`.`goods_id` tham chiếu `goods`.`id`:** Ràng buộc này đảm bảo rằng `goods_id` trong bảng `orderitem` trỏ đến một ID hợp lệ trong bảng `goods`.
* **`orderitem`.`order_id` tham chiếu `order`.`id`:** Ràng buộc này đảm bảo rằng `order_id` trong bảng `orderitem` trỏ đến ID hợp lệ trong bảng `order`.
* **`recommend`.`goods_id` tham chiếu `goods`.`id`:** Ràng buộc này đảm bảo rằng `goods_id` trong bảng `recommend` trỏ đến ID hợp lệ trong bảng `goods`.

**3. ON DELETE NO ACTION :**

* Mệnh đề này trong các ràng buộc khóa ngoại chỉ định rằng việc xóa một hàng khỏi bảng được tham chiếu (ví dụ: `hàng hóa`) sẽ không tự động xóa bất kỳ hàng nào trong các bảng tham chiếu (ví dụ: `orderitem`) tham chiếu đến hàng đó. Điều này đảm bảo tính toàn vẹn dữ liệu và ngăn chặn việc xóa tầng không mong muốn.

**4. Dữ liệu mẫu:**

* Một mục nhập dữ liệu mẫu được chèn vào bảng `orderitem`, liên kết một mặt hàng cụ thể với một đơn đặt hàng.

**/

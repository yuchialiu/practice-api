-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: practice
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','$2b$10$J4UBDeRHUYYva5Wrupk9JOUnHLn34Z.Tr81i3QJQ1.d/4mqXfZUsS'),(2,'test1','$2b$10$FLKTK/F.gLLaY4maeq/Px.MHYrrfyoczjXTwDo5p/kqrqwIl0JrtS'),(3,'test2','$2b$10$n9WWvbu9STFwbd6ovDZ6buSqIaJqpsEsPqZGRnjfN8L1Jd2RFOO3C'),(4,'test3','$2b$10$GjCGZuiNBvA1sj5Hpa3rBeOj6FbLidfm9KJ7z5nDes4O39ML0mSv.'),(5,'test4','$2b$10$.dxLueqmgsbqlaUN51AWxuiioQ1KjLb49.TBJl5SLG8OLiomLkelq'),(6,'test5','$2b$10$2iABloSRlmSY4E1xaZE.DehWs731quuqeYL47X0FKUdAvU5Lo2PKG'),(7,'test6','$2b$10$8dL.gKcOJbRPCI8pPAgn3uKfLCR5xvFo3oZavIMOoz0wzLIAH2CsK'),(8,'test7','$2b$10$aQcs/kpzAKGIkrx10cuvxePAjTN/EBYVytNOgffy2JvYmoopj9JZS'),(9,'tes','$2b$10$y.6v8/ti0CSLoVTwQWV...alOvxeg6kx9CG4QiMAm5konLm.je4.e'),(10,'testtesttesttesttesttesttesttest','$2b$10$2U4dQyjRUS.Yu0k8y.FJEeEOu/ldtnulAxynxWmMjjUBP8KhrC00u'),(11,'test8','$2b$10$rxpUIaPZ7eH2kmg6Y71wF.LXaPaa.GyJPhHuezdfSOGMYkxIzTVBe'),(12,'test9','$2b$10$2/7Di4Gx52XTeD7ALWJ5FuCRX6Jlc.o1DT4yUBn86t44DtuA1CGOS'),(13,'test10','$2b$10$GNxNrZzVE.NqB3tIqZk/aeR3TkzDLVGdl.w5FqffEbc6270IcCV4O'),(14,'test11','$2b$10$2GTeXwiicj4HpxxIuKrhIOrs4SxTtB81Y/PCg3zacIQn6QdCqbfx6'),(15,'test12','$2b$10$BOVkqg9S4H3YIzY6ndhd0efZFpp9ffMNo5QtFVU47DD1RzJQaOD16');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-16  3:17:31

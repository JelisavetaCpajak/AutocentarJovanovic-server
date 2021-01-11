-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autocentar
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `atest`
--

DROP TABLE IF EXISTS `atest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atest` (
  `broj_atesta` varchar(45) NOT NULL,
  `datum` datetime DEFAULT NULL,
  `napomena` varchar(500) DEFAULT NULL,
  `broj_sasije` varchar(17) DEFAULT NULL,
  `id_klijenta` varchar(45) DEFAULT NULL,
  `sifra_tipa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`broj_atesta`),
  KEY `sifra_key_idx` (`sifra_tipa`) /*!80000 INVISIBLE */,
  KEY `id_klijenta_idx` (`id_klijenta`),
  KEY `broj_sasije_atest_idx` (`broj_sasije`),
  CONSTRAINT `broj_sasije_atest` FOREIGN KEY (`broj_sasije`) REFERENCES `vozilo` (`broj_sasije`) ON UPDATE CASCADE,
  CONSTRAINT `id_klijenta_atest` FOREIGN KEY (`id_klijenta`) REFERENCES `klijent` (`id_klijenta`) ON UPDATE CASCADE,
  CONSTRAINT `sifra_tipa_atest` FOREIGN KEY (`sifra_tipa`) REFERENCES `tip_atesta` (`sifra_tipa`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atest`
--

LOCK TABLES `atest` WRITE;
/*!40000 ALTER TABLE `atest` DISABLE KEYS */;
INSERT INTO `atest` VALUES ('029780-20','2020-03-19 00:00:00','Bocna stakla - stepen zatamnjenja manji od 30%, stepen refleksije manji od 15%. Zadnje staklo - stepen zatamnjenja veci od 30%, stepen refleksije manji od 15% ','R2024078596658423','be297ea5-01e8-4222-8f6e-03e7cec2cab9','1'),('033621-20 K','2020-02-18 00:00:00','Rezervoar \"Olimpik\" homologacija E1367R010272, Reduktor \"Longas\" homologacija E867R011515, Multiventil \"Atiker\" homologacija E767R011031806','R2024078596658423','be297ea5-01e8-4222-8f6e-03e7cec2cab9','2');
/*!40000 ALTER TABLE `atest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atest_zapisnik`
--

DROP TABLE IF EXISTS `atest_zapisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atest_zapisnik` (
  `id_broj` varchar(45) NOT NULL,
  `broj_atesta` varchar(45) NOT NULL,
  `datum_koriscenja` datetime DEFAULT NULL,
  PRIMARY KEY (`id_broj`,`broj_atesta`),
  KEY `broj_atesta_idx` (`broj_atesta`),
  CONSTRAINT `broj_atesta_atest_zapisnik` FOREIGN KEY (`broj_atesta`) REFERENCES `atest` (`broj_atesta`) ON UPDATE CASCADE,
  CONSTRAINT `id_broj_atest_zapisnik` FOREIGN KEY (`id_broj`) REFERENCES `zapisnik_o_tehnickom_pregledu` (`id_broj`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atest_zapisnik`
--

LOCK TABLES `atest_zapisnik` WRITE;
/*!40000 ALTER TABLE `atest_zapisnik` DISABLE KEYS */;
INSERT INTO `atest_zapisnik` VALUES ('1','029780-20','2020-05-23 00:00:00'),('1','033621-20 K','2020-05-23 00:00:00');
/*!40000 ALTER TABLE `atest_zapisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasko_polisa`
--

DROP TABLE IF EXISTS `kasko_polisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kasko_polisa` (
  `sifra_kasko` varchar(45) NOT NULL,
  `ugovarac` varchar(100) DEFAULT NULL,
  `premija` decimal(10,2) DEFAULT NULL,
  `porez` decimal(10,2) DEFAULT NULL,
  `ukupna_premija` decimal(10,2) DEFAULT NULL,
  `datum_od` datetime DEFAULT NULL,
  `datum_do` datetime DEFAULT NULL,
  `broj_sasije` varchar(17) DEFAULT NULL,
  `id_zahteva` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sifra_kasko`),
  KEY `id_zahteva_za_kasko_idx` (`id_zahteva`),
  KEY `broj_sasije_kasko_idx` (`broj_sasije`),
  CONSTRAINT `broj_sasije_kasko` FOREIGN KEY (`broj_sasije`) REFERENCES `vozilo` (`broj_sasije`) ON UPDATE CASCADE,
  CONSTRAINT `id_zahteva_za_kasko` FOREIGN KEY (`id_zahteva`) REFERENCES `zahtev_za_kasko_osiguranjem` (`id_zahteva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasko_polisa`
--

LOCK TABLES `kasko_polisa` WRITE;
/*!40000 ALTER TABLE `kasko_polisa` DISABLE KEYS */;
INSERT INTO `kasko_polisa` VALUES ('646d6ed6-f622-4e78-ae28-83f890fb0f0c','DDOR Novi Sad',6482.00,324.00,6806.00,'2020-07-28 11:31:06','2021-07-28 00:00:00','R2024078596658423','1');
/*!40000 ALTER TABLE `kasko_polisa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kasko_stavka`
--

DROP TABLE IF EXISTS `kasko_stavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kasko_stavka` (
  `sifra_kasko` varchar(45) NOT NULL,
  `rb_stavke` int NOT NULL,
  `ugovoreno_pokrice` varchar(200) DEFAULT NULL,
  `suma_osiguranja` decimal(10,2) DEFAULT NULL,
  `ucesce_osiguranika` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sifra_kasko`,`rb_stavke`),
  CONSTRAINT `sifra_kasko_kasko_stavka` FOREIGN KEY (`sifra_kasko`) REFERENCES `kasko_polisa` (`sifra_kasko`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kasko_stavka`
--

LOCK TABLES `kasko_stavka` WRITE;
/*!40000 ALTER TABLE `kasko_stavka` DISABLE KEYS */;
INSERT INTO `kasko_stavka` VALUES ('646d6ed6-f622-4e78-ae28-83f890fb0f0c',1,'UGOVORENI OSNOVNI KASKO RIZICI: Saobracajni rizici, pozarni rizici, prirodni rizici, vandalizam, ostali kasko rizici.',234724.00,'Apsolutno ucesce 50 eur u din. protivrednostihuhu'),('646d6ed6-f622-4e78-ae28-83f890fb0f0c',2,'DOPUNSKI KASKO RIZICI: Dopunski rizik kradje vozila',234724.00,'Apsolutno ucesce 50 eur u din. protivvrednosti'),('646d6ed6-f622-4e78-ae28-83f890fb0f0c',3,'Obracunati popusti: popust na vozacki staz preko 15 godina, bonus za auto kasko 50%.',0.00,'/');
/*!40000 ALTER TABLE `kasko_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klijent`
--

DROP TABLE IF EXISTS `klijent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klijent` (
  `id_klijenta` varchar(45) NOT NULL,
  `jmbg` varchar(13) DEFAULT NULL,
  `broj_lk` varchar(10) DEFAULT NULL,
  `datum_vazenja_lk_klijenta` date DEFAULT NULL,
  `ime_prezime_klijenta` varchar(100) DEFAULT NULL,
  `adresa_klijenta` varchar(250) DEFAULT NULL,
  `ime_firme` varchar(250) DEFAULT NULL,
  `pib` varchar(45) DEFAULT NULL,
  `adresa_firme` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_klijenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klijent`
--

LOCK TABLES `klijent` WRITE;
/*!40000 ALTER TABLE `klijent` DISABLE KEYS */;
INSERT INTO `klijent` VALUES ('60ded4e0-8d02-4558-9f3d-facd4127183f','1604997787834','010356987','2021-09-05','jelisaveta cpajak','Beograd',NULL,NULL,NULL),('be297ea5-01e8-4222-8f6e-03e7cec2cab9','2205996152345','01753159','2025-06-25','Nikola Nikolić','Prvomajska 15',NULL,NULL,NULL),('c3c97887-3520-4e23-8090-f0a5ea29ff19',NULL,NULL,NULL,NULL,NULL,'klijent111','111','adresa111'),('d2b7c1e3-db07-46a1-bd4a-7db7c1d3667e',NULL,NULL,NULL,NULL,NULL,'firma1','1010','adresa1'),('e3fa74f3-7065-4a3d-971e-8a608011fb5f',NULL,NULL,NULL,NULL,NULL,'yxxx','23232332','yxyx 3'),('f1523f1e-784d-4310-bdd7-e6884e93937f',NULL,NULL,NULL,NULL,NULL,'Coca-cola HBC','555','Batajnički drum bb');
/*!40000 ALTER TABLE `klijent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nalog_za_uplatu_osiguranja`
--

DROP TABLE IF EXISTS `nalog_za_uplatu_osiguranja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nalog_za_uplatu_osiguranja` (
  `sifra_naloga` varchar(45) NOT NULL,
  `iznos` decimal(10,2) DEFAULT NULL,
  `racun_primaoca` varchar(45) DEFAULT NULL,
  `svrha_uplate` varchar(200) DEFAULT NULL,
  `primalac` varchar(100) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  `id_klijenta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sifra_naloga`),
  KEY `id_klijenta_nalog_za_uplatu_osig_idx` (`id_klijenta`),
  CONSTRAINT `id_klijenta_nalog_za_uplatu_osig` FOREIGN KEY (`id_klijenta`) REFERENCES `klijent` (`id_klijenta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nalog_za_uplatu_osiguranja`
--

LOCK TABLES `nalog_za_uplatu_osiguranja` WRITE;
/*!40000 ALTER TABLE `nalog_za_uplatu_osiguranja` DISABLE KEYS */;
INSERT INTO `nalog_za_uplatu_osiguranja` VALUES ('1',12450.00,'160-346152-05','Osiguranje vozila BG456RI','DDOR Novi Sad, Beograd','2020-05-23 00:00:00','be297ea5-01e8-4222-8f6e-03e7cec2cab9');
/*!40000 ALTER TABLE `nalog_za_uplatu_osiguranja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nalog_za_uplatu_takse`
--

DROP TABLE IF EXISTS `nalog_za_uplatu_takse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nalog_za_uplatu_takse` (
  `id_predmeta` varchar(45) NOT NULL,
  `sifra_naloga` varchar(45) NOT NULL,
  `primalac` varchar(100) DEFAULT NULL,
  `iznos` decimal(10,2) DEFAULT NULL,
  `svrha_uplate` varchar(200) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  `racun_primaoca` varchar(45) DEFAULT NULL,
  `id_klijenta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_predmeta`,`sifra_naloga`),
  KEY `id_klijenta_nalog_za_taksu_idx` (`id_klijenta`),
  CONSTRAINT `id_klijenta_nalog_za_taksu` FOREIGN KEY (`id_klijenta`) REFERENCES `klijent` (`id_klijenta`) ON UPDATE CASCADE,
  CONSTRAINT `id_predmeta_nalog_za_taksu` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmeta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nalog_za_uplatu_takse`
--

LOCK TABLES `nalog_za_uplatu_takse` WRITE;
/*!40000 ALTER TABLE `nalog_za_uplatu_takse` DISABLE KEYS */;
INSERT INTO `nalog_za_uplatu_takse` VALUES ('68ccd138-062e-430c-ab76-3d2d4f5eb015','1','MUP RS',204.00,'Saobracajna nalepnica BG456RI','2020-05-23 11:44:00','840-21849-56','be297ea5-01e8-4222-8f6e-03e7cec2cab9'),('68ccd138-062e-430c-ab76-3d2d4f5eb015','2','SO',1898.00,'Porez na upotebu motornog vozila BG456RI','2020-05-23 11:47:00','840-714511843-87','be297ea5-01e8-4222-8f6e-03e7cec2cab9'),('68ccd138-062e-430c-ab76-3d2d4f5eb015','3','Zavod za izradu novcanica',236.00,'Saobracajna nalepnica BG456RI','2020-05-23 11:49:00','8980-333-07','be297ea5-01e8-4222-8f6e-03e7cec2cab9'),('68ccd138-062e-430c-ab76-3d2d4f5eb015','4','Komunalna taksa',1140.00,'Registracija vozila BG456RI','2020-05-23 11:50:00','840-714513843-04','be297ea5-01e8-4222-8f6e-03e7cec2cab9');
/*!40000 ALTER TABLE `nalog_za_uplatu_takse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovlascenje`
--

DROP TABLE IF EXISTS `ovlascenje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ovlascenje` (
  `id_ovlascenja` varchar(45) NOT NULL,
  `ime_prezime_ovlascenog` varchar(100) DEFAULT NULL,
  `broj_lk_ovlasceni` varchar(10) DEFAULT NULL,
  `id_klijenta` varchar(45) DEFAULT NULL,
  `broj_sasije` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`id_ovlascenja`),
  KEY `id_klijenta_ovlascenje_idx` (`id_klijenta`),
  KEY `broj_sasije_ovlascenje_idx` (`broj_sasije`),
  CONSTRAINT `broj_sasije_ovlascenje` FOREIGN KEY (`broj_sasije`) REFERENCES `vozilo` (`broj_sasije`) ON UPDATE CASCADE,
  CONSTRAINT `id_klijenta_ovlascenje` FOREIGN KEY (`id_klijenta`) REFERENCES `klijent` (`id_klijenta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovlascenje`
--

LOCK TABLES `ovlascenje` WRITE;
/*!40000 ALTER TABLE `ovlascenje` DISABLE KEYS */;
INSERT INTO `ovlascenje` VALUES ('1','Milica Nikolić','010123457','be297ea5-01e8-4222-8f6e-03e7cec2cab9','R2024078596658423'),('2','novo ovlascenje','222222222','f1523f1e-784d-4310-bdd7-e6884e93937f','11111111111111324');
/*!40000 ALTER TABLE `ovlascenje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovlascenje_zapisnik_o_tehnickom_pregledu`
--

DROP TABLE IF EXISTS `ovlascenje_zapisnik_o_tehnickom_pregledu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ovlascenje_zapisnik_o_tehnickom_pregledu` (
  `id_zapisnika` varchar(45) NOT NULL,
  `id_ovlascenja` varchar(45) NOT NULL,
  PRIMARY KEY (`id_zapisnika`,`id_ovlascenja`),
  KEY `id_ovlascenja_idx` (`id_ovlascenja`),
  CONSTRAINT `id_ovlascenja_ovlascenje_zapisnik` FOREIGN KEY (`id_ovlascenja`) REFERENCES `ovlascenje` (`id_ovlascenja`) ON UPDATE CASCADE,
  CONSTRAINT `id_zapisnika_ovlascenje_zapisnik` FOREIGN KEY (`id_zapisnika`) REFERENCES `zapisnik_o_tehnickom_pregledu` (`id_broj`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovlascenje_zapisnik_o_tehnickom_pregledu`
--

LOCK TABLES `ovlascenje_zapisnik_o_tehnickom_pregledu` WRITE;
/*!40000 ALTER TABLE `ovlascenje_zapisnik_o_tehnickom_pregledu` DISABLE KEYS */;
INSERT INTO `ovlascenje_zapisnik_o_tehnickom_pregledu` VALUES ('1','1');
/*!40000 ALTER TABLE `ovlascenje_zapisnik_o_tehnickom_pregledu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polisa_osiguranja`
--

DROP TABLE IF EXISTS `polisa_osiguranja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polisa_osiguranja` (
  `sifra_polise` varchar(45) NOT NULL,
  `datum_izdavanja` datetime DEFAULT NULL,
  `premijski_stepen` varchar(10) DEFAULT NULL,
  `premija` decimal(10,2) DEFAULT NULL,
  `pocetak_osiguranja` datetime DEFAULT NULL,
  `istek_osiguranja` datetime DEFAULT NULL,
  `broj_sasije` varchar(17) DEFAULT NULL,
  `id_zahteva` varchar(45) DEFAULT NULL,
  `id_potvrde_o_informisanju` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sifra_polise`),
  KEY `broj_sasije_polisa_osig_idx` (`broj_sasije`),
  KEY `id_zahteva_polisa_osig_idx` (`id_zahteva`),
  KEY `id_potvrde_polisa_osig_idx` (`id_potvrde_o_informisanju`),
  CONSTRAINT `broj_sasije_polisa_osig` FOREIGN KEY (`broj_sasije`) REFERENCES `vozilo` (`broj_sasije`) ON UPDATE CASCADE,
  CONSTRAINT `id_potvrde_polisa_osig` FOREIGN KEY (`id_potvrde_o_informisanju`) REFERENCES `potvrda_o_informisanju_klijenta` (`id_potvrde`) ON UPDATE CASCADE,
  CONSTRAINT `id_zahteva_polisa_osig` FOREIGN KEY (`id_zahteva`) REFERENCES `zahtev_za_polisom` (`id_zahteva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polisa_osiguranja`
--

LOCK TABLES `polisa_osiguranja` WRITE;
/*!40000 ALTER TABLE `polisa_osiguranja` DISABLE KEYS */;
INSERT INTO `polisa_osiguranja` VALUES ('8012292366','2020-05-23 00:00:00','1',10527.00,'2020-05-23 23:59:00','2021-05-23 23:59:00','R2024078596658423','1','1');
/*!40000 ALTER TABLE `polisa_osiguranja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `potvrda_o_informisanju_klijenta`
--

DROP TABLE IF EXISTS `potvrda_o_informisanju_klijenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `potvrda_o_informisanju_klijenta` (
  `id_potvrde` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `datum` datetime DEFAULT NULL,
  `osiguravac` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mesto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nacin_informisanja` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `vrsta_osiguranja` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_potvrde`),
  CONSTRAINT `potvrda_o_informisanju_klijenta_chk_1` CHECK (((`nacin_informisanja` = _utf8mb4'elektronski') or (`nacin_informisanja` = _utf8mb4'papirni')))
) ENGINE=InnoDB DEFAULT CHARSET=ujis;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `potvrda_o_informisanju_klijenta`
--

LOCK TABLES `potvrda_o_informisanju_klijenta` WRITE;
/*!40000 ALTER TABLE `potvrda_o_informisanju_klijenta` DISABLE KEYS */;
INSERT INTO `potvrda_o_informisanju_klijenta` VALUES ('1','2020-05-23 00:00:00','DDOR Novi Sad a.d.o Novi Sad','Beograd','elektronski','1,2');
/*!40000 ALTER TABLE `potvrda_o_informisanju_klijenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmet`
--

DROP TABLE IF EXISTS `predmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmet` (
  `id_predmeta` varchar(45) NOT NULL,
  `sifra_polise` varchar(45) DEFAULT NULL,
  `reg_oznaka` varchar(20) DEFAULT NULL,
  `id_reg_lista` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_predmeta`),
  KEY `sifra_polise_predmet_idx` (`sifra_polise`),
  KEY `reg_oznaka_predmet_idx` (`reg_oznaka`),
  KEY `id_reg_lista_predmet_idx` (`id_reg_lista`),
  CONSTRAINT `id_reg_lista_predmet` FOREIGN KEY (`id_reg_lista`) REFERENCES `registracioni_list` (`id_reg_lista`) ON UPDATE CASCADE,
  CONSTRAINT `reg_oznaka_predmet` FOREIGN KEY (`reg_oznaka`) REFERENCES `saobracajna_dozvola` (`reg_oznaka`) ON UPDATE CASCADE,
  CONSTRAINT `sifra_polise_predmet` FOREIGN KEY (`sifra_polise`) REFERENCES `polisa_osiguranja` (`sifra_polise`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmet`
--

LOCK TABLES `predmet` WRITE;
/*!40000 ALTER TABLE `predmet` DISABLE KEYS */;
INSERT INTO `predmet` VALUES ('68ccd138-062e-430c-ab76-3d2d4f5eb015','8012292366','BG456RI','1');
/*!40000 ALTER TABLE `predmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmet_ovlascenje`
--

DROP TABLE IF EXISTS `predmet_ovlascenje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmet_ovlascenje` (
  `id_predmeta` varchar(45) NOT NULL,
  `id_ovlascenja` varchar(45) NOT NULL,
  PRIMARY KEY (`id_predmeta`,`id_ovlascenja`),
  KEY `id_ovlascenja_pred_ovl_idx` (`id_ovlascenja`),
  CONSTRAINT `id_ovlascenja_pred_ovl` FOREIGN KEY (`id_ovlascenja`) REFERENCES `ovlascenje` (`id_ovlascenja`) ON UPDATE CASCADE,
  CONSTRAINT `id_predmeta_pred_ovl` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmeta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmet_ovlascenje`
--

LOCK TABLES `predmet_ovlascenje` WRITE;
/*!40000 ALTER TABLE `predmet_ovlascenje` DISABLE KEYS */;
INSERT INTO `predmet_ovlascenje` VALUES ('68ccd138-062e-430c-ab76-3d2d4f5eb015','1');
/*!40000 ALTER TABLE `predmet_ovlascenje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmet_registraciona_nalepnica`
--

DROP TABLE IF EXISTS `predmet_registraciona_nalepnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmet_registraciona_nalepnica` (
  `kontrolni_broj` varchar(45) NOT NULL,
  `id_predmeta` varchar(45) NOT NULL,
  PRIMARY KEY (`kontrolni_broj`,`id_predmeta`),
  KEY `id_predmeta_pred_reg_nal_idx` (`id_predmeta`),
  CONSTRAINT `id_predmeta_pred_reg_nal` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmeta`) ON UPDATE CASCADE,
  CONSTRAINT `kontrolni_broj_pred_reg_nal` FOREIGN KEY (`kontrolni_broj`) REFERENCES `registraciona_nalepnica` (`kontrolni_broj`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmet_registraciona_nalepnica`
--

LOCK TABLES `predmet_registraciona_nalepnica` WRITE;
/*!40000 ALTER TABLE `predmet_registraciona_nalepnica` DISABLE KEYS */;
INSERT INTO `predmet_registraciona_nalepnica` VALUES ('0002058524','68ccd138-062e-430c-ab76-3d2d4f5eb015');
/*!40000 ALTER TABLE `predmet_registraciona_nalepnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racun`
--

DROP TABLE IF EXISTS `racun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racun` (
  `sifra_racuna` varchar(45) NOT NULL,
  `datum` datetime DEFAULT NULL,
  `ukupno_sa_pdv` decimal(10,2) DEFAULT NULL,
  `ukupno_bez_pdv` decimal(10,2) DEFAULT NULL,
  `id_klijenta` varchar(45) DEFAULT NULL,
  `id_zapisnika` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sifra_racuna`),
  KEY `id_zapisnika_racun_idx` (`id_zapisnika`),
  KEY `id_klijenta_racun_idx` (`id_klijenta`),
  CONSTRAINT `id_klijenta_racun` FOREIGN KEY (`id_klijenta`) REFERENCES `klijent` (`id_klijenta`) ON UPDATE CASCADE,
  CONSTRAINT `id_zapisnika_racun` FOREIGN KEY (`id_zapisnika`) REFERENCES `zapisnik_o_tehnickom_pregledu` (`id_broj`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racun`
--

LOCK TABLES `racun` WRITE;
/*!40000 ALTER TABLE `racun` DISABLE KEYS */;
INSERT INTO `racun` VALUES ('9776f727-d907-4462-9115-86740c00e6db','2020-09-07 17:05:29',3200.00,3000.00,'f1523f1e-784d-4310-bdd7-e6884e93937f','2'),('b029d8fd-bb48-42dd-baee-59133b8b7c65','2020-10-05 12:28:46',1300.00,1300.00,'be297ea5-01e8-4222-8f6e-03e7cec2cab9','1'),('b590595e-295c-4521-a7f0-30bf7a5e575f','2020-09-04 16:39:04',13600.00,12000.00,'f1523f1e-784d-4310-bdd7-e6884e93937f','2'),('ce77cf20-4947-4cc1-b53b-82a78aae279a','2020-09-07 14:33:46',7500.00,5000.00,'f1523f1e-784d-4310-bdd7-e6884e93937f','2');
/*!40000 ALTER TABLE `racun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registraciona_nalepnica`
--

DROP TABLE IF EXISTS `registraciona_nalepnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registraciona_nalepnica` (
  `kontrolni_broj` varchar(45) NOT NULL,
  `broj_tablica` varchar(20) DEFAULT NULL,
  `datum_vazenja_registracije` datetime DEFAULT NULL,
  `broj_sasije` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`kontrolni_broj`),
  KEY `broj_sasije_reg_nal_idx` (`broj_sasije`),
  CONSTRAINT `broj_sasije_reg_nal` FOREIGN KEY (`broj_sasije`) REFERENCES `vozilo` (`broj_sasije`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registraciona_nalepnica`
--

LOCK TABLES `registraciona_nalepnica` WRITE;
/*!40000 ALTER TABLE `registraciona_nalepnica` DISABLE KEYS */;
INSERT INTO `registraciona_nalepnica` VALUES ('0002058524','BG456RI','2021-05-23 00:00:00','R2024078596658423');
/*!40000 ALTER TABLE `registraciona_nalepnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registracioni_list`
--

DROP TABLE IF EXISTS `registracioni_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registracioni_list` (
  `id_reg_lista` varchar(45) NOT NULL,
  `sifra_firme` varchar(45) DEFAULT NULL,
  `broj_sasije` varchar(17) DEFAULT NULL,
  `id_broj` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_reg_lista`),
  KEY `id_zapisnika_tehn_reg_list_idx` (`id_broj`),
  KEY `broj_sasija_reg_list_idx` (`broj_sasije`),
  CONSTRAINT `broj_sasija_reg_list` FOREIGN KEY (`broj_sasije`) REFERENCES `vozilo` (`broj_sasije`) ON UPDATE CASCADE,
  CONSTRAINT `id_zapisnika_tehn_reg_list` FOREIGN KEY (`id_broj`) REFERENCES `zapisnik_o_tehnickom_pregledu` (`id_broj`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registracioni_list`
--

LOCK TABLES `registracioni_list` WRITE;
/*!40000 ALTER TABLE `registracioni_list` DISABLE KEYS */;
INSERT INTO `registracioni_list` VALUES ('1','019334','R2024078596658423','1');
/*!40000 ALTER TABLE `registracioni_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saobracajna_dozvola`
--

DROP TABLE IF EXISTS `saobracajna_dozvola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saobracajna_dozvola` (
  `reg_oznaka` varchar(20) NOT NULL,
  `datum_od` datetime DEFAULT NULL,
  `datum_do` datetime DEFAULT NULL,
  `broj_saobracajne` varchar(15) NOT NULL,
  `serijski_broj` varchar(25) NOT NULL,
  `broj_sasije` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`reg_oznaka`),
  KEY `broj_sasije_saobr_idx` (`broj_sasije`),
  CONSTRAINT `broj_sasije_saobr` FOREIGN KEY (`broj_sasije`) REFERENCES `vozilo` (`broj_sasije`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saobracajna_dozvola`
--

LOCK TABLES `saobracajna_dozvola` WRITE;
/*!40000 ALTER TABLE `saobracajna_dozvola` DISABLE KEYS */;
INSERT INTO `saobracajna_dozvola` VALUES ('BG456RI','2019-10-05 00:00:00','2026-10-05 00:00:00','2834706','8169AB0000D0E8','R2024078596658423'),('CA032JC','2019-10-05 00:00:00','2029-10-05 00:00:00','3287745','5647AB0000D0E4','11111111111111324'),('PROBA','2019-10-05 00:00:00','2026-10-05 00:00:00','2834706','8169AB0000D0E8','R2024078596658423');
/*!40000 ALTER TABLE `saobracajna_dozvola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stavka_racuna`
--

DROP TABLE IF EXISTS `stavka_racuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stavka_racuna` (
  `sifra_racuna` varchar(45) NOT NULL,
  `redni_broj` int NOT NULL,
  `naziv` varchar(45) DEFAULT NULL,
  `kolicina` int DEFAULT NULL,
  `cena_sa_pdv` decimal(10,2) DEFAULT NULL,
  `cena_bez_pdv` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sifra_racuna`,`redni_broj`),
  CONSTRAINT `sifra_racuna_stavka` FOREIGN KEY (`sifra_racuna`) REFERENCES `racun` (`sifra_racuna`) ON UPDATE CASCADE,
  CONSTRAINT `stavka_racuna_chk_1` CHECK ((`kolicina` > 0)),
  CONSTRAINT `stavka_racuna_chk_2` CHECK ((`cena_sa_pdv` > 0)),
  CONSTRAINT `stavka_racuna_chk_3` CHECK ((`cena_bez_pdv` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stavka_racuna`
--

LOCK TABLES `stavka_racuna` WRITE;
/*!40000 ALTER TABLE `stavka_racuna` DISABLE KEYS */;
INSERT INTO `stavka_racuna` VALUES ('9776f727-d907-4462-9115-86740c00e6db',1,'stavka123',2,1600.00,1500.00),('b029d8fd-bb48-42dd-baee-59133b8b7c65',1,'aaa',1,100.00,100.00),('b029d8fd-bb48-42dd-baee-59133b8b7c65',2,'qqqq',12,100.00,100.00),('b590595e-295c-4521-a7f0-30bf7a5e575f',1,'stavka racuna1',2,6800.00,6000.00),('ce77cf20-4947-4cc1-b53b-82a78aae279a',1,'stavkaaa',5,1500.00,1000.00);
/*!40000 ALTER TABLE `stavka_racuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_atesta`
--

DROP TABLE IF EXISTS `tip_atesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip_atesta` (
  `sifra_tipa` varchar(45) NOT NULL,
  `naziv_tipa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sifra_tipa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_atesta`
--

LOCK TABLES `tip_atesta` WRITE;
/*!40000 ALTER TABLE `tip_atesta` DISABLE KEYS */;
INSERT INTO `tip_atesta` VALUES ('1','Zatamnjena stakla'),('2','Plin');
/*!40000 ALTER TABLE `tip_atesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vozilo`
--

DROP TABLE IF EXISTS `vozilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vozilo` (
  `broj_sasije` varchar(17) NOT NULL,
  `masa` int DEFAULT NULL,
  `snaga_motora` int DEFAULT NULL,
  `zapremina_motora` int DEFAULT NULL,
  `broj_motora` varchar(45) DEFAULT NULL,
  `kategorija` varchar(200) DEFAULT NULL,
  `marka` varchar(200) DEFAULT NULL,
  `model` varchar(200) DEFAULT NULL,
  `pogonsko_gorivo` varchar(45) DEFAULT NULL,
  `boja` varchar(45) DEFAULT NULL,
  `max_masa` int DEFAULT NULL,
  `broj_osovina` int DEFAULT NULL,
  `godina_proizvodnje` int DEFAULT NULL,
  `br_mesta_za_sedenje` int DEFAULT NULL,
  `datum_prve_registracije` datetime DEFAULT NULL,
  `id_klijenta` varchar(45) NOT NULL,
  PRIMARY KEY (`broj_sasije`),
  KEY `id_klijenta_vozilo_idx` (`id_klijenta`),
  CONSTRAINT `id_klijenta_vozilo` FOREIGN KEY (`id_klijenta`) REFERENCES `klijent` (`id_klijenta`) ON UPDATE CASCADE,
  CONSTRAINT `vozilo_chk_1` CHECK ((`broj_osovina` in (2,3,4,5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vozilo`
--

LOCK TABLES `vozilo` WRITE;
/*!40000 ALTER TABLE `vozilo` DISABLE KEYS */;
INSERT INTO `vozilo` VALUES ('11111111111111324',434,433,43,'342424','PUTNICKO VOZILO','fsf','ffsf','EVRO DIZEL','fdfdf',344,2,2019,2,'2020-07-03 20:43:00','f1523f1e-784d-4310-bdd7-e6884e93937f'),('drugoVozilo',11,11,11,'11','PUTNICKO VOZILO','PEUGEOT','207','EVRO DIZEL','FFF',2222,2,2003,5,'2008-07-09 15:30:00','be297ea5-01e8-4222-8f6e-03e7cec2cab9'),('R2024078596658423',1290,75,1870,'F9QK732C295077','PUTNICKO VOZILO','RENAULT','SCENIC 1.9 DCI','EVRO DIZEL','5M PLAVA METALIZIRANA',1840,2,2002,5,'2008-07-09 15:30:00','be297ea5-01e8-4222-8f6e-03e7cec2cab9');
/*!40000 ALTER TABLE `vozilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtev`
--

DROP TABLE IF EXISTS `zahtev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtev` (
  `id_zahteva` varchar(45) NOT NULL,
  `id_klijenta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_zahteva`),
  KEY `id_klijenta_zahtev_idx` (`id_klijenta`),
  CONSTRAINT `id_klijenta_zahtev` FOREIGN KEY (`id_klijenta`) REFERENCES `klijent` (`id_klijenta`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtev`
--

LOCK TABLES `zahtev` WRITE;
/*!40000 ALTER TABLE `zahtev` DISABLE KEYS */;
INSERT INTO `zahtev` VALUES ('1','be297ea5-01e8-4222-8f6e-03e7cec2cab9'),('2','f1523f1e-784d-4310-bdd7-e6884e93937f');
/*!40000 ALTER TABLE `zahtev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtev_za_kasko_osiguranjem`
--

DROP TABLE IF EXISTS `zahtev_za_kasko_osiguranjem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtev_za_kasko_osiguranjem` (
  `id_zahteva` varchar(45) NOT NULL,
  PRIMARY KEY (`id_zahteva`),
  CONSTRAINT `id_zahteva_kasko` FOREIGN KEY (`id_zahteva`) REFERENCES `zahtev` (`id_zahteva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtev_za_kasko_osiguranjem`
--

LOCK TABLES `zahtev_za_kasko_osiguranjem` WRITE;
/*!40000 ALTER TABLE `zahtev_za_kasko_osiguranjem` DISABLE KEYS */;
INSERT INTO `zahtev_za_kasko_osiguranjem` VALUES ('1'),('2');
/*!40000 ALTER TABLE `zahtev_za_kasko_osiguranjem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtev_za_polisom`
--

DROP TABLE IF EXISTS `zahtev_za_polisom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtev_za_polisom` (
  `id_zahteva` varchar(45) NOT NULL,
  PRIMARY KEY (`id_zahteva`),
  CONSTRAINT `id_zahteva_polisa` FOREIGN KEY (`id_zahteva`) REFERENCES `zahtev` (`id_zahteva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtev_za_polisom`
--

LOCK TABLES `zahtev_za_polisom` WRITE;
/*!40000 ALTER TABLE `zahtev_za_polisom` DISABLE KEYS */;
INSERT INTO `zahtev_za_polisom` VALUES ('1');
/*!40000 ALTER TABLE `zahtev_za_polisom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtev_za_zelenim_kartonom`
--

DROP TABLE IF EXISTS `zahtev_za_zelenim_kartonom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtev_za_zelenim_kartonom` (
  `id_zahteva` varchar(45) NOT NULL,
  PRIMARY KEY (`id_zahteva`),
  CONSTRAINT `id_zahteva_zel_karton` FOREIGN KEY (`id_zahteva`) REFERENCES `zahtev` (`id_zahteva`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtev_za_zelenim_kartonom`
--

LOCK TABLES `zahtev_za_zelenim_kartonom` WRITE;
/*!40000 ALTER TABLE `zahtev_za_zelenim_kartonom` DISABLE KEYS */;
INSERT INTO `zahtev_za_zelenim_kartonom` VALUES ('1');
/*!40000 ALTER TABLE `zahtev_za_zelenim_kartonom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zapisnik_o_registraciji`
--

DROP TABLE IF EXISTS `zapisnik_o_registraciji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zapisnik_o_registraciji` (
  `id_reg_zapisnika` varchar(45) NOT NULL,
  `datum_i_vreme_izdavanja_nalepnice` datetime DEFAULT NULL,
  `reg_oznaka` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_reg_zapisnika`),
  KEY `reg_oznaka_zapisnik_o_reg_idx` (`reg_oznaka`),
  CONSTRAINT `reg_oznaka_zapisnik_o_reg` FOREIGN KEY (`reg_oznaka`) REFERENCES `saobracajna_dozvola` (`reg_oznaka`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zapisnik_o_registraciji`
--

LOCK TABLES `zapisnik_o_registraciji` WRITE;
/*!40000 ALTER TABLE `zapisnik_o_registraciji` DISABLE KEYS */;
INSERT INTO `zapisnik_o_registraciji` VALUES ('1','2020-05-23 16:00:00','BG456RI');
/*!40000 ALTER TABLE `zapisnik_o_registraciji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zapisnik_o_registraciji_registraciona_nalepnica`
--

DROP TABLE IF EXISTS `zapisnik_o_registraciji_registraciona_nalepnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zapisnik_o_registraciji_registraciona_nalepnica` (
  `id_reg_zapisnika` varchar(45) NOT NULL,
  `kontrolni_broj` varchar(45) NOT NULL,
  PRIMARY KEY (`id_reg_zapisnika`,`kontrolni_broj`),
  KEY `kontrolni_broj_zap_reg_reg_nal_idx` (`kontrolni_broj`),
  CONSTRAINT `id_zapisnika_zap_reg_reg_nal` FOREIGN KEY (`id_reg_zapisnika`) REFERENCES `zapisnik_o_registraciji` (`id_reg_zapisnika`) ON UPDATE CASCADE,
  CONSTRAINT `kontrolni_broj_zap_reg_reg_nal` FOREIGN KEY (`kontrolni_broj`) REFERENCES `registraciona_nalepnica` (`kontrolni_broj`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zapisnik_o_registraciji_registraciona_nalepnica`
--

LOCK TABLES `zapisnik_o_registraciji_registraciona_nalepnica` WRITE;
/*!40000 ALTER TABLE `zapisnik_o_registraciji_registraciona_nalepnica` DISABLE KEYS */;
INSERT INTO `zapisnik_o_registraciji_registraciona_nalepnica` VALUES ('1','0002058524');
/*!40000 ALTER TABLE `zapisnik_o_registraciji_registraciona_nalepnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zapisnik_o_tehnickom_pregledu`
--

DROP TABLE IF EXISTS `zapisnik_o_tehnickom_pregledu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zapisnik_o_tehnickom_pregledu` (
  `id_broj` varchar(45) NOT NULL,
  `datum` datetime DEFAULT NULL,
  `vreme_pocetka` datetime DEFAULT NULL,
  `vreme_zavrsetka` datetime DEFAULT NULL,
  `ocena_ispravnosti` tinyint DEFAULT NULL,
  `kontrolor` varchar(100) DEFAULT NULL,
  `atest_za_plin` tinyint DEFAULT NULL,
  `atest_za_stakla` tinyint DEFAULT NULL,
  `reg_oznaka` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_broj`),
  KEY `reg_oznaka_zap_tehn_idx` (`reg_oznaka`),
  CONSTRAINT `reg_oznaka_zap_tehn` FOREIGN KEY (`reg_oznaka`) REFERENCES `saobracajna_dozvola` (`reg_oznaka`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zapisnik_o_tehnickom_pregledu`
--

LOCK TABLES `zapisnik_o_tehnickom_pregledu` WRITE;
/*!40000 ALTER TABLE `zapisnik_o_tehnickom_pregledu` DISABLE KEYS */;
INSERT INTO `zapisnik_o_tehnickom_pregledu` VALUES ('1','2020-05-23 00:00:00','2020-05-23 15:06:00','2020-05-23 15:36:00',1,'Goran Ristić',1,1,'BG456RI'),('2','2020-09-05 00:00:00','2020-09-05 13:00:00','2020-09-05 13:40:00',1,'Nemanja Stevanovic',1,1,'CA032JC');
/*!40000 ALTER TABLE `zapisnik_o_tehnickom_pregledu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaposleni` (
  `id_zaposlenog` varchar(45) NOT NULL,
  `ime` varchar(45) DEFAULT NULL,
  `prezime` varchar(45) DEFAULT NULL,
  `korisnicko_ime` varchar(45) DEFAULT NULL,
  `sifra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_zaposlenog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposleni`
--

LOCK TABLES `zaposleni` WRITE;
/*!40000 ALTER TABLE `zaposleni` DISABLE KEYS */;
INSERT INTO `zaposleni` VALUES ('04f0537a-3466-4d56-8c1c-ec692ce80d26','Jelisaveta','Cpajak','jelisaveta','Jelisaveta16'),('4e829941-eee0-4e7b-8b8a-80075af4804e','Ana','Filipović','anci','AnaFil12'),('8c474c3d-393c-4979-bef7-4b6894b263f0','Sanja','Despotović','sanja','Sanjaaa1'),('ca518593-9f9d-4315-82c1-e036126c336e','Milos','Ljubisavljevic','ljuba','Sifra.123'),('e1861a1a-76c6-40f7-848c-e1f1b8ec3af8','Jovana','Todorović','jovana','Jovanaa1'),('fee45d39-7509-4c4d-96d9-4e2a840b15c0','Luka','Despotović','Luka','LukaDes1');
/*!40000 ALTER TABLE `zaposleni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zeleni_karton`
--

DROP TABLE IF EXISTS `zeleni_karton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zeleni_karton` (
  `br` varchar(45) NOT NULL,
  `osiguravac` varchar(100) NOT NULL,
  `datum_od` datetime DEFAULT NULL,
  `datum_do` datetime DEFAULT NULL,
  `sifra_polise` varchar(45) DEFAULT NULL,
  `id_zahteva` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`br`),
  KEY `sifra_polise_zel_karton_idx` (`sifra_polise`),
  KEY `id_zahteva_zel_karton_idx` (`id_zahteva`),
  CONSTRAINT `id_zahteva_zeleni_karton` FOREIGN KEY (`id_zahteva`) REFERENCES `zahtev_za_zelenim_kartonom` (`id_zahteva`) ON UPDATE CASCADE,
  CONSTRAINT `sifra_polise_zeleni_karton` FOREIGN KEY (`sifra_polise`) REFERENCES `polisa_osiguranja` (`sifra_polise`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zeleni_karton`
--

LOCK TABLES `zeleni_karton` WRITE;
/*!40000 ALTER TABLE `zeleni_karton` DISABLE KEYS */;
INSERT INTO `zeleni_karton` VALUES ('077015444','SRB/NS','2020-05-23 00:00:00','2021-05-23 00:00:00','8012292366','1');
/*!40000 ALTER TABLE `zeleni_karton` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-07 18:40:18

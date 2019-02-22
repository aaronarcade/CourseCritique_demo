#----------------------------------------------------------
#CC table
CREATE TABLE `Data` (
  `profID` varchar(150) NOT NULL DEFAULT 'UNKNOWN',
  `courseID` varchar(150) NOT NULL DEFAULT 'UNKNOWN',
  `Course` varchar(35) DEFAULT 'UNKNOWN',
  `Section` varchar(10) DEFAULT 'UNKNOWN',
  `Year` varchar(15) DEFAULT 'UNKNOWN',
  `Prof` varchar(255) DEFAULT 'UNKNOWN',
  `ProfMiddle` varchar(255) DEFAULT NULL,
  `A` int(3) DEFAULT '0',
  `B` int(3) DEFAULT '0',
  `C` int(3) DEFAULT '0',
  `D` int(3) DEFAULT '0',
  `F` int(3) DEFAULT '0',
  `W` int(3) DEFAULT '0',
  `Size` varchar(50) DEFAULT 'UNKNOWN',
  `Level` varchar(50) DEFAULT 'UNKNOWN',
  `GPA` double DEFAULT '0',
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`index`),
  KEY `profID` (`profID`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=260052 DEFAULT CHARSET=utf8;

#----------------------------------------------------------
#CIOS table
CREATE TABLE `CIOS_table` (
  `CIOS CRN` varchar(255) DEFAULT NULL,
  `CRN` int(11) DEFAULT NULL,
  `Course Semester` int(11) DEFAULT NULL,
  `Teacher Firs Name` varchar(255) DEFAULT NULL,
  `Teacher Last Name` varchar(255) DEFAULT NULL,
  `School Teacher ID` varchar(255) DEFAULT NULL,
  `Dept` varchar(255) DEFAULT NULL,
  `CourseNum` int(11) DEFAULT NULL,
  `CourseSection` varchar(255) DEFAULT NULL,
  `Tot` int(11) DEFAULT NULL,
  `RR` varchar(255) DEFAULT NULL,
  `Stu:HPW1` varchar(255) DEFAULT NULL,
  `Stu:HPW2` varchar(255) DEFAULT NULL,
  `Stu:HPW3` varchar(255) DEFAULT NULL,
  `Stu:HPW4` varchar(255) DEFAULT NULL,
  `Stu:HPW5` varchar(255) DEFAULT NULL,
  `Stu:HPW6` varchar(255) DEFAULT NULL,
  `Stu:HPW7` varchar(255) DEFAULT NULL,
  `Stu:HPWNA` varchar(255) DEFAULT NULL,
  `Course:OAIM` varchar(255) DEFAULT NULL,
  `Course:OA1` varchar(255) DEFAULT NULL,
  `Course:OA2` varchar(255) DEFAULT NULL,
  `Course:OA3` varchar(255) DEFAULT NULL,
  `Course:OA4` varchar(255) DEFAULT NULL,
  `Course:OA5` varchar(255) DEFAULT NULL,
  `Inst:respectIM` varchar(255) DEFAULT NULL,
  `Inst:respect1` varchar(255) DEFAULT NULL,
  `Inst:respect2` varchar(255) DEFAULT NULL,
  `Inst:respect3` varchar(255) DEFAULT NULL,
  `Inst:respect4` varchar(255) DEFAULT NULL,
  `Inst:respect5` varchar(255) DEFAULT NULL,
  `Inst:OAIM` varchar(255) DEFAULT NULL,
  `Inst:OA1` varchar(255) DEFAULT NULL,
  `Inst:OA2` varchar(255) DEFAULT NULL,
  `Inst:OA3` varchar(255) DEFAULT NULL,
  `Inst:OA4` varchar(255) DEFAULT NULL,
  `Inst:OA5` varchar(255) DEFAULT NULL,
  KEY `CRN` (`CRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#----------------------------------------------------------
#CC_CIOS intermediate table
CREATE TABLE `CIOS_CC_IDs_table` (
  `CIOS_ID` int(11) DEFAULT NULL,
  `CC_ID` int(10) unsigned NOT NULL,
  KEY `CC_ID` (`CC_ID`),
  KEY `CIOS_ID` (`CIOS_ID`),
  CONSTRAINT `CC_key` FOREIGN KEY (`CC_ID`) REFERENCES `Data` (`index`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CIOS_key` FOREIGN KEY (`CIOS_ID`) REFERENCES `CIOS_table` (`CRN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#----------------------------------------------------------


CREATE TABLE `Customer`(
  `ID`    CHAR(11)  PRIMARY KEY, 
  `NAME`  CHAR(40)  NOT NULL,    
  `EMAIL` CHAR(100) NOT NULL    
);


CREATE TABLE `Bank`(
  `COMPANY`     CHAR(50)  NOT NULL, 
  `accountNUM`  CHAR(12)  NOT NULL, 
  `routingNUM`  CHAR(9)   NOT NULL, 
  `ID`          CHAR(11)  NOT NULL, 

  PRIMARY KEY (`accountNUM`, `routingNUM`),
  FOREIGN KEY (`ID`) REFERENCES `Customer`(`ID`)
);



CREATE TABLE `Stock`(
  `SHARE`    INT(12)   NOT NULL,    
  `SYMBOL`   CHAR(40)  PRIMARY KEY, 
  `COMPANY`  CHAR(50)  NOT NULL     
);



CREATE TABLE `Order`(
  `QUANTITY`    INT(12)    NOT NULL,    
  `orderNUM`    CHAR(30)   PRIMARY KEY, 
  `LIMIT`       INT(12)    NOT NULL,    
  `marketORDER` BOOLEAN       NOT NULL     
);


CREATE TABLE `Transaction`(
  `DATE`      DATETIME      NOT NULL, 
  `orderNUM`  CHAR(30)      NOT NULL, 
  `AMOUNT`    INT(12)       NOT NULL, 

  PRIMARY KEY (`DATE`, `orderNUM`),
  FOREIGN KEY (`orderNUM`) REFERENCES `Order`(`orderNUM`)
);



CREATE TABLE `Cancel`(
  `DATE`      DATETIME      NOT NULL, 
  `orderNUM`  CHAR(30)      NOT NULL, 
  
  PRIMARY KEY (`DATE`, `orderNUM`),
  FOREIGN KEY (`orderNUM`) REFERENCES `Order`(`orderNUM`)
);



CREATE TABLE `Placed`(
  `DATE`         DATETIME      NOT NULL, 
  `orderNUM`     CHAR(30)      NOT NULL, 
  `customerID`   CHAR(11)      NOT NULL, 
  `StockSYMBOL`  CHAR(40)      NOT NULL, 

  PRIMARY KEY (`DATE`, `orderNUM`, `customerID`),
  FOREIGN KEY (`orderNUM`) REFERENCES `Order`(`orderNUM`),
  FOREIGN KEY (`customerID`) REFERENCES `Customer`(`ID`),
  FOREIGN KEY (`stockSYMBOL`) REFERENCES `Stock`(`SYMBOL`)
);



CREATE TABLE `Sells`(
  `DATE`         DATETIME      NOT NULL, 
  `customerID`   CHAR(11)      NOT NULL, 
  `AMOUNT`       INT(12)       NOT NULL, 
  `stockSYMBOL`  CHAR(40)      NOT NULL, 

  PRIMARY KEY (`DATE`, `customerID`),
  FOREIGN KEY (`customerID`) REFERENCES `Customer`(`ID`),
  FOREIGN KEY (`stockSYMBOL`) REFERENCES `Stock`(`SYMBOL`)
);



CREATE TABLE `Buys`(
  `DATE`         DATETIME      NOT NULL, 
  `customerID`   CHAR(11)      NOT NULL, 
  `AMOUNT`       INT(12)       NOT NULL, 
  `stockSYMBOL`  CHAR(40)      NOT NULL, 

  PRIMARY KEY (`DATE`, `customerID`),
  FOREIGN KEY (`customerID`) REFERENCES `Customer`(`ID`),
  FOREIGN KEY (`stockSYMBOL`) REFERENCES `Stock`(`SYMBOL`)
);



CREATE TABLE `Withdraw`(
  `DATE`         DATETIME      NOT NULL, 
  `accountNUM`   CHAR(12)      NOT NULL, 
  `AMOUNT`       INT(12)       NOT NULL, 
  `stockSYMBOL`  CHAR(40)      NOT NULL, 
  `routingNUM`   CHAR(9)       NOT NULL, 

  PRIMARY KEY (`DATE`, `accountNUM`, `routingNUM`),
  FOREIGN KEY (`accountNUM`) REFERENCES `Bank`(`accountNUM`),
  FOREIGN KEY (`routingNUM`) REFERENCES `Bank`(`routingNUM`),
  FOREIGN KEY (`stockSYMBOL`) REFERENCES `Stock`(`SYMBOL`)
);



CREATE TABLE `Deposit`(
  `DATE`         DATETIME      NOT NULL, 
  `accountNUM`   CHAR(12)      NOT NULL, 
  `AMOUNT`       INT(12)       NOT NULL, 
  `stockSYMBOL`  CHAR(40)      NOT NULL, 
  `routingNUM`   CHAR(9)       NOT NULL, 

  PRIMARY KEY (`DATE`, `accountNUM`, `routingNUM`),
  FOREIGN KEY (`accountNUM`) REFERENCES `Bank`(`accountNUM`),
  FOREIGN KEY (`routingNUM`) REFERENCES `Bank`(`routingNUM`),
  FOREIGN KEY (`stockSYMBOL`) REFERENCES `Stock`(`SYMBOL`)
);
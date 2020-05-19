CREATE TABLE tblReference (
  Reference_ID varchar(20),
  Description varchar(50),
  PRIMARY KEY (Reference_ID)
);

CREATE TABLE TblClientInfo (
  Client_id varchar(15),
  C_name varchar(30),
  C_surname varchar(50),
  Address varchar(200),
  Code varchar(4),
  C_Tel_H varchar(20),
  C_Tel_W varchar(20),
  C_Tell_Cell varchar(20),
  C_Email varchar(200),
  Reference_ID varchar(20) REFERENCES tblReference (Reference_ID),
  PRIMARY KEY (Client_id)
);

CREATE TABLE tblInv_Info (
  Inv_Num varchar(8),
  Client_id varchar(15) REFERENCES TblClientInfo (Client_id),
  Inv_Date date,
  Inv_Paid varchar(3),
  Inv_Paid_date date,
  Comments varchar(200),
  PRIMARY KEY (Inv_Num)
);

CREATE TABLE tblSupplier_Info (
  Supplier_ID varchar(15),
  Contact_Person varchar(30),
  Supplier_Tel varchar(30),
  Supplier_Email varchar(50),
  Bank varchar(30),
  Bank_Code varchar(10),
  Supplier_BankNum varchar(30),
  Supplier_Type_Bank_Account varchar(20),
  PRIMARY KEY (Supplier_ID)
);

CREATE TABLE tblSupplements (
  Supplement_id varchar(20),
  Supplier_ID varchar(15) REFERENCES tblSupplier_Info (Supplier_ID),
  Supplement_Description varchar(50),
  Cost_excl number,
  Cost_incl number,
  Min_levels int,
  Current_stock_levels int,
  Nappi_code varchar(20),
  PRIMARY KEY (Supplement_id)
);

CREATE TABLE tblInv_Items (
  Inv_Num varchar(8) REFERENCES tblInv_Info (Inv_Num),
  Supplement_id varchar(20) REFERENCES tblSupplements (Supplement_id),
  Item_Price number,
  Item_quantity int,
  PRIMARY KEY (Inv_Num, Supplement_id)
);


​
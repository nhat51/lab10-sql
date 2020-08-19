CREATE DATABASE ToyzUnlimited
USE ToyzUnlimited
GO
CREATE TABLE ToyzUnlimited(
	ProductCode VARCHAR(5) PRIMARY KEY,
	Name VARCHAR(30),
	Category VARCHAR(30),
	Manufacturer VARCHAR(40),
	AgeRange VARCHAR(15),
	UnitPrice MONEY,
	Netweight INT,
	QtyOnHand INT
)
INSERT INTO ToyzUnlimited VALUES
('111','Puzzel','Xep hinh','Toyfun','3-10','200',50,21),
('112','Con xoay','doi khang','CN toyy','5-15','50',300,30),
('113','ninja go','lap ghep','ninjast toy','5-10','300',700,22),
('114','chien co huyen thoai','doi khang','hk toy','5-15','400',100,50),
('115','Slime','slime','ha phuong shop','4-10','90',10,33),
('116','nguoi may','lap ghep','GAO toy','6-8','500',600,43),
('117','bup be barbie','bo do choi','BARBIE toy','3-6','200',200,50),
('118','xe dua','do choi mo hinh','fast toy','5-10','320',500,60),
('119','gau teedy','thu nhoi bong','teddy toys','3-6','120',300,45),
('120','rubik 3x3','do choi tri tue','rubik 8','6-15','300',400,70),
('121','rubik 4x4','do choi tri tue','rubik 8','6-15','500',500,30),
('122','bo do cau ca','do choi tre em','hk toye','3-5','200',600,54),
('123','but cham doc','do choi giao duc','smart child','6-10','400',500,60),
('124','bo do choi golf','do cho tre em','rcky toys','4-10','800',300,20)
GO
DROP TABLE ToyzUnlimited
--Viết câu lệnh tạo Thủ tục lưu trữ có tên là HeavyToys cho phép liệt kê tất cả các loại đồ chơi có trọng lượng lớn hơn 500g.
CREATE PROCEDURE HeavyToys AS
SELECT * FROM ToyzUnlimited WHERE( Netweight >500)
GO
DROP PROCEDURE HeavyToys
EXEC HeavyToys

--Viết câu lệnh tạo Thủ tục lưu trữ có tên là PriceIncreasecho phép tăng giá của tất cả các loại đồ chơi lên thêm 10 đơn vị giá.
CREATE PROCEDURE PriceIncrease AS
BEGIN 
UPDATE ToyzUnlimited 
SET UnitPrice *= 10 
END
EXEC PriceIncrease
SELECT * FROM ToyzUnlimited

-- Viết câu lệnh tạo Thủ tục lưu trữ có tên là QtyOnHand làm giảm số lượng đồ chơi còn trong của hàng mỗi thứ 5 đơn vị.
CREATE PROCEDURE QtyOnHand AS
BEGIN 
UPDATE ToyzUnlimited 
SET UnitPrice /= 5 
END
EXEC QtyOnHand

--Thủ tục lưu trữ hệ thống sp_helptext
sp_helptext '[dbo].[HeavyToys]'

--Khung nhìn hệ thống sys.sql_modules
sp_helptext '[dbo].[PriceIncrease]'


sp_helptext '[dbo].[QtyOnHand]'
SELECT  DEFINITION FROM sys.sql_modules
CREATE PROCEDURE SpecificPriceIncrease AS
BEGIN
	UPDATE ToyzUnlimited 
	SET UnitPrice = QtyOnHand + UnitPrice
END
EXEC SpecificPriceIncrease
SELECT * FROM ToyzUnlimited
ALTER PROCEDURE SpecificPriceIncrease 
AS 
UPDATE ToyzUnlimited 
SET UnitPrice = QtyOnHand + UnitPrice
SELECT ProductCode,Name,Category,Manufacturer,UnitPrice AS UnitPrice,QtyOnHand FROM ToyzUnlimited 
WHERE QtyOnHand > 0
SELECT @@ROWCOUNT 
ALTER PROCEDURE SpecificPriceIncrease
AS
UPDATE ToyzUnlimited
SET 
SELECT * FROM ToyzUnlimited

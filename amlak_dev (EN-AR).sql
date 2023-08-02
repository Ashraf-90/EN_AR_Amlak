-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 208.91.199.11:3306
-- Generation Time: Aug 02, 2023 at 07:48 PM
-- Server version: 5.6.39
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amlak_dev`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Add_Building` (IN `owner_ship_Owner_Ship_Id` VARCHAR(200), IN `building_condition_Building_Condition_Id` VARCHAR(200), IN `building_type_Building_Type_Id` VARCHAR(200), IN `Building_English_Name` VARCHAR(200), IN `Building_Arabic_Name` VARCHAR(200), IN `electricity_meter` VARCHAR(200), IN `Water_meter` VARCHAR(200), IN `Building_NO` VARCHAR(200), IN `Construction_Area` VARCHAR(200), IN `Maintenance_status` VARCHAR(200), IN `Building_Value` VARCHAR(200), IN `Construction_Completion_Date` VARCHAR(200), IN `Building_Photo` VARCHAR(200), IN `Building_Photo_Path` VARCHAR(200), IN `Statement` VARCHAR(200), IN `Statement_Path` VARCHAR(200), IN `Building_Permit` VARCHAR(200), IN `Building_Permit_Path` VARCHAR(200), IN `certificate_of_completion` VARCHAR(200), IN `certificate_of_completion_Path` VARCHAR(200), IN `Image` VARCHAR(200), IN `Image_Path` VARCHAR(200), IN `Map` VARCHAR(200), IN `Map_path` VARCHAR(200), IN `Plan` VARCHAR(200), IN `Plano_Path` VARCHAR(200), IN `Entrance_Photo` VARCHAR(200), IN `Entrance_Photo_Path` VARCHAR(200), IN `Active` VARCHAR(200), IN `IsRealEsataeInvesment` VARCHAR(200))  BEGIN
Insert Into building 
(owner_ship_Owner_Ship_Id , building_condition_Building_Condition_Id  ,building_type_Building_Type_Id ,Building_English_Name,Building_Arabic_Name ,
electricity_meter,Water_meter ,Building_NO,Construction_Area ,Maintenance_status ,Building_Value ,Construction_Completion_Date ,Building_Photo , 
Building_Photo_Path ,Statement ,Statement_Path ,Building_Permit , Building_Permit_Path ,certificate_of_completion ,certificate_of_completion_Path , 
Image ,Image_Path , Map , Map_path ,Plan ,Plano_Path ,Entrance_Photo ,Entrance_Photo_Path , Active , IsRealEsataeInvesment)
VALUES 
(owner_ship_Owner_Ship_Id , building_condition_Building_Condition_Id  ,building_type_Building_Type_Id ,Building_English_Name,Building_Arabic_Name ,
electricity_meter,Water_meter ,Building_NO,Construction_Area ,Maintenance_status ,Building_Value ,Construction_Completion_Date ,Building_Photo , 
Building_Photo_Path ,Statement ,Statement_Path ,Building_Permit , Building_Permit_Path ,certificate_of_completion ,certificate_of_completion_Path , 
Image ,Image_Path , Map , Map_path ,Plan ,Plano_Path ,Entrance_Photo ,Entrance_Photo_Path , Active , IsRealEsataeInvesment);

Insert Into arcive_building 
(owner_ship_Owner_Ship_Id , building_condition_Building_Condition_Id  ,building_type_Building_Type_Id ,Building_English_Name,Building_Arabic_Name ,
electricity_meter,Water_meter ,Building_NO,Construction_Area ,Maintenance_status ,Building_Value ,Construction_Completion_Date ,Building_Photo , 
Building_Photo_Path ,Statement ,Statement_Path ,Building_Permit , Building_Permit_Path ,certificate_of_completion ,certificate_of_completion_Path , 
Image ,Image_Path , Map , Map_path ,Plan ,Plano_Path ,Entrance_Photo ,Entrance_Photo_Path , Active , IsRealEsataeInvesment)
VALUES 
(owner_ship_Owner_Ship_Id , building_condition_Building_Condition_Id  ,building_type_Building_Type_Id ,Building_English_Name,Building_Arabic_Name ,
electricity_meter,Water_meter ,Building_NO,Construction_Area ,Maintenance_status ,Building_Value ,Construction_Completion_Date ,Building_Photo , 
Building_Photo_Path ,Statement ,Statement_Path ,Building_Permit , Building_Permit_Path ,certificate_of_completion ,certificate_of_completion_Path , 
Image ,Image_Path , Map , Map_path ,Plan ,Plano_Path ,Entrance_Photo ,Entrance_Photo_Path , Active , IsRealEsataeInvesment);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Add_Multi_Contract` (IN `Contract_Details` VARCHAR(200), IN `Payment_Amount` VARCHAR(200), IN `Payment_Amount_L` VARCHAR(200), IN `Date_Of_Sgin` VARCHAR(200), IN `Start_Date` VARCHAR(200), IN `End_Date` VARCHAR(200), IN `users_user_ID` VARCHAR(200), IN `Rented_Item` VARCHAR(200), IN `New_ReNewed_Expaired` VARCHAR(200), IN `Start_Free_Period` VARCHAR(200), IN `Duration_free_period` VARCHAR(200), IN `maintenance` VARCHAR(200), IN `Rental_allowed_Or_Not_allowed` VARCHAR(200), IN `reason_for_rent_Reason_For_Rent_Id` VARCHAR(200), IN `contract_type_Contract_Type_Id` VARCHAR(200), IN `contract_template_Contract_template_Id` VARCHAR(200), IN `Number_Of_Mounth` VARCHAR(200), IN `Number_Of_Years` VARCHAR(200), IN `tenants_Tenants_ID` VARCHAR(200), IN `Com_rep` VARCHAR(200), IN `Paymen_Method` VARCHAR(200), IN `payment_type_payment_type_Id` VARCHAR(200))  BEGIN
Insert Into building_contract (
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
building_Building_Id , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id) 
VALUES( 
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
Rented_Item , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id )  ;

Insert Into arcive_building_contract (
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
building_Building_Id , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id) 
VALUES( 
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
Rented_Item , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id );
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Add_OwnerShip` (IN `owner_Owner_Id` VARCHAR(200), IN `zone_zone_Id` VARCHAR(200), IN `Owner_Ship_EN_Name` VARCHAR(200), IN `Owner_Ship_AR_Name` VARCHAR(200), IN `ownership_NO` VARCHAR(200), IN `Parcel_Area` VARCHAR(200), IN `Bond_NO` VARCHAR(200), IN `Bond_Date` VARCHAR(200), IN `Street_NO` VARCHAR(200), IN `Street_Name` VARCHAR(200), IN `Land_Value` VARCHAR(200), IN `Appreciation_octagon` VARCHAR(200), IN `PIN_Number` VARCHAR(200), IN `owner_ship_Code` VARCHAR(200), IN `Active` VARCHAR(200), IN `Mab_Url` VARCHAR(200), IN `owner_ship_Certificate_Image` VARCHAR(200), IN `owner_ship_Certificate_Image_Path` VARCHAR(200), IN `Property_Scheme_Image` VARCHAR(200), IN `Property_Scheme_Image_Path` VARCHAR(200), IN `IsRealEsataeInvesment` VARCHAR(200))  BEGIN
Insert Into owner_ship   
(owner_Owner_Id  , zone_zone_Id  , Owner_Ship_EN_Name, Owner_Ship_AR_Name , ownership_NO,  
Parcel_Area , Bond_NO, Bond_Date, Street_NO , Street_Name , Land_Value ,  
Appreciation_octagon , PIN_Number, owner_ship_Code , Active , Mab_Url ,  
owner_ship_Certificate_Image , owner_ship_Certificate_Image_Path , Property_Scheme_Image , Property_Scheme_Image_Path , IsRealEsataeInvesment) 
 VALUES  
(owner_Owner_Id  ,  zone_zone_Id  ,  Owner_Ship_EN_Name,  Owner_Ship_AR_Name ,  ownership_NO,  
 Parcel_Area ,  Bond_NO,  Bond_Date,  Street_NO ,  Street_Name ,  Land_Value ,  
 Appreciation_octagon ,  PIN_Number,  owner_ship_Code ,  Active ,  Mab_Url ,  
 owner_ship_Certificate_Image ,  owner_ship_Certificate_Image_Path ,  Property_Scheme_Image ,  Property_Scheme_Image_Path ,  IsRealEsataeInvesment);
 
 Insert Into arcive_ownership   
(owner_Owner_Id  , zone_zone_Id  , Owner_Ship_EN_Name, Owner_Ship_AR_Name , ownership_NO,  
Parcel_Area , Bond_NO, Bond_Date, Street_NO , Street_Name , Land_Value ,  
Appreciation_octagon , PIN_Number, owner_ship_Code , Active , Mab_Url ,  
owner_ship_Certificate_Image , owner_ship_Certificate_Image_Path , Property_Scheme_Image , Property_Scheme_Image_Path , IsRealEsataeInvesment) 
 VALUES  
( owner_Owner_Id  ,  zone_zone_Id  ,  Owner_Ship_EN_Name,  Owner_Ship_AR_Name ,  ownership_NO,  
 Parcel_Area ,  Bond_NO,  Bond_Date,  Street_NO ,  Street_Name ,  Land_Value ,  
 Appreciation_octagon ,  PIN_Number,  owner_ship_Code ,  Active ,  Mab_Url ,  
 owner_ship_Certificate_Image ,  owner_ship_Certificate_Image_Path ,  Property_Scheme_Image ,  Property_Scheme_Image_Path ,  IsRealEsataeInvesment);


END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Add_Singel_Contract` (IN `Contract_Details` VARCHAR(200), IN `Payment_Amount` VARCHAR(200), IN `Payment_Amount_L` VARCHAR(200), IN `Date_Of_Sgin` VARCHAR(200), IN `Start_Date` VARCHAR(200), IN `End_Date` VARCHAR(200), IN `users_user_ID` VARCHAR(200), IN `Rented_Item` VARCHAR(200), IN `New_ReNewed_Expaired` VARCHAR(200), IN `Start_Free_Period` VARCHAR(200), IN `Duration_free_period` VARCHAR(200), IN `maintenance` VARCHAR(200), IN `Rental_allowed_Or_Not_allowed` VARCHAR(200), IN `reason_for_rent_Reason_For_Rent_Id` VARCHAR(200), IN `contract_type_Contract_Type_Id` VARCHAR(200), IN `contract_template_Contract_template_Id` VARCHAR(200), IN `Number_Of_Mounth` VARCHAR(200), IN `Number_Of_Years` VARCHAR(200), IN `tenants_Tenants_ID` VARCHAR(200), IN `Com_rep` VARCHAR(200), IN `Paymen_Method` VARCHAR(200), IN `payment_type_payment_type_Id` VARCHAR(200))  BEGIN
Insert Into contract (
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
units_Unit_ID , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id) 
VALUES( 
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
Rented_Item , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id )  ;

Insert Into arcive_contract (
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
units_Unit_ID , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id) 
VALUES( 
Contract_Details , 
Payment_Amount  , 
Payment_Amount_L  , 
Date_Of_Sgin        , 
Start_Date       , 
End_Date         , 
users_user_ID , 
Rented_Item , 
New_ReNewed_Expaired , 
Start_Free_Period , 
Duration_free_period , 
maintenance , 
Rental_allowed_Or_Not_allowed , 
reason_for_rent_Reason_For_Rent_Id   , 
contract_type_Contract_Type_Id   , 
contract_template_Contract_template_Id , 
Number_Of_Mounth , 
Number_Of_Years , 
tenants_Tenants_ID , 
Com_rep ,
Paymen_Method ,
payment_type_payment_type_Id )  ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Add_Unit` (IN `unit_condition_Unit_Condition_Id` VARCHAR(200), IN `unit_detail_Unit_Detail_Id` VARCHAR(200), IN `unit_type_Unit_Type_Id` VARCHAR(200), IN `building_Building_Id` VARCHAR(200), IN `furniture_case_Furniture_case_Id` VARCHAR(200), IN `Unit_Number` VARCHAR(200), IN `Floor_Number` VARCHAR(200), IN `Unit_Space` VARCHAR(200), IN `current_situation` VARCHAR(200), IN `Oreedo_Number` VARCHAR(200), IN `Electricityt_Number` VARCHAR(200), IN `Water_Number` VARCHAR(200), IN `virtual_Value` VARCHAR(200), IN `Image_One` VARCHAR(200), IN `Image_One_Path` VARCHAR(200), IN `Image_Two` VARCHAR(200), IN `Image_Two_Path` VARCHAR(200), IN `Image_Three` VARCHAR(200), IN `Image_Three_Path` VARCHAR(200), IN `Image_Four` VARCHAR(200), IN `Image_Four_Path` VARCHAR(200), IN `Half` VARCHAR(200), IN `Active` VARCHAR(200))  BEGIN
Insert Into units 
( unit_condition_Unit_Condition_Id  , unit_detail_Unit_Detail_Id  , unit_type_Unit_Type_Id , building_Building_Id , furniture_case_Furniture_case_Id , 
Unit_Number, Floor_Number , Unit_Space,  current_situation , Oreedo_Number, Electricityt_Number , Water_Number , virtual_Value , 
Image_One , Image_One_Path , Image_Two , Image_Two_Path , Image_Three ,  Image_Three_Path ,  Image_Four ,  Image_Four_Path , Half , Active)
VALUES 
( unit_condition_Unit_Condition_Id  , unit_detail_Unit_Detail_Id  , unit_type_Unit_Type_Id , building_Building_Id , furniture_case_Furniture_case_Id , 
Unit_Number, Floor_Number , Unit_Space,  current_situation , Oreedo_Number, Electricityt_Number , Water_Number , virtual_Value , 
Image_One , Image_One_Path , Image_Two , Image_Two_Path , Image_Three ,  Image_Three_Path ,  Image_Four ,  Image_Four_Path , Half , Active);

Insert Into arcive_units 
( unit_condition_Unit_Condition_Id  , unit_detail_Unit_Detail_Id  , unit_type_Unit_Type_Id , building_Building_Id , furniture_case_Furniture_case_Id , 
Unit_Number, Floor_Number , Unit_Space,  current_situation , Oreedo_Number, Electricityt_Number , Water_Number , virtual_Value , 
Image_One , Image_One_Path , Image_Two , Image_Two_Path , Image_Three ,  Image_Three_Path ,  Image_Four ,  Image_Four_Path , Half , Active)
VALUES 
( unit_condition_Unit_Condition_Id  , unit_detail_Unit_Detail_Id  , unit_type_Unit_Type_Id , building_Building_Id , furniture_case_Furniture_case_Id , 
Unit_Number, Floor_Number , Unit_Space,  current_situation , Oreedo_Number, Electricityt_Number , Water_Number , virtual_Value , 
Image_One , Image_One_Path , Image_Two , Image_Two_Path , Image_Three ,  Image_Three_Path ,  Image_Four ,  Image_Four_Path , Half , Active);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `All_Avilabel_Cheuqe` (IN `Type_e` VARCHAR(200), IN `Datee` VARCHAR(200))  NO SQL
BEGIN
Select (SELECT CAST(CONCAT('A/' ,Cq.Cheques_Id)as char) )Cheques_Id , Cq.Cheques_No , 
Cq.Cheques_Date ,Cq.Cheques_Amount ,Cq.Cheque_Owner ,Cq.Cheques_Status ,Cq.Collect_Type ,Cq.Collection_Date ,Cq.beneficiary_person , B.Bank_Arabic_Name , B.Bank_English_Name , T.Tenants_Arabic_Name , T.Tenants_English_Name ,
(select units_Unit_ID from contract where Contract_Id = Cq.contract_Contract_Id )U_ID , 
(SELECT CAST(CONCAT('وحدة رقم : ' ,(select Unit_Number from units where Unit_ID=U_ID))as char) )U_NO ,
(SELECT CAST(CONCAT('Unit NO :' ,(select Unit_Number from units where Unit_ID=U_ID))as char) )EN_U_NO ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=(select building_Building_Id from units where Unit_ID=U_ID ) ) O_ID , 
(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code , 
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name , 
(select Owner_Ship_EN_Name from owner_ship where Owner_Ship_Id=O_ID)EN_O_Name
from cheques Cq 
left join bank B on (Cq.bank_Bank_Id = B.Bank_Id) 
left join tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID)
where (SELECT CAST(CONCAT('A/' ,Cq.Cheques_Id)as char) ) like CONCAT('%', Type_e, '%')
and Cq.Cheques_Date Like  CONCAT('%', Datee, '%')

Union All
Select (SELECT CAST(CONCAT('B/' ,Cq.Cheques_Id)as char) )Cheques_Id , Cq.Cheques_No ,
 Cq.Cheques_Date ,Cq.Cheques_Amount , Cq.Cheque_Owner ,Cq.Cheques_Status , Cq.Collect_Type ,Cq.Collection_Date , Cq.beneficiary_person , B.Bank_Arabic_Name , B.Bank_English_Name ,  T.Tenants_Arabic_Name , T.Tenants_English_Name ,
(select building_Building_Id from building_contract where Contract_Id = Cq.building_contract_Contract_Id )B_ID , 
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name , 
(select Building_English_Name from building where Building_Id=B_ID)EN_B_Name ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID , 
(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code , 
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_N , 
(select Owner_Ship_EN_Name from owner_ship where Owner_Ship_Id=O_ID)EN_O_N
from building_cheques Cq 
left join bank B on (Cq.bank_Bank_Id = B.Bank_Id)
left join tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID)
where (SELECT CAST(CONCAT('B/' ,Cq.Cheques_Id)as char) ) like CONCAT('%', Type_e, '%') 
and Cq.Cheques_Date Like  CONCAT('%', Datee, '%');
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `All_Cash` (IN `Type_e` VARCHAR(200), IN `Datee` VARCHAR(200))  BEGIN
Select (SELECT CAST(CONCAT('A/' ,CA.Cash_Amount_ID)as char) )Cash_Amount_ID  , CA.Cash_Amount , CA.Cash_Date , CA.Satuts , CA.Collection_Date , 
T.Tenants_Arabic_Name  , T.Tenants_English_Name ,
(select units_Unit_ID from contract where Contract_Id = CA.Contract_Id )U_ID ,
(SELECT CAST(CONCAT('وحدة رقم : ' ,(select Unit_Number from units where Unit_ID=U_ID))as char) )U_NO ,
(SELECT CAST(CONCAT('Unit NO :' ,(select Unit_Number from units where Unit_ID=U_ID))as char) )EN_U_NO ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=(select building_Building_Id from units where Unit_ID=U_ID ) ) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name ,
(select Owner_Ship_EN_Name  from owner_ship where Owner_Ship_Id=O_ID)EN_O_Name ,
(select  owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code
from cash_amount CA
left join tenants T on (CA.tenant_Id = T.Tenants_ID)
where (SELECT CAST(CONCAT('A/' ,CA.Cash_Amount_ID)as char) ) like CONCAT('%', Type_e, '%')
and CA.Cash_Date  Like  CONCAT('%', Datee, '%')
Union All
Select (SELECT CAST(CONCAT('B/' ,CA.Cash_Amount_ID)as char) )Cash_Amount_ID , CA.Cash_Amount , CA.Cash_Date , CA.Satuts , CA.Collection_Date , 
T.Tenants_Arabic_Name  , T.Tenants_English_Name ,
(select building_Building_Id from building_contract where Contract_Id = CA.Contract_Id )B_ID , 
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name , 
(select Building_English_Name from building where Building_Id=B_ID)EN_B_Name ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name ,
(select Owner_Ship_EN_Name  from owner_ship where Owner_Ship_Id=O_ID)EN_O_Name ,
(select  owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code
from building_cash_amount CA
left join tenants T on (CA.tenant_Id = T.Tenants_ID)
where (SELECT CAST(CONCAT('B/' ,CA.Cash_Amount_ID)as char) ) like CONCAT('%', Type_e, '%') 
and CA.Cash_Date  Like  CONCAT('%', Datee, '%') ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `All_Contract_List` ()  BEGIN
select 
C.Contract_Id    as Contract_Id , 
(SELECT CAST(CONCAT('U/' ,Contract_Id)as char) )ID,
C.Number_Of_Years    as Number_Of_Years ,
C.Payment_Amount    as Payment_Amount, 
C.Start_Date    as Start_Date, 
C.End_Date    as End_Date , 
C.New_ReNewed_Expaired    as New_ReNewed_Expaired ,
   
(SELECT CAST(CONCAT('وحدة رقم : ' ,U.Unit_Number    , 'في البناء : ', Building_Arabic_Name)as char) )Unit_Number ,
(SELECT CAST(CONCAT('Unit NO : ' ,U.Unit_Number  , 'In The Builidng : ', Building_English_Name)as char) )EN_Unit_Number ,
O.Owner_Ship_AR_Name    as Owner_Ship_AR_Name , 
O.Owner_Ship_EN_Name    as Owner_Ship_EN_Name ,
O.owner_ship_Code    as owner_ship_Code , 
Z.zone_arabic_name   as zone_arabic_name , 
Z.zone_English_name   as zone_English_name , 
T.Tenants_Arabic_Name   as Tenants_Arabic_Name , 
T.Tenants_English_Name   as Tenants_English_Name , 
TN.Arabic_nationality    as Arabic_nationality , 
TN.English_nationality    as English_nationality ,
CT.Contract_Arabic_Type   as Contract_Arabic_Type , 
CT.Contract_English_Type   as Contract_English_Type ,
SUBSTRING(Start_Date   ,7,4)yearr ,
(SELECT CAST(CONCAT(Unit_Number , '/' , Building_NO , '/' , owner_ship_Code , '/' ,yearr)as char) )CON_NO
from  contract C
left join units U on (C.units_Unit_ID = U.Unit_ID)
left join building B on (U.building_Building_Id = B.building_Id)
left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join zone Z on (O.zone_zone_Id = Z.zone_Id)
left join tenants T on (C.tenants_Tenants_ID = T.Tenants_Id)
left join nationality TN on (T.nationality_nationality_ID = TN.nationality_ID)
left join contract_type CT on (C.contract_type_Contract_Type_Id = CT.Contract_Type_Id)
 
union All 
 
select 
C.Contract_Id , 
(SELECT CAST(CONCAT('B/' ,Contract_Id)as char) )CON_NO ,
C.Number_Of_Years , 
C.Payment_Amount , 
C.Start_Date , 
C.End_Date , 
C.New_ReNewed_Expaired , 
 
B.Building_Arabic_Name , B.Building_English_Name ,
O.Owner_Ship_AR_Name    as Owner_Ship_AR_Name , 
O.Owner_Ship_EN_Name    as Owner_Ship_EN_Name ,
O.owner_ship_Code    as owner_ship_Code , 
Z.zone_arabic_name   as zone_arabic_name , 
Z.zone_English_name   as zone_English_name , 
T.Tenants_Arabic_Name   as Tenants_Arabic_Name , 
T.Tenants_English_Name   as Tenants_English_Name , 
TN.Arabic_nationality    as Arabic_nationality , 
TN.English_nationality    as English_nationality ,
CT.Contract_Arabic_Type   as Contract_Arabic_Type , 
CT.Contract_English_Type   as Contract_English_Type , 
SUBSTRING(Start_Date,7,4)yearr , 
 (SELECT CAST(CONCAT(Building_NO , '/' , owner_ship_Code , '/' ,yearr)as char) )CON_NO
from  building_contract C
left join building B on (C.building_Building_Id = B.Building_Id)
left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join zone Z on (O.zone_zone_Id = Z.zone_Id)
left join tenants T on (C.tenants_Tenants_ID = T.Tenants_Id)
left join nationality TN on (T.nationality_nationality_ID = TN.nationality_ID)
left join contract_type CT on (C.contract_type_Contract_Type_Id = CT.Contract_Type_Id);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `All_Rental_Disclosure` (IN `B_Id` VARCHAR(200), IN `Type_e` VARCHAR(200))  BEGIN
select * from (
SELECT  (SELECT CAST(CONCAT('A')as char) )Typee ,
C.Contract_Id  as Contract_Id  ,  
C.users_user_ID   as users_user_ID, 
C.tenants_Tenants_ID   as tenants_Tenants_ID,
C.units_Unit_ID   as units_Unit_ID, 
C.contract_type_Contract_Type_Id   as contract_type_Contract_Type_Id, 
C.contract_template_Contract_template_Id   as contract_template_Contract_template_Id,
C.payment_type_payment_type_Id   as payment_type_payment_type_Id, 
C.reason_for_rent_Reason_For_Rent_Id   as reason_for_rent_Reason_For_Rent_Id, 
C.Number_Of_Mounth   as Number_Of_Mounth,
C.Number_Of_Years   as Number_Of_Years, 
C.Payment_Amount   as Payment_Amount, 
C.Payment_Amount_L   as Payment_Amount_L,
C.Date_Of_Sgin   as Date_Of_Sgin, 
C.Start_Date   as Start_Date, 
C.End_Date   as End_Date,
C.Contract_Details   as Contract_Details, 
C.New_ReNewed_Expaired   as New_ReNewed_Expaired, 
C.Start_Free_Period   as Start_Free_Period,
C.Duration_free_period   as Duration_free_period, 
C.maintenance   as maintenance, 
C.Rental_allowed_Or_Not_allowed   as Rental_allowed_Or_Not_allowed,
C.Com_rep   as Com_rep, 
C.Paymen_Method   as Paymen_Method, 
C.Real_Contract_FileName   as Real_Contract_FileName,
C.Real_Contract_Path   as Real_Contract_Path,
T.Tenants_Arabic_Name , T.Tenants_English_Name , T.tenant_type_Tenant_Type_Id ,   T.ID_NO , T.Tenants_Mobile , T.business_records , T.P_O_Box  , TN.Arabic_nationality , 
U.Unit_Number , U.Electricityt_Number , U.Water_Number ,  UT.Unit_Arabic_Type , UT.Unit_English_Type , UD.Unit_Arabic_Detail , UD.Unit_English_Detail , U.furniture_case_Furniture_case_Id, UC.Unit_Arabic_Condition , UC.Unit_English_Condition ,
B.Building_NO, B.Building_Arabic_Name, B.Building_Id , 
O.Street_NO , O.Street_Name , Z.zone_number , O.Owner_Ship_AR_Name , O.owner_ship_Code, O.Owner_Ship_Id , ONR.Owner_Arabic_name, 
CT.Contract_Arabic_Type, 
FC.Furniture_Ar_case, 
PT.payment_Arabic_type 
FROM contract C 
left join tenants T on(C.tenants_Tenants_ID = T.Tenants_Id) 
left join nationality TN on(T.nationality_nationality_ID = TN.nationality_ID) 
left join units U on(C.units_Unit_ID = U.Unit_Id) 
left join unit_type UT on(U.unit_type_Unit_Type_Id = UT.Unit_Type_Id) 
left join unit_detail UD on(U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id) 
left join unit_condition UC on(U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id) 
left join building B on(U.building_Building_Id = B.building_Id) 
left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) 
left join zone Z on(O.zone_zone_Id = Z.zone_Id) 
left join owner ONR on(O.owner_Owner_Id = ONR.Owner_Id) 
left join contract_type CT on(C.contract_type_Contract_Type_Id = CT.Contract_Type_Id) 
left join furniture_case FC on(U.furniture_case_Furniture_case_Id = FC.Furniture_case_Id) 
left join payment_type PT on(C.payment_type_payment_type_Id = PT.payment_type_Id) 
where B.Half_Building_ID = B_Id and (SELECT CAST(CONCAT('A')as char) ) like CONCAT('%', Type_e, '%')
union  
SELECT (SELECT CAST(CONCAT('B')as char) )Typee , C.* ,   
T.Tenants_Arabic_Name , T.Tenants_English_Name , T.tenant_type_Tenant_Type_Id ,   T.ID_NO , T.Tenants_Mobile ,  T.business_records , T.P_O_Box  , TN.Arabic_nationality ,         
U.Unit_Number , U.Electricityt_Number , U.Water_Number ,  UT.Unit_Arabic_Type , UT.Unit_English_Type , UD.Unit_Arabic_Detail, UD.Unit_English_Detail , U.furniture_case_Furniture_case_Id, UC.Unit_Arabic_Condition , UC.Unit_English_Condition ,        
B.Building_NO, B.Building_Arabic_Name, B.Building_Id ,         
O.Street_NO , O.Street_Name , Z.zone_number , O.Owner_Ship_AR_Name , O.owner_ship_Code, O.Owner_Ship_Id , ONR.Owner_Arabic_name,       
CT.Contract_Arabic_Type,         
FC.Furniture_Ar_case,         
PT.payment_Arabic_type         
FROM building_contract C        
left join tenants T on(C.tenants_Tenants_ID = T.Tenants_Id)        
left join nationality TN on(T.nationality_nationality_ID = TN.nationality_ID)          
left join building B on(C.building_Building_Id = B.building_Id)       
left join units U on(U.building_Building_Id = B.Building_Id)       
left join unit_type UT on(U.unit_type_Unit_Type_Id = UT.Unit_Type_Id)        
left join unit_detail UD on(U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)       
left join unit_condition UC on(U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id)       
left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)       
left join zone Z on(O.zone_zone_Id = Z.zone_Id)       
left join owner ONR on(O.owner_Owner_Id = ONR.Owner_Id)       
left join contract_type CT on(C.contract_type_Contract_Type_Id = CT.Contract_Type_Id)       
left join furniture_case FC on(U.furniture_case_Furniture_case_Id = FC.Furniture_case_Id)       
left join payment_type PT on(C.payment_type_payment_type_Id = PT.payment_type_Id)       
where B.Half_Building_ID = B_Id and (SELECT CAST(CONCAT('B')as char) ) like CONCAT('%', Type_e, '%') )a  order by Unit_Number;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `All_Tenant_Disclosure` (IN `T_Id` INT, IN `Type_e` VARCHAR(200))  select * from
(select (SELECT CAST(CONCAT('A')as char))Typee ,  U.Unit_ID , U.Unit_Number , U.Water_Number , U.Electricityt_Number ,  
UD.Unit_Arabic_Detail , UD.Unit_English_Detail ,  UC.Unit_Arabic_Condition ,  UC.Unit_English_Condition , 
B.Building_Id , B.Building_Arabic_Name , B.Building_English_Name , B.Building_NO ,  
O.Owner_Ship_Id , O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name , O.owner_ship_Code , 
C.tenants_Tenants_ID  as tenants_Tenants_ID ,
 C.Number_Of_Years  as Number_Of_Years  , 
 C.Start_Date  as Start_Date ,
 C.End_Date  as End_Date , 
 C.Payment_Amount  as Payment_Amount , 
 C.Paymen_Method  as Paymen_Method , 
 C.Contract_Details  as Contract_Details   
from units U
left join unit_detail UD on(U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)  
left join unit_condition UC on(U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id)  
left join building B on(U.building_Building_Id = B.Building_Id)  
left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join contract C on(C.units_Unit_ID = U.Unit_ID)
where (SELECT CAST(CONCAT('A')as char) ) like CONCAT('%', Type_e, '%')
union all
select (SELECT CAST(CONCAT('B')as char))Typee ,  U.Unit_ID , U.Unit_Number , U.Water_Number , U.Electricityt_Number ,  
 UD.Unit_Arabic_Detail , UD.Unit_English_Detail ,  UC.Unit_Arabic_Condition , UC.Unit_English_Condition ,  
 B.Building_Id , B.Building_Arabic_Name , B.Building_English_Name , B.Building_NO ,  
 O.Owner_Ship_Id , O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name , O.owner_ship_Code ,  
 C.tenants_Tenants_ID , C.Number_Of_Years , C.Start_Date , C.End_Date , C.Payment_Amount , C.Paymen_Method , C.Contract_Details   
 from units U  
 left join unit_detail UD on(U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)  
 left join unit_condition UC on(U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id)  
 left join building B on(U.building_Building_Id = B.Building_Id)  
 left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)  
 left join building_contract C on(C.building_Building_Id = B.Building_Id)
 where (SELECT CAST(CONCAT('B')as char) ) like CONCAT('%', Type_e, '%')) a 
 where tenants_Tenants_ID = T_Id$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `All_Trasformatios` (IN `Type_e` VARCHAR(200), IN `Datee` VARCHAR(200))  BEGIN
select  (SELECT CAST(CONCAT('A/' ,T.transformation_Table_ID)as char) )transformation_Id ,  T.transformation_No , T.transformation_Date , T.Amount , T.Status , T.Collection_Date  , 
TB.Bank_Name , TB.Bank_Name_En ,  TB.Account_No_En , TB.Soaft_Code_No_En , TB.Beneficiary_Name , TB.Beneficiary_Name_En ,
TT.Tenants_Arabic_Name  ,  TT.Tenants_English_Name  ,
(select units_Unit_ID from contract where Contract_Id = T.Contract_Id )U_ID ,
(SELECT CAST(CONCAT('وحدة رقم : ' ,(select Unit_Number from units where Unit_ID=U_ID))as char) )U_NO ,
(SELECT CAST(CONCAT('Unit NO :' ,(select Unit_Number from units where Unit_ID=U_ID))as char) )EN_U_NO ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=(select building_Building_Id from units where Unit_ID=U_ID ) ) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name ,
(select Owner_Ship_EN_Name  from owner_ship where Owner_Ship_Id=O_ID)EN_O_Name ,
(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code
from transformation_table T 
left join transformation_bank TB on (T.transformation_Bank_ID = TB.transformation_Bank_ID)
left join tenants TT on (T.tenant_Id = TT.Tenants_ID)
where (SELECT CAST(CONCAT('A/' ,T.transformation_Table_ID)as char) ) like CONCAT('%', Type_e, '%')
and T.transformation_Date Like  CONCAT('%', Datee, '%')
Union All
select (SELECT CAST(CONCAT('B/' ,T.transformation_Table_ID)as char) )transformation_Id , T.transformation_No , T.transformation_Date , T.Amount , T.Status , T.Collection_Date , 
TB.Bank_Name , TB.Bank_Name_En , TB.Account_No_En , TB.Soaft_Code_No_En , TB.Beneficiary_Name , TB.Beneficiary_Name_En ,
TT.Tenants_Arabic_Name , TT.Tenants_English_Name  ,
(select building_Building_Id from building_contract where Contract_Id = T.Contract_Id )B_ID , 
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Building_English_Name from building where Building_Id=B_ID)EN_B_Name,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name ,
(select Owner_Ship_EN_Name  from owner_ship where Owner_Ship_Id=O_ID)EN_O_Name ,
(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code
from building_transformation_table T
left join transformation_bank TB on (T.transformation_Bank_ID = TB.transformation_Bank_ID)
left join tenants TT on (T.tenant_Id = TT.Tenants_ID)
where (SELECT CAST(CONCAT('B/' ,T.transformation_Table_ID)as char) ) like CONCAT('%', Type_e, '%') 
and T.transformation_Date Like  CONCAT('%', Datee, '%');
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Asset_Detail` (IN `Id` INT)  BEGIN
select
 A.* ,
AL.*,
AC.*,
V.*,
MC.Categoty_AR , MC.Categoty_EN ,
E.Employee_Arabic_name , E.Employee_English_name ,
I.* ,
O.Owner_Ship_AR_Name, O.Owner_Ship_EN_Name,
B.Building_Arabic_Name,B.Building_English_Name,
U.Unit_Number,
C.*

FROM assets A

left join asset_location AL on (A.asset_location_Asset_Location_Id = AL.Asset_Location_Id)
left join asset_condition AC on (A.asset_condition_Asset_Condition_Id = AC.Asset_Condition_Id)
left join vendor_typ V on (A.vendor_type_Vendor_Type_Id = V.Vendor_Type_Id)
left join maintenance_categoty MC on (A.maintenance_categoty_Categoty_Id = MC.Categoty_Id)
left join employee E on (A.Buyer = E.Employee_Id)
left join inventory I on (A.Inventory_Id = I.Inventory_Id)
left join owner_ship O on (A.OwnerShip_Id = O.Owner_Ship_Id)
left join building B on (A.Building_ID = B.Building_Id)
left join units U on (A.Unit_Id = U.Unit_ID)
left join contractor C on (A.contractor = C.Contractor_ID)

where Assets_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Asset_Details` (IN `Id` INT)  BEGIN
SELECT  A.Assets_English_Name   , A.Assets_Arabic_Name , A.Assets_Value , A.Purchase_Date ,
A.Description , A.Quantitiy ,


ATY.Asset_Arabic_Type ,
AC.Asset_Arabic_Condition ,
Al.Asset_Arabic_Location ,
Vn.Vendor_Arabic_Type , 
Inv.Inventory_Arabic_name , 
W.Aseet_Arabic_warranty , 
B.Building_Arabic_Name , 
U.Unit_Number

FROM assets A

left join asset_type ATY on (A.asset_type_Asset_Type_Id = ATY.Asset_Type_Id)
left join asset_condition AC on (A.asset_condition_Asset_Condition_Id = AC.Asset_Condition_Id) 
left join asset_location Al on (A.asset_location_Asset_Location_Id = Al.Asset_Location_Id) 
left join vendor_type Vn on (A.vendor_type_Vendor_Type_Id = Vn.Vendor_Type_Id)
left join inventory Inv on (A.inventory_Inventory_Id = Inv.Inventory_Id)
left join aseet_warranty W on (A.aseet_warranty_Aseet_warranty_Id = W.Aseet_warranty_Id)
left join building B on (A.building_Building_Id = B.Building_Id)
left join units U on (A.units_Unit_ID = U.Unit_ID)


where Assets_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Asset_List` ()  BEGIN
select
 A.* ,
AL.*,
AC.*,
V.*,
MC.Categoty_AR , MC.Categoty_EN,
E.Employee_Arabic_name,
I.*,
O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name,
B.Building_Arabic_Name, B.Building_English_Name,
U.Unit_Number

FROM assets A

left join asset_location AL on (A.asset_location_Asset_Location_Id = AL.Asset_Location_Id)
left join asset_condition AC on (A.asset_condition_Asset_Condition_Id = AC.Asset_Condition_Id)
left join vendor_typ V on (A.vendor_type_Vendor_Type_Id = V.Vendor_Type_Id)
left join maintenance_categoty MC on (A.maintenance_categoty_Categoty_Id = MC.Categoty_Id)
left join employee E on (A.Buyer = E.Employee_Id)
left join inventory I on (A.Inventory_Id = I.Inventory_Id)
left join owner_ship O on (A.OwnerShip_Id = O.Owner_Ship_Id)
left join building B on (A.Building_ID = B.Building_Id)
left join units U on (A.Unit_Id = U.Unit_ID);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Avilabel_Cash_Amount` ()  BEGIN
select Ch_tb.*,  
T.Tenants_Arabic_Name ,
T.Tenants_ID,
(select units_Unit_ID from contract where Contract_Id = Ch_tb.Contract_Id )U_ID ,
(select building_Building_Id from units where Unit_ID=U_ID ) B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,
(select Unit_Number from units where Unit_ID=U_ID)U_NO,
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name , 
(select  owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code
FROM  cash_amount Ch_tb
left join  tenants T on (Ch_tb.tenant_Id = T.Tenants_ID);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Avilabel_Cheuqes` (IN `Cheq_No` VARCHAR(200), IN `Cheq_Date` VARCHAR(200), IN `Cheq_Owner` VARCHAR(200), IN `Bank_ArabicName` VARCHAR(200), IN `Tenants_ArabicName` VARCHAR(200), IN `Cheq_Status` VARCHAR(200))  BEGIN
SELECT 
Cq.*,  
Cq_T.Cheque_arabic_Type  , 
B.Bank_Arabic_Name ,
T.Tenants_Arabic_Name ,
T.Tenants_ID,


(select units_Unit_ID from contract where Contract_Id = Cq.contract_Contract_Id )U_ID ,
(select building_Building_Id from units where Unit_ID=U_ID ) B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,

(select Unit_Number from units where Unit_ID=U_ID)U_NO,
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name,
(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code






FROM amlak_realestate.cheques Cq
left join amlak_realestate.cheque_type Cq_T on (Cq.cheque_type_Cheque_Type_id = Cq_T.Cheque_Type_id)
left join amlak_realestate.bank B on (Cq.bank_Bank_Id = B.Bank_Id)
left join amlak_realestate.tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID)


where Cheques_No like CONCAT('%', Cheq_No, '%')
or Cheques_Date like CONCAT('%', Cheq_Date, '%') 
or Cheque_Owner like CONCAT('%', Cheq_Owner, '%')  
or Bank_Arabic_Name like CONCAT('%', Bank_ArabicName, '%')
or Tenants_Arabic_Name like CONCAT('%', Tenants_ArabicName, '%')
or Cheques_Status like CONCAT('%', Cheq_Status, '%');

END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Avilable_transformation` ()  SELECT 
tr_tb.*,  
B.* ,
T.Tenants_Arabic_Name ,
T.Tenants_ID,


(select units_Unit_ID from contract where Contract_Id = tr_tb.Contract_Id )U_ID ,
(select building_Building_Id from units where Unit_ID=U_ID ) B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,

(select Unit_Number from units where Unit_ID=U_ID)U_NO,
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name ,

(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code






FROM  .transformation_table tr_tb

left join  .transformation_bank B on (tr_tb.transformation_Bank_ID = B.transformation_Bank_ID)
left join  .tenants T on (tr_tb.tenant_Id = T.Tenants_ID)$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Buildings_Avilabel_Cheuqes` (IN `Cheq_No` VARCHAR(200), IN `Cheq_Date` VARCHAR(200), IN `Cheq_Owner` VARCHAR(200), IN `Bank_ArabicName` VARCHAR(200), IN `Tenants_ArabicName` VARCHAR(200), IN `Cheq_Status` VARCHAR(200))  BEGIN
SELECT 
Cq.*,  
Cq_T.Cheque_arabic_Type  , 
B.Bank_Arabic_Name ,
T.Tenants_Arabic_Name ,
T.Tenants_ID,



(select building_Building_Id from building_contract where Contract_Id = Cq.building_contract_Contract_Id )B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,


(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name,
(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code






FROM amlak_realestate.building_cheques Cq
left join amlak_realestate.cheque_type Cq_T on (Cq.cheque_type_Cheque_Type_id = Cq_T.Cheque_Type_id)
left join amlak_realestate.bank B on (Cq.bank_Bank_Id = B.Bank_Id)
left join amlak_realestate.tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID)


where Cheques_No like CONCAT('%', Cheq_No, '%')
or Cheques_Date like CONCAT('%', Cheq_Date, '%') 
or Cheque_Owner like CONCAT('%', Cheq_Owner, '%')  
or Bank_Arabic_Name like CONCAT('%', Bank_ArabicName, '%')
or Tenants_Arabic_Name like CONCAT('%', Tenants_ArabicName, '%')
or Cheques_Status like CONCAT('%', Cheq_Status, '%');

END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_Avilable_Cash` ()  BEGIN
SELECT 
Cq.*,T.Tenants_Arabic_Name , T.Tenants_ID,
(select building_Building_Id from building_contract where Contract_Id = Cq.Contract_Id )B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name , 
(select  owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code
FROM  building_cash_amount Cq
left join  tenants T on (Cq.tenant_Id = T.Tenants_ID);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_Avilable_transformation` ()  BEGIN
SELECT 
Cq.*, B.* , T.Tenants_Arabic_Name , T.Tenants_ID,
(select building_Building_Id from building_contract where Contract_Id = Cq.Contract_Id )B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name , 
(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code 
FROM  building_transformation_table Cq
left join  transformation_bank B on (Cq.transformation_Bank_ID = B.transformation_Bank_ID)
left join  tenants T on (Cq.tenant_Id = T.Tenants_ID);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_cheques_Amount` ()  BEGIN
SELECT 
Cq.*,  
Cq_T.Cheque_arabic_Type  , 
B.Bank_Arabic_Name ,
T.Tenants_Arabic_Name ,
T.Tenants_ID,


(select building_Building_Id from building_contract where Contract_Id = Cq.building_contract_Contract_Id )B_ID ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,


(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name






FROM building_cheques Cq
left join cheque_type Cq_T on (Cq.cheque_type_Cheque_Type_id = Cq_T.Cheque_Type_id)
left join bank B on (Cq.bank_Bank_Id = B.Bank_Id)
left join tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_Contarct_list` ()  BEGIN
SELECT 
C.* ,  
T.Tenants_Arabic_Name ,  T.Tenants_English_Name , T.tenant_type_Tenant_Type_Id ,   T.ID_NO , T.Tenants_Mobile , T.tenant_type_Tenant_Type_Id , T.business_records , T.P_O_Box  , TN.Arabic_nationality , TN.English_nationality ,
B.Building_Arabic_Name,  B.Building_English_Name , B.Building_Id,B.Building_NO , 
 O.Street_NO , O.Street_Name , O.Owner_Ship_AR_Name, O.Owner_Ship_EN_Name,  O.owner_ship_Code, Z.zone_number , Z.zone_arabic_name , Z.zone_English_name ,
 CT.Contract_Arabic_Type ,  CT.Contract_English_Type ,
 (Select count(*) from units where building_Building_Id = B.Building_Id)buildingCount,
 SUBSTRING(Start_Date,7,4)yearr,
 (SELECT CAST(CONCAT(Building_NO , '/' , owner_ship_Code , '/' ,yearr)as char) )CON_NO
FROM building_contract C
left join tenants T on (C.tenants_Tenants_ID = T.Tenants_Id)
left join nationality TN on (T.nationality_nationality_ID = TN.nationality_ID)
left join building B on (C.building_Building_Id = B.Building_Id)
left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join zone Z on (O.zone_zone_Id = Z.zone_Id)
left join contract_type CT on (C.contract_type_Contract_Type_Id = CT.Contract_Type_Id);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_Contract_Detalis` (IN `Id` INT)  BEGIN
SELECT 
C.* ,  
T.Tenants_Arabic_Name , T.tenant_type_Tenant_Type_Id ,   T.ID_NO , T.Tenants_Mobile , T.tenant_type_Tenant_Type_Id , T.business_records , T.P_O_Box  , TN.Arabic_nationality ,
B.Building_Arabic_Name, B.Building_Id,
 O.Street_NO , O.Street_Name , Z.zone_number ,
 CT.Contract_Arabic_Type ,
 (Select count(*) from units where building_Building_Id = B.Building_Id)buildingCount
FROM amlak_realestate.building_contract C
left join amlak_realestate.tenants T on (C.tenants_Tenants_ID = T.Tenants_Id)
left join amlak_realestate.nationality TN on (T.nationality_nationality_ID = TN.nationality_ID)
left join amlak_realestate.building B on (C.building_Building_Id = B.Building_Id)
left join amlak_realestate.owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join amlak_realestate.zone Z on (O.zone_zone_Id = Z.zone_Id)
left join amlak_realestate.contract_type CT on (C.contract_type_Contract_Type_Id = CT.Contract_Type_Id)
where Contract_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_Contract_List_In_Edit_page` (IN `Id` INT)  BEGIN
SELECT 
Cq.*,  


Cq_T.*  , 
B.* ,
T.Tenants_Arabic_Name , T.Tenants_English_Name



FROM building_cheques Cq

left join cheque_type Cq_T on (Cq.cheque_type_Cheque_Type_id = Cq_T.Cheque_Type_id)
left join bank B on (Cq.bank_Bank_Id = B.Bank_Id)
left join tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID)

where building_contract_Contract_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_Details` (IN `Id` INT)  BEGIN
SELECT
B.*  ,  BC.*  ,  BT.* ,
O.Owner_Ship_Ar_Name , O.Street_NO ,
Z.zone_number,
(select count(*) from units where building_Building_Id = B.Building_Id)Unit_Connt


FROM building B

left join owner_ship O on (B.owner_ship_owner_ship_Id = O.owner_ship_Id)
left join building_condition BC on (B.building_condition_Building_Condition_Id = BC.building_condition_Id)
left join building_type BT on (B.building_type_Building_Type_Id = BT.building_type_Id)

left join zone Z on (O.zone_zone_Id = Z.zone_Id)

where Building_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_List_In_Ownership_Details` (IN `Id` INT)  BEGIN
SELECT 
B.*,  


O.Owner_Ship_AR_Name  , 
BC.* ,
BT.* ,
(YEAR(CURDATE()) - B.Construction_Completion_Date )Building_Age,
(B.Building_Value / 30)Annual_Waste,
((YEAR(CURDATE()) - B.Construction_Completion_Date)*(B.Building_Value / 30))Cumulative_Waste,
(30-(YEAR(CURDATE()) - B.Construction_Completion_Date ))Still_Age,
(select Sum(virtual_Value) from units where building_Building_Id = B.Building_Id)Sum_virtual_Value ,
(select Sum(unit_type_Unit_Type_Id) from units where building_Building_Id = B.Building_Id  and unit_type_Unit_Type_Id = '1' )Sum_apartment ,
((select Sum(unit_type_Unit_Type_Id) from units where building_Building_Id = B.Building_Id  and unit_type_Unit_Type_Id = '3')/3 )Sum_Office ,
((select Sum(unit_type_Unit_Type_Id) from units where building_Building_Id = B.Building_Id  and unit_type_Unit_Type_Id = '2')/2 )Sum_Stor , 



(SELECT IF((select Sum(Collection) from collection_table where Building_Id = B.Building_Id)  != 0, (select Sum(Collection) from collection_table where Building_Id = B.Building_Id) , 0)) Dakhel_FUly , 
(SELECT IF((select Sum(Payment_Amount) from building_contract where building_Building_Id = B.Building_Id)  != 0, (select Sum(Collection) from collection_table where Building_Id = B.Building_Id) , 0)) Ijar_Taakudy_B , 
(SELECT IF((Select Sum(Payment_Amount) from contract  join  units U on (U.Unit_ID = contract.units_Unit_ID) where U. building_Building_Id = B.Building_Id  ) != 0, (Select Sum(Payment_Amount) from contract  join  units U on (U.Unit_ID = contract.units_Unit_ID) where U. building_Building_Id = B.Building_Id  ), 0))Ijar_Taakudy_U , 

(select (Ijar_Taakudy_B)+(Ijar_Taakudy_U))Ijar_Taakudy ,

(select (B.Building_Value)*(0.05)*(Building_Age)) NotBook_Still ,

(SELECT IF(NotBook_Still != 0, NotBook_Still, 0)) R_NotBook_Still ,


(SELECT IF(( select  B.Building_Value - Cumulative_Waste)!=0, ( select  B.Building_Value - Cumulative_Waste), 0)) Still_Building_Value ,

(select Sum(unit_condition_Unit_Condition_Id) from units where building_Building_Id = B.Building_Id  and unit_condition_Unit_Condition_Id = '1' )Moajar ,
((select Sum(unit_condition_Unit_Condition_Id) from units where building_Building_Id = B.Building_Id  and unit_condition_Unit_Condition_Id = '2'))Shagher ,
((select Sum(unit_condition_Unit_Condition_Id) from units where building_Building_Id = B.Building_Id  and unit_condition_Unit_Condition_Id = '3'))Insha_Siana , 
(select Sum(unit_condition_Unit_Condition_Id) from units where building_Building_Id = B.Building_Id  and unit_condition_Unit_Condition_Id = '4' )NeZaa  ,

(SELECT IF(Moajar != 0, Moajar, 0)) R_Moajar ,
(SELECT IF(Shagher != 0, Shagher, 0)) R_Shagher ,
(SELECT IF(Insha_Siana != 0, Insha_Siana, 0)) R_Insha_Siana ,
(SELECT IF(NeZaa != 0, NeZaa, 0)) R_NeZaa 

FROM  building B

left join  owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join  building_condition BC on (B.building_condition_Building_Condition_Id = BC.Building_Condition_Id)
left join  building_type BT on (B.building_type_Building_Type_Id = BT.Building_Type_Id)



where owner_ship_Owner_Ship_Id = ID and  B.Active ='1' ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Building_Zone_Id` (IN `Id` INT)  BEGIN
SELECT   Z.zone_Id   
FROM amlak_realestate.building B
left join amlak_realestate.owner_ship O on (B.owner_ship_Owner_Ship_Id = O.owner_Ship_Id)
left join amlak_realestate.zone Z on (O.zone_zone_Id = Z.zone_Id) 
where Building_Id = Id;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Buliding_list` ()  BEGIN
SELECT 
B.*,  


O.Owner_Ship_AR_Name  , O.Owner_Ship_EN_Name ,
BC.* ,
BT.* 




FROM building B

left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join building_condition BC on (B.building_condition_Building_Condition_Id = BC.Building_Condition_Id)
left join building_type BT on (B.building_type_Building_Type_Id = BT.Building_Type_Id)

where B.Active ='1' order by O.owner_ship_Code ASC;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `cheques_Amount` ()  BEGIN
SELECT 
Cq.*,  
Cq_T.Cheque_arabic_Type  , 
B.Bank_Arabic_Name ,
T.Tenants_Arabic_Name ,
T.Tenants_ID,


(select units_Unit_ID from contract where Contract_Id = Cq.contract_Contract_Id )U_ID ,
(select building_Building_Id from units where Unit_ID=U_ID ) B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID,

(select Unit_Number from units where Unit_ID=U_ID)U_NO,
(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name,
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name,
(select virtual_Value from units where Unit_ID=U_ID)virtual_Value






FROM cheques Cq
left join cheque_type Cq_T on (Cq.cheque_type_Cheque_Type_id = Cq_T.Cheque_Type_id)
left join bank B on (Cq.bank_Bank_Id = B.Bank_Id)
left join tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Company_Rep_List` ()  BEGIN
select
CR.* , N.*
from company_representative CR
left join nationality N on (CR.nationality_nationality_ID = N.nationality_ID)
where Company_representative_Id >1;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `complaint_report_request` ()  BEGIN
SELECT 
CRR.*,  


T.Tenants_Arabic_Name  , T.Tenants_English_Name , 
E.Employee_Arabic_name , E.Employee_English_name ,
B.Building_Arabic_Name , B.Building_English_Name ,
U.Unit_Number 



FROM complaint_report_request CRR


left join tenants T on (CRR.Tenant_ID = T.Tenants_ID)
left join employee E on (CRR.Employee_ID = E.Employee_Id)
left join building B on (CRR.building_Building_Id = B.Building_Id)
left join units U on (CRR.Unit_Id = U.Unit_ID)
order by CRR.priority_Danger;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `complaint_report_request_Details` (IN `Id` INT)  BEGIN
Select 
CRR.*,  
T.Tenants_Arabic_Name  ,  T.Tenants_English_Name  ,
E.Employee_Arabic_name ,  E.Employee_English_name ,
B.Building_Arabic_Name ,  B.Building_English_Name,
U.Unit_Number
FROM complaint_report_request CRR 
left join tenants T on (CRR.Tenant_ID = T.Tenants_ID)
left join employee E on (CRR.Employee_ID = E.Employee_Id)
left join building B on (CRR.building_Building_Id = B.Building_Id)
left join units U on (CRR.Unit_Id = U.Unit_ID)
where Complaint_Report_Request_Id =ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Com_Rep_Detail` (IN `Id` INT)  BEGIN
select
CR.* ,  CRN.Arabic_nationality
FROM amlak_realestate.company_representative CR
left join amlak_realestate.nationality CRN on (CR.nationality_nationality_ID = CRN.nationality_ID)
where Company_representative_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Com_Rep_Details` (IN `Id` INT)  BEGIN
select
CR.* , 
N.Arabic_nationality , 
CN.Tenants_Arabic_Name
from company_representative CR
left join amlak_realestate.nationality N on (CR.nationality_nationality_ID = N.nationality_ID)
left join amlak_realestate.tenants CN on (CR.tenants_Tenants_ID = CN.Tenants_ID)
where Company_representative_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Contarct_list` ()  BEGIN
SELECT 
C.* ,  

T.Tenants_Arabic_Name , T.Tenants_English_Name , T.tenant_type_Tenant_Type_Id ,   T.ID_NO , T.Tenants_Mobile , T.tenant_type_Tenant_Type_Id , T.business_records , T.P_O_Box  , TN.Arabic_nationality , TN.English_nationality ,
U.Unit_Number , U.Electricityt_Number , U.Water_Number ,  UT.Unit_Arabic_Type ,UD.Unit_Arabic_Detail, U.furniture_case_Furniture_case_Id, UC.Unit_Arabic_Condition ,
B.Building_NO, B.Building_Arabic_Name, B.Building_English_Name, B.Building_Id ,
 O.Street_NO , O.Street_Name , Z.* , O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name , O.owner_ship_Code, ONR.Owner_Arabic_name,
 CT.*,
 FC.Furniture_Ar_case,
 PT.*,
 SUBSTRING(Start_Date,7,4)yearr,
 (SELECT CAST(CONCAT(Unit_Number , '/' , Building_NO , '/' , owner_ship_Code , '/' ,yearr)as char) )CON_NO

FROM contract C


left join tenants T on (C.tenants_Tenants_ID = T.Tenants_Id)
left join nationality TN on (T.nationality_nationality_ID = TN.nationality_ID)

left join units U on (C.units_Unit_ID = U.Unit_Id)
left join unit_type UT on (U.unit_type_Unit_Type_Id = UT.Unit_Type_Id)
left join unit_detail UD on (U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)
left join unit_condition UC on (U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id)

left join building B on (U.building_Building_Id = B.building_Id)
left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join zone Z on (O.zone_zone_Id = Z.zone_Id)
left join owner ONR on (O.owner_Owner_Id = ONR.Owner_Id)

left join contract_type CT on (C.contract_type_Contract_Type_Id = CT.Contract_Type_Id)
left join furniture_case FC on (U.furniture_case_Furniture_case_Id = FC.Furniture_case_Id)

left join payment_type PT on (C.payment_type_payment_type_Id = PT.payment_type_Id);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Contract_Detalis` (IN `Id` INT)  BEGIN
SELECT 
C.* ,  

T.Tenants_Arabic_Name , T.tenant_type_Tenant_Type_Id ,   T.ID_NO , T.Tenants_Mobile , T.tenant_type_Tenant_Type_Id , T.business_records , T.P_O_Box  , TN.Arabic_nationality ,
U.Unit_Number , U.Electricityt_Number , U.Water_Number ,  UT.Unit_Arabic_Type ,UD.Unit_Arabic_Detail, U.furniture_case_Furniture_case_Id,
B.Building_NO,
 O.Street_NO , O.Street_Name , Z.zone_number ,
 CT.Contract_Arabic_Type,
 FC.Furniture_Ar_case,
  PT.payment_Arabic_type

FROM amlak_realestate.contract C


left join amlak_realestate.tenants T on (C.tenants_Tenants_ID = T.Tenants_Id)
left join amlak_realestate.nationality TN on (T.nationality_nationality_ID = TN.nationality_ID)

left join amlak_realestate.units U on (C.units_Unit_ID = U.Unit_Id)
left join amlak_realestate.unit_type UT on (U.unit_type_Unit_Type_Id = UT.Unit_Type_Id)
left join amlak_realestate.unit_detail UD on (U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)

left join amlak_realestate.building B on (U.building_Building_Id = B.building_Id)
left join amlak_realestate.owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
left join amlak_realestate.zone Z on (O.zone_zone_Id = Z.zone_Id)

left join amlak_realestate.contract_type CT on (C.contract_type_Contract_Type_Id = CT.Contract_Type_Id)
left join amlak_realestate.furniture_case FC on (U.furniture_case_Furniture_case_Id = FC.Furniture_case_Id)
left join amlak_realestate.payment_type PT on (C.payment_type_payment_type_Id = PT.payment_type_Id)

where Contract_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Contract_GridView` ()  BEGIN
SELECT 
C.Contract_Id , C.Payment_Amount , C.Date_Of_Sgin , C.Start_Date , C.End_Date ,  T.Tenants_Arabic_Name   
FROM amlak_realestate.contract C
left join amlak_realestate.tenants T on (C.tenants_Tenants_ID = T.Tenants_ID);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Contract_List_In_Edit_page` (IN `Id` INT)  BEGIN
SELECT 
Cq.*,  


Cq_T.*  , 
B.* ,
T.Tenants_Arabic_Name



FROM cheques Cq

left join cheque_type Cq_T on (Cq.cheque_type_Cheque_Type_id = Cq_T.Cheque_Type_id)
left join bank B on (Cq.bank_Bank_Id = B.Bank_Id)
left join tenants T on (Cq.tenants_Tenants_ID = T.Tenants_ID)

where contract_Contract_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Dashboard_Test` ()  BEGIN
Select (SELECT CAST(CONCAT('U_Cq/' ,Cq.Cheques_Id)as char))Id  , Cq.Cheques_Date as Datee  ,Cq.Cheques_Amount as  Amount,
(select units_Unit_ID from contract where Contract_Id = Cq.contract_Contract_Id )U_ID , 
(select building_Building_Id from units where Unit_ID=U_ID ) B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id= B_ID) O_ID , 
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name from cheques Cq 
Union All
Select (SELECT CAST(CONCAT('B_Cq/' ,Cq.Cheques_Id)as char) )Id , Cq.Cheques_Date as Datee  ,Cq.Cheques_Amount as  Amount ,
(select building_Building_Id from building_contract where Contract_Id = Cq.building_contract_Contract_Id )B_ID , 
(select building_Building_Id from building_contract where Contract_Id = Cq.building_contract_Contract_Id )B_ID ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID , 
(select Owner_Ship_AR_Name from owner_ship where Owner_Ship_Id=O_ID)O_Name from building_cheques Cq 
Union All
select  (SELECT CAST(CONCAT('U_Tr/' ,T.transformation_Table_ID)as char))Id , T.transformation_Date as Datee , T.Amount as  Amount ,
(select units_Unit_ID from contract where Contract_Id = T.Contract_Id )U_ID ,
(select building_Building_Id from units where Unit_ID=U_ID ) B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id= B_ID) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name from transformation_table T 
Union All
select (SELECT CAST(CONCAT('B_Tr/' ,T.transformation_Table_ID)as char) )Id  , T.transformation_Date as Datee , T.Amount as  Amount ,
(select building_Building_Id from building_contract where Contract_Id = T.Contract_Id )B_ID , 
(select building_Building_Id from building_contract where Contract_Id = T.Contract_Id )B_ID ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name from building_transformation_table T
Union All
Select (SELECT CAST(CONCAT('U_Ca/' ,CA.Cash_Amount_ID)as char) )Id  ,  CA.Cash_Date as Datee , CA.Cash_Amount as  Amount ,  
(select units_Unit_ID from contract where Contract_Id = CA.Contract_Id )U_ID ,
(select building_Building_Id from units where Unit_ID=U_ID ) B_ID,
(select owner_ship_Owner_Ship_Id from building where Building_Id= B_ID) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name from cash_amount CA
Union All
Select (SELECT CAST(CONCAT('B_Ca/' ,CA.Cash_Amount_ID)as char) )Id ,   CA.Cash_Date as Datee , CA.Cash_Amount as  Amount ,  
(select building_Building_Id from building_contract where Contract_Id = CA.Contract_Id )B_ID , 
(select building_Building_Id from building_contract where Contract_Id = CA.Contract_Id )B_ID ,
(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID , 
(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name from building_cash_amount CA ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Details_All_ownership` ()  BEGIN
select Z.zone_number ,  Z.zone_arabic_name , Z.zone_English_name , onr.Owner_Arabic_name , onr.Owner_English_name ,
 O.* , 
(Select count(*) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Active ='1'  )buildingCount,

(Select CAST( CONCAT
(
'شقة : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')), 
 '  /  ', 
'مكتب : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )),
'  /  ', 
'محل : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' )) ,
'  /  ',
'فيلا : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Villa' )) 
)as char)
 from units LIMIT 1 )Unit_Type  ,
 
  (Select CAST( CONCAT
(
'apartment : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')), 
 '  /  ', 
'Office : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )),
'  /  ', 
'Shop : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' )) ,
'  /  ',
'villa : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Villa' )) 
)as char)
 from units LIMIT 1 )EN_Unit_Type  ,
 
 
(Select Sum(virtual_Value) from units  where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1' and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) Sum_Ownership_Virtual_Value ,
((Select Sum(virtual_Value) from units  where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1' and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id ))*12/14)AedIftirady_ON_BuildingValue , 

 
  


(SELECT IF((Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) > 0, (Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_U ,
(SELECT IF((Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) > 0, (Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_B ,




( select  Ejar_Taakudy_U + Ejar_Taakudy_B) Ejar_Taakudy_OS ,

((Select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Active ='1'  )+(O.Land_Value))KemtArd_KemtBena ,

( select (Ejar_Taakudy_OS*12)/(KemtArd_KemtBena)) Aed_ON_KemtAkar , 

(select (Sum_Ownership_Virtual_Value - Ejar_Taakudy_OS)*12) Farek_Sanawy



from owner_ship O 
left join owner onr on (O.owner_Owner_Id = onr.owner_Id)


left join zone Z on (O.zone_zone_Id = Z.zone_Id) ;select Z.zone_number ,  Z.zone_arabic_name , Z.zone_English_name , onr.Owner_Arabic_name ,
 O.* , 
(Select count(*) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Active ='1'  )buildingCount,

(Select CAST( CONCAT
(
'شقة : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')), 
 '  /  ', 
'مكتب : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )),
'  /  ', 
'محل : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' )) ,
'  /  ',
'فيلا : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Villa' )) 
)as char)
 from units LIMIT 1 )Unit_Type  ,
 
 (Select CAST( CONCAT
(
'شقة : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')), 
 '  /  ', 
'Office : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )),
'  /  ', 
'Shop : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' )) ,
'  /  ',
'villa : ', (Select count(*) from units join unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Villa' )) 
)as char)
 from units LIMIT 1 )EN_Unit_Type  ,
 
 
(Select Sum(virtual_Value) from units  where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1' and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) Sum_Ownership_Virtual_Value ,
((Select Sum(virtual_Value) from units  where Half ='0' and building_Building_Id in ( Select Building_Id from building where Active ='1' and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id ))*12/14)AedIftirady_ON_BuildingValue , 

 
  


(SELECT IF((Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) > 0, (Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_U ,
(SELECT IF((Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) > 0, (Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_B ,




( select  Ejar_Taakudy_U + Ejar_Taakudy_B) Ejar_Taakudy_OS ,

((Select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Active ='1'  )+(O.Land_Value))KemtArd_KemtBena ,

( select (Ejar_Taakudy_OS*12)/(KemtArd_KemtBena)) Aed_ON_KemtAkar , 

(select (Sum_Ownership_Virtual_Value - Ejar_Taakudy_OS)*12) Farek_Sanawy



from owner_ship O 
left join owner onr on (O.owner_Owner_Id = onr.owner_Id)


left join zone Z on (O.zone_zone_Id = Z.zone_Id) ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Edit_Building` (IN `owner_ship_Owner_Ship_Id` VARCHAR(200), IN `building_condition_Building_Condition_Id` VARCHAR(200), IN `building_type_Building_Type_Id` VARCHAR(200), IN `Building_English_Name` VARCHAR(200), IN `Building_Arabic_Name` VARCHAR(200), IN `electricity_meter` VARCHAR(200), IN `Water_meter` VARCHAR(200), IN `Building_NO` VARCHAR(200), IN `Construction_Area` VARCHAR(200), IN `Maintenance_status` VARCHAR(200), IN `Building_Value` VARCHAR(200), IN `Construction_Completion_Date` VARCHAR(200), IN `Building_Photo` VARCHAR(200), IN `Building_Photo_Path` VARCHAR(200), IN `Entrance_Photo` VARCHAR(200), IN `Entrance_Photo_Path` VARCHAR(200), IN `Statement` VARCHAR(200), IN `Statement_Path` VARCHAR(200), IN `Building_Permit` VARCHAR(200), IN `Building_Permit_Path` VARCHAR(200), IN `certificate_of_completion` VARCHAR(200), IN `certificate_of_completion_Path` VARCHAR(200), IN `Image` VARCHAR(200), IN `Image_Path` VARCHAR(200), IN `Map` VARCHAR(200), IN `Map_path` VARCHAR(200), IN `Plan` VARCHAR(200), IN `Plano_Path` VARCHAR(200), IN `ID` INT)  BEGIN
UPDATE building SET 
owner_ship_Owner_Ship_Id  = owner_ship_Owner_Ship_Id , 
building_condition_Building_Condition_Id = building_condition_Building_Condition_Id, 
building_type_Building_Type_Id = building_type_Building_Type_Id, 
Building_English_Name  = Building_English_Name ,
Building_Arabic_Name = Building_Arabic_Name,
electricity_meter  = electricity_meter ,
Water_meter  = Water_meter ,
Building_NO = Building_NO , 
Construction_Area = Construction_Area ,
Maintenance_status = Maintenance_status ,
Building_Value = Building_Value ,
Construction_Completion_Date = Construction_Completion_Date ,
Building_Photo = Building_Photo ,
Building_Photo_Path = Building_Photo_Path ,
Entrance_Photo = Entrance_Photo ,
Entrance_Photo_Path = Entrance_Photo_Path ,
Statement = Statement ,
Statement_Path = Statement_Path ,
Building_Permit = Building_Permit ,
Building_Permit_Path = Building_Permit_Path ,
certificate_of_completion = certificate_of_completion ,
certificate_of_completion_Path = certificate_of_completion_Path ,
Image = Image ,
Image_Path = Image_Path ,
Map = Map ,
Map_path = Map_path ,
Plan = Plan ,
Plano_Path = Plano_Path 
Where Building_Id = ID;

UPDATE arcive_building SET 
owner_ship_Owner_Ship_Id  = owner_ship_Owner_Ship_Id , 
building_condition_Building_Condition_Id = building_condition_Building_Condition_Id, 
building_type_Building_Type_Id = building_type_Building_Type_Id, 
Building_English_Name  = Building_English_Name ,
Building_Arabic_Name = Building_Arabic_Name,
electricity_meter  = electricity_meter ,
Water_meter  = Water_meter ,
Building_NO = Building_NO , 
Construction_Area = Construction_Area ,
Maintenance_status = Maintenance_status ,
Building_Value = Building_Value ,
Construction_Completion_Date = Construction_Completion_Date ,
Building_Photo = Building_Photo ,
Building_Photo_Path = Building_Photo_Path ,
Entrance_Photo = Entrance_Photo ,
Entrance_Photo_Path = Entrance_Photo_Path ,
Statement = Statement ,
Statement_Path = Statement_Path ,
Building_Permit = Building_Permit ,
Building_Permit_Path = Building_Permit_Path ,
certificate_of_completion = certificate_of_completion ,
certificate_of_completion_Path = certificate_of_completion_Path ,
Image = Image ,
Image_Path = Image_Path ,
Map = Map ,
Map_path = Map_path ,
Plan = Plan ,
Plano_Path = Plano_Path 
Where Building_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Edit_B_Contract_Ownership_Unit_dropdownlist` (IN `Id` INT)  BEGIN
SELECT  B.*,
O.Owner_Ship_Id 
FROM building B
left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)

where Building_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Edit_Contract_Ownership_Unit_dropdownlist` (IN `Id` INT)  BEGIN
SELECT  U.*,
B.Building_Id ,
O.Owner_Ship_Id 


FROM units U

left join building B on (U.building_Building_Id = B.building_Id)
left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)

where Unit_ID = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Edit_Multi_Contract` (IN `users_user_ID` VARCHAR(200), IN `tenants_Tenants_ID` VARCHAR(200), IN `Com_rep` VARCHAR(200), IN `building_Building_Id` VARCHAR(200), IN `contract_type_Contract_Type_Id` VARCHAR(200), IN `contract_template_Contract_template_Id` VARCHAR(200), IN `payment_type_payment_type_Id` VARCHAR(200), IN `reason_for_rent_Reason_For_Rent_Id` VARCHAR(200), IN `Number_Of_Mounth` VARCHAR(200), IN `Number_Of_Years` VARCHAR(200), IN `Payment_Amount` VARCHAR(200), IN `Payment_Amount_L` VARCHAR(200), IN `maintenance` VARCHAR(200), IN `Rental_allowed_Or_Not_allowed` VARCHAR(200), IN `Paymen_Method` VARCHAR(200), IN `Real_Contract_FileName` VARCHAR(200), IN `Real_Contract_Path` VARCHAR(200), IN `Date_Of_Sgin` VARCHAR(200), IN `Start_Date` VARCHAR(200), IN `End_Date` VARCHAR(200), IN `Start_Free_Period` VARCHAR(200), IN `Duration_free_period` VARCHAR(200), IN `Contract_Details` VARCHAR(200), IN `ID` INT)  BEGIN
UPDATE building_contract SET 
users_user_ID = users_user_ID ,
tenants_Tenants_ID = tenants_Tenants_ID, 
Com_rep = Com_rep, 
building_Building_Id = building_Building_Id , 
contract_type_Contract_Type_Id = contract_type_Contract_Type_Id, 
contract_template_Contract_template_Id = contract_template_Contract_template_Id , 
payment_type_payment_type_Id = payment_type_payment_type_Id , 
reason_for_rent_Reason_For_Rent_Id = reason_for_rent_Reason_For_Rent_Id , 
Number_Of_Mounth = Number_Of_Mounth , 
Number_Of_Years = Number_Of_Years , 
Payment_Amount = Payment_Amount ,
Payment_Amount_L = Payment_Amount_L ,
maintenance = maintenance ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Paymen_Method = Paymen_Method ,
Real_Contract_FileName = Real_Contract_FileName ,
Real_Contract_Path = Real_Contract_Path ,
Date_Of_Sgin = Date_Of_Sgin  ,
Start_Date = Start_Date ,
End_Date = End_Date ,
Start_Free_Period = Start_Free_Period ,
Duration_free_period = Duration_free_period ,
maintenance = maintenance ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Contract_Details = Contract_Details 
WHERE Contract_Id = ID ;


UPDATE arcive_building_contract SET 
users_user_ID = users_user_ID ,
tenants_Tenants_ID = tenants_Tenants_ID, 
Com_rep = Com_rep, 
building_Building_Id = building_Building_Id , 
contract_type_Contract_Type_Id = contract_type_Contract_Type_Id, 
contract_template_Contract_template_Id = contract_template_Contract_template_Id , 
payment_type_payment_type_Id = payment_type_payment_type_Id , 
reason_for_rent_Reason_For_Rent_Id = reason_for_rent_Reason_For_Rent_Id , 
Number_Of_Mounth = Number_Of_Mounth , 
Number_Of_Years = Number_Of_Years , 
Payment_Amount = Payment_Amount ,
Payment_Amount_L = Payment_Amount_L ,
maintenance = maintenance ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Paymen_Method = Paymen_Method ,
Real_Contract_FileName = Real_Contract_FileName ,
Real_Contract_Path = Real_Contract_Path ,
Date_Of_Sgin = Date_Of_Sgin  ,
Start_Date = Start_Date ,
End_Date = End_Date ,
Start_Free_Period = Start_Free_Period ,
Duration_free_period = Duration_free_period ,
maintenance = maintenance ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Contract_Details = Contract_Details 
WHERE Contract_Id = ID ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Edit_OwnerShip` (IN `Owner_Ship_EN_Name` VARCHAR(200), IN `Owner_Ship_AR_Name` VARCHAR(200), IN `ownership_NO` VARCHAR(200), IN `Parcel_Area` VARCHAR(200), IN `Bond_NO` VARCHAR(200), IN `Bond_Date` VARCHAR(200), IN `Street_NO` VARCHAR(200), IN `Street_Name` VARCHAR(200), IN `Land_Value` VARCHAR(200), IN `Appreciation_octagon` VARCHAR(200), IN `PIN_Number` VARCHAR(200), IN `owner_ship_Code` VARCHAR(200), IN `Mab_Url` VARCHAR(200), IN `owner_Owner_Id` VARCHAR(200), IN `zone_zone_Id` VARCHAR(200), IN `owner_ship_Certificate_Image` VARCHAR(200), IN `owner_ship_Certificate_Image_Path` VARCHAR(200), IN `Property_Scheme_Image` VARCHAR(200), IN `Property_Scheme_Image_Path` VARCHAR(200), IN `ID` INT)  BEGIN
UPDATE owner_ship SET 
Owner_Ship_EN_Name=Owner_Ship_EN_Name , 
Owner_Ship_AR_Name=Owner_Ship_AR_Name , 
ownership_NO=ownership_NO,
Parcel_Area=Parcel_Area , 
Bond_NO=Bond_NO,
Bond_Date=Bond_Date,
Street_NO=Street_NO,
Street_Name=Street_Name,
Land_Value=Land_Value , 
Appreciation_octagon=Appreciation_octagon , 
PIN_Number=PIN_Number , 
owner_ship_Code=owner_ship_Code , 
Mab_Url=Mab_Url , 
owner_Owner_Id=owner_Owner_Id , 
zone_zone_Id=zone_zone_Id, 
owner_ship_Certificate_Image=owner_ship_Certificate_Image , 
owner_ship_Certificate_Image_Path=owner_ship_Certificate_Image_Path , 
Property_Scheme_Image=Property_Scheme_Image , 
Property_Scheme_Image_Path=Property_Scheme_Image_Path  
WHERE Owner_Ship_Id=ID;

UPDATE arcive_ownership SET 
Owner_Ship_EN_Name=Owner_Ship_EN_Name , 
Owner_Ship_AR_Name=Owner_Ship_AR_Name , 
ownership_NO=ownership_NO,
Parcel_Area=Parcel_Area , 
Bond_NO=Bond_NO,
Bond_Date=Bond_Date,
Street_NO=Street_NO,
Street_Name=Street_Name,
Land_Value=Land_Value , 
Appreciation_octagon=Appreciation_octagon , 
PIN_Number=PIN_Number , 
owner_ship_Code=owner_ship_Code , 
Mab_Url=Mab_Url , 
owner_Owner_Id=owner_Owner_Id , 
zone_zone_Id=zone_zone_Id, 
owner_ship_Certificate_Image=owner_ship_Certificate_Image , 
owner_ship_Certificate_Image_Path=owner_ship_Certificate_Image_Path , 
Property_Scheme_Image=Property_Scheme_Image , 
Property_Scheme_Image_Path=Property_Scheme_Image_Path  
WHERE Owner_Ship_Id=ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Edit_Single_Contract` (IN `users_user_ID` VARCHAR(200), IN `tenants_Tenants_ID` VARCHAR(200), IN `Com_rep` VARCHAR(200), IN `units_Unit_ID` VARCHAR(200), IN `contract_type_Contract_Type_Id` VARCHAR(200), IN `contract_template_Contract_template_Id` VARCHAR(200), IN `payment_type_payment_type_Id` VARCHAR(200), IN `reason_for_rent_Reason_For_Rent_Id` VARCHAR(200), IN `Number_Of_Mounth` VARCHAR(200), IN `Number_Of_Years` VARCHAR(200), IN `Payment_Amount` VARCHAR(200), IN `Payment_Amount_L` VARCHAR(200), IN `maintenance` VARCHAR(200), IN `Rental_allowed_Or_Not_allowed` VARCHAR(200), IN `Paymen_Method` VARCHAR(200), IN `Real_Contract_FileName` VARCHAR(200), IN `Real_Contract_Path` VARCHAR(200), IN `Date_Of_Sgin` VARCHAR(200), IN `Start_Date` VARCHAR(200), IN `End_Date` VARCHAR(200), IN `Start_Free_Period` VARCHAR(200), IN `Duration_free_period` VARCHAR(200), IN `Contract_Details` VARCHAR(200), IN `ID` INT)  BEGIN
UPDATE contract SET 
users_user_ID = users_user_ID ,
tenants_Tenants_ID = tenants_Tenants_ID, 
Com_rep = Com_rep, 
units_Unit_ID = units_Unit_ID , 
contract_type_Contract_Type_Id = contract_type_Contract_Type_Id, 
contract_template_Contract_template_Id = contract_template_Contract_template_Id , 
payment_type_payment_type_Id = payment_type_payment_type_Id , 
reason_for_rent_Reason_For_Rent_Id = reason_for_rent_Reason_For_Rent_Id , 
Number_Of_Mounth = Number_Of_Mounth , 
Number_Of_Years = Number_Of_Years , 
Payment_Amount = Payment_Amount ,
Payment_Amount_L = Payment_Amount_L ,
maintenance = maintenance ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Paymen_Method = Paymen_Method ,
Real_Contract_FileName = Real_Contract_FileName ,
Real_Contract_Path = Real_Contract_Path ,
Date_Of_Sgin = Date_Of_Sgin  ,
Start_Date = Start_Date ,
End_Date = End_Date ,
Start_Free_Period = Start_Free_Period ,
Duration_free_period = Duration_free_period ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Contract_Details = Contract_Details 
WHERE Contract_Id = ID ;


UPDATE arcive_contract SET 
users_user_ID = users_user_ID ,
tenants_Tenants_ID = tenants_Tenants_ID, 
Com_rep = Com_rep, 
units_Unit_ID = units_Unit_ID , 
contract_type_Contract_Type_Id = contract_type_Contract_Type_Id, 
contract_template_Contract_template_Id = contract_template_Contract_template_Id , 
payment_type_payment_type_Id = payment_type_payment_type_Id , 
reason_for_rent_Reason_For_Rent_Id = reason_for_rent_Reason_For_Rent_Id , 
Number_Of_Mounth = Number_Of_Mounth , 
Number_Of_Years = Number_Of_Years , 
Payment_Amount = Payment_Amount ,
Payment_Amount_L = Payment_Amount_L ,
maintenance = maintenance ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Paymen_Method = Paymen_Method ,
Real_Contract_FileName = Real_Contract_FileName ,
Real_Contract_Path = Real_Contract_Path ,
Date_Of_Sgin = Date_Of_Sgin  ,
Start_Date = Start_Date ,
End_Date = End_Date ,
Start_Free_Period = Start_Free_Period ,
Duration_free_period = Duration_free_period ,
Rental_allowed_Or_Not_allowed = Rental_allowed_Or_Not_allowed ,
Contract_Details = Contract_Details 
WHERE Contract_Id = ID ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Edit_Unit` (IN `Unit_Number` VARCHAR(200), IN `Floor_Number` VARCHAR(200), IN `Unit_Space` VARCHAR(200), IN `current_situation` VARCHAR(200), IN `Oreedo_Number` VARCHAR(200), IN `Electricityt_Number` VARCHAR(200), IN `Water_Number` VARCHAR(200), IN `virtual_Value` VARCHAR(200), IN `furniture_case_Furniture_case_Id` VARCHAR(200), IN `unit_condition_Unit_Condition_Id` VARCHAR(200), IN `unit_detail_Unit_Detail_Id` VARCHAR(200), IN `unit_type_Unit_Type_Id` VARCHAR(200), IN `building_Building_Id` VARCHAR(200), IN `Image_One` VARCHAR(200), IN `Image_One_Path` VARCHAR(200), IN `Image_Two` VARCHAR(200), IN `Image_Two_Path` VARCHAR(200), IN `Image_Three` VARCHAR(200), IN `Image_Three_Path` VARCHAR(200), IN `Image_Four` VARCHAR(200), IN `Image_Four_Path` VARCHAR(200), IN `ID` INT)  BEGIN
UPDATE units SET 
Unit_Number = Unit_Number , 
Floor_Number = Floor_Number , 
Unit_Space = Unit_Space ,
current_situation = current_situation , 
Oreedo_Number = Oreedo_Number , 
Electricityt_Number = Electricityt_Number , 
Water_Number = Water_Number , 
virtual_Value = virtual_Value , 
furniture_case_Furniture_case_Id  = furniture_case_Furniture_case_Id ,
unit_condition_Unit_Condition_Id = unit_condition_Unit_Condition_Id , 
unit_detail_Unit_Detail_Id = unit_detail_Unit_Detail_Id , 
unit_type_Unit_Type_Id = unit_type_Unit_Type_Id, 
building_Building_Id = building_Building_Id ,  
Image_One = Image_One , 
Image_One_Path = Image_One_Path ,  
Image_Two = Image_Two , 
Image_Two_Path = Image_Two_Path , 
Image_Three = Image_Three , 
Image_Three_Path = Image_Three_Path , 
Image_Four = Image_Four , 
Image_Four_Path = Image_Four_Path  
WHERE Unit_ID = ID ;

UPDATE arcive_units SET 
Unit_Number = Unit_Number , 
Floor_Number = Floor_Number , 
Unit_Space = Unit_Space ,
current_situation = current_situation , 
Oreedo_Number = Oreedo_Number , 
Electricityt_Number = Electricityt_Number , 
Water_Number = Water_Number , 
virtual_Value = virtual_Value , 
furniture_case_Furniture_case_Id  = furniture_case_Furniture_case_Id ,
unit_condition_Unit_Condition_Id = unit_condition_Unit_Condition_Id , 
unit_detail_Unit_Detail_Id = unit_detail_Unit_Detail_Id , 
unit_type_Unit_Type_Id = unit_type_Unit_Type_Id, 
building_Building_Id = building_Building_Id ,  
Image_One = Image_One , 
Image_One_Path = Image_One_Path ,  
Image_Two = Image_Two , 
Image_Two_Path = Image_Two_Path , 
Image_Three = Image_Three , 
Image_Three_Path = Image_Three_Path , 
Image_Four = Image_Four , 
Image_Four_Path = Image_Four_Path  
WHERE Unit_ID = ID ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Employee_GridView` ()  BEGIN
SELECT 
E.* , ED.*  ,  EL.* 
FROM employee E
left join department ED on (E.department_Department_Id = ED.Department_Id)
left join employee_level EL on (E.employee_level_Employee_Level_Id = EL.Employee_Level_Id);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Evaluation_Chart` ()  BEGIN
 select 
( select Count(a.Persenteg) from 
 
( SELECT T.* ,  
(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points ,  
(SELECT IF(Points !=0, Points, 0))R_Points ,  
(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg  
FROM  tenants T) a

where a.Persenteg BETWEEN 80 and 100) A ,


( select Count(a.Persenteg) from 
 
( SELECT T.* ,  
(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points ,  
(SELECT IF(Points !=0, Points, 0))R_Points ,  
(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg  
FROM  tenants T) a

where a.Persenteg BETWEEN 60 and 79) B ,

( select Count(a.Persenteg) from 
 
( SELECT T.* ,  
(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points ,  
(SELECT IF(Points !=0, Points, 0))R_Points ,  
(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg  
FROM  tenants T) a

where a.Persenteg BETWEEN 40 and 59) C ,


( select Count(a.Persenteg) from 
 
( SELECT T.* ,  
(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points ,  
(SELECT IF(Points !=0, Points, 0))R_Points ,  
(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg  
FROM  tenants T) a

where a.Persenteg BETWEEN 20 and 39) D ,

( select Count(a.Persenteg) from 
 
( SELECT T.* ,  
(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points ,  
(SELECT IF(Points !=0, Points, 0))R_Points ,  
(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg  
FROM  tenants T) a

where a.Persenteg BETWEEN 0 and 19) E,

(SELECT IF(((A/(select count(*) from tenants))*100)!= 0 , ((A/(select count(*) from tenants))*100), 0)) R_A ,
(SELECT IF(((B/(select count(*) from tenants))*100)!= 0 , ((B/(select count(*) from tenants))*100), 0)) R_B ,
(SELECT IF(((C/(select count(*) from tenants))*100)!= 0 , ((C/(select count(*) from tenants))*100), 0)) R_C ,
(SELECT IF(((D/(select count(*) from tenants))*100)!= 0 , ((D/(select count(*) from tenants))*100), 0)) R_D ,
(SELECT IF(((E/(select count(*) from tenants))*100)!= 0 , ((E/(select count(*) from tenants))*100), 0)) R_E ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Maintenance_List` (IN `Id` INT)  BEGIN
SELECT 
M.*,
U.Unit_Number ,B.Building_Arabic_Name ,O.Owner_Ship_AR_Name , 
CONCAT (Users_Ar_First_Name ,' ' ,Users_Ar_Last_Name) as User_Name,
MT.Maintenance_Arabic_Type , 
A.Assets_Arabic_Name

FROM amlak_realestate.maintenance M
left join amlak_realestate.users USR on (M.users_user_ID = USR.user_ID )

left join amlak_realestate.units U on (M.units_Unit_ID = U.Unit_ID)
left join amlak_realestate.building B on (U.building_Building_Id = B.building_Id)
left join amlak_realestate.owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)

left join amlak_realestate.maintenance_type MT on (M.maintenance_type_Maintenance_Type_Id = MT.Maintenance_Type_Id )
left join amlak_realestate.assets A on (M.assets_Assets_Id = A.Assets_Id )
where M.units_Unit_ID = ID; 
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Maintenance_O_B_U` (IN `Id` INT)  BEGIN
SELECT U.* ,  O.Owner_Ship_AR_Name   , B.Building_Arabic_Name 
FROM amlak_realestate.units U

left join amlak_realestate.building B on (U.building_Building_Id = B.building_Id)
left join amlak_realestate.owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)

where Unit_ID = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `maintenance_request_Details` (IN `Id` INT)  BEGIN
SELECT 
MR.* ,
MG.Categoty_AR,
(E.Employee_Arabic_name)T_echnical, (E.Employee_English_name)EN_T_echnical,
(EM.Employee_Arabic_name)W_atcher,  (EM.Employee_English_name)EN_W_atcher,

A.Contractor_Waranty_Period,
A.Purchase_Date,
A.Waranty_Period,
A.Waranty_End_Date,
A.Waranty_Start_Date,
A.Assets_Arabic_Name , A.Assets_English_Name

FROM maintenance_request MR
left join maintenance_categoty MG on (MR.maintenance_categoty_Categoty_Id = MG.Categoty_Id)
left join employee E on (MR.Technical = E.Employee_Id)
left join employee EM on (MR.Watcher = EM.Employee_Id)
left join assets A on (MR.assets_Assets_Id = A.Assets_Id)
where Maintenance_Request_ID = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `maintenance_request_List` (IN `Id` INT)  BEGIN
SELECT 
MR.* ,
MG.Categoty_AR , MG.Categoty_EN ,
(E.Employee_Arabic_name)T_echnical , (E.Employee_English_name)EN_T_echnical ,
(EM.Employee_Arabic_name)W_atcher , (EM.Employee_English_name)EN_W_atcher ,
A.Assets_Arabic_Name , A.Assets_English_Name

FROM maintenance_request MR
left join maintenance_categoty MG on (MR.maintenance_categoty_Categoty_Id = MG.Categoty_Id)
left join employee E on (MR.Technical = E.Employee_Id)
left join employee EM on (MR.Watcher = EM.Employee_Id)
left join assets A on (MR.assets_Assets_Id = A.Assets_Id)
where complaint_report_request_Complaint_Report_Request_Id = ID;

END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `maintenance_request_site` (IN `Id` INT)  BEGIN
SELECT 
 C.tenants_Tenants_ID , C.units_Unit_ID,
U.Unit_Number ,B.Building_Arabic_Name , B.Building_English_Name , B.Building_Id


FROM contract C

left join units U on (C.units_Unit_ID = U.Unit_ID)
left join building B on (U.building_Building_Id = B.building_Id)

where tenants_Tenants_ID = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Maintenance_SubTypes_List` ()  BEGIN
select MC.* 
from amlak_realestate.maintenance_categoty MC 
where Main_Categoty !=0;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `M_OwnerShip` ()  BEGIN
select  M.*, O.Owner_Ship_AR_Name , M.*, O.Owner_Ship_EN_Name  , B.* , 
IF((Mortgage_Value - (TIMESTAMPDIFF(MONTH, Start_Date , Now()) *  Installment_Value )) > 0,
 (Mortgage_Value - (TIMESTAMPDIFF(MONTH, Start_Date , Now()) *  Installment_Value )), "0") Remaining_Amount,
(TIMESTAMPDIFF(MONTH, Start_Date , Now()) *  Installment_Value )Amount_Paid,
IF((Mortgage_Value - (TIMESTAMPDIFF(MONTH, Start_Date , Now()) *  Installment_Value )/Installment_Value)>0, 
cast(((Mortgage_Value - (TIMESTAMPDIFF(MONTH, Start_Date , Now()) *  Installment_Value ))/Installment_Value) as decimal(10,0)), "0")Remaining_Installments
from mortgaged_wonership M
left join owner_ship O on (M.Ownership_Id = O.Owner_Ship_Id)
left join bank B on (M.Bank_Id = B.Bank_Id);
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `New_OWnership_Excel_report` ()  select Z.zone_number ,  Z.zone_arabic_name , Z.zone_English_name , onr.Owner_Arabic_name , onr.Owner_English_name ,
 O.* ,  
(Select count(*) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Active ='1'  )buildingCount, 
(Select CAST( CONCAT 
( 
'شقة : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')),  
 '  /  ',  
'مكتب : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )), 
'  /  ',  
'محل : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' ))  
)as char) 
 from  units LIMIT 1 )Unit_Type  , 
 
 (Select CAST( CONCAT 
( 
'Apartment :', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')),  
 '  /  ',  
'Office : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )), 
'  /  ',  
'Stor : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' ))  
)as char) 
 from  units LIMIT 1 )EN_Unit_Type  ,
 
(SELECT IF((Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) != 0, (Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_U , 
(SELECT IF((Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) != 0, (Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_B ,

  
(Select Sum(virtual_Value) from units  where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) Dakhel_Shahry_Ifterady , 
(SELECT IF((select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) !=0, (select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id), 0)) Kemet_Mabany,
(select Sum(Collection) from collection_table where Ownersip_Id = O.Owner_Ship_Id) Muhasal_Sanawy ,
(select (Dakhel_Shahry_Ifterady *12)/Kemet_Mabany) AedIftirady_ON_Kemet_Mabany ,
(select (Ejar_Taakudy_U  + Ejar_Taakudy_B)/12) Ejar_Shary_taakudy ,
(select (Ejar_Shary_taakudy - Dakhel_Shahry_Ifterady )*12) Farek_Sanawy ,
( select  Kemet_Mabany + O.Land_Value) Kema_Kulia ,
( select  (Ejar_Shary_taakudy *12) / (Kema_Kulia)) Aed_ON_KemtAkar ,
( select  (Muhasal_Sanawy - Dakhel_Shahry_Ifterady) * 12) Farek_Tahseel ,

( select  (Kemet_Mabany / Muhasal_Sanawy) ) Esterdad ,

(SELECT IF(Dakhel_Shahry_Ifterady != 0 , Dakhel_Shahry_Ifterady, 0)) Onee , 
(SELECT IF(Kemet_Mabany != 0 , Kemet_Mabany, 0)) Two , 
(SELECT IF(Muhasal_Sanawy != 0 , Muhasal_Sanawy, 0)) Three , 
(SELECT IF(AedIftirady_ON_Kemet_Mabany != 0 , AedIftirady_ON_Kemet_Mabany, 0)) Four , 
(SELECT IF(Ejar_Shary_taakudy != 0 , Ejar_Shary_taakudy, 0)) Five  ,
(SELECT IF(Farek_Sanawy != 0 , Farek_Sanawy, 0)) Six ,
(SELECT IF(Kema_Kulia != 0 , Kema_Kulia, 0)) Seven ,
(SELECT IF(Aed_ON_KemtAkar != 0 , Aed_ON_KemtAkar, 0)) Eghit ,
(SELECT IF(Farek_Tahseel != 0 , Farek_Tahseel, 0)) Nine ,
(SELECT IF(Esterdad != 0 , Esterdad, 0)) Ten ,


M.* , Bnk.Bank_Arabic_Name , Bnk.Bank_English_Name ,
(TIMESTAMPDIFF(MONTH, M.Start_Date , Now()) *  M.Installment_Value )Amount_Paid , 
(select IF((Mortgage_Value - (TIMESTAMPDIFF(MONTH, M.Start_Date , Now()) *  M.Installment_Value )) != 0,
 (M.Mortgage_Value - (TIMESTAMPDIFF(MONTH, M.Start_Date , Now()) *  M.Installment_Value )), 0)) Remaining_Amount ,
 
 (SELECT IF((Remaining_Amount/Installment_Value) != 0 , (Remaining_Amount/Installment_Value), 0)) Remaining_Time ,
 ( SELECT Statment_Path from ownership_statment where  Statment_Id = (SELECT MAX(Statment_Id) AS LastInsertedID from ownership_statment where Ownership_Id = O.Owner_Ship_Id ))Statment_Id ,

(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '1'))Muajar ,
(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '2'))Shager ,
(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '3'))Inshaa , 
(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '4'))Nizza ,

(SELECT IF(Muajar!=0 , Muajar, 0)) R_Muajar,
(SELECT IF(Shager!=0, Shager, 0)) R_Shager,
(SELECT IF(Inshaa!=0, Inshaa, 0)) R_Inshaa ,
(SELECT IF(Nizza!=0, Nizza, 0)) R_Inshaa 

from owner_ship O 
left join  owner onr on (O.owner_Owner_Id = onr.owner_Id) 
left join  zone Z on (O.zone_zone_Id = Z.zone_Id)  

left join  mortgaged_wonership M on (M.Ownership_Id = O.Owner_Ship_Id) 
left join  bank Bnk on (Bnk.Bank_Id = M.Bank_Id)

ORDER BY O.zone_zone_Id$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `new_procedure` (IN `Id` INT)  BEGIN
SELECT  B.Building_Arabic_Name   , Z.zone_arabic_name , S.Street_arabic_name , onr.Owner_English_name ,
OS.ownership_english_status

FROM amlak_realestate.building B
left join amlak_realestate.owner_ship O on (B.owner_ship_Owner_Ship_Id = O.owner_Ship_Id)
left join amlak_realestate.zone Z on (O.zone_zone_Id = Z.zone_Id) 
left join amlak_realestate.Street S on (O.Street_Street_Id = S.Street_Id) 

left join amlak_realestate.Owner onr on (O.owner_Owner_Id = onr.Owner_Id)

left join amlak_realestate.ownership_status OS on (O.ownership_status_ownership_status_id = OS.ownership_status_id)
where Building_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Onership_Excel_report` (IN `Id` INT)  BEGIN
select Z.zone_number ,  Z.zone_arabic_name , onr.Owner_Arabic_name , 
 O.* ,  
(Select count(*) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Active ='1'  )buildingCount, 
(Select CAST( CONCAT 
( 
'شقة : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')),  
 '  /  ',  
'مكتب : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )), 
'  /  ',  
'محل : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' ))  
)as char) 
 from  units LIMIT 1 )Unit_Type  , 
 
(SELECT IF((Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) != 0, (Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_U , 
(SELECT IF((Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) != 0, (Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_B ,

  
(Select Sum(virtual_Value) from units  where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) Dakhel_Shahry_Ifterady , 
(SELECT IF((select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) !=0, (select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id), 0)) Kemet_Mabany,
(select Sum(Collection) from collection_table where Ownersip_Id = O.Owner_Ship_Id) Muhasal_Sanawy ,
(select (Dakhel_Shahry_Ifterady *12)/Kemet_Mabany) AedIftirady_ON_Kemet_Mabany ,
(select (Ejar_Taakudy_U  + Ejar_Taakudy_B)/12) Ejar_Shary_taakudy ,
(select (Ejar_Shary_taakudy - Dakhel_Shahry_Ifterady )*12) Farek_Sanawy ,
( select  Kemet_Mabany + O.Land_Value) Kema_Kulia ,
( select  (Ejar_Shary_taakudy *12) / (Kema_Kulia)) Aed_ON_KemtAkar ,
( select  (Muhasal_Sanawy - Dakhel_Shahry_Ifterady) * 12) Farek_Tahseel ,

( select  (Kemet_Mabany / Muhasal_Sanawy) ) Esterdad ,

(SELECT IF(Dakhel_Shahry_Ifterady != 0 , Dakhel_Shahry_Ifterady, 0)) Onee , 
(SELECT IF(Kemet_Mabany != 0 , Kemet_Mabany, 0)) Two , 
(SELECT IF(Muhasal_Sanawy != 0 , Muhasal_Sanawy, 0)) Three , 
(SELECT IF(AedIftirady_ON_Kemet_Mabany != 0 , AedIftirady_ON_Kemet_Mabany, 0)) Four , 
(SELECT IF(Ejar_Shary_taakudy != 0 , Ejar_Shary_taakudy, 0)) Five  ,
(SELECT IF(Farek_Sanawy != 0 , Farek_Sanawy, 0)) Six ,
(SELECT IF(Kema_Kulia != 0 , Kema_Kulia, 0)) Seven ,
(SELECT IF(Aed_ON_KemtAkar != 0 , Aed_ON_KemtAkar, 0)) Eghit ,
(SELECT IF(Farek_Tahseel != 0 , Farek_Tahseel, 0)) Nine ,
(SELECT IF(Esterdad != 0 , Esterdad, 0)) Ten ,




M.* , Bnk.Bank_Arabic_Name ,
(TIMESTAMPDIFF(MONTH, M.Start_Date , Now()) *  M.Installment_Value )Amount_Paid , 
(select IF((Mortgage_Value - (TIMESTAMPDIFF(MONTH, M.Start_Date , Now()) *  M.Installment_Value )) > 0,
 (M.Mortgage_Value - (TIMESTAMPDIFF(MONTH, M.Start_Date , Now()) *  M.Installment_Value )), "0")) Remaining_Amount ,
 
 (SELECT IF((Remaining_Amount/Installment_Value) != 0 , (Remaining_Amount/Installment_Value), 0)) Remaining_Time ,
 ( SELECT Statment_Path from ownership_statment where  Statment_Id = (SELECT MAX(Statment_Id) AS LastInsertedID from ownership_statment where Ownership_Id = O.Owner_Ship_Id ))Statment_Id ,

(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '1'))Muajar ,
(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '2'))Shager ,
(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '3'))Inshaa , 
(Select count(*) from units join  unit_condition uc on uc.Unit_Condition_Id = units.unit_condition_Unit_Condition_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and   owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_Condition_Id = '4'))Nizza ,



(SELECT IF(Muajar != 0 , Muajar , 0)) R_Muajar  , 
(SELECT IF(Shager != 0 , Shager , 0)) R_Shager , 
(SELECT IF(Inshaa != 0 , Inshaa , 0)) R_Inshaa , 
(SELECT IF(Nizza != 0 , Nizza , 0)) R_Nizza 




from owner_ship O 
left join  owner onr on (O.owner_Owner_Id = onr.owner_Id) 
left join  zone Z on (O.zone_zone_Id = Z.zone_Id)  

left join  mortgaged_wonership M on (M.Ownership_Id = O.Owner_Ship_Id) 
left join  bank Bnk on (Bnk.Bank_Id = M.Bank_Id) 



Where O.Owner_Ship_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Ownership_Details` (IN `Id` INT)  BEGIN
SELECT 
 O.* ,
onr.Owner_Arabic_name  , 
Z.* ,
( SELECT Statment_Path from ownership_statment where  Statment_Id = (SELECT MAX(Statment_Id) AS LastInsertedID from ownership_statment where Ownership_Id = O.Owner_Ship_Id ))Statment_Id




FROM owner_ship O

left join owner onr on (O.owner_Owner_Id = onr.owner_Id)
left join zone Z on (O.zone_zone_Id = Z.zone_Id)




where Owner_Ship_Id = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `OwnerShip_Test_4` (IN `OS_N` VARCHAR(200), IN `OS_Code` VARCHAR(200), IN `Z_N` VARCHAR(200))  BEGIN
select Z.zone_number ,  Z.zone_arabic_name , onr.Owner_Arabic_name , 
 O.* ,  
(Select count(*) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Active ='1'  )buildingCount, 
(Select CAST( CONCAT 
( 
'شقة : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1'  and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and  Unit_English_Type = 'apartment')),  
 '  /  ',  
'مكتب : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'Office' )), 
'  /  ',  
'محل : ', (Select count(*) from units join  unit_type ut on ut.Unit_Type_Id = units.unit_type_Unit_Type_Id where Half ='0' and building_Building_Id in (Select Building_Id from  building where Active ='1'  and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id and Unit_English_Type = 'store' ))  
)as char) 
 from  units LIMIT 1 )Unit_Type  , 
 
(SELECT IF((Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) != 0, (Select Sum(Payment_Amount) from contract  join units U on U.Unit_ID = contract.units_Unit_ID where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_U , 
(SELECT IF((Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) != 0, (Select Sum(Payment_Amount) from building_contract  join building B on B.Building_Id = building_contract.building_Building_Id where  building_Building_Id in (Select Building_Id from  building where Active ='1' and owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )), 0)) Ejar_Taakudy_B ,

  
(Select Sum(virtual_Value) from units  where Half ='0' and building_Building_Id in ( Select Building_Id from  building where Active ='1' and  owner_ship_Owner_Ship_Id = O.Owner_Ship_Id )) Dakhel_Shahry_Ifterady , 
(SELECT IF((select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) !=0, (select Sum(Building_Value) from building where owner_ship_Owner_Ship_Id = O.Owner_Ship_Id), 0)) Kemet_Mabany,
(select Sum(Collection) from collection_table where Ownersip_Id = O.Owner_Ship_Id) Muhasal_Sanawy ,
(select (Dakhel_Shahry_Ifterady *12)/Kemet_Mabany) AedIftirady_ON_Kemet_Mabany ,
(select (Ejar_Taakudy_U  + Ejar_Taakudy_B)/12) Ejar_Shary_taakudy ,
(select (Ejar_Shary_taakudy - Dakhel_Shahry_Ifterady )*12) Farek_Sanawy ,
( select  Kemet_Mabany + O.Land_Value) Kema_Kulia ,
( select  (Ejar_Shary_taakudy *12) / (Kema_Kulia)) Aed_ON_KemtAkar ,
( select  (Muhasal_Sanawy - Dakhel_Shahry_Ifterady) * 12) Farek_Tahseel ,

(SELECT IF(Dakhel_Shahry_Ifterady != 0 , Dakhel_Shahry_Ifterady, 0)) Onee , 
(SELECT IF(Kemet_Mabany != 0 , Kemet_Mabany, 0)) Two , 
(SELECT IF(Muhasal_Sanawy != 0 , Muhasal_Sanawy, 0)) Three , 
(SELECT IF(AedIftirady_ON_Kemet_Mabany != 0 , AedIftirady_ON_Kemet_Mabany, 0)) Four , 
(SELECT IF(Ejar_Shary_taakudy != 0 , Ejar_Shary_taakudy, 0)) Five  ,
(SELECT IF(Farek_Sanawy != 0 , Farek_Sanawy, 0)) Six ,
(SELECT IF(Kema_Kulia != 0 , Kema_Kulia, 0)) Seven ,
(SELECT IF(Aed_ON_KemtAkar != 0 , Aed_ON_KemtAkar, 0)) Eghit ,
(SELECT IF(Farek_Tahseel != 0 , Farek_Tahseel, 0)) Nine


from owner_ship O 
left join  owner onr on (O.owner_Owner_Id = onr.owner_Id) 
left join  zone Z on (O.zone_zone_Id = Z.zone_Id)  
Where   
O.Owner_Ship_AR_Name like CONCAT('%', OS_N, '%') 
or O.owner_ship_Code like CONCAT('%', OS_Code, '%')
or Z.zone_arabic_name like CONCAT('%', Z_N, '%');
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Periodec_Maintenance` (IN `Id` INT, `O_Id` NCHAR(200), `B_Id` NCHAR(200))  BEGIN
SELECT PM.*,
A.Assets_Arabic_Name ,
O.Owner_Ship_AR_Name,
B.Building_Arabic_Name ,
U.Unit_Number,
(Em1.Employee_Arabic_name)Em1 , 
(Em2.Employee_Arabic_name)Em2 ,
(Em3.Employee_Arabic_name)Em3,
(Em4.Employee_Arabic_name)Em4,
(Em5.Employee_Arabic_name)Em5 , 
(Em6.Employee_Arabic_name)Em6 ,
(Em7.Employee_Arabic_name)Em7,
(Em8.Employee_Arabic_name)Em8,
(Em9.Employee_Arabic_name)Em9 , 
(Em10.Employee_Arabic_name)Em10 ,
(Em11.Employee_Arabic_name)Em11,
(Em12.Employee_Arabic_name)Em12



FROM periodic_maintenence PM

left join amlak_realestate.assets A on (PM.Asset_ID = A.Assets_Id)
left join amlak_realestate.owner_ship O on (A.OwnerShip_Id = O.Owner_Ship_Id)
left join amlak_realestate.building B on (A.Building_ID = B.Building_Id)
left join amlak_realestate.units U on (A.Unit_Id = U.Unit_ID)

left join amlak_realestate.employee EM1 on (PM.E_M_1 = EM1.Employee_Id)
left join amlak_realestate.employee EM2 on (PM.E_M_2 = EM2.Employee_Id)
left join amlak_realestate.employee EM3 on (PM.E_M_3 = EM3.Employee_Id)
left join amlak_realestate.employee EM4 on (PM.E_M_4 = EM4.Employee_Id)
left join amlak_realestate.employee EM5 on (PM.E_M_5 = EM5.Employee_Id)
left join amlak_realestate.employee EM6 on (PM.E_M_6 = EM6.Employee_Id)
left join amlak_realestate.employee EM7 on (PM.E_M_7 = EM7.Employee_Id)
left join amlak_realestate.employee EM8 on (PM.E_M_8 = EM8.Employee_Id)
left join amlak_realestate.employee EM9 on (PM.E_M_9 = EM9.Employee_Id)
left join amlak_realestate.employee EM10 on (PM.E_M_10 = EM10.Employee_Id)
left join amlak_realestate.employee EM11 on (PM.E_M_11 = EM11.Employee_Id)
left join amlak_realestate.employee EM12 on (PM.E_M_12 = EM12.Employee_Id)

where Year = ID and (Owner_Ship_AR_Name like CONCAT('%', O_Id, '%') or Building_Arabic_Name like CONCAT('%', B_Id, '%'));


END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Periodec_Maintenance_New` ()  BEGIN
select
 A.* ,
AL.Asset_Arabic_Location, AL.Asset_English_Location,
AC.Asset_Arabic_Condition, AC.Asset_English_Condition,
V.Vendor_Arabic_Type, V.Vendor_English_Type,
MC.Categoty_AR, MC.Categoty_EN,  MC.Categoty_Id ,
E.Employee_Arabic_name, E.Employee_English_name,
I.Inventory_arabic_name, I.Inventory_English_name,
O.Owner_Ship_AR_Name, O.Owner_Ship_EN_Name,
B.Building_Arabic_Name, B.Building_English_Name,
U.Unit_Number

FROM assets A

left join asset_location AL on (A.asset_location_Asset_Location_Id = AL.Asset_Location_Id)
left join asset_condition AC on (A.asset_condition_Asset_Condition_Id = AC.Asset_Condition_Id)
left join vendor_typ V on (A.vendor_type_Vendor_Type_Id = V.Vendor_Type_Id)
left join maintenance_categoty MC on (A.maintenance_categoty_Categoty_Id = MC.Categoty_Id)
left join employee E on (A.Buyer = E.Employee_Id)
left join inventory I on (A.Inventory_Id = I.Inventory_Id)
left join owner_ship O on (A.OwnerShip_Id = O.Owner_Ship_Id)
left join building B on (A.Building_ID = B.Building_Id)
left join units U on (A.Unit_Id = U.Unit_ID)
where MC.Categoty_Id = 13 or MC.Categoty_Id = 15 or MC.Categoty_Id = 36 ;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Tenant_Details` (IN `Id` INT)  BEGIN
Select T.*,
TY.* , Crep.* ,
N.*
 
FROM tenants T
left join tenant_type TY on (T.tenant_type_Tenant_Type_Id = TY.Tenant_Type_Id)
left join nationality N on (T.nationality_nationality_ID = N.nationality_ID)
left join company_representative Crep on (Crep.tenants_Tenants_ID = T.Tenants_ID)
where Tenants_ID = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Unit_Details` (IN `Id` INT)  BEGIN
SELECT 
U.*, 


UT.Unit_Arabic_Type  , 
UC.Unit_Arabic_Condition ,
UD.Unit_Arabic_Detail , 
B.Building_Arabic_Name ,
FC.Furniture_Ar_case


FROM amlak_realestate.units U

left join amlak_realestate.unit_type UT on (U.unit_type_Unit_Type_Id = UT.Unit_Type_Id)
left join amlak_realestate.unit_condition UC on (U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id)
left join amlak_realestate.unit_detail UD on (U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)
left join amlak_realestate.building B on (U.building_Building_Id = B.Building_Id)
left join amlak_realestate.furniture_case FC on (U.furniture_case_Furniture_case_Id = FC.Furniture_case_Id)

where Unit_ID = ID;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Unit_List` ()  BEGIN
SELECT 
U.* , 

U.Image_One_Path , 
U.Image_Two_Path , 
U.Image_Three_Path ,
U.Image_Four_Path ,  


UT.*  , 
UC.* ,
UD.* , 
B.Building_Arabic_Name , B.Building_English_Name , B.Building_NO ,
O.Owner_Ship_AR_Name, O.Owner_Ship_EN_Name,
O.Street_NO,
O.Street_Name , 
O.owner_ship_Code


FROM units U

left join unit_type UT on (U.unit_type_Unit_Type_Id = UT.Unit_Type_Id)
left join unit_condition UC on (U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id)
left join unit_detail UD on (U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)
left join building B on (U.building_Building_Id = B.Building_Id)
left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)
where U.Half = '0'
order by O.owner_ship_Code ASC;
END$$

CREATE DEFINER=`amlakdevuser`@`%` PROCEDURE `Unit_List_In_Building_Details` (IN `Id` INT)  BEGIN
SELECT 
U.* ,
UT.*  , 
UC.* ,
UD.* , 
B.Building_Arabic_Name ,
B.Building_NO , 

 

(Select Sum(Collection) from collection_table where Unit_Id = U.Unit_ID ) Muhasal_Fuly ,


(SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
(Select Sum(Collection) from collection_table where Unit_Id = U.Unit_ID ),
 (Select Sum(Collection) from collection_table where Building_Id = U.building_Building_Id )/  (SELECT COUNT(`Unit_ID`) from units WHERE `building_Building_Id` = U.building_Building_Id)))Muhasal_Fuly ,



(SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
((select Payment_Amount from contract where units_Unit_ID = U.Unit_ID AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE())  GROUP BY units_Unit_ID)/  (SELECT COUNT(`Unit_ID`) from units WHERE `building_Building_Id` = U.building_Building_Id)   ),
((Select  Payment_Amount from building_contract BC where building_Building_Id = U.building_Building_Id AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE()) GROUP BY building_Building_Id)/(SELECT COUNT(`Unit_ID`) from units WHERE `building_Building_Id` = U.building_Building_Id))))Payment_Amount ,
 
 (SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
(select tenants_Tenants_ID from contract where units_Unit_ID = U.Unit_ID AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE())  GROUP BY units_Unit_ID),
 (Select  tenants_Tenants_ID from building_contract BC where building_Building_Id = U.building_Building_Id AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE()) GROUP BY building_Building_Id)))tenants_Tenants_ID ,
 
 (SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
(select Paymen_Method from contract where units_Unit_ID = U.Unit_ID AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE())  GROUP BY units_Unit_ID),
 (Select  Paymen_Method from building_contract BC where building_Building_Id = U.building_Building_Id AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE()) GROUP BY building_Building_Id)))Paymen_Method ,
 
 (SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
(select Start_Date from contract where units_Unit_ID = U.Unit_ID AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE())  GROUP BY units_Unit_ID),
 (Select  Start_Date from building_contract BC where building_Building_Id = U.building_Building_Id AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE()) GROUP BY building_Building_Id)))Start_Date , 
 
 (SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
(select End_Date from contract where units_Unit_ID = U.Unit_ID AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE())  GROUP BY units_Unit_ID),
 (Select  End_Date from building_contract BC where building_Building_Id = U.building_Building_Id AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE()) GROUP BY building_Building_Id)))End_Date , 
 
 (SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
(select Contract_Id from contract where units_Unit_ID = U.Unit_ID AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE())  GROUP BY units_Unit_ID),
 (Select  Contract_Id from building_contract BC where building_Building_Id = U.building_Building_Id AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE()) GROUP BY building_Building_Id)))Contract_Id , 
 
  (SELECT Tenants_Arabic_Name from tenants WHERE Tenants_ID = tenants_Tenants_ID) Tenants_Arabic_Name,
 (SELECT Tenants_English_Name from tenants WHERE Tenants_ID = tenants_Tenants_ID) Tenants_English_Name,
 
 (select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  tenants_Tenants_ID )Points ,
(SELECT IF(Points !=0, Points, 0))R_Points ,
(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg ,

(SELECT IF(Persenteg >0, Persenteg , 0)) R_Persenteg ,

((SELECT IF((select count(units_Unit_ID) from contract where units_Unit_ID = U.Unit_ID) > 0,  
((select Payment_Amount from contract where units_Unit_ID = U.Unit_ID AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE())  GROUP BY units_Unit_ID)/  (SELECT COUNT(`Unit_ID`) from units WHERE `building_Building_Id` = U.building_Building_Id)   ),
((Select  Payment_Amount from building_contract BC where building_Building_Id = U.building_Building_Id AND SUBSTRING(End_Date,7,4)>= YEAR(CURDATE()) GROUP BY building_Building_Id)/(SELECT COUNT(`Unit_ID`) from units WHERE `building_Building_Id` = U.building_Building_Id)))) * 12) Muhasal_Muftarad



FROM  units U

left join  unit_type UT on (U.unit_type_Unit_Type_Id = UT.Unit_Type_Id)
left join  unit_condition UC on (U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id)
left join  unit_detail UD on (U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id)
left join  building B on (U.building_Building_Id = B.Building_Id)


where U.building_Building_Id = ID and  U.Half = '0';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `arcive_building`
--

CREATE TABLE `arcive_building` (
  `Building_Id` int(11) NOT NULL,
  `Half_Building_ID` varchar(50) DEFAULT NULL,
  `owner_ship_Owner_Ship_Id` int(11) NOT NULL,
  `building_condition_Building_Condition_Id` int(11) NOT NULL,
  `building_type_Building_Type_Id` int(11) NOT NULL,
  `Building_English_Name` varchar(200) NOT NULL,
  `Building_Arabic_Name` varchar(200) NOT NULL,
  `electricity_meter` varchar(200) DEFAULT NULL,
  `Water_meter` varchar(200) DEFAULT NULL,
  `Building_NO` varchar(200) DEFAULT NULL,
  `Construction_Area` varchar(200) DEFAULT NULL,
  `Maintenance_status` varchar(200) DEFAULT NULL,
  `Building_Value` varchar(200) DEFAULT NULL,
  `Construction_Completion_Date` varchar(200) DEFAULT NULL,
  `Building_Photo` varchar(200) DEFAULT NULL,
  `Building_Photo_Path` varchar(200) DEFAULT NULL,
  `Entrance_Photo` varchar(200) DEFAULT NULL,
  `Entrance_Photo_Path` varchar(200) DEFAULT NULL,
  `Statement` varchar(200) DEFAULT NULL,
  `Statement_Path` varchar(200) DEFAULT NULL,
  `Building_Permit` varchar(200) DEFAULT NULL,
  `Building_Permit_Path` varchar(200) DEFAULT NULL,
  `certificate_of_completion` varchar(200) DEFAULT NULL,
  `certificate_of_completion_Path` varchar(200) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `Image_Path` varchar(200) DEFAULT NULL,
  `Map` varchar(200) DEFAULT NULL,
  `Map_path` varchar(200) DEFAULT NULL,
  `Plan` varchar(200) DEFAULT NULL,
  `Plano_Path` varchar(200) DEFAULT NULL,
  `Active` varchar(45) DEFAULT NULL,
  `IsRealEsataeInvesment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arcive_building`
--

INSERT INTO `arcive_building` (`Building_Id`, `Half_Building_ID`, `owner_ship_Owner_Ship_Id`, `building_condition_Building_Condition_Id`, `building_type_Building_Type_Id`, `Building_English_Name`, `Building_Arabic_Name`, `electricity_meter`, `Water_meter`, `Building_NO`, `Construction_Area`, `Maintenance_status`, `Building_Value`, `Construction_Completion_Date`, `Building_Photo`, `Building_Photo_Path`, `Entrance_Photo`, `Entrance_Photo_Path`, `Statement`, `Statement_Path`, `Building_Permit`, `Building_Permit_Path`, `certificate_of_completion`, `certificate_of_completion_Path`, `Image`, `Image_Path`, `Map`, `Map_path`, `Plan`, `Plano_Path`, `Active`, `IsRealEsataeInvesment`) VALUES
(8, '8', 4, 1, 15, 'Building apartments and shops Fareej Al Ghanem', 'شقق فندقية فريج الغانم', '1261848', '1217626', '8-15', '6092.140', 'مصان', '21510000', '2012', 'No File', 'No File', 'DSC_4150.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4150.JPG', 'No File', 'No File', 'رخصة بناء الغانم.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الغانم.pdf', 'اتمام بناءالغانم القديم الشيخ  فهد.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناءالغانم القديم الشيخ  فهد.pdf', 'DSC_4155.JPG', '/English/Main_Application/Building_File/Image/DSC_4155.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(11, '11', 6, 6, 7, 'Fereej Abdulaziz Twin Buildings', 'عمارتين فريج عبدالعزيز ', '125146', '91760', '82', '466.8', ' قيد الدراسة ', '2187500', '2018', 'No File', 'No File', '٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', 'No File', 'No File', 'رخصة بناء فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فريج عبدالعزيز.pdf', 'اتمام بناء عمارة فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء عمارة فريج عبدالعزيز.pdf', 'DSC_4158.JPG', '/English/Main_Application/Building_File/Image/DSC_4158.JPG', 'SITE PLAN.pdf', '/English/Main_Application/Building_File/Map/SITE PLAN.pdf', 'No File', 'No File', '1', '0'),
(18, '18', 6, 6, 7, 'Fereej Abdulaziz Twin Buildings', 'عمارتين فريج عبدالعزيز 80', '127153', '97763', '80', '', 'دراسة صيانة ', '2187500', '2013', 'No File', 'No File', '٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', 'No File', 'No File', 'رخصة بناء فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فريج عبدالعزيز.pdf', 'اتمام بناء عمارة فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء عمارة فريج عبدالعزيز.pdf', 'DSC_4159.JPG', '/English/Main_Application/Building_File/Image/DSC_4159.JPG', 'SITE PLAN.pdf', '/English/Main_Application/Building_File/Map/SITE PLAN.pdf', 'No File', 'No File', '1', '0'),
(19, '19', 8, 1, 7, 'Bin Dirham Al Kubraa', 'بن درهم الكبرى', '1181995', '', '14', '1944.55', 'مصان ', '6237000', '2015', 'No File', 'No File', '٢٠٢٢٠٣١٤_١١٤٩٢٧.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣١٤_١١٤٩٢٧.jpg', 'No File', 'No File', 'No File', 'No File', 'اتمام بناء عمارة فريج بن درهم الكبرى ارضي+6مكرر.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء عمارة فريج بن درهم الكبرى ارضي+6مكرر.pdf', '٢٠٢٢٠٣١٤_١١٤٩٥٥.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣١٤_١١٤٩٥٥.jpg', 'Site plan.pdf', '/English/Main_Application/Building_File/Map/Site plan.pdf', 'No File', 'No File', '1', '0'),
(20, '20', 9, 5, 16, 'Al Najma Building  AL Makhbez', 'عمارة النجمة  المخبز', '', '25188', '19', '', 'قيد متابعة ', '881500', '2012', '20220320_082151.jpg', '/English/Main_Application/Building_File/Building_Photo/20220320_082151.jpg', '20220320_082306.jpg', '/English/Main_Application/Building_File/Entrace_Photo/20220320_082306.jpg', 'No File', 'No File', 'رخصة بناء نجمة المخبز.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء نجمة المخبز.pdf', 'اتمام النجمة المخبز.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام النجمة المخبز.pdf', '20220320_082402.jpg', '/English/Main_Application/Building_File/Image/20220320_082402.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(22, '22', 10, 8, 15, 'Al Najma Two Stores and Shop', 'عمارة دورين ومحل', '90580', '', '51', '', 'مشروع صيانة', '75500', '1990', 'No File', 'No File', 'DSC_4176.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4176.JPG', 'No File', 'No File', 'رخصة بناء النجمة دورين ومحل.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء النجمة دورين ومحل.pdf', 'شهادة اتمام النجمة دورين ومحل.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام النجمة دورين ومحل.pdf', 'DSC_4174.JPG', '/English/Main_Application/Building_File/Image/DSC_4174.JPG', 'خرائط النجمة دورين ومحل.pdf', '/English/Main_Application/Building_File/Map/خرائط النجمة دورين ومحل.pdf', 'No File', 'No File', '1', '0'),
(23, '23', 11, 1, 2, ' Al Najma Shops  ', 'محلات النجمة', '1183416', '1146796', '23', '', '', '858000', '2013', 'No File', 'No File', 'DSC_4177.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4177.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء.pdf', 'DSC_4179.JPG', '/English/Main_Application/Building_File/Image/DSC_4179.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(25, '25', 12, 1, 7, 'Sanyo', 'سانيو', '18915', '8175', '8', '645', 'مصان', '2052811', '2016', 'WhatsApp Image 2023-02-26 at 10.21.07 AM (3).jpeg', '/English/Main_Application/Building_File/Building_Photo/WhatsApp Image 2023-02-26 at 10.21.07 AM (3).jpeg', 'WhatsApp Image 2023-02-26 at 10.21.07 AM (4).jpeg', '/English/Main_Application/Building_File/Entrace_Photo/WhatsApp Image 2023-02-26 at 10.21.07 AM (4).jpeg', 'No File', 'No File', 'رخصة بناء سانيو.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء سانيو.pdf', 'شهادة اتمام بناء سانيو..pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء سانيو..pdf', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(26, '26', 14, 5, 7, 'Um Ghuwailina Hospital', 'أم غويلينة المستشفى', '18996', '8890', '107', '', 'قيد متابعة ', '4357500', '2014', 'No File', 'No File', 'DSC_4195.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4195.JPG', 'No File', 'No File', 'رخصة بناء المستشفى.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء المستشفى.pdf', 'اتمام بناء المستشفى.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء المستشفى.pdf', 'DSC_4193.JPG', '/English/Main_Application/Building_File/Image/DSC_4193.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(27, '27', 15, 6, 16, 'Um Ghuwailina Al Sughra', 'أم غويلينة الصغرى', '183302', '152797', '111', '', 'دراسة صيانة ', '1086000', '2006', 'No File', 'No File', '20220320_092622.jpg', '/English/Main_Application/Building_File/Entrace_Photo/20220320_092622.jpg', 'No File', 'No File', 'رخصة بناء ام غويلينة الصغرى.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء ام غويلينة الصغرى.pdf', 'شهادة اتمام بناء ام غويلينا الصغرى.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء ام غويلينا الصغرى.pdf', 'DSC_4198.JPG', '/English/Main_Application/Building_File/Image/DSC_4198.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(28, '28', 16, 6, 16, 'Um Ghuwailina Al Jadida ', 'أم غويلينة الجديدة', '', '', '15', '3474.2', 'دارسة صيانة ', '11333000', '2010', '20220321_095547.jpg', '/English/Main_Application/Building_File/Building_Photo/20220321_095547.jpg', '20220321_095328.jpg', '/English/Main_Application/Building_File/Entrace_Photo/20220321_095328.jpg', 'No File', 'No File', 'No File', 'No File', 'اتمام بناء الجديدة.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء الجديدة.pdf', '20220321_095547.jpg', '/English/Main_Application/Building_File/Image/20220321_095547.jpg', 'ground floor &typicalfloor.pdf', '/English/Main_Application/Building_File/Map/ground floor &typicalfloor.pdf', 'No File', 'No File', '1', '0'),
(29, '29', 17, 1, 17, 'Um Ghuwailina Al Kubraa', 'أم غويلينة الكبرى', '1026729', '940665', '55', '403.17', 'مصان ', '7935781', '2007', '٢٠٢٢٠٣٢١_١٠٢٤٥٣.jpg', '/English/Main_Application/Building_File/Building_Photo/٢٠٢٢٠٣٢١_١٠٢٤٥٣.jpg', '٢٠٢٢٠٣٢١_١٠٢٥٥٢.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١٠٢٥٥٢.jpg', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '٢٠٢٢٠٣٢١_١٠٢٥٢٦.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣٢١_١٠٢٥٢٦.jpg', 'Typical floor.pdf', '/English/Main_Application/Building_File/Map/Typical floor.pdf', 'No File', 'No File', '1', '0'),
(30, '30', 17, 1, 17, 'Um Ghuwailina Al Kubraa', 'بيت الشوك', '34137', '56703', '7', '2808', 'جديد', ' 8188630', '2021', '٢٠٢٢٠٣٢١_١٠٢٧٠٠.jpg', '/English/Main_Application/Building_File/Building_Photo/٢٠٢٢٠٣٢١_١٠٢٧٠٠.jpg', '٢٠٢٢٠٣٢١_١٠٢٧٥٥.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١٠٢٧٥٥.jpg', 'No File', 'No File', 'رخصة بناء الشوك.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الشوك.pdf', 'شهادة اتمام بناء الشوك 2 العمارة الجديدة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء الشوك 2 العمارة الجديدة.pdf', '٢٠٢٢٠٣٢١_١٠٢٧٢١.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣٢١_١٠٢٧٢١.jpg', 'empty_Image.jpg', '/English/Main_Application/Building_File/Map/empty_Image.jpg', 'No File', 'No File', '1', '0'),
(31, '31', 18, 1, 10, 'Two Villas in Khalifa City North  ', 'فيلتان مدينة خليفة الشمالية', '1218994', '1160000', '3،5', '', 'جديد', '2850000', '2011', 'No File', 'No File', 'WhatsApp Image 2021-03-21 at 11.15.21 AM.jpeg', '/English/Main_Application/Building_File/Entrace_Photo/WhatsApp Image 2021-03-21 at 11.15.21 AM.jpeg', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء مدينة خليفة ش المنارة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء مدينة خليفة ش المنارة.pdf', 'DSC_4217.JPG', '/English/Main_Application/Building_File/Image/DSC_4217.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(32, '32', 19, 7, 11, 'Villa Zawia', 'فيلا زاوية', '85999', '59387', '32', '', 'دراسة متابعة ', '1011700', '1989', 'DSC_4221.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4221.JPG', 'DSC_4222.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4222.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء فيلا م خ شمالية.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء فيلا م خ شمالية.pdf', 'DSC_4220.JPG', '/English/Main_Application/Building_File/Image/DSC_4220.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(33, '33', 20, 7, 11, 'VillasYumna Wusta', 'فلل يمنى وسطى', '164915', '	125816', '30،28', '', 'دراسة صيانة ', '1916200', '2000', 'DSC_4227.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4227.JPG', 'DSC_4225.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4225.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4223.JPG', '/English/Main_Application/Building_File/Image/DSC_4223.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(34, '34', 21, 6, 11, 'Villas Sharqiat Gharbiat  Al Jamea', 'فلل شرقية غربية  الجامعة', '1052468', '', '45،47', '', 'دراسة صيانة ', '1916200', '2005', 'DSC_4231.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4231.JPG', 'DSC_4229.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4229.JPG', 'No File', 'No File', 'رخصة بناء فلل شرقية غربية الجامعة.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فلل شرقية غربية الجامعة.pdf', 'شهادة اتمام بناء شرقية وغربية مدينة خ ش.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء شرقية وغربية مدينة خ ش.pdf', 'DSC_4231.JPG', '/English/Main_Application/Building_File/Image/DSC_4231.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(35, '35', 22, 1, 7, 'Khalifa City Building Al Wadhia', 'عمارة مدينة خليفة  الوضيحية', '1355153', '1286323', '24،17', ' 1,321 ', 'مصان ', '6791491', '2017', 'DSC_4236.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4236.JPG', 'DSC_4238.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4238.JPG', 'No File', 'No File', 'رخصة بناء مدينة خليفة.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء مدينة خليفة.pdf', 'شهادة اتمام بناء عمارة مدينة خليفة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء عمارة مدينة خليفة.pdf', 'DSC_4242.JPG', '/English/Main_Application/Building_File/Image/DSC_4242.JPG', 'الوضيحية.jpg', '/English/Main_Application/Building_File/Map/الوضيحية.jpg', 'No File', 'No File', '1', '0'),
(36, '36', 23, 1, 19, 'Khalifa City North House', 'منزل مدينة خليفة الشمالية', '24063', '', '9', '', '', '156100', '2011', 'DSC_4251.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4251.JPG', 'DSC_4252.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4252.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4250.JPG', '/English/Main_Application/Building_File/Image/DSC_4250.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(37, '37', 24, 7, 19, ' Gharnata House', 'منزل غرناطة', '46176', '78202', '19', '', 'دراسة صيانة ', '1218000', '1980', 'DSC_4262.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4262.JPG', 'DSC_4263.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4263.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4264.JPG', '/English/Main_Application/Building_File/Image/DSC_4264.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(38, '38', 25, 7, 19, 'House in front of Al Murur ', 'منزل مقابل المرور', '55958', '33568', '109', '', 'دراسة صيانة ', '200000', '1982', 'DSC_4254.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4254.JPG', 'DSC_4257.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4257.JPG', 'No File', 'No File', 'No File', 'No File', 'اتمام بناء منزل مقابل المرور.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء منزل مقابل المرور.pdf', 'DSC_4255.JPG', '/English/Main_Application/Building_File/Image/DSC_4255.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(39, '39', 26, 5, 11, 'Two detached villas', 'فيلتان متلاصقتان', '', '', '35،33', '', 'جديد ', '3000000', '2004', 'DSC_4208.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4208.JPG', 'DSC_4201.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4201.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء المطار العتيق.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء المطار العتيق.pdf', 'DSC_4204.JPG', '/English/Main_Application/Building_File/Image/DSC_4204.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(40, '40', 27, 5, 11, 'Western Villa', 'فيلا غربية', '1055459', '966396', '88', '', 'دراسة صيانة', '1225000', '2006', 'No File', 'No File', 'DSC_4270.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4270.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء ازغوى الغربية.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء ازغوى الغربية.pdf', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(41, '41', 29, 5, 11, 'Eastern Villa    ', 'فيلا شرقية', '1060966', '970330', '86', '', 'دراسة صيانة ', '1225000', '2006', 'DSC_4267.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4267.JPG', 'DSC_4266.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4266.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء ازغوى شرقية.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء ازغوى شرقية.pdf', '20220317_105950.jpg', '/English/Main_Application/Building_File/Image/20220317_105950.jpg', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(42, '42', 35, 6, 11, 'Villa Ain Khaled ', 'فيلا عين خالد', '119612', '1073819', '79', '', 'دراسة صيانة ', '3500000', '1998', 'DSC_4210.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4210.JPG', 'DSC_4214.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4214.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء عين خالد.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء عين خالد.pdf', 'DSC_4209.JPG', '/English/Main_Application/Building_File/Image/DSC_4209.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(44, '44', 36, 1, 20, 'New Industrial Garage', 'كراج الصناعية الجديد', '128624', '104618', '177', '', '', '5867000', '', '٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', '/English/Main_Application/Building_File/Building_Photo/٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', '3a266a79-a822-4cc5-a099-90790f36e9e7.jpg', '/English/Main_Application/Building_File/Entrace_Photo/3a266a79-a822-4cc5-a099-90790f36e9e7.jpg', 'No File', 'No File', 'رخصة بناء الصناعية .pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الصناعية .pdf', 'اتمام بناء الصناعية.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء الصناعية.pdf', '٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(45, '45', 43, 6, 11, 'Villa Al Dafna', 'فيلا الدفنة', '178907', '137757', '193', '', 'دراسة صيانة', '1954000', '2000', '20220323_123016.jpg', '/English/Main_Application/Building_File/Building_Photo/20220323_123016.jpg', '20220323_122912.jpg', '/English/Main_Application/Building_File/Entrace_Photo/20220323_122912.jpg', 'No File', 'No File', 'No File', 'No File', 'اتمام بناء فيلا الدفنة.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء فيلا الدفنة.pdf', '20220323_123006.jpg', '/English/Main_Application/Building_File/Image/20220323_123006.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(47, '47', 38, 1, 11, 'Villa Al Khaysa', 'فيلا الخيسة', '1044652', '959164', '7', '', '', '1366500', '2006', 'No File', 'No File', 'DSC_4298.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4298.JPG', 'No File', 'No File', 'رخصة بناء.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء.pdf', 'شهادة اتمام بناء.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء.pdf', 'DSC_4295.JPG', '/English/Main_Application/Building_File/Image/DSC_4295.JPG', 'Site plan.pdf', '/English/Main_Application/Building_File/Map/Site plan.pdf', 'No File', 'No File', '1', '0'),
(48, '48', 44, 10, 18, 'Ravdat Al Hamamah', 'روضة الحمامة', '', '', '39', '', 'أرض فضاء', '0', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(49, '49', 40, 6, 11, ' Al Ruweys Villas', 'فلل الرويس', '', '', '41', '', 'دراسة صيانة', '1963082', '2009', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'رخصة بناء الرويس.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الرويس.pdf', 'شهادة اتمام بناء الرويس.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء الرويس.pdf', 'No File', 'No File', 'Site plan.pdf', '/English/Main_Application/Building_File/Map/Site plan.pdf', 'No File', 'No File', '1', '0'),
(50, '50', 41, 1, 11, 'Villa Al Vakeer', 'فيلا الوكير', '1361895', '1291269', '494', '', 'جديد ', '1408095', '2019', 'IMG-20220324-WA0002.jpg', '/English/Main_Application/Building_File/Building_Photo/IMG-20220324-WA0002.jpg', 'IMG-20220324-WA0001.jpg', '/English/Main_Application/Building_File/Entrace_Photo/IMG-20220324-WA0001.jpg', 'No File', 'No File', 'رخصة بناء فيلا الوكير.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فيلا الوكير.pdf', 'شهادة اتمام بناء الوكير.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء الوكير.pdf', 'IMG-20220324-WA0003.jpg', '/English/Main_Application/Building_File/Image/IMG-20220324-WA0003.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(51, '51', 37, 1, 2, 'Palm Tower Offices', 'مكاتب برج النخلة ', '1056105', '997132', '3،4،5', '140*3', '', '11739965', '2004', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'سند+اتمام بناء+رخصة الدفاع المدني مكاتب الدفنة.pdf', '/English/Main_Application/Building_File/Building_Permit/سند+اتمام بناء+رخصة الدفاع المدني مكاتب الدفنة.pdf', 'شهادة اتمام بناء.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء.pdf', 'No File', 'No File', 'empty_Image.jpg', '/English/Main_Application/Building_File/Map/empty_Image.jpg', 'No File', 'No File', '1', '0'),
(52, '52', 13, 1, 16, 'HSBC', 'أم غويلينة أتش أس بي سي', '1361066', '1290744', '48', '2674', 'جديد', '6681012', '', 'DSC_4183.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4183.JPG', 'DSC_4182.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4182.JPG', 'No File', 'No File', 'رخصة بناء  hsbc.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء  hsbc.pdf', 'إتمام بناء hsbc.pdf', '/English/Main_Application/Building_File/certificate_completion/إتمام بناء hsbc.pdf', 'DSC_4186.JPG', '/English/Main_Application/Building_File/Image/DSC_4186.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(54, '54', 39, 5, 11, 'Al Qatifia Villa', ' فلة القطيفية', ' 1184490', '', '101', '٦١٣.٤', 'قيد متابعة ', '17989000', '2015', 'DSC_4312.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4312.JPG', 'DSC_4315.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4315.JPG', 'No File', 'No File', 'رخصة بناء القطيفية.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء القطيفية.pdf', 'شهادة اتمام بناء لقطيفية  البحيرة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء لقطيفية  البحيرة.pdf', 'DSC_4307.JPG', '/English/Main_Application/Building_File/Image/DSC_4307.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(62, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '1 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(63, '11', 6, 1, 7, 'Half Building :عمارتين فريج عبدالعزيز ', '4 شقق في البناء : عمارتين فريج عبدالعزيز ', NULL, NULL, '82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(64, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '3 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(65, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '8 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(66, '31', 18, 1, 10, 'Half Building :فيلتان مدينة خليفة الشمالية', '2 فيلا في البناء : فيلتان مدينة خليفة الشمالية', NULL, NULL, '3،5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(67, '11', 6, 1, 7, 'Half Building :عمارتين فريج عبدالعزيز ', '3 شقق في البناء : عمارتين فريج عبدالعزيز ', NULL, NULL, '82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(68, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '3 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(69, '20', 9, 1, 16, 'Half Building :عمارة النجمة  المخبز', '3 شقق في البناء : عمارة النجمة  المخبز', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(70, '20', 9, 1, 16, 'Half Building :عمارة النجمة  المخبز', '3 شقق في البناء : عمارة النجمة  المخبز', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(71, '29', 17, 1, 15, 'Half Building :أم غويلينة الكبرى', '11 شقق في البناء : أم غويلينة الكبرى', NULL, NULL, '55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(72, '8', 4, 1, 15, 'Half Building :شقق فندقية فريج الغانم', '10 محلات في البناء : شقق فندقية فريج الغانم', NULL, NULL, '8-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(73, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(74, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(75, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(76, '76', 45, 1, 11, 'vaill Graft al rayyan', 'فيلا غرافة الريان ', '1145485', '1078480', '494', '', 'جديد ', '1154500', '2013', 'DSC_4282.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4282.JPG', 'DSC_4283.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4283.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4282.JPG', '/English/Main_Application/Building_File/Image/DSC_4282.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(77, '28', 16, 6, 16, 'Half Building :أم غويلينة الجديدة', '2 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(78, '28', 16, 6, 16, 'Half Building :أم غويلينة الجديدة', '2 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(79, '79', 46, 1, 11, 'Villa new Al Khaysa', 'فيلا الخيسة الجديدة ', '', '', '36', '', '', '1171415', '2013', 'DSC_4301.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4301.JPG', 'DSC_4300.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4300.JPG', 'No File', 'No File', 'No File', 'No File', '٧٠٠٦١١١٤  اتمام بناء الخيسة.pdf', '/English/Main_Application/Building_File/certificate_completion/٧٠٠٦١١١٤  اتمام بناء الخيسة.pdf', 'DSC_4304.JPG', '/English/Main_Application/Building_File/Image/DSC_4304.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(81, '81', 48, 5, 11, 'Al Gharafa Villa', 'فيلا الغرافة ', '', '', '48', '', '', '1565008', '2013', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(82, '82', 47, 1, 11, 'Izghawa Housing', 'ازغوى اسكان', '', '', '59', '615', '', '1565008', '2023', 'DSC_4286.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4286.JPG', 'DSC_4289.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4289.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4285.JPG', '/English/Main_Application/Building_File/Image/DSC_4285.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(84, '39', 26, 5, 11, 'Half Building :فيلتان متلاصقتان', '2 فيلا في البناء : فيلتان متلاصقتان', NULL, NULL, '35،33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(85, '39', 26, 5, 11, 'Half Building :فيلتان متلاصقتان', '2 فيلا في البناء : فيلتان متلاصقتان', NULL, NULL, '35،33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(86, '37', 24, 7, 19, 'Half Building :منزل غرناطة', '3 بيت شعبي في البناء : منزل غرناطة', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(87, '37', 24, 7, 19, 'Half Building :منزل غرناطة', '3 بيت شعبي في البناء : منزل غرناطة', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(88, '31', 18, 1, 10, 'Half Building :فيلتان مدينة خليفة الشمالية', '2 فيلا في البناء : فيلتان مدينة خليفة الشمالية', NULL, NULL, '3،5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(89, '35', 22, 1, 7, 'Half Building :عمارة مدينة خليفة  الوضيحية', '8 شقق في البناء : عمارة مدينة خليفة  الوضيحية', NULL, NULL, '24،17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(90, '35', 22, 1, 7, 'Half Building :عمارة مدينة خليفة  الوضيحية', '8 شقق في البناء : عمارة مدينة خليفة  الوضيحية', NULL, NULL, '24،17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(91, '52', 13, 1, 16, 'Half Building :أم غويلينة أتش أس بي سي', '12 شقق في البناء : أم غويلينة أتش أس بي سي', NULL, NULL, '48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(92, '26', 14, 5, 7, 'Half Building :أم غويلينة المستشفى', '10 شقق في البناء : أم غويلينة المستشفى', NULL, NULL, '107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(93, '26', 14, 5, 7, 'Half Building :أم غويلينة المستشفى', '10 شقق في البناء : أم غويلينة المستشفى', NULL, NULL, '107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(94, '31', 18, 1, 10, 'Half Building :فيلتان مدينة خليفة الشمالية', '1 محل في البناء : فيلتان مدينة خليفة الشمالية', NULL, NULL, '3،5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(97, NULL, 39, 5, 11, 'Half Building : فلة القطيفية', '5 فيلا في البناء :  فلة القطيفية', NULL, NULL, '101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(98, NULL, 49, 1, 11, 'Villa Al Kheesa School ', 'فيلا الخيسة المدرسة', '', '', '11', '560', '', '1333333', '2023', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(99, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(100, '29', 17, 1, 17, 'Half Building :أم غويلينة الكبرى', '11 شقق في البناء : أم غويلينة الكبرى', NULL, NULL, '55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(101, '101', 50, 1, 11, 'Villa Alkheesa Hajar', 'فيلا الخيسة حجر', '', '', '35', '540', '', '1351158', '2023', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(102, NULL, 51, 1, 2, 'Builidng Test Onexxxx', 'بناء تجربة واحد', '4343', '54554', '01', '5000', 'New', '150000', '2012', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(103, NULL, 52, 5, 12, 'Building One Test Two', 'بناء أول  تجربة إثنان', '23232', '3232', '11111', '34434', 'New', '150000', '2011', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(104, NULL, 54, 6, 21, 'building One Pro Test Fourr', 'بناء واحد ملكية تجربة رابعة', '12345', '6789', '0104', '4000', 'New', '100000', '2010', 'BBUUilding333.jpg', '/English/Main_Application/Building_File/Building_Photo/BBUUilding333.jpg', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'Map_1.jpg', '/English/Main_Application/Building_File/Map/Map_1.jpg', 'No File', 'No File', '1', '0'),
(105, NULL, 54, 5, 2, 'Building One Pro Four', 'بناء واحد ملكية رابعة', '1234', '567', '0104', '1100', 'New', '1000', '2009', 'BBUUilding333.jpg', '/English/Main_Application/Building_File/Building_Photo/BBUUilding333.jpg', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'Map_1.jpg', '/English/Main_Application/Building_File/Map/Map_1.jpg', 'No File', 'No File', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `arcive_building_contract`
--

CREATE TABLE `arcive_building_contract` (
  `Contract_Id` int(11) NOT NULL,
  `users_user_ID` int(11) NOT NULL,
  `tenants_Tenants_ID` int(11) NOT NULL,
  `building_Building_Id` int(11) NOT NULL,
  `contract_type_Contract_Type_Id` int(11) NOT NULL,
  `contract_template_Contract_template_Id` int(11) NOT NULL,
  `payment_type_payment_type_Id` int(11) NOT NULL,
  `reason_for_rent_Reason_For_Rent_Id` int(11) NOT NULL,
  `Number_Of_Mounth` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Number_Of_Years` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Payment_Amount` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Payment_Amount_L` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Date_Of_Sgin` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Start_Date` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `End_Date` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Contract_Details` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `New_ReNewed_Expaired` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `Start_Free_Period` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Duration_free_period` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `maintenance` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `Rental_allowed_Or_Not_allowed` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `Com_rep` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Paymen_Method` varchar(200) DEFAULT NULL,
  `Real_Contract_FileName` varchar(200) DEFAULT NULL,
  `Real_Contract_Path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arcive_building_contract`
--

INSERT INTO `arcive_building_contract` (`Contract_Id`, `users_user_ID`, `tenants_Tenants_ID`, `building_Building_Id`, `contract_type_Contract_Type_Id`, `contract_template_Contract_template_Id`, `payment_type_payment_type_Id`, `reason_for_rent_Reason_For_Rent_Id`, `Number_Of_Mounth`, `Number_Of_Years`, `Payment_Amount`, `Payment_Amount_L`, `Date_Of_Sgin`, `Start_Date`, `End_Date`, `Contract_Details`, `New_ReNewed_Expaired`, `Start_Free_Period`, `Duration_free_period`, `maintenance`, `Rental_allowed_Or_Not_allowed`, `Com_rep`, `Paymen_Method`, `Real_Contract_FileName`, `Real_Contract_Path`) VALUES
(23, 5, 41, 8, 1, 2, 2, 1, '', '2', '130000', 'مئة وثلاثنون الف', '01/09/2022', '01/09/2022', '01/09/2024', '', '1', '', '', '2', '1', '4', 'شيك', NULL, NULL),
(26, 8, 61, 26, 1, 2, 2, 2, '', '1', '35000', 'خمسة وثلاثون الاف', '01/08/2022', '01/09/2022', '15/08/2023', '', '1', '', '', '2', '1', '1', NULL, NULL, NULL),
(30, 8, 48, 18, 1, 2, 2, 2, '', '1', '10000', 'عشرة الاف ', '31/07/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '2', '2', '20', NULL, NULL, NULL),
(31, 8, 52, 25, 1, 2, 2, 1, '', '5', '29700', 'تسعة وعشرون الاف وسبعمئة ', '18/02/2021', '01/08/2021', '31/07/2026', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', NULL, NULL, NULL),
(33, 9, 52, 52, 1, 2, 2, 1, '', '5', '74400', 'اربعة وسبعون الاف واربعمئة ', '23/03/2021', '01/08/2021', '31/07/2026', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(34, 9, 52, 19, 1, 2, 2, 1, '', '5', '80400', 'ثمانون الاف وأربعمئة ', '01/10/2020', '01/08/2021', '30/07/2026', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(39, 8, 3, 64, 1, 3, 2, 3, '', '1', '14100', 'اربعة عشر ومئة ', '09/02/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(40, 8, 9, 65, 1, 3, 2, 3, '', '1', '37600', 'سبعة وثلاثون الاف وستمئة', '01/01/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '1', '1', 'شيك', NULL, NULL),
(41, 8, 67, 66, 1, 3, 2, 1, '', '3', '26000', 'ستة وعشرون الاف ريال فقط ', '30/04/2021', '01/04/2022', '31/03/2025', '', '1', '', '', '1', '2', '37', 'شيك', NULL, NULL),
(42, 9, 49, 67, 1, 3, 2, 1, '', '1', '9000', 'تسعة الاف ريال فقط ', '31/05/2022', '01/06/2022', '31/05/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', NULL, NULL),
(43, 8, 3, 68, 1, 3, 2, 3, '', '3', '14100', 'اربعة عشر الف ومئة ', '01/01/2021', '01/12/2020', '30/11/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(45, 8, 53, 70, 1, 3, 2, 3, '', '1', '9000', 'تسعة الاف ريال ', '01/12/2022', '01/12/2022', '30/11/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(46, 8, 20, 71, 1, 3, 2, 1, '', '1', '36850', 'ستة وثلاثون الاف وثمانمئة وخمسون', '01/08/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(47, 8, 43, 72, 1, 3, 2, 2, '', '5', '40000', 'اربعون الاف ريال ', '01/12/2022', '01/01/2023', '31/12/2027', '', '1', '', '', '1', '2', '5', 'شيك', NULL, NULL),
(50, 8, 48, 75, 4, 3, 2, 3, '2', '', '10400', 'عشرة الاف واربع مئة ', '01/01/2021', '01/01/2021', '31/07/2022', '', '1', '', '', '1', '2', '20', 'نقداً', NULL, NULL),
(51, 8, 8, 77, 1, 3, 2, 3, '', '1', '9600', 'تسعة الاف وستمئة', '24/01/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '1', '2', '1', '1', NULL, NULL),
(52, 8, 8, 78, 1, 3, 2, 3, '', '1', '9600', 'تسعة الاف وستمئة', '24/01/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '1', '2', '1', '1', NULL, NULL),
(53, 8, 83, 84, 1, 3, 2, 1, '', '2', '16000', 'ستة عشرة الاف ريال ', '27/03/2021', '01/04/2023', '30/06/2022', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(54, 8, 114, 85, 1, 3, 2, 1, '', '3', '16000', 'ستة عشر الاف ريال ', '27/03/2021', '01/08/2021', '30/06/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(55, 8, 51, 86, 1, 3, 2, 3, '', '1', '24666', 'اربعة وعشرون الاف وستمئة وسة وستون', '01/05/2021', '01/05/2021', '30/04/2022', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(56, 8, 51, 87, 1, 3, 2, 3, '', '2', '18000', 'ثمن عشر الاف ', '28/04/2022', '01/05/2022', '30/04/2024', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(57, 8, 67, 88, 1, 3, 1, 1, '', '1', '32000', 'اثنان وثلاثون الاف ريال ', '30/03/2019', '01/05/2020', '30/04/2021', '', '1', '', '', '1', '2', '37', 'نقداً', NULL, NULL),
(58, 8, 41, 89, 1, 3, 2, 1, '', '2', '30000', 'ثلاثون الاف ريال ', '19/09/2019', '01/01/2020', '30/04/2021', '', '1', '', '', '2', '2', '4', 'شيك', NULL, NULL),
(59, 8, 41, 90, 1, 3, 2, 1, '', '1', '30000', 'ثلاثون الاف ريال ', '01/01/2021', '01/01/2020', '30/04/2021', '', '1', '', '', '2', '2', '4', 'شيك', NULL, NULL),
(60, 8, 41, 91, 1, 3, 2, 1, '', '1', '78000', 'سبعة وثمون الاف ريال ', '23/11/2019', '01/01/2020', '15/06/2021', '', '1', '01/01/2020', '3', '1', '2', '4', 'شيك', NULL, NULL),
(61, 8, 61, 92, 1, 3, 5, 3, '', '1', '31666', 'واحد وثلاثون وستمئة وستون ', '11/06/2020', '01/07/2020', '31/07/2021', '', '1', '', '', '2', '2', '19', 'نقداً', NULL, NULL),
(62, 8, 61, 93, 1, 3, 2, 3, '', '1', '30000', 'ثلاثون الف ريال ', '03/06/2021', '01/08/2021', '15/09/2022', '', '1', '01/08/2022', '2', '2', '2', '19', 'نقداً', NULL, NULL),
(63, 8, 116, 94, 1, 3, 2, 2, '', '4', '2250', 'الفان ومئتان وخمسون ', '01/01/2020', '01/01/2020', '31/12/2023', '', '1', '', '', '2', '2', '42', 'نقداً', NULL, NULL),
(65, 5, 88, 97, 1, 3, 2, 1, '', '2', '60000', 'ستون الاف ريال ', '30/09/2021', '01/12/2021', '01/11/2023', '', '1', '', '', '1', '2', '45', 'Cheques', '', ''),
(66, 8, 88, 54, 1, 2, 5, 1, '', '2', '50000', 'خمسون الاف ريال ', '23/04/2020', '01/04/2020', '01/04/2022', 'تم دفع القيمية الايجارية عن كامل مدة التعاقد 1000000 مليون ريال', '1', '', '', '1', '2', '45', 'نقداً', NULL, NULL),
(67, 8, 48, 99, 1, 3, 2, 3, '', '1', '10000', 'عشرة الاف ريال', '01/05/2023', '01/05/2023', '30/04/2024', '', '1', '', '', '2', '2', '20', 'شيك', '', ''),
(68, 9, 52, 35, 1, 2, 3, 1, '', '5', '39600', 'تسعة وثلالثين ألف وستة مئة ريال', '18/10/2020', '01/08/2021', '01/08/2026', '', '1', '', '', '1', '1', '1', 'تحويل', NULL, NULL),
(69, 8, 20, 100, 1, 3, 2, 1, '', '1', '36850', 'ستة وثلاثون الاف وثمان مئة وخمسون ', '29/01/2023', '01/05/2023', '30/04/2024', '', '1', '', '', '2', '2', '1', 'شيك', NULL, NULL),
(70, 5, 134, 82, 1, 2, 2, 2, '', '1', '3000', 'three thousand', '12/07/2023', '14/07/2023', '13/07/2024', '', '1', '', '', '2', '2', '1', 'Transformation', '', ''),
(71, 5, 59, 82, 1, 2, 2, 2, '', '1', '3000', 'three thousand', '12/07/2023', '14/07/2023', '13/07/2024', '', '1', '', '', '2', '2', '32', 'Transformation', '', ''),
(72, 5, 107, 106, 1, 3, 2, 2, '', '1', '4000', 'Four Thousand', '10/07/2023', '11/07/2023', '10/07/2024', '', '1', '', '', '1', '1', '1', 'Cash', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `arcive_contract`
--

CREATE TABLE `arcive_contract` (
  `Contract_Id` int(11) NOT NULL,
  `users_user_ID` int(11) NOT NULL,
  `tenants_Tenants_ID` int(11) NOT NULL,
  `units_Unit_ID` int(11) NOT NULL,
  `contract_type_Contract_Type_Id` int(11) NOT NULL,
  `contract_template_Contract_template_Id` int(11) NOT NULL,
  `payment_type_payment_type_Id` int(11) NOT NULL,
  `reason_for_rent_Reason_For_Rent_Id` int(11) NOT NULL,
  `Number_Of_Mounth` varchar(45) DEFAULT NULL,
  `Number_Of_Years` varchar(45) DEFAULT NULL,
  `Payment_Amount` varchar(200) NOT NULL,
  `Payment_Amount_L` varchar(200) NOT NULL,
  `Date_Of_Sgin` varchar(200) NOT NULL,
  `Start_Date` varchar(200) NOT NULL,
  `End_Date` varchar(200) NOT NULL,
  `Contract_Details` varchar(2000) DEFAULT NULL,
  `New_ReNewed_Expaired` varchar(45) NOT NULL,
  `Start_Free_Period` varchar(200) DEFAULT NULL,
  `Duration_free_period` varchar(200) DEFAULT NULL,
  `maintenance` varchar(45) NOT NULL,
  `Rental_allowed_Or_Not_allowed` varchar(45) NOT NULL,
  `Com_rep` varchar(45) DEFAULT NULL,
  `Paymen_Method` varchar(200) DEFAULT NULL,
  `Real_Contract_FileName` varchar(200) DEFAULT NULL,
  `Real_Contract_Path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arcive_contract`
--

INSERT INTO `arcive_contract` (`Contract_Id`, `users_user_ID`, `tenants_Tenants_ID`, `units_Unit_ID`, `contract_type_Contract_Type_Id`, `contract_template_Contract_template_Id`, `payment_type_payment_type_Id`, `reason_for_rent_Reason_For_Rent_Id`, `Number_Of_Mounth`, `Number_Of_Years`, `Payment_Amount`, `Payment_Amount_L`, `Date_Of_Sgin`, `Start_Date`, `End_Date`, `Contract_Details`, `New_ReNewed_Expaired`, `Start_Free_Period`, `Duration_free_period`, `maintenance`, `Rental_allowed_Or_Not_allowed`, `Com_rep`, `Paymen_Method`, `Real_Contract_FileName`, `Real_Contract_Path`) VALUES
(3, 5, 76, 203, 1, 1, 2, 2, '', '1', '11000', 'إحدى عشر ألف', '01/02/2022', '01/02/2022', '01/02/2023', '', '1', '', '', '2', '2', '5', '', NULL, NULL),
(7, 5, 25, 174, 1, 1, 2, 1, '', '1', '3500', 'ثلاثة الف وخمس مئة ', '', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(12, 8, 34, 183, 1, 1, 2, 1, '', '1', '5700', 'خمسة الف وسبع مئة ', '', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(18, 8, 17, 168, 1, 1, 2, 1, '', '1', '3500', 'ثلاثة الف وخمسئة', '20/11/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(19, 8, 33, 182, 1, 1, 2, 1, '', '1', '5500', 'خمسة الف وخمسمئة', '20/11/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(20, 8, 31, 180, 1, 1, 2, 1, '', '1', '3500', 'ثلاثة الف وخمسمئة ', '01/12/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(23, 8, 22, 171, 1, 1, 2, 1, '', '1', '3400', 'ثلاثة الف واربعمئة ', '25/11/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(24, 8, 24, 173, 1, 1, 2, 1, '', '1', '4500', 'اربع الف وخمسمئة', '25/12/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(25, 8, 29, 178, 1, 1, 2, 1, '', '1', '4300', 'اربعة الف وثلاثمئة', '20/11/2022', '06/01/2023', '05/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(28, 8, 26, 175, 1, 1, 2, 1, '', '1', '4300', 'اربعة الاف وثلاثمئة ', '20/12/2022', '10/01/2023', '9/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(31, 8, 28, 167, 1, 1, 2, 1, '', '1', '4400', 'اربعة الاف واربعمئة ', '08/01/2023', '08/01/2023', '07/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(34, 8, 18, 169, 1, 1, 2, 1, '', '1', '4500', 'اربعة الاف وخمسمئة ', '03/01/2023', '31/01/2023', '31/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(35, 8, 32, 181, 1, 1, 2, 1, '', '1', '4300', 'اربعة الاف وثلاثمئة ', '20/12/2022', '05/01/2023', '04/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(39, 8, 23, 172, 1, 1, 2, 1, '', '1', '4500', 'اربعة الاف وخمسمئة ', '20/12/2023', '31/01/2023', '30/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(41, 8, 13, 25, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '14/01/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(42, 8, 15, 7, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '01/01/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(45, 8, 102, 176, 1, 1, 2, 1, '', '1', '4300', 'اربعة الاف وثلاثمئة ', '26/01/2022', '01/02/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(46, 8, 101, 177, 1, 1, 2, 1, '', '1', '3300', 'ثلاثة الاف وثلاثمئة ', '28/01/2023', '01/02/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(47, 8, 74, 201, 1, 1, 2, 2, '', '1', '10000', 'عشرة الاف ريال فقط لاغير', '30/1/2023', '01/02/2023', '28/01/2024', '', '1', '', '', '1', '2', '26', 'شيك', NULL, NULL),
(49, 8, 75, 202, 1, 1, 2, 2, '', '1', '10000', 'عشر الاف ريال ', '30/1/2023', '30/01/2023', '30/01/2024', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(51, 8, 82, 212, 1, 1, 2, 1, '', '1', '7500', 'سبعة الاف وخمسمئة ', '01/02/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(52, 8, 80, 208, 1, 1, 2, 1, '', '3', '11000', 'احدا عشر الاف ريال فقط ', '30/07/2020', '01/08/2020', '31/07/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(53, 8, 103, 122, 1, 1, 2, 2, '', '1', '9000', 'تسعة الاف ريال فقط ', '12/11/2022', '01/12/2022', '30/11/2023', '', '1', '', '', '1', '2', '38', 'شيك', NULL, NULL),
(54, 8, 9, 148, 1, 1, 2, 1, '', '1', '2500', 'الافان وخمسة مئة ', '01/01/2021', '01/01/2021', '13/03/2023', 'شهر اربعة  فارغ شهر خمسة  سماح ', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(55, 8, 9, 162, 1, 1, 2, 1, '', '1', '3000', 'ثلاثة الاف ريال ', '01/01/2021', '01/01/2021', '31/03/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(56, 8, 87, 220, 1, 1, 4, 1, '', '5', '8000', 'ثمن الاف ريال فقط ', '01/09/2020', '01/09/2020', '31/08/2025', 'تم دفع سنتين مقدم \r\nعللى راس كل سنة من العقد حتى 30 8 2022 من 1 9 2022 شيك كل اربع شهور ', '1', '', '', '1', '2', '39', 'شيك', NULL, NULL),
(57, 8, 5, 6, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف و سبعمئة ', '01/08/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(58, 8, 15, 29, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '01/08/2022', '01/10/2022', '30/09/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(59, 8, 5, 13, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '01/03/2023', '01/03/2023', '29/02/2024', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(61, 8, 104, 233, 1, 1, 2, 2, '', '1', '2000', 'الافان ريال ', '28/01/2023', '01/02/2023', '31/05/2024', 'استأجر مساحة إدارية خمسة عشرة متر مربع  ', '1', '01/02/2023', '4', '1', '2', '40', 'شيك', NULL, NULL),
(62, 8, 47, 99, 1, 1, 2, 1, '', '5', '5000', 'خمسة الاف ريال ', '20/11/2018', '01/11/2018', '01/11/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(63, 8, 82, 212, 1, 1, 2, 1, '', '2', '5000', 'خمسة الاف ريال ', '28/02/2019', '01/03/2019', '28/02/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(64, 8, 70, 189, 1, 1, 2, 1, '', '2', '10000', 'عشر الاف ريال ', '24/12/2020', '01/01/2021', '30/04/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(65, 8, 73, 191, 1, 1, 2, 1, '', '2', '10000', 'عشرة الاف ريال ', '31/05/2021', '01/06/2021', '31/10/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(67, 8, 105, 161, 1, 1, 2, 3, '', '1', '3700', 'ثلاثة الاف وسبعة مئة ', '25/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(69, 8, 107, 327, 1, 1, 2, 3, '', '1', '1500', 'الف وخمس مئة ريال ', '18/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', '3', NULL, NULL),
(70, 8, 30, 179, 1, 1, 2, 1, '', '1', '4200', 'اربعة الاف ومئتين ', '18/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', '1', NULL, NULL),
(71, 8, 108, 323, 1, 1, 2, 3, '', '1', '1800', 'الف وثمئة ', '25/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', '3', NULL, NULL),
(72, 8, 109, 324, 1, 1, 2, 3, '', '1', '1800', 'الف وثمنمئة ', '30/01/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '1', '2', '1', '3', NULL, NULL),
(73, 8, 19, 170, 1, 1, 1, 1, '', '1', '4100', 'اربعة الاف ومئة ريال ', '25/01/2022', '28/02/2023', '28/02/2024', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(76, 8, 110, 230, 1, 1, 2, 1, '', '3', '4000', 'اربعة الاف ريال فقط ', '25/02/2023', '01/03/2023', '01/01/2027', '', '1', '01/03/2023', '10', '1', '1', '1', '1', NULL, NULL),
(77, 8, 91, 231, 1, 1, 2, 1, '', '2', '5000', 'خمسة الاف ريال ', '28/08/2021', '01/09/2021', '31/08/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(78, 8, 85, 217, 1, 1, 2, 1, '', '2', '20000', 'عشرون الاف ريال ', '14/05/2021', '01/06/2021', '31/05/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(79, 8, 90, 234, 1, 1, 1, 2, '', '3', '20000', 'عشرون الاف ريال ', '15/01/2020', '15/04/2020', '14/04/2023', 'يتم تحويل القيمية الايجارية بداية كل سنة ميلادية في بداية العقد ', '1', '', '', '1', '2', '34', 'تحويل', NULL, NULL),
(80, 8, 2, 3, 1, 1, 2, 3, '', '3', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2020', '01/01/2020', '30/09/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(81, 8, 3, 4, 1, 1, 2, 3, '', '3', '4700', 'اربعة الاف وسبعمئة ريال ', '09/01/2020', '15/01/2020', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(82, 8, 117, 6, 1, 1, 2, 1, '', '1', '5000', 'خمسة الاف ريال ', '01/06/2020', '01/06/2020', '31/05/2021', '', '1', '', '', '1', '2', '43', 'نقداً', '', ''),
(83, 8, 6, 7, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '03/03/2020', '01/03/2020', '28/02/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(84, 8, 7, 8, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '20/06/2021', '01/07/2021', '01/08/2022', '', '1', '01/07/2021', '1', '1', '2', '1', 'نقداً', '', ''),
(85, 8, 7, 8, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '20/06/2021', '01/07/2021', '31/07/2022', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(86, 8, 7, 8, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '04/06/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(87, 8, 8, 9, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '31/01/2021', '01/02/2021', '31/01/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(88, 8, 8, 9, 1, 1, 2, 3, '', '1', '4800', 'اربعة الاف وثمانمائة ', '24/01/2022', '01/02/2022', '31/01/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(89, 8, 2, 9, 1, 1, 2, 3, '', '4', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2020', '01/01/2020', '31/12/2024', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(90, 8, 5, 13, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '07/02/2021', '01/03/2021', '28/02/2022', '', '1', '01/03/2021', '1', '1', '2', '1', 'نقداً', '', ''),
(91, 8, 10, 15, 1, 1, 2, 3, '', '4', '5000', 'خمسة الاف ريال ', '29/12/2019', '01/01/2020', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(92, 8, 11, 16, 1, 1, 2, 3, '', '1', '5500', 'خمسة الاف وخمسمائة ', '28/10/2019', '01/11/2019', '31/10/2020', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(93, 8, 11, 16, 1, 1, 2, 3, '', '1', '4800', 'اربعة الاف وثمانمائة ', '31/10/2020', '01/11/2020', '31/10/2021', '', '1', '', '', '2', '2', '1', 'نقداً', NULL, NULL),
(94, 5, 11, 16, 1, 1, 2, 3, '', '2', '4700', 'اربعة الاف وسبعمئة ريال ', '31/10/2021', '01/11/2021', '29/11/2023', '', '1', '', '', '1', '2', '1', 'Cash', '', ''),
(96, 8, 97, 17, 1, 1, 3, 1, '', '11', '5500', 'خمسة الاف وخمسمائة ريال ', '12/08/2012', '12/08/2012', '11/08/2023', '', '1', '', '', '1', '2', '1', 'تحويل', NULL, NULL),
(97, 8, 12, 19, 1, 1, 2, 3, '', '1', '500', 'خمسة الاف  ', '16/01/2020', '01/02/2020', '31/01/2021', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(98, 8, 12, 19, 1, 1, 2, 3, '', '2', '4700', 'اربعة الاف وسبعمئة ريال ', '23/10/2021', '01/12/2021', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(99, 8, 8, 20, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '30/01/2021', '01/02/2021', '31/01/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(100, 8, 97, 23, 1, 1, 3, 1, '', '9', '6000', 'ستة الاف ريال ', '18/09/2012', '18/09/2012', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(101, 8, 13, 25, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '08/12/2020', '01/01/2021', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(102, 8, 13, 25, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '25/10/2021', '01/10/2021', '01/10/2022', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(104, 8, 14, 26, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '18/07/2020', '01/08/2020', '31/07/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(105, 8, 14, 26, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '21/08/2021', '01/08/2021', '31/07/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(106, 8, 14, 26, 4, 1, 2, 3, '1', '', '4500', 'اربعة الاف وخمسمائة ', '01/02/2022', '01/01/2022', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(107, 8, 2, 27, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '01/01/2020', '01/01/2020', '31/12/2020', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(108, 8, 2, 27, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '01/01/2021', '01/01/2021', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(109, 8, 2, 27, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(110, 8, 118, 28, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '01/05/2020', '01/05/2020', '30/04/2021', '', '1', '', '', '1', '2', '44', 'نقداً', '', ''),
(111, 8, 9, 28, 4, 1, 2, 3, '14', '', '4700', 'اربعة الاف وسبعمائة ريال ', '05/07/2021', '01/07/2021', '01/11/2022', '', '1', '01/07/2021', '2', '1', '2', '1', 'نقداً', '', ''),
(112, 8, 15, 29, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '01/11/2020', '01/11/2020', '30/11/2021', '', '1', '01/11/2020', '1', '2', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(113, 8, 15, 29, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '26/09/2021', '01/10/2021', '30/09/2022', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(115, 8, 63, 145, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ', '01/02/2021', '01/02/2021', '31/01/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(116, 8, 63, 145, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ', '10/12/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(117, 8, 62, 144, 1, 1, 2, 3, '', '1', '2800', 'الفان وثمانمئة ', '01/01/2020', '01/01/2020', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(118, 5, 62, 144, 1, 1, 2, 3, '', '2', '2500', 'الفان وخمسمائة', '01/01/2022', '02/01/2021', '31/12/2023', '', '1', '', '', '1', '2', '1', 'Cash', '', ''),
(119, 8, 63, 145, 1, 1, 2, 3, '', '4', '2500', 'الفان وخمسمائة ', '01/01/2020', '01/01/2020', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(120, 8, 119, 146, 1, 1, 1, 3, '', '3', '2500', 'الفان وخمسمائة ', '01/11/2020', '01/11/2020', '31/10/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(121, 8, 65, 147, 1, 1, 2, 3, '', '3', '2500', 'الفان وخمسمائة ', '01/02/2021', '01/02/2021', '31/01/2024', 'تم دفع اربع شهور بشيك واحد ', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(122, 8, 66, 149, 1, 1, 2, 3, '', '4', '2500', 'الفان وخمسمائة ', '01/01/2020', '01/01/2020', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(123, 8, 120, 148, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ', '01/01/2010', '01/01/2020', '30/03/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(127, 8, 106, 322, 1, 1, 4, 1, '', '5', '15000', 'خمسة عشر الف ريال ', '16/01/2023', '01/01/2023', '31/12/2027', '', '1', '', '', '1', '2', '41', 'تحويل', NULL, NULL),
(128, 8, 122, 201, 1, 1, 2, 2, '', '2', '13000', 'ثلاثة عشر الاف رياال ', '13/09/2019', '15/09/2019', '31/10/2021', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(129, 8, 9, 216, 1, 1, 2, 3, '', '1', '10500', 'عشرة الاف وخمسمائة ', '28/03/2021', '01/04/2021', '31/03/2022', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(131, 8, 84, 215, 1, 1, 2, 2, '', '5', '12000', 'اثني عشر الف ريال ', '25/06/2022', '01/07/2022', '30/06/2027', '', '1', '', '', '1', '2', '24', 'شيك', NULL, NULL),
(132, 8, 76, 203, 1, 1, 2, 2, '', '1', '14000', 'اربعة عشر الف ريال ', '25/12/2019', '01/01/2020', '31/01/2021', '', '1', '', '', '1', '2', '27', 'نقداً', NULL, NULL),
(133, 8, 76, 203, 1, 1, 2, 2, '', '1', '13000', 'ثلاثة عشر الف ريال', '31/01/2021', '01/02/2021', '30/11/2021', '', '1', '', '', '1', '2', '27', 'نقداً', NULL, NULL),
(134, 8, 76, 203, 4, 1, 2, 2, '5', '', '11000', 'احدى عشر الف ريال ', '01/12/2021', '01/12/2021', '31/05/2022', '', '1', '', '', '1', '2', '27', 'نقداً', NULL, NULL),
(136, 8, 9, 216, 1, 1, 2, 3, '', '2', '10500', 'عشرة الاف وخمسمائة ', '01/04/2022', '01/04/2022', '31/03/2024', '', '1', '', '', '1', '1', '1', 'شيك', NULL, NULL),
(138, 8, 52, 455, 1, 1, 3, 1, '', '3', '13200', 'ثلاثة عشر الف ومئتان ريال ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(139, 8, 52, 226, 1, 1, 3, 1, '', '3', '8000', 'ثمن الاف ريال فقط ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '1', '1', 'تحويل', NULL, NULL),
(140, 8, 52, 192, 1, 1, 3, 1, '', '3', '11000', 'احدى عشر الف ريال ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '2', '1', 'تحويل', NULL, NULL),
(141, 8, 52, 190, 1, 1, 3, 1, '', '3', '11500', 'احدى عشر الف وخمسمائة ريال ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '2', '1', 'تحويل', NULL, NULL),
(142, 8, 52, 456, 1, 1, 3, 1, '', '3', '13200', 'ثلاثة عشر الف ومئتان', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '1', '1', 'تحويل', NULL, NULL),
(143, 8, 59, 123, 1, 1, 2, 2, '', '1', '9000', 'تسعة الاف ربال فقط ', '16/03/2023', '01/04/2023', '31/03/2024', '', '1', '', '', '1', '1', '32', 'شيك', NULL, NULL),
(144, 8, 125, 120, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ريال فقط  ', '19/03/2023', '01/04/2023', '31/03/2024', '', '1', '', '', '2', '2', '1', 'شيك', '', ''),
(145, 8, 126, 118, 1, 1, 2, 2, '', '1', '1000', 'الف ريال ', '19/03/2023', '01/03/2023', '29/02/2024', '', '1', '', '', '2', '1', '1', 'شيك', NULL, NULL),
(146, 8, 127, 96, 1, 1, 2, 3, '', '1', '3000', 'ثلاثة الاف ريال ', '01/03/2023', '01/03/2023', '29/02/2024', '', '1', '', '', '2', '2', '1', 'شيك', NULL, NULL),
(147, 8, 129, 121, 1, 1, 2, 3, '', '1', '4000', 'اربعة الاف ريال ', '20/03/2023', '01/04/2023', '01/08/2024', 'تم تحصيل الشهر الاول مقدما بموجب شيك ', '1', '01/04/2023', '4', '2', '1', '1', 'شيك', '', ''),
(148, 8, 3, 5, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '22/03/2023', '01/04/2023', '31/03/2024', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(149, 8, 129, 98, 1, 1, 2, 3, '', '1', '3000', 'ثلاثة الاف ريال ', '18/01/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '2', '2', '1', 'شيك', NULL, NULL),
(150, 9, 52, 455, 1, 1, 4, 1, '', '1', '13200', 'ثلاثة عشر الف ومئتان ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '1', '1', 'تحويل', '', ''),
(151, 8, 82, 212, 1, 1, 5, 3, '', '1', '10000', 'عشر الاف ربال ', '28/02/2019', '01/03/2019', '29/02/2020', 'تم دفع الايجار مقدما', '1', '', '', '2', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(152, 9, 52, 226, 1, 1, 4, 1, '', '1', '8000', 'ثمن الاف ريال فقط ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(153, 9, 52, 456, 1, 1, 4, 1, '', '1', '13200', 'ثلاثة عشر الف ومئتان', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(154, 9, 52, 192, 1, 1, 4, 1, '', '1', '11000', 'احدى عشر الف ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '2', '1', 'تحويل', '', ''),
(155, 9, 52, 190, 1, 1, 4, 1, '', '1', '11500', 'احدى عشر الف وخمسمائة ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '2', '1', 'تحويل', '', ''),
(156, 8, 132, 28, 1, 1, 3, 3, '', '2', '4650', 'اربعة الاف وستمئة وخمسون', '01/01/2020', '01/01/2020', '31/12/2021', 'القيمية الايجارية تحول بدل اجور محامي', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(157, 8, 105, 5, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '29/04/2023', '01/05/2023', '30/04/2024', '', '1', '', '', '1', '1', '1', 'شيك', NULL, NULL),
(158, 8, 100, 124, 1, 1, 2, 2, '', '2', '10000', 'عشرة الاف ريال ', '01/02/2020', '01/02/2020', '01/04/2022', 'فترة سماح شهرين تسعة وعشرة ', '1', '01/09/2021', '2', '2', '2', '33', 'نقداً', '', ''),
(159, 8, 100, 124, 1, 1, 2, 2, '', '1', '9000', 'تسعة الاف ريال ', '01/02/2022', '01/02/2022', '01/02/2023', '', '1', '', '', '2', '2', '33', 'شيك', NULL, NULL),
(160, 8, 4, 5, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '01/01/2020', '01/01/2020', '31/12/2020', 'تم تنزل الايجار الشهري ل اربعة الاف وسبعمئة  اخر شهرين ', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(161, 8, 4, 5, 1, 1, 2, 3, '', '2', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2021', '01/01/2021', '31/12/2022', '', '1', '', '', '1', '1', '1', 'نقداً', NULL, NULL),
(162, 8, 4, 5, 4, 1, 2, 3, '4', '', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2023', '01/01/2023', '30/04/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(164, 5, 130, 126, 1, 1, 2, 1, '', '1', '3000', 'Three Thousands', '11/07/2023', '11/07/2023', '10/07/2024', '', '1', '', '', '1', '2', '...............', 'Cheques', '', ''),
(165, 5, 131, 311, 1, 1, 2, 3, '', '1', '3000', 'Three Thousands', '03/07/2023', '04/07/2023', '03/07/2024', '', '1', '', '', '1', '2', '...............', 'Cheques', '', ''),
(166, 5, 130, 471, 1, 1, 2, 3, '', '1', '2000', 'Two thousand ', '11/07/2023', '11/07/2023', '10/07/2024', '', '1', '', '', '2', '2', '1', 'Cheques', '', ''),
(167, 5, 3, 4, 1, 1, 2, 1, '', '1', '2000', 'Two Thao sand', '14/07/2023', '14/07/2023', '13/07/2024', '', '1', '', '', '1', '1', '1', 'Cheques', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `arcive_ownership`
--

CREATE TABLE `arcive_ownership` (
  `Owner_Ship_Id` int(11) NOT NULL,
  `owner_Owner_Id` int(11) NOT NULL,
  `zone_zone_Id` int(11) NOT NULL,
  `Owner_Ship_EN_Name` varchar(200) NOT NULL,
  `Owner_Ship_AR_Name` varchar(200) NOT NULL,
  `ownership_NO` varchar(200) NOT NULL,
  `Parcel_Area` varchar(200) DEFAULT NULL,
  `Bond_NO` varchar(200) DEFAULT NULL,
  `Bond_Date` varchar(200) DEFAULT NULL,
  `Street_NO` varchar(200) DEFAULT NULL,
  `Street_Name` varchar(200) DEFAULT NULL,
  `Land_Value` varchar(45) DEFAULT NULL,
  `Appreciation_octagon` varchar(200) DEFAULT NULL,
  `PIN_Number` varchar(200) NOT NULL,
  `owner_ship_Code` varchar(200) DEFAULT NULL,
  `owner_ship_Certificate_Image` varchar(200) NOT NULL,
  `owner_ship_Certificate_Image_Path` varchar(200) NOT NULL,
  `Property_Scheme_Image` varchar(200) NOT NULL,
  `Property_Scheme_Image_Path` varchar(200) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Mab_Url` varchar(200) DEFAULT NULL,
  `IsRealEsataeInvesment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arcive_ownership`
--

INSERT INTO `arcive_ownership` (`Owner_Ship_Id`, `owner_Owner_Id`, `zone_zone_Id`, `Owner_Ship_EN_Name`, `Owner_Ship_AR_Name`, `ownership_NO`, `Parcel_Area`, `Bond_NO`, `Bond_Date`, `Street_NO`, `Street_Name`, `Land_Value`, `Appreciation_octagon`, `PIN_Number`, `owner_ship_Code`, `owner_ship_Certificate_Image`, `owner_ship_Certificate_Image_Path`, `Property_Scheme_Image`, `Property_Scheme_Image_Path`, `Active`, `Mab_Url`, `IsRealEsataeInvesment`) VALUES
(4, 5, 8, 'Fereej Alghanim Hotel Apartments', 'شقق فندقية فريج الغانم ', '1', '1089', '119830', '', '852', 'شارع الأصمعي', '23826000', ' ', '06120023', '06/1', 'سند الغانم العتيق.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند الغانم العتيق.pdf', 'No File', 'No File', 0, 'https://goo.gl/maps/znuPdPCE1BeYzSF37', '0'),
(6, 5, 14, 'Fereej Abdulaziz Twin Buildings', 'عمارتين فريج عبدالعزيز', '1', '455', '66530', NULL, '920', 'شارع السليمي', '8571500', ' ', '14070007', '14/1', 'سند ومخطط فريج عبدالعزيز 2.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ومخطط فريج عبدالعزيز 2.pdf', 'No File', 'No File', 0, '', '0'),
(8, 5, 29, 'Bin Dirham Al Kubraa', 'بن درهم الكبرى', '2', '495', '30235', '', '816', 'شارع ضرار بن الخطاب', '10656000', ' ', '25680034', '25/2', 'سند ملكية رقم 30235 (بن درهم شيخ ).pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 30235 (بن درهم شيخ ).pdf', 'بن درهم الكبرى مخطط.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/بن درهم الكبرى مخطط.pdf', 0, 'No File', '0'),
(9, 5, 30, 'Al Najma Building AL Makhbez', 'عمارة النجمة المخبز', '3', '112', '42363', '', '930', 'شارع ابن الربيع', '1809000', ' ', '26230049', '26/3', 'سند ملكية النجمة المخبز.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية النجمة المخبز.pdf', 'النجمة المخبز مخطط.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/النجمة المخبز مخطط.pdf', 0, 'No File', '0'),
(10, 5, 30, 'Al Najma 2 Stores and Shop', 'عمارة دورين ومحل', '4', '216', '125846', '', '937', 'شارع بشر بن البراء', '3952500', ' ', '26240024', '26/4', 'سند ملكية عمارة دورين ومحل النجمة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية عمارة دورين ومحل النجمة .pdf', 'سند ملكية ومخطط رقم 125846.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 125846.pdf', 0, 'No File', '0'),
(11, 5, 30, ' Al Najma Shops', 'محلات النجمة', '5', '143', '52875', '', '938', 'شارع حارثة الخزاعي', '1350000', ' ', '26250005', '26/5', 'سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', 'سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', 0, 'No File', '0'),
(12, 5, 31, 'Sanyo', 'سانيو', '2', '285', '2773', NULL, '894', 'لشارع العدالة', '5804800', ' ', '27110015', '27/2', 'سند ومخطط سانيو..pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ومخطط سانيو..pdf', 'سند ومخطط سانيو..pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط سانيو..pdf', 0, '', '0'),
(13, 5, 31, 'HSBCc', 'أتش أس بي سي', '1', '641', '3709', '', '896', 'لشارع الحباب بن جبير', '13551450', ' ', '27070021', '27/1', 'مخطط و سند HSBC المنارة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/مخطط و سند HSBC المنارة.pdf', 'مخطط و سند HSBC المنارة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط و سند HSBC المنارة.pdf', 0, 'No File', '0'),
(14, 4, 31, 'Um Ghuwailina Hospital', 'أم غويلينة المستشفى', '3', '447', '12138', '', '880', 'شارع سميسمة', '8902200', ' ', '27230009', '27/3', 'سند ملكية ومخطط الصحي.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط الصحي.pdf', 'سند ملكية ومخطط الصحي.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط الصحي.pdf', 0, 'No File', '0'),
(15, 5, 31, 'Um Ghuwailina Al Sughra', 'أم غويلينة الصغرى', '5', '209', '2609', '', '810', 'شارع ابن الجوزي', '4050000', ' ', '27720003', '27/5', 'سند ملكية الصغرى.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية الصغرى.pdf', 'سند ملكية ومخطط رقم 2609.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 2609.pdf', 0, 'No File', '0'),
(16, 5, 31, 'Um Ghuwailina Al Jadida', 'أم غويلينة الجديدة', '7', '824', '4831', '', '940', 'شارع حارثة بن سهل', '15966000', ' ', '27800009', '27/7', 'سند ملكية ام غويلينة الجديدة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ام غويلينة الجديدة .pdf', 'سند ومخطط ام غ الجديدة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط ام غ الجديدة.pdf', 0, 'No File', '0'),
(17, 5, 31, 'Um Ghuwailina Al Kubraa', 'أم غويلينة الكبرى', '8', '917', '174368', '', '810', 'شارع ابن الجوزي', '16187700', ' ', '27870015', '27/8', 'سند ملكيةام غويلينة الكبرى .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكيةام غويلينة الكبرى .pdf', 'سند ومخطط الشوك والكبرى.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط الشوك والكبرى.pdf', 0, 'No File', '0'),
(18, 4, 37, 'Two Villas in Khalifa City North', 'فيلتان مدينة خليفة الشمالية', '1', '741', '43951', '', '884', 'شارع الظعاين', '4386800', ' ', '32080001', '32/1', 'سند ملكية ومخطط رقم43951.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط رقم43951.pdf', 'سند ملكية ومخطط رقم43951.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم43951.pdf', 0, 'No File', '0'),
(19, 5, 37, 'Villa Zawia', 'فيلا زاوية', '2', '372', '87709', NULL, '834', 'شارع غشام', '2002000', ' ', '32230029', '32/2', 'سند ملكية رقم 87709.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 87709.pdf', 'مخطط فيلا زاويا.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط فيلا زاويا.pdf', 0, '', '0'),
(20, 5, 37, 'Villas Yumna Wusta', 'فلل يمنى وسطى', '3', '739', '87710', NULL, '834', 'شارع غشام', '4375250', ' ', '32230030', '32/3', 'سند ملكية رقم 87710.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 87710.pdf', 'سند ملكية رقم 87710.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية رقم 87710.pdf', 0, '', '0'),
(21, 5, 37, 'Villas Sharqiat Gharbiat  Al Jamea', 'فلل شرقية غربية الجامعة', '4', '739', '26207', NULL, '980', 'شارع الرويس', '4375250', ' ', '32230035', '32/4', 'سند فيلا غربية شرقية م خ ش.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند فيلا غربية شرقية م خ ش.pdf', 'سند فيلا غربية شرقية م خ ش.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند فيلا غربية شرقية م خ ش.pdf', 0, '', '0'),
(22, 4, 37, 'Khalifa City Building  Al Wadhia', 'عمارة مدينة خليفة الوضيحية', '5', '737', '6228', NULL, '958', 'شارع الوضيحية', ' 4398900', ' ', '32240043', '32/5', '1سند  ومخطط ملكية عمارة مدينة خليفة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/1سند  ومخطط ملكية عمارة مدينة خليفة.pdf', 'سند ملكية عمارة مدينة خليفة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية عمارة مدينة خليفة.pdf', 0, '', '0'),
(23, 4, 37, 'Khalifa City North House', 'منزل مدينة خليفة الشمالية', '6', '648', '137108', NULL, '884', 'شارع الظعاين', ' 3836250', ' ', '32080034', '32/6', 'سند ملكية.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية.pdf', 'مخطط.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط.pdf', 0, '', '0'),
(24, 4, 40, ' Gharnata House', 'منزل غرناطة', '1', '1804', '143088', NULL, '925', 'شارع الانوار', ' 10679900', ' ', '34060042', '34/1', 'سند ملكية رقم 143088.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 143088.pdf', 'سند ملكية رقم 143088.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية رقم 143088.pdf', 0, '', '0'),
(25, 5, 40, 'House in front of Al Murur', 'منزل مقابل المرور', '2', '404', '25946', NULL, '810', 'شارع عمر بن عبدالعزيز', '2175500', ' ', '34300029', '34/2', 'سند ملكية مقابل المرور.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية مقابل المرور.pdf', 'سند ملكية مقابل المرور.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية مقابل المرور.pdf', 0, '', '0'),
(26, 5, 56, 'Two detached villas', 'فيلتان متلاصقتان', '1', '750', '42149', NULL, '903', 'شارع أحد', '3961000', ' ', '45014054', '45/1', 'سند فلل المطار.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند فلل المطار.pdf', 'مخطط فلل المطار.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط فلل المطار.pdf', 0, '', '0'),
(27, 5, 71, 'Western Villa', 'فيلا غربية', '1', '515', '81231', '', '836', 'شارع وادى السمريه', '2772000', ' ', '51610130', '51/1', 'سند ملكية ازغوى غربية .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ازغوى غربية .pdf', 'سند ومخطط ملكية رقم 81231.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط ملكية رقم 81231.pdf', 0, 'No File', '0'),
(29, 5, 71, 'Eastern Villa   ', 'فيلا شرقية', '2', '451', '81232', '', '836', 'شارع وادى السمريه', '2772000', ' ', '51610131', '51/2', 'سند ملكية رقم 81232.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 81232.pdf', 'مخطط 81232 فيلا شرقية.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط 81232 فيلا شرقية.pdf', 0, 'No File', '0'),
(35, 5, 72, 'Villa Ain Khaled ', 'فيلا عين خالد', '1', '1047', '43368', '', '452', 'شارع 452', '4580000', ' ', '56130046', '56/1', 'سند ملكية رقم 43368.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 43368.pdf', 'سند ملكية رقم 43368.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية رقم 43368.pdf', 0, 'No File', '0'),
(36, 4, 73, 'New Industrial Garage', 'كراج الصناعية الجديد', '2', '2413', 'لا يوجد', '', '51', '	شارع 51', '11733000', ' ', '57010371', '57/2', 'عقد ايجار بلدية  الصناعية.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/عقد ايجار بلدية  الصناعية.pdf', 'مخطط الصناعية .pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الصناعية .pdf', 0, 'No File', '0'),
(37, 5, 74, 'Palm Tower Offices', 'مكاتب برج النخلة', '1', '643', '113439', '', '810', 'شارع ام حصاه', '000', ' ', '60030014', '60/1', 'عقد بيع مكتب 4603.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/عقد بيع مكتب 4603.pdf', 'عقد بيع مكتب رقم  4604.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/عقد بيع مكتب رقم  4604.pdf', 0, 'No File', '0'),
(38, 5, 69, 'Villa Al Khaysa', 'فيلا الخيسة', '1', '600', '422181', NULL, '585', 'شارع 585', '2906100', ' ', '70093257', '70/1', 'سند ومخطط فيلا الخيسة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ومخطط فيلا الخيسة.pdf', 'سند ومخطط فيلا الخيسة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط فيلا الخيسة.pdf', 0, '', '0'),
(39, 4, 76, 'Al Qatifia Villas', 'فلل القطيفية', '1', '3067', '90250', '', '2', 'شارع الامير', '27013000', ' ', '66170565', '66/1', 'سند ملكية ومخطط رقم 90250.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط رقم 90250.pdf', 'سند ملكية ومخطط رقم 90250.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 90250.pdf', 0, 'No File', '0'),
(40, 5, 68, ' Al Ruweys Villas', 'فلل الرويس', '1', '1273', '403853', '', '961', 'شارع 961', '800000', ' ', '79050397', '79/1', 'سند ملكية الرويس.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية الرويس.pdf', 'مخطط الرويس.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الرويس.pdf', 0, 'No File', '0'),
(41, 5, 70, 'Villa Al Vakeer', 'فيلا الوكير', '1', '1019', '217469', NULL, '1200', 'شارع روضة الغزلانية', '300', ' ', '91060946', '91/1', 'سند الملكية والمخطط الوكير.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند الملكية والمخطط الوكير.pdf', 'سند الملكية والمخطط الوكير.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند الملكية والمخطط الوكير.pdf', 0, '', '0'),
(42, 9, 73, 'Garage 27th Street', 'جراج شارع 27', '1', '1100', 'لا يوجد  سند و رقم مساحي ', NULL, '27', 'شارع 27', '0', ' ', '57000000', '57/1', 'No File', 'No File', 'No File', 'No File', 0, '', '0'),
(43, 10, 76, 'Villa Al Dafna', 'فيلا الدفنة', '1', '1225', '81551', '', '	801', 'شارع ام الزبد', '7252300', ' ', '66160121', '66/1', 'سند ملكية فيلا الدفنة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية فيلا الدفنة.pdf', 'مخطط بيت الدفنة ٦٦١٦٠١٢١.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط بيت الدفنة ٦٦١٦٠١٢١.pdf', 0, 'No File', '0'),
(44, 11, 69, 'Ravdat Al Hamamah', 'روضة الحمامه', '2', '1281', '116182', NULL, '	1215', 'شارع 1215', '0', ' ', '70101529', '70/2', 'سند ملكية رقم 116182.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 116182.pdf', 'No File', 'No File', 0, '', '0'),
(45, 5, 67, 'vaill garaft al ryan', 'فيلا غرافة الريان ', '3', '450', '158462', '', '511', '', '1680000', ' ', '51258088', '51/3', 'سند ملكية فيلا غرافة الريان.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية فيلا غرافة الريان.pdf', 'مخطط 158462 فيلا غرافة الريان_pdf.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط 158462 فيلا غرافة الريان_pdf.pdf', 0, 'No File', '0'),
(46, 5, 69, 'Villa Alkheesa New', 'فيلا الخيسة جديدة ', '3', '542', '426990', '', '660', '', '1656600', ' ', '70061114', '70/3', 'سند ملكية الخيسة الجديدة  .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية الخيسة الجديدة  .pdf', 'مخطط الخيسة الجديدة  .pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الخيسة الجديدة  .pdf', 0, 'No File', '0'),
(47, 5, 71, 'Izghawa', 'ازغوى اسكان ', '4', '615', '104155', '', '52', 'جري الساعي ', '1565992', 'مثمن', '71080436', '71/4', 'سند ملكية ازغوى اسكان .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ازغوى اسكان .pdf', 'مخطط ازغوى اسكان 104155.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط ازغوى اسكان 104155.pdf', 0, 'No File', '0'),
(48, 5, 77, 'Al Gharafa Villa', 'الغرافة ', '5', '569', '463589', '', '839', 'رأس الغارية', '1565992', 'تقديري', '51610362', '51/5', 'سند ملكية فيلا الغرافة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية فيلا الغرافة .pdf', 'مخطط الغرافة  463589.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الغرافة  463589.pdf', 0, 'No File', '0'),
(49, 5, 69, 'Villa Al Kheesa School', 'الخيسة المدرسة', '4', '560', '467245', NULL, '174', '174', '2000000', 'مثمن', '70093624', '70/4', 'سند ملكيةالخيسة المدرسة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكيةالخيسة المدرسة .pdf', 'No File', 'No File', NULL, '', '0'),
(50, 5, 69, 'Villa Alkheesa Hajar', 'فيلا الخيسة حجر', '5', '540', '559799', '', '170', 'شارع 170', '2024064', 'مثمن', '70093653', '70/5', 'سند ملكيةفيلا الخيسة الجديدة 2_230513_105413.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكيةفيلا الخيسة الجديدة 2_230513_105413.pdf', 'No File', 'No File', 0, 'No File', '0'),
(51, 12, 13, 'Test Onexxxx', 'تجربة واحد', '01', '50000', '001', '', '01', 'St01', '1500000', 'مثمن', '13569645', '13/01', 'No File', 'No File', 'No File', 'No File', 0, 'No File', '0'),
(52, 5, 10, 'Test two', 'تجربة إثنان', '020', '5000', '02002', '20/10/2014', '20', 'ST20', '50000', 'مثمن', '12569658', '12/020', 'Jud 1.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/Jud 1.pdf', 'Wolfgang 1.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/Wolfgang 1.pdf', 0, 'No File', '0'),
(53, 9, 15, 'test Three', 'تجربة ثالثة', '030', '565656', '03003', '', '30', 'ST30', '5656565', ' ', '15696554', '15/030', 'No File', 'No File', 'No File', 'No File', 0, 'No File', '0'),
(54, 10, 25, 'Test Four Property', 'ملكية تجربة رابعة', '040', '600', '04004', '', '04', 'ST04', '400000', 'تقديري', '23659258', '23/040', 'No File', 'No File', 'No File', 'No File', 0, 'No File', '0');

-- --------------------------------------------------------

--
-- Table structure for table `arcive_units`
--

CREATE TABLE `arcive_units` (
  `Unit_ID` int(11) NOT NULL,
  `unit_condition_Unit_Condition_Id` int(11) NOT NULL,
  `unit_detail_Unit_Detail_Id` int(11) NOT NULL,
  `unit_type_Unit_Type_Id` int(11) NOT NULL,
  `building_Building_Id` int(11) NOT NULL,
  `furniture_case_Furniture_case_Id` int(11) NOT NULL,
  `Unit_Number` varchar(200) DEFAULT NULL,
  `Floor_Number` varchar(200) DEFAULT NULL,
  `Unit_Space` varchar(200) DEFAULT NULL,
  `current_situation` varchar(200) DEFAULT NULL,
  `Oreedo_Number` varchar(200) DEFAULT NULL,
  `Electricityt_Number` varchar(200) DEFAULT NULL,
  `Water_Number` varchar(200) DEFAULT NULL,
  `virtual_Value` varchar(200) DEFAULT NULL,
  `Image_One` varchar(200) DEFAULT NULL,
  `Image_One_Path` varchar(200) DEFAULT NULL,
  `Image_Two` varchar(200) DEFAULT NULL,
  `Image_Two_Path` varchar(200) DEFAULT NULL,
  `Image_Three` varchar(200) DEFAULT NULL,
  `Image_Three_Path` varchar(200) DEFAULT NULL,
  `Image_Four` varchar(200) DEFAULT NULL,
  `Image_Four_Path` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Image_One_Path_Website` varchar(200) DEFAULT NULL,
  `Image_Two_Path_Website` varchar(200) DEFAULT NULL,
  `Image_Three_Path_Website` varchar(200) DEFAULT NULL,
  `Image_Four_Path_Website` varchar(200) DEFAULT NULL,
  `Half` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `arcive_units`
--

INSERT INTO `arcive_units` (`Unit_ID`, `unit_condition_Unit_Condition_Id`, `unit_detail_Unit_Detail_Id`, `unit_type_Unit_Type_Id`, `building_Building_Id`, `furniture_case_Furniture_case_Id`, `Unit_Number`, `Floor_Number`, `Unit_Space`, `current_situation`, `Oreedo_Number`, `Electricityt_Number`, `Water_Number`, `virtual_Value`, `Image_One`, `Image_One_Path`, `Image_Two`, `Image_Two_Path`, `Image_Three`, `Image_Three_Path`, `Image_Four`, `Image_Four_Path`, `Active`, `Image_One_Path_Website`, `Image_Two_Path_Website`, `Image_Three_Path_Website`, `Image_Four_Path_Website`, `Half`) VALUES
(3, 1, 2, 1, 28, 4, '1', '1', '95', '', '', '١٠٨٦٩٧', '١٠٠٠٣٩٩', '5250', 'U_1.jpg', '/English/Main_Application/units_Photo/U_1.jpg', 'U_2.jpg', '/English/Main_Application/units_Photo/U_2.jpg', 'U_3.jpeg', '/English/Main_Application/units_Photo/U_3.jpeg', 'U_4.jpg', '/English/Main_Application/units_Photo/U_4.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_1.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_2.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_3.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_4.jpg', '0'),
(4, 1, 2, 1, 28, 4, '2', '1', '100', '', '', '١٠٨٩٦٩٨', '١٠٠٠٤٠٠', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0'),
(5, 1, 2, 1, 28, 4, '3', '1', '105', '', '', '1089699', '1000401', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(6, 1, 2, 1, 28, 4, '4', '1', '105', '', '', '1089700', '1000402', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(7, 1, 2, 1, 28, 4, '5', '2', '95', '', '', '1089701', '1000403', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(8, 1, 2, 1, 28, 4, '6', '2', '100', '', '', '1089702', '1000404', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(9, 1, 2, 1, 28, 1, '7', '2', '105', '', '', '1089703', '1000405', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(10, 1, 2, 1, 28, 1, '8', '2', '105', '', '', '1089704', '1000406', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(13, 1, 2, 1, 28, 4, '9', '3', '95', '', '', '1089705', '1000407', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(14, 1, 2, 1, 28, 4, '10', '3', '100', '', '', '1089706', '1000408', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(15, 1, 2, 1, 28, 4, '11', '3', '105', '', '', '1089707', '1000409', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(16, 1, 2, 1, 28, 1, '12', '3', '105', '', '', '1089708', '1000410', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(17, 1, 2, 1, 28, 4, '13', '4', '95', '', '', '1089710', '1000412', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(18, 1, 2, 1, 28, 4, '14', '4', '100', '', '', '1089711', '1000413', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(19, 1, 2, 1, 28, 1, '15', '4', '105', '', '', '1089712', '1000414', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(20, 1, 2, 1, 28, 4, '16', '4', '105', '', '', '1089713', '1000415', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(22, 1, 2, 1, 28, 4, '17', '5', '95', '', '', '1089714', '1000416', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(23, 1, 2, 1, 28, 1, '18', '5', '100', '', '', '1089715', '1000417', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(24, 1, 2, 1, 28, 4, '19', '5', '105', '', '', '1089715', '1000417', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(25, 1, 2, 1, 28, 1, '20', '5', '105', '', '', '1089717', '1000419', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(26, 1, 2, 1, 28, 4, '21', '6', '95', '', '', '1089718', '1000420', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(27, 1, 2, 1, 28, 4, '22', '6', '100', '', '', '1089719', '1000421', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(28, 1, 2, 1, 28, 4, '23', '6', '105', '', '', '1089720', '1000422', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(29, 1, 2, 1, 28, 4, '24', '6', '105', '', '', '1089721', '1000423', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(30, 1, 2, 1, 28, 4, '25', '7', '95', '', '', '1089722', '1000424', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(31, 1, 2, 1, 25, 1, '26', '7', '100', '', '', '1089723', '1000425', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(32, 1, 2, 1, 28, 4, '27', '7', '105', '', '', '1089723', 'مشمول في 25', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(33, 1, 2, 1, 28, 4, '28', '7', '105', '', '', '1089722', 'مشمول في 26', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(34, 5, 3, 5, 28, 4, '29', '8', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(35, 1, 4, 1, 8, 2, '104', '1', '128', '', '', '1261803', '1217640', '4000', 'U_5.jpg', '/English/Main_Application/units_Photo/U_5.jpg', 'U_6.jpg', '/English/Main_Application/units_Photo/U_6.jpg', 'U_7.jpg', '/English/Main_Application/units_Photo/U_7.jpg', 'U_8.jpeg', '/English/Main_Application/units_Photo/U_8.jpeg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_5.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_6.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_7.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_8.jpeg', '0'),
(36, 1, 4, 1, 8, 1, '105', '1', '128', '', '', '1261801', '1217687', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(37, 1, 4, 1, 8, 1, '204', '2', '128', '', '', '1261802', '1217688', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(38, 1, 4, 1, 8, 1, '205', '2', '128', '', '', '1261803', '1217689', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(39, 1, 4, 1, 8, 1, '304', '3', '128', '', '', '1261804', '1217690', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(40, 1, 4, 1, 8, 1, '305', '3', '128', '', '', '1261805', '1217691', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(41, 1, 4, 1, 8, 1, '404', '4', '128', '', '', '1261806', '1217692', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(42, 1, 4, 1, 8, 1, '405', '4', '128', '', '', '1261807', '1217693', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(43, 1, 4, 1, 8, 1, '504', '5', '128', '', '', '1261808', '1217694', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(44, 1, 4, 1, 8, 1, '505', '5', '128', '', '', '1261809', '1217695', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(45, 1, 4, 1, 8, 1, '604', '6', '128', '', '', '1261810', '1217696', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(46, 1, 4, 1, 8, 1, '605', '6', '128', '', '', '1261811', ' 1217697', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(47, 1, 6, 1, 8, 2, '101', '1', '64', '', '', '1261800', '1217637', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(48, 1, 6, 1, 8, 2, '102', '1', '64', '', '', '1261801', '1217638', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(49, 1, 6, 1, 8, 2, '103', '1', '64', '', '', '1261802', '1217639', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(50, 1, 6, 1, 8, 1, '106', '1', '64', '', '', '1261815', '1217701', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(51, 1, 6, 1, 8, 1, '107', '1', '64', '', '', '1261816', '1217702', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(52, 1, 6, 1, 8, 1, '108', '1', '64', '', '', '1261817', '1217703', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(53, 1, 6, 1, 8, 1, '201', '2', '64', '', '', '1261818', '1217704', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(54, 1, 6, 1, 8, 1, '202', '2', '64', '', '', '1261819', '1217705', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(55, 1, 6, 1, 8, 1, '203', '2', '64', '', '', '1261820', '1217706', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(56, 1, 6, 1, 8, 1, '206', '2', '64', '', '', '1261821', '1217707', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(57, 1, 6, 1, 8, 1, '207', '2', '64', '', '', '1261822', '1217708', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(58, 1, 6, 1, 8, 1, '208', '2', '64', '', '', '1261823', '1217709', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(59, 1, 6, 1, 8, 1, '301', '3', '64', '', '', '1261824', '1217710', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(60, 1, 6, 1, 8, 1, '302', '3', '64', '', '', '1261825', '1217711', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(61, 1, 6, 1, 8, 1, '303', '3', '64', '', '', '1261826', '1217712', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(62, 1, 6, 1, 8, 1, '306', '3', '64', '', '', '1261827', '1217713', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(63, 1, 6, 1, 8, 1, '307', '3', '64', '', '', '1261828', '1217714', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(64, 1, 6, 1, 8, 1, '308', '3', '64', '', '', '1261829', '1217715', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(65, 1, 6, 1, 8, 1, '401', '4', '64', '', '', '1261830', '1217716', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(66, 1, 6, 1, 8, 1, '402', '4', '64', '', '', '1261833', '1217719', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(67, 1, 6, 1, 8, 1, '403', '4', '64', '', '', '1261834', '1217720', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(68, 1, 6, 1, 8, 1, '406', '4', '64', '', '', '1261835', '1217721', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(69, 1, 6, 1, 8, 1, '407', '4', '64', '', '', '1261836', '1217722', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(70, 1, 6, 1, 8, 1, '408', '4', '64', '', '', '1261837', '1217723', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(71, 1, 6, 1, 8, 1, '501', '5', '64', '', '', '1261838', '1217724', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(72, 1, 6, 1, 8, 1, '502', '5', '64', '', '', '1261839', '1217725', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(73, 1, 6, 1, 8, 1, '503', '5', '64', '', '', '1261840', '1217726', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(74, 1, 6, 1, 8, 1, '506', '5', '64', '', '', '1261841', '1217727', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(75, 1, 6, 1, 8, 1, '507', '5', '64', '', '', '1261842', '1217728', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(76, 1, 6, 1, 8, 1, '508', '5', '64', '', '', '1261843', '1217729', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(77, 1, 6, 1, 8, 1, '601', '6', '64', '', '', '1261844', '1217730', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(78, 1, 6, 1, 8, 1, '602', '6', '64', '', '', '1261845', '1217731', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(79, 1, 6, 1, 8, 1, '603', '6', '64', '', '', '1261846', '1217732', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(80, 1, 6, 1, 8, 1, '606', '6', '64', '', '', '1261847', '1217733', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(81, 1, 6, 1, 8, 1, '607', '6', '64', '', '', '1261831', '1217717', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(82, 1, 6, 1, 8, 1, '608', '6', '64', '', '', '1261832', '1217718', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(83, 1, 7, 2, 8, 1, '49', '1', '40', '', '', '1262790', '1217627', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(84, 1, 7, 2, 8, 1, '50', '1', '40', '', '', '1262791', '1217628', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(85, 1, 7, 2, 8, 1, '51', '1', '40', '', '', '1262792', '1217629', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(86, 1, 7, 2, 8, 1, '52', '1', '40', '', '', '1262793', '1217630', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(87, 1, 7, 2, 8, 1, '53', '1', '40', '', '', '1262794', '1217631', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(88, 1, 7, 2, 8, 1, '54', '1', '40', '', '', '1262795', '1217632', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(89, 1, 7, 2, 8, 1, '55', '1', '40', '', '', '1262796', '1217633', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(90, 1, 7, 2, 8, 1, '56', '1', '40', '', '', '1262797', '1217634', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(91, 1, 7, 2, 8, 1, '57', '1', '40', '', '', '1262798', '1217635', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(92, 1, 7, 2, 8, 1, '58', '1', '40', '', '', '1262799', '1217636', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(93, 1, 8, 1, 11, 1, '1', '1', '100', '', '', '125148', '91966', '3800', 'U_9.jpg', '/English/Main_Application/units_Photo/U_9.jpg', 'U_10.jpg', '/English/Main_Application/units_Photo/U_10.jpg', 'U_11.jpg', '/English/Main_Application/units_Photo/U_11.jpg', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_9.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_10.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_11.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', '0'),
(94, 1, 8, 1, 11, 1, '2', '1', '100', '', '', '125149', '91965', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(95, 1, 8, 1, 11, 1, '3', '2', '100', '', '', '125149', '91967', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(96, 1, 8, 1, 11, 1, '4', '2', '100', '', '', '125150', '91968', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(97, 1, 8, 1, 11, 1, '5', '3', '100', '', '', '125151', '91969', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(98, 1, 8, 1, 11, 1, '6', '3', '100', '', '', '125152', '91970', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(99, 1, 4, 1, 18, 1, '1', '1', '310', 'رقم المبنى 80', '', '1251073', '1191369', '3800', 'U_3.jpeg', '/English/Main_Application/units_Photo/U_3.jpeg', 'U_2.jpg', '/English/Main_Application/units_Photo/U_2.jpg', 'U_11.jpg', '/English/Main_Application/units_Photo/U_11.jpg', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_3.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_2.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_11.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', '0'),
(100, 1, 4, 1, 18, 1, '2', '1', '160', 'رقم المبنى 80', '', '1251074', '1191370', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(101, 1, 4, 1, 18, 1, '3', '1', '310', 'رقم المبنى 80', '', '1251075', '1191371', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(102, 1, 4, 1, 18, 1, '4', '1', '160', 'رقم المبنى 80 شقة أرضية', '', '', '', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(103, 1, 2, 1, 19, 2, '1', '1', '120', '', '', '1181983', '1152740', '5250', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 'U_3.jpeg', '/English/Main_Application/units_Photo/U_3.jpeg', 'U_8.jpeg', '/English/Main_Application/units_Photo/U_8.jpeg', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_3.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_8.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', '0'),
(104, 1, 2, 1, 19, 2, '2', '1', '125', '', '', '1181984', '1152741', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(105, 1, 2, 1, 19, 2, '3', '2', '120', '', '', '1181985', '1152742', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(106, 1, 2, 1, 19, 2, '4', '2', '125', '', '', '1181986', '1152743', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(107, 1, 2, 1, 19, 2, '5', '3', '120', '', '', '1181987', '1152744', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(108, 1, 2, 1, 19, 2, '6', '3', '125', '', '', '1181988', '1152745', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(109, 1, 2, 1, 19, 2, '7', '4', '120', '', '', '1181989', '1152746', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(110, 1, 2, 1, 19, 2, '8', '4', '125', '', '', '1181990', '1152747', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(111, 1, 2, 1, 19, 2, '9', '5', '120', '', '', '1181991', '1152748', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(112, 1, 2, 1, 19, 2, '10', '5', '125', '', '', '1181992', '1152749', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(113, 1, 2, 1, 19, 2, '11', '6', '120', '', '', '1181993', '1152750', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(114, 1, 2, 1, 19, 2, '12', '6', '125', '', '', '1181994', '1152751', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(115, 1, 8, 1, 20, 3, '1', '1', '60', '', '', '1183418', '1152805', '3000', 'U_4.jpg', '/English/Main_Application/units_Photo/U_4.jpg', 'U_5.jpg', '/English/Main_Application/units_Photo/U_5.jpg', 'U_6.jpg', '/English/Main_Application/units_Photo/U_6.jpg', 'U_7.jpg', '/English/Main_Application/units_Photo/U_7.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_4.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_5.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_6.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_7.jpg', '0'),
(116, 1, 8, 1, 20, 3, '2', '2', '60', '', '', '1183418', '1152805', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(117, 1, 8, 1, 20, 1, '3', '3', '60', '', '', '1183418', '1152805', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(118, 1, 5, 2, 22, 1, '1', '1', '15', '', '', '103724', '', '1000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(119, 1, 8, 1, 22, 1, '2', '1', '95', '', '', '90580', '64118', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(120, 1, 8, 1, 22, 1, '3', '1', '95', '', '', '90579', '64118', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(121, 1, 5, 6, 22, 1, '4', '1', '110', '', '', '7948', '64118', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(122, 1, 5, 2, 23, 1, '1', '1', '40', '', '', '1183414', '1146795', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0');
INSERT INTO `arcive_units` (`Unit_ID`, `unit_condition_Unit_Condition_Id`, `unit_detail_Unit_Detail_Id`, `unit_type_Unit_Type_Id`, `building_Building_Id`, `furniture_case_Furniture_case_Id`, `Unit_Number`, `Floor_Number`, `Unit_Space`, `current_situation`, `Oreedo_Number`, `Electricityt_Number`, `Water_Number`, `virtual_Value`, `Image_One`, `Image_One_Path`, `Image_Two`, `Image_Two_Path`, `Image_Three`, `Image_Three_Path`, `Image_Four`, `Image_Four_Path`, `Active`, `Image_One_Path_Website`, `Image_Two_Path_Website`, `Image_Three_Path_Website`, `Image_Four_Path_Website`, `Half`) VALUES
(123, 1, 5, 2, 23, 1, '2', '1', '38', '', '', '1183415', '1146796', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0'),
(124, 1, 5, 2, 23, 1, '3', '1', '38', '', '', '1183416', '1146797', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0'),
(125, 1, 6, 1, 25, 2, '1', '1', '40', '', '', '1219305', '1116069', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(126, 1, 6, 1, 25, 2, '2', '1', '40', '', '', '1219306', '1116070', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(127, 1, 6, 1, 25, 2, '3', '1', '40', '', '', '1219307', '1116071', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(128, 1, 6, 1, 25, 2, '4', '1', '40', '', '', '1219308', '1116072', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(129, 1, 6, 1, 25, 2, '5', '1', '40', '', '', '1219309', '1116073', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(130, 1, 6, 1, 25, 2, '6', '1', '40', '', '', '1219310', '1116074', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(131, 1, 6, 1, 25, 2, '7', '1', '40', '', '', '1219311', '1116075', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(132, 1, 6, 1, 25, 2, '8', '1', '40', '', '', '1219312', '1116076', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(133, 1, 6, 1, 25, 2, '9', '1', '40', '', '', '1219313', '1116077', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(134, 1, 2, 1, 26, 4, '1', '1', '95', '', '', '1160690', '1099848', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(135, 1, 2, 1, 26, 4, '2', '1', '105', '', '', '1160691', '1099849', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(136, 1, 2, 1, 26, 4, '3', '2', '95', '', '', '1160692', '1099850', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(137, 1, 2, 1, 26, 4, '4', '2', '105', '', '', '1160693', '1099851', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(138, 1, 2, 1, 26, 4, '5', '3', '95', '', '', '1160694', '1099852', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(139, 1, 2, 1, 26, 4, '6', '3', '105', '', '', '1160695', '1099853', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(140, 1, 2, 1, 26, 4, '7', '4', '95', '', '', '1160696', '1099854', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(141, 1, 2, 1, 26, 4, '8', '4', '105', '', '', '1160697', '1099855', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(142, 1, 2, 1, 26, 4, '9', '5', '95', '', '', '1160698', '1099856', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(143, 1, 2, 1, 26, 4, '10', '5', '105', '', '', '1160699', '1099857', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(144, 1, 8, 1, 27, 1, '1', '1', '50', '', '', '183296', '152797', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(145, 1, 8, 1, 27, 1, '2', '1', '50', '', '', '183297', '152799', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(146, 1, 8, 1, 27, 1, '3', '2', '50', '', '', '183298', '152800', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(147, 1, 8, 1, 27, 1, '4', '2', '50', '', '', '183299', '152801', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(148, 1, 8, 1, 27, 1, '5', '3', '50', '', '', '183300', '152802', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(149, 1, 8, 1, 27, 1, '6', '3', '50', '', '', '183301', '152803', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(150, 1, 4, 1, 29, 4, '1', '1', '95', '', '', '1026715', '940651', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(151, 1, 4, 1, 29, 2, '2', '1', '85', '', '', '1026716', '940652', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(152, 1, 4, 1, 29, 4, '3', '1', '95', '', '', '1026717', '940653', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(153, 1, 4, 1, 29, 4, '4', '1', '85', '', '', '1026718', '940654', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(154, 1, 4, 1, 29, 4, '5', '1', '95', '', '', '1026719', '940655', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(155, 1, 4, 1, 29, 4, '6', '1', '85', '', '', '1026720', '940656', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(156, 1, 4, 1, 29, 4, '7', '1', '95', '', '', '1026721', '940657', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(157, 1, 4, 1, 29, 4, '8', '1', '85', '', '', '1026722', '940658', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(158, 1, 4, 1, 29, 4, '9', '1', '95', '', '', '1026723', '940659', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(159, 1, 4, 1, 29, 4, '10', '1', '85', '', '', '1026724', '940660', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(160, 1, 4, 1, 29, 4, '11', '1', '95', '', '', '1026725', '940661', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(161, 1, 4, 1, 29, 4, '12', '1', '85', '', '', '1026726', '940662', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(162, 1, 4, 1, 29, 4, '13', '1', '95', '', '', '1026727', '940663', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(163, 1, 4, 3, 29, 1, '14', '1', '85', 'استخدام مالك', '', '1026727', '940663', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(164, 1, 3, 5, 29, 4, '15', '1', '', '', '', '', '', '1000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(165, 1, 3, 5, 29, 0, '16', '1', '', '', '', '', '', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(166, 1, 5, 8, 29, 0, '17', '1', '', 'السطح العلوي', '', '', '', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(167, 1, 12, 1, 30, 1, '1', '1', '100', '', '', '1323058', '1245258', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(168, 1, 6, 1, 30, 1, '2', '1', '60', '', '', '1323059', '1245259', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(169, 1, 4, 1, 30, 1, '3', '1', '100', '', '', '1323060', '1245260', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(170, 1, 4, 1, 30, 1, '4', '1', '100', '', '', '1323061', '1245261', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(171, 1, 6, 1, 30, 1, '5', '1', '60', '', '', '1323062', '1245262', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(172, 1, 4, 1, 30, 1, '6', '1', '100', '', '', '1323063', '1245263', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(173, 1, 4, 1, 30, 1, '7', '1', '100', '', '', '1323064', '1245264', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(174, 1, 6, 1, 30, 1, '8', '1', '60', '', '', '1323065', '1245265', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(175, 1, 4, 1, 30, 1, '9', '1', '100', '', '', '1323066', '1245266', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(176, 1, 4, 1, 30, 1, '10', '1', '100', '', '', '1323067', '1245267', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(177, 1, 6, 1, 30, 1, '11', '1', '60', '', '', '1323068', '1245268', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(178, 1, 4, 1, 30, 1, '12', '1', '100', '', '', '1323069', '1245269', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(179, 1, 4, 1, 30, 1, '13', '1', '100', '', '', '1323070', '1245270', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(180, 1, 6, 1, 30, 1, '14', '1', '60', '', '', '1323071', '1245271', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(181, 1, 4, 1, 30, 1, '15', '1', '100', '', '', '1323072', '1245272', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(182, 1, 2, 1, 30, 1, '16', '1', '130', '', '', '1323073', '1245273', '5700', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(183, 1, 2, 1, 30, 1, '17', '1', '130', '', '', '1323074', '1245274', '5700', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(184, 1, 3, 8, 8, 3, '18', '1', '5454', 'غرفة سطح ', '', '', '', '9999', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(185, 1, 5, 4, 31, 4, '1', '1', '', '', '', '1218993', '1159998', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(186, 1, 5, 4, 31, 4, '2', '1', '', '', '', '1218994', '1160000', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(187, 1, 5, 2, 31, 1, '3', '1', '', '', '', '', '', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(188, 1, 4, 4, 32, 3, '1', '1', '', '', '', '85999', '59387', '3500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(189, 1, 5, 4, 33, 4, '1', '1', '', 'فيلا يمنى', '', '164915', '125816', '13000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(190, 1, 5, 4, 33, 4, '2', '1', '', 'فيلا وسطى ', '', '164915', '125816', '13000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(191, 1, 5, 4, 34, 4, '45', '1', '', 'فيلا شرقية ', '', '1052468', '962922', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(192, 1, 5, 4, 34, 4, '47', '1', '', 'فيلا غربية ', '', '1052469', '', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(193, 1, 6, 1, 35, 2, '1', '2', '60', '', '', '1355145', '1286330', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(194, 1, 4, 1, 35, 2, '2', '2', '84', '', '', '1355146', '1286331', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(195, 1, 4, 1, 35, 2, '3', '2', '', '', '', '1355147', '1286332', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(196, 1, 4, 1, 35, 2, '4', '2', '', '', '', '1355148', '1286333', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(197, 1, 6, 1, 35, 2, '5', '2', '60', '', '', '1355149', '1286334', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(198, 1, 4, 1, 35, 2, '6', '2', '84', '', '', '1355150', '1286335', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(199, 1, 4, 1, 35, 2, '7', '2', '', '', '', '1355151', '1286336', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(200, 1, 4, 1, 35, 2, '8', '2', '', '', '', '1355152', '1286337', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(201, 1, 7, 2, 35, 1, '1', '1', '54', '', '', '1355139', '1286324', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(202, 1, 7, 2, 35, 1, '2', '1', '48', '', '', '1355140', '1286325', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(203, 1, 7, 2, 35, 1, '3', '1', '48', '', '', '1355141', '1286326', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(204, 1, 7, 2, 35, 1, '4', '1', '58', '', '', '1355142', '1286327', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(205, 1, 7, 2, 35, 1, '5', '1', '58', '', '', '1355143', '1286328', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(206, 1, 7, 2, 35, 1, '6', '1', '58', 'مؤجر ', '', '1355144', '1286329', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(207, 1, 3, 8, 35, 4, '7', '1', '', 'استخدام شركة  ', '', '', '', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(208, 1, 5, 6, 36, 3, '1', '1', '750', '', '', '24063', '', '13000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(209, 1, 5, 6, 37, 4, '1', '1', '', '', '', '46176', '78202', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(210, 1, 5, 6, 37, 4, '2', '1', '', '', '', '', '', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(211, 1, 5, 6, 37, 4, '3', '1', '', '', '', '', '', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(212, 1, 5, 6, 38, 4, '3', '1', '', '', '', '55958', '33568', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(215, 1, 5, 4, 40, 4, '1', '1', '', '', '', '1055459', '966396', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(216, 1, 5, 4, 41, 1, '86', '1', '450', '', '', '1060966', '970330', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(217, 1, 5, 4, 42, 4, '1', '1', '1060', '', '', '119612', '1073819', '25000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(219, 1, 5, 11, 44, 0, '1', '1', '', '', '', '128624', '104618', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(220, 1, 5, 4, 45, 4, '1', '1', '', '', '', '178907', '137757', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(226, 1, 5, 4, 47, 1, '1', '1', '1200', '', '', '1044652', '959164', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(227, 1, 5, 12, 48, 1, '1', '1', '', 'Vacant land ', '', '', '', '2000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(228, 1, 5, 4, 49, 1, '1', '1', '310', ' ', '', '1057331', '966696', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(229, 1, 5, 4, 49, 1, '2', '1', '310', ' ', '', '1057331', '966696', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(230, 1, 5, 4, 49, 1, '3', '1', '310', ' ', '', '1057331', '966696', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(231, 1, 10, 4, 50, 4, '1', '1', '', '', '', '1361895', '1291269', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(232, 1, 5, 3, 51, 1, '4603', '46', '15', '', '', '1056105', '9977132', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(233, 1, 5, 3, 51, 1, '4604', '46', '15', '', '', '1056105', '9977132', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(234, 1, 5, 3, 51, 1, '4605', '46', '15', '', '', '1056106', '997134', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(235, 1, 9, 1, 52, 2, '1', '1', '150', '', '', '1361055', '1290733', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(236, 1, 9, 1, 52, 2, '2', '1', '150', '', '', '1361056', '1290734', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(237, 1, 9, 1, 52, 2, '3', '2', '150', '', '', '1361057', '1290735', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(238, 1, 9, 1, 52, 2, '4', '2', '150', '', '', '1361058', '1290736', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(239, 1, 9, 1, 52, 2, '5', '3', '150', '', '', '1361059', '1290737', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(241, 1, 9, 1, 52, 2, '6', '3', '150', '', '', '1361060', '1290738', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(242, 1, 9, 1, 52, 2, '7', '4', '150', '', '', '1361061', '1290739', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(243, 1, 9, 1, 52, 2, '8', '4', '150', '', '', '1361062', '1290740', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(244, 1, 9, 1, 52, 2, '9', '5', '150', '', '', '1361063', '1290741', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(245, 1, 9, 1, 52, 2, '10', '5', '150', '', '', '1361064', '1290742', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(246, 1, 9, 1, 52, 2, '11', '6', '150', '', '', '1361065', '1290743', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(247, 1, 9, 1, 52, 2, '12', '6', '150', '', '', '1361066', '1290744', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(248, 1, 5, 8, 39, 1, '3', '2', '50', 'السطح العلوي ', '', '', '', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(252, 1, 5, 4, 54, 1, '1', '1', '', '', '', '1184490', '1151756', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(257, 1, 5, 4, 39, 1, '35', '1', '377', '', '', '1007565	', '908027', '10000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(258, 1, 5, 4, 39, 1, '33', '1', '377', '', '', '1007564', '908026', '10000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(260, 1, 2, 1, 62, 4, '1', '1', '', '', '', '١٠٨٦٩٧', '١٠٠٠٣٩٩', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(261, 1, 8, 1, 63, 4, '1', '1', '', '', '', '125148', '91966', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(262, 1, 8, 1, 63, 1, '3', '1', '', '', '', '125149', '91967', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(263, 1, 8, 1, 63, 1, '5', '1', '', '', '', '125151', '91969', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(264, 1, 8, 1, 63, 1, '6', '1', '', '', '', '125152', '91970', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(265, 1, 2, 1, 64, 4, '2', '1', '', '', '', '١٠٨٩٦٩٨', '١٠٠٠٤٠٠', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(266, 1, 2, 1, 64, 4, '26', '7', '', '', '', '1089723', '1000425', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(267, 1, 2, 1, 64, 4, '27', '7', '', '', '', '1089723', 'مشمول في 25', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(268, 1, 2, 1, 65, 4, '10', '3', '', '', '', '1089706', '1000408', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(269, 1, 2, 1, 65, 4, '14', '4', '', '', '', '1089711', '1000413', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1');
INSERT INTO `arcive_units` (`Unit_ID`, `unit_condition_Unit_Condition_Id`, `unit_detail_Unit_Detail_Id`, `unit_type_Unit_Type_Id`, `building_Building_Id`, `furniture_case_Furniture_case_Id`, `Unit_Number`, `Floor_Number`, `Unit_Space`, `current_situation`, `Oreedo_Number`, `Electricityt_Number`, `Water_Number`, `virtual_Value`, `Image_One`, `Image_One_Path`, `Image_Two`, `Image_Two_Path`, `Image_Three`, `Image_Three_Path`, `Image_Four`, `Image_Four_Path`, `Active`, `Image_One_Path_Website`, `Image_Two_Path_Website`, `Image_Three_Path_Website`, `Image_Four_Path_Website`, `Half`) VALUES
(270, 1, 2, 1, 65, 4, '17', '5', '', '', '', '1089714', '1000416', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(271, 1, 2, 1, 65, 4, '18', '1', '', '', '', '1089715', '1000417', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(272, 1, 2, 1, 65, 4, '19', '5', '', '', '', '1089715', '1000417', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(273, 1, 2, 1, 65, 4, '23', '6', '', '', '', '1089720', '1000422', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(274, 1, 2, 1, 65, 4, '25', '7', '', '', '', '1089722', '1000424', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(275, 1, 2, 1, 65, 4, '28', '7', '', '', '', '1089722', 'مشمول في 26', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(276, 1, 5, 4, 66, 4, '1', '1', '', '', '', '1218993', '1159998', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(277, 1, 5, 4, 66, 4, '2', '1', '', '', '', '1218994', '1160000', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(278, 1, 8, 1, 67, 1, '2', '1', '', '', '', '125149', '91965', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(279, 1, 8, 1, 67, 1, '3', '1', '', '', '', '125149', '91967', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(280, 1, 8, 1, 67, 1, '5', '1', '', '', '', '125151', '91969', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(281, 1, 2, 1, 68, 4, '2', '1', '', '', '', '١٠٨٩٦٩٨', '١٠٠٠٤٠٠', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(282, 1, 2, 1, 68, 4, '26', '7', '', '', '', '1089723', '1000425', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(283, 1, 2, 1, 68, 4, '27', '7', '', '', '', '1089723', 'مشمول في 25', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(284, 1, 8, 1, 69, 3, '1', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(285, 1, 8, 1, 69, 3, '2', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(286, 1, 8, 1, 69, 1, '3', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(287, 1, 8, 1, 70, 3, '1', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(288, 1, 8, 1, 70, 3, '2', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(289, 1, 8, 1, 70, 1, '3', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(290, 1, 4, 1, 71, 4, '1', '1', '', '', '', '1026715', '940651', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(291, 1, 4, 1, 71, 2, '2', '1', '', '', '', '1026716', '940652', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(292, 1, 4, 1, 71, 4, '3', '1', '', '', '', '1026717', '940653', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(293, 1, 4, 1, 71, 4, '4', '1', '', '', '', '1026718', '940654', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(294, 1, 4, 1, 71, 4, '5', '1', '', '', '', '1026719', '940655', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(295, 1, 4, 1, 71, 4, '6', '1', '', '', '', '1026720', '940656', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(296, 1, 4, 1, 71, 4, '7', '1', '', '', '', '1026721', '940657', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(297, 1, 4, 1, 71, 4, '8', '1', '', '', '', '1026722', '940658', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(298, 1, 4, 1, 71, 4, '9', '1', '', '', '', '1026723', '940659', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(299, 1, 4, 1, 71, 4, '10', '1', '', '', '', '1026724', '940660', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(300, 1, 4, 1, 71, 4, '11', '1', '', '', '', '1026725', '940661', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(301, 1, 7, 2, 72, 1, '49', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(302, 1, 7, 2, 72, 1, '50', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(303, 1, 7, 2, 72, 1, '51', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(304, 1, 7, 2, 72, 1, '52', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(305, 1, 7, 2, 72, 1, '53', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(306, 1, 7, 2, 72, 1, '54', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(307, 1, 7, 2, 72, 1, '55', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(308, 1, 7, 2, 72, 1, '56', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(309, 1, 7, 2, 72, 1, '57', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(310, 1, 7, 2, 72, 1, '58', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(311, 1, 5, 5, 52, 1, '13', '0', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(312, 1, 5, 5, 19, 4, '13', '0', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(313, 1, 4, 1, 73, 4, '1', '1', '', 'رقم المبنى 80', '', '1251073', '1191369', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(314, 1, 4, 1, 73, 4, '2', '1', '', 'رقم المبنى 80', '', '1251074', '1191370', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(315, 1, 4, 1, 73, 1, '3', '1', '', 'رقم المبنى 80', '', '1251075', '1191371', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(316, 1, 4, 1, 74, 4, '1', '1', '', 'رقم المبنى 80', '', '1251073', '1191369', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(317, 1, 4, 1, 74, 4, '2', '1', '', 'رقم المبنى 80', '', '1251074', '1191370', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(318, 1, 4, 1, 74, 1, '3', '1', '', 'رقم المبنى 80', '', '1251075', '1191371', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(319, 1, 4, 1, 75, 4, '1', '1', '', 'رقم المبنى 80', '', '1251073', '1191369', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(320, 1, 4, 1, 75, 4, '2', '1', '', 'رقم المبنى 80', '', '1251074', '1191370', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(321, 1, 4, 1, 75, 1, '3', '1', '', 'رقم المبنى 80', '', '1251075', '1191371', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(322, 1, 10, 4, 76, 4, '1', '1', '0', 'مؤجر ', '', '1145485', '1078480', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(323, 1, 3, 4, 32, 4, '2', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(324, 1, 3, 4, 32, 4, '3', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(325, 1, 3, 4, 32, 4, '4', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(326, 1, 3, 4, 32, 4, '5', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(327, 1, 13, 8, 32, 4, '6', '2', '', '', '', '', '', '1500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(328, 1, 2, 1, 77, 4, '7', '5', '', '', '', '1089703', '1000405', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(329, 1, 2, 1, 77, 4, '16', '4', '', '', '', '1089713', '1000415', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(332, 1, 10, 4, 79, 3, '1', '1', '', 'متابعة ', '', '', '', '13000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, NULL),
(333, 1, 10, 4, 80, 3, '1', '1', '', '', '', '', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, NULL),
(334, 1, 10, 4, 81, 3, '1', '1', '', '', '', '', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, NULL),
(335, 1, 5, 4, 84, 4, '35', '1', '', '', '', '1007565	', '908027', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(336, 1, 5, 4, 84, 4, '33', '1', '', '', '', '1007564', '908026', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(337, 1, 5, 4, 85, 4, '35', '1', '', '', '', '1007565	', '908027', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(338, 1, 5, 4, 85, 4, '33', '1', '', '', '', '1007564', '908026', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(339, 1, 5, 6, 86, 4, '1', '1', '', '', '', '46176', '78202', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(340, 1, 5, 6, 86, 4, '2', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(341, 1, 5, 6, 86, 4, '3', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(342, 1, 5, 6, 87, 4, '1', '1', '', '', '', '46176', '78202', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(343, 1, 5, 6, 87, 4, '2', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(344, 1, 5, 6, 87, 4, '3', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(345, 1, 5, 4, 88, 4, '1', '1', '', '', '', '1218993', '1159998', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(346, 1, 5, 4, 88, 4, '2', '1', '', '', '', '1218994', '1160000', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(347, 1, 6, 1, 89, 2, '1', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(348, 1, 4, 1, 89, 2, '2', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(349, 1, 4, 1, 89, 2, '3', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(350, 1, 4, 1, 89, 2, '4', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(351, 1, 6, 1, 89, 2, '5', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(352, 1, 4, 1, 89, 2, '6', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(353, 1, 4, 1, 89, 2, '7', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(354, 1, 4, 1, 89, 2, '8', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(363, 1, 9, 1, 91, 2, '1', '1', '150', '', '', '1361055', '1290733', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(364, 1, 9, 1, 91, 2, '2', '1', '150', '', '', '1361056', '1290734', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(365, 1, 9, 1, 91, 2, '3', '2', '150', '', '', '1361057', '1290735', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(366, 1, 9, 1, 91, 2, '4', '2', '150', '', '', '1361058', '1290736', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(367, 1, 9, 1, 91, 2, '5', '3', '150', '', '', '1361059', '1290737', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(368, 1, 9, 1, 91, 2, '6', '3', '150', '', '', '1361060', '1290738', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(369, 1, 9, 1, 91, 2, '7', '4', '150', '', '', '1361061', '1290739', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(370, 1, 9, 1, 91, 2, '8', '4', '150', '', '', '1361062', '1290740', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(371, 1, 9, 1, 91, 2, '9', '5', '150', '', '', '1361063', '1290741', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(372, 1, 9, 1, 91, 2, '10', '5', '150', '', '', '1361064', '1290742', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(373, 1, 9, 1, 91, 2, '11', '6', '150', '', '', '1361065', '1290743', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(374, 1, 9, 1, 91, 2, '12', '6', '150', '', '', '1361066', '1290744', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(375, 1, 2, 1, 92, 4, '1', '1', '', '', '', '1160690', '1099848', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(376, 1, 2, 1, 92, 4, '2', '1', '', '', '', '1160691', '1099849', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(377, 1, 2, 1, 92, 4, '3', '2', '', '', '', '1160692', '1099850', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(378, 1, 2, 1, 92, 4, '4', '2', '', '', '', '1160693', '1099851', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(379, 1, 2, 1, 92, 4, '5', '3', '', '', '', '1160694', '1099852', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(380, 1, 2, 1, 92, 4, '6', '3', '', '', '', '1160695', '1099853', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(381, 1, 2, 1, 92, 4, '7', '4', '', '', '', '1160696', '1099854', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(382, 1, 2, 1, 92, 4, '8', '4', '', '', '', '1160697', '1099855', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(383, 1, 2, 1, 92, 4, '9', '5', '', '', '', '1160698', '1099856', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(384, 1, 2, 1, 92, 4, '10', '5', '', '', '', '1160699', '1099857', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(385, 1, 2, 1, 93, 4, '1', '1', '', '', '', '1160690', '1099848', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(386, 1, 2, 1, 93, 4, '2', '1', '', '', '', '1160691', '1099849', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(387, 1, 2, 1, 93, 4, '3', '2', '', '', '', '1160692', '1099850', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(388, 1, 2, 1, 93, 4, '4', '2', '', '', '', '1160693', '1099851', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(389, 1, 2, 1, 93, 4, '5', '3', '', '', '', '1160694', '1099852', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(390, 1, 2, 1, 93, 4, '6', '3', '', '', '', '1160695', '1099853', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(391, 1, 2, 1, 93, 4, '7', '4', '', '', '', '1160696', '1099854', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(392, 1, 2, 1, 93, 4, '8', '4', '', '', '', '1160697', '1099855', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(393, 1, 2, 1, 93, 4, '9', '5', '', '', '', '1160698', '1099856', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(394, 1, 2, 1, 93, 4, '10', '5', '', '', '', '1160699', '1099857', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(395, 1, 5, 2, 94, 1, '3', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(444, 1, 5, 4, 54, 4, '2', '1', '', '', '', '1184492', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(445, 1, 5, 4, 54, 4, '3', '1', '', '', '', ' 1184494', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(446, 1, 5, 4, 54, 4, '4', '1', '', '', '', '1184496', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(447, 1, 5, 4, 54, 4, '5', '1', '', '', '', '1184498', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(449, 1, 5, 4, 97, 1, '1', '1', '', '', '', '1184490', '1151756', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(450, 1, 5, 4, 97, 4, '2', '1', '', '', '', '1184492', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(451, 1, 5, 4, 97, 4, '3', '1', '', '', '', ' 1184494', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(452, 1, 5, 4, 97, 4, '4', '1', '', '', '', '1184496', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(453, 1, 5, 4, 97, 4, '5', '1', '', '', '', '1184498', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(454, 1, 5, 4, 98, 4, '1', '1', '560', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(455, 1, 5, 4, 101, 4, '1', '1', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(456, 1, 5, 4, 82, 4, '1', '1', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(460, 1, 4, 1, 100, 4, '1', '1', '95', '', '', '1026715', '940651', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(461, 1, 4, 1, 100, 2, '2', '1', '85', '', '', '1026716', '940652', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(462, 1, 4, 1, 100, 4, '3', '1', '95', '', '', '1026717', '940653', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(463, 1, 4, 1, 100, 4, '4', '1', '85', '', '', '1026718', '940654', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(464, 1, 4, 1, 100, 4, '5', '1', '95', '', '', '1026719', '940655', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(465, 1, 4, 1, 100, 4, '6', '1', '85', '', '', '1026720', '940656', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(466, 1, 4, 1, 100, 4, '7', '1', '95', '', '', '1026721', '940657', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(467, 1, 4, 1, 100, 4, '8', '1', '85', '', '', '1026722', '940658', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(468, 1, 4, 1, 100, 4, '9', '1', '95', '', '', '1026723', '940659', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(469, 1, 4, 1, 100, 4, '10', '1', '85', '', '', '1026724', '940660', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(470, 1, 4, 1, 100, 4, '11', '1', '95', '', '', '1026725', '940661', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(471, 2, 3, 1, 104, 1, '010104', '3', '200', 'New', '1234', '5678', '8743', '2500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, NULL, NULL, NULL, NULL, '0'),
(472, 1, 4, 1, 82, 1, '0123', '1', '200', 'New', '111111', '222222', '33333', '3500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, NULL, NULL, NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `aseet_warranty`
--

CREATE TABLE `aseet_warranty` (
  `Aseet_warranty_Id` int(11) NOT NULL,
  `Aseet_English_warranty` varchar(200) NOT NULL,
  `Aseet_Arabic_warranty` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aseet_warranty`
--

INSERT INTO `aseet_warranty` (`Aseet_warranty_Id`, `Aseet_English_warranty`, `Aseet_Arabic_warranty`) VALUES
(1, 'cheque', 'شيك'),
(2, 'cash', 'نقداً'),
(3, 'without warranty', 'بدون ضمان');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `Assets_Id` int(11) NOT NULL,
  `asset_location_Asset_Location_Id` int(11) NOT NULL,
  `vendor_type_Vendor_Type_Id` int(11) NOT NULL,
  `asset_condition_Asset_Condition_Id` int(11) NOT NULL,
  `maintenance_categoty_Categoty_Id` int(11) NOT NULL,
  `Assets_English_Name` varchar(200) DEFAULT NULL,
  `Assets_Arabic_Name` varchar(200) DEFAULT NULL,
  `Assets_Value` varchar(200) DEFAULT NULL,
  `Purchase_Date` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Serial_Number` varchar(200) DEFAULT NULL,
  `Main_Place` varchar(200) DEFAULT NULL,
  `How_To_Get` varchar(45) DEFAULT NULL,
  `Contractor` varchar(200) DEFAULT NULL,
  `Buyer` varchar(45) DEFAULT NULL,
  `Contractor_Waranty_Period` varchar(200) DEFAULT NULL,
  `Waranty_Period` varchar(200) DEFAULT NULL,
  `Waranty_Start_Date` varchar(200) DEFAULT NULL,
  `Waranty_End_Date` varchar(200) DEFAULT NULL,
  `Waranty_Certificate` varchar(200) DEFAULT NULL,
  `Waranty_Certificate_Path` varchar(200) DEFAULT NULL,
  `Inventory_Id` varchar(45) DEFAULT NULL,
  `OwnerShip_Id` varchar(45) DEFAULT NULL,
  `Building_ID` varchar(45) DEFAULT NULL,
  `Unit_Id` varchar(45) DEFAULT NULL,
  `Last_periodec_maintenance` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`Assets_Id`, `asset_location_Asset_Location_Id`, `vendor_type_Vendor_Type_Id`, `asset_condition_Asset_Condition_Id`, `maintenance_categoty_Categoty_Id`, `Assets_English_Name`, `Assets_Arabic_Name`, `Assets_Value`, `Purchase_Date`, `Description`, `Serial_Number`, `Main_Place`, `How_To_Get`, `Contractor`, `Buyer`, `Contractor_Waranty_Period`, `Waranty_Period`, `Waranty_Start_Date`, `Waranty_End_Date`, `Waranty_Certificate`, `Waranty_Certificate_Path`, `Inventory_Id`, `OwnerShip_Id`, `Building_ID`, `Unit_Id`, `Last_periodec_maintenance`) VALUES
(1, 2, 1, 1, 15, '', '', '100000', '25/02/2022', 'مصهعد', '', 'بناء', 'شراء', '', '2', '', '', '', '', 'No File', 'No File', '1', '4', '8', '', NULL),
(2, 2, 1, 1, 10, 'Air condition', 'مكيف', '10000', '27/04/2022', 'الرلارلار', '111111111', 'بناء', 'شراء', '', '2', '', '3', '15/03/2023', '16/03/2023', 'No File', 'No File', '1', '8', '19', '', NULL),
(3, 2, 1, 1, 13, 'AC', 'مكيف تجربة', '2000', '07/03/2021', 'xxxxxxxxx', '000000', 'وحدة', 'ضمن مشروع', '1', '', '350', '', '', '', 'No File', 'No File', '1', '11', '23', '123', '01/08/2022'),
(4, 2, 1, 3, 12, 'Izgwa Pluming', 'مضخة إزغوى', '3000', '25/07/2022', 'Izgwa Pluming ', 'XXX123YYY', 'Unit', 'Buying', '', '2', '', '365', '25/07/2022', '25/07/2023', 'No File', 'No File', '1', '47', '82', '476', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_condition`
--

CREATE TABLE `asset_condition` (
  `Asset_Condition_Id` int(11) NOT NULL,
  `Asset_English_Condition` varchar(200) NOT NULL,
  `Asset_Arabic_Condition` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asset_condition`
--

INSERT INTO `asset_condition` (`Asset_Condition_Id`, `Asset_English_Condition`, `Asset_Arabic_Condition`) VALUES
(1, 'new ', 'جديد'),
(3, 'used', 'مستعمل');

-- --------------------------------------------------------

--
-- Table structure for table `asset_location`
--

CREATE TABLE `asset_location` (
  `Asset_Location_Id` int(11) NOT NULL,
  `Asset_English_Location` varchar(200) NOT NULL,
  `Asset_Arabic_Location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asset_location`
--

INSERT INTO `asset_location` (`Asset_Location_Id`, `Asset_English_Location`, `Asset_Arabic_Location`) VALUES
(1, 'Undefined', 'غير محدد'),
(2, 'main entry ', 'الساحة الرئيسيه ');

-- --------------------------------------------------------

--
-- Table structure for table `asset_type`
--

CREATE TABLE `asset_type` (
  `Asset_Type_Id` int(11) NOT NULL,
  `Asset_English_Type` varchar(200) NOT NULL,
  `Asset_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Bank_Id` int(11) NOT NULL,
  `Bank_Arabic_Name` varchar(200) NOT NULL,
  `Bank_English_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`Bank_Id`, `Bank_Arabic_Name`, `Bank_English_Name`) VALUES
(1, ' بنك قطر الوطني', 'QNB'),
(2, ' البنك التجاري', 'CBQ'),
(3, ' بنك الدوحة', 'DOHA BANK'),
(4, ' البنك األهلي', 'AHLI BANK'),
(5, ' بنك قطر الدولي', 'IBQ'),
(6, 'بنك الخليج التجاري', 'AL KHALIJI BANK'),
(7, ' بنك قطر للتنمية', 'QDB'),
(8, 'مصرف قطر الاسالمي', 'QIB'),
(9, 'بنك قطر الدولي الاسالمي', 'QIIB'),
(10, 'بنك بروة', 'BARWA BANK'),
(11, 'مصرف الريان', 'AL RAYAN BANK'),
(12, ' البنك العربي المحدود', 'ARAB BANK'),
(13, 'بنك المشرق', 'MASHREQ BANK'),
(14, 'بنك ستاندرد تشارترد', 'STANDARD CHARTERD BANK'),
(15, 'بنك اتش اس بى سى الشرق الاوسط', 'HSBC '),
(16, ' بنك يونايتد المحدود', 'UNITED BANK LTD '),
(17, ' بنك صادرات ايران', 'BSI'),
(18, ' بنك بي أن بي باريبا', 'BNP PARIBAS BANK');

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `Building_Id` int(11) NOT NULL,
  `Half_Building_ID` varchar(50) DEFAULT NULL,
  `owner_ship_Owner_Ship_Id` int(11) NOT NULL,
  `building_condition_Building_Condition_Id` int(11) NOT NULL,
  `building_type_Building_Type_Id` int(11) NOT NULL,
  `Building_English_Name` varchar(200) NOT NULL,
  `Building_Arabic_Name` varchar(200) NOT NULL,
  `electricity_meter` varchar(200) DEFAULT NULL,
  `Water_meter` varchar(200) DEFAULT NULL,
  `Building_NO` varchar(200) DEFAULT NULL,
  `Construction_Area` varchar(200) DEFAULT NULL,
  `Maintenance_status` varchar(200) DEFAULT NULL,
  `Building_Value` varchar(200) DEFAULT NULL,
  `Construction_Completion_Date` varchar(200) DEFAULT NULL,
  `Building_Photo` varchar(200) DEFAULT NULL,
  `Building_Photo_Path` varchar(200) DEFAULT NULL,
  `Entrance_Photo` varchar(200) DEFAULT NULL,
  `Entrance_Photo_Path` varchar(200) DEFAULT NULL,
  `Statement` varchar(200) DEFAULT NULL,
  `Statement_Path` varchar(200) DEFAULT NULL,
  `Building_Permit` varchar(200) DEFAULT NULL,
  `Building_Permit_Path` varchar(200) DEFAULT NULL,
  `certificate_of_completion` varchar(200) DEFAULT NULL,
  `certificate_of_completion_Path` varchar(200) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `Image_Path` varchar(200) DEFAULT NULL,
  `Map` varchar(200) DEFAULT NULL,
  `Map_path` varchar(200) DEFAULT NULL,
  `Plan` varchar(200) DEFAULT NULL,
  `Plano_Path` varchar(200) DEFAULT NULL,
  `Active` varchar(45) DEFAULT NULL,
  `IsRealEsataeInvesment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`Building_Id`, `Half_Building_ID`, `owner_ship_Owner_Ship_Id`, `building_condition_Building_Condition_Id`, `building_type_Building_Type_Id`, `Building_English_Name`, `Building_Arabic_Name`, `electricity_meter`, `Water_meter`, `Building_NO`, `Construction_Area`, `Maintenance_status`, `Building_Value`, `Construction_Completion_Date`, `Building_Photo`, `Building_Photo_Path`, `Entrance_Photo`, `Entrance_Photo_Path`, `Statement`, `Statement_Path`, `Building_Permit`, `Building_Permit_Path`, `certificate_of_completion`, `certificate_of_completion_Path`, `Image`, `Image_Path`, `Map`, `Map_path`, `Plan`, `Plano_Path`, `Active`, `IsRealEsataeInvesment`) VALUES
(8, '8', 4, 1, 15, 'Building apartments and shops Fareej Al Ghanem', 'شقق فندقية فريج الغانم', '1261848', '1217626', '8-15', '6092.140', 'مصان', '21510000', '2012', 'No File', 'No File', 'DSC_4150.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4150.JPG', 'No File', 'No File', 'رخصة بناء الغانم.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الغانم.pdf', 'اتمام بناءالغانم القديم الشيخ  فهد.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناءالغانم القديم الشيخ  فهد.pdf', 'DSC_4155.JPG', '/English/Main_Application/Building_File/Image/DSC_4155.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(11, '11', 6, 6, 7, 'Fereej Abdulaziz Twin Buildings', 'عمارتين فريج عبدالعزيز ', '125146', '91760', '82', '466.8', ' قيد الدراسة ', '2187500', '2018', 'No File', 'No File', '٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', 'No File', 'No File', 'رخصة بناء فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فريج عبدالعزيز.pdf', 'اتمام بناء عمارة فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء عمارة فريج عبدالعزيز.pdf', 'DSC_4158.JPG', '/English/Main_Application/Building_File/Image/DSC_4158.JPG', 'SITE PLAN.pdf', '/English/Main_Application/Building_File/Map/SITE PLAN.pdf', 'No File', 'No File', '1', '0'),
(18, '18', 6, 6, 7, 'Fereej Abdulaziz Twin Buildings', 'عمارتين فريج عبدالعزيز 80', '127153', '97763', '80', '', 'دراسة صيانة ', '2187500', '2013', 'No File', 'No File', '٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١١٣٤٠٤.jpg', 'No File', 'No File', 'رخصة بناء فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فريج عبدالعزيز.pdf', 'اتمام بناء عمارة فريج عبدالعزيز.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء عمارة فريج عبدالعزيز.pdf', 'DSC_4159.JPG', '/English/Main_Application/Building_File/Image/DSC_4159.JPG', 'SITE PLAN.pdf', '/English/Main_Application/Building_File/Map/SITE PLAN.pdf', 'No File', 'No File', '1', '0'),
(19, '19', 8, 1, 7, 'Bin Dirham Al Kubraa', 'بن درهم الكبرى', '1181995', '', '14', '1944.55', 'مصان ', '6237000', '2015', 'No File', 'No File', '٢٠٢٢٠٣١٤_١١٤٩٢٧.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣١٤_١١٤٩٢٧.jpg', 'No File', 'No File', 'No File', 'No File', 'اتمام بناء عمارة فريج بن درهم الكبرى ارضي+6مكرر.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء عمارة فريج بن درهم الكبرى ارضي+6مكرر.pdf', '٢٠٢٢٠٣١٤_١١٤٩٥٥.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣١٤_١١٤٩٥٥.jpg', 'Site plan.pdf', '/English/Main_Application/Building_File/Map/Site plan.pdf', 'No File', 'No File', '1', '0'),
(20, '20', 9, 5, 16, 'Al Najma Building  AL Makhbez', 'عمارة النجمة  المخبز', '', '25188', '19', '', 'قيد متابعة ', '881500', '2012', '20220320_082151.jpg', '/English/Main_Application/Building_File/Building_Photo/20220320_082151.jpg', '20220320_082306.jpg', '/English/Main_Application/Building_File/Entrace_Photo/20220320_082306.jpg', 'No File', 'No File', 'رخصة بناء نجمة المخبز.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء نجمة المخبز.pdf', 'اتمام النجمة المخبز.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام النجمة المخبز.pdf', '20220320_082402.jpg', '/English/Main_Application/Building_File/Image/20220320_082402.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(22, '22', 10, 8, 15, 'Al Najma Two Stores and Shop', 'عمارة دورين ومحل', '90580', '', '51', '', 'مشروع صيانة', '75500', '1990', 'No File', 'No File', 'DSC_4176.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4176.JPG', 'No File', 'No File', 'رخصة بناء النجمة دورين ومحل.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء النجمة دورين ومحل.pdf', 'شهادة اتمام النجمة دورين ومحل.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام النجمة دورين ومحل.pdf', 'DSC_4174.JPG', '/English/Main_Application/Building_File/Image/DSC_4174.JPG', 'خرائط النجمة دورين ومحل.pdf', '/English/Main_Application/Building_File/Map/خرائط النجمة دورين ومحل.pdf', 'No File', 'No File', '1', '0'),
(23, '23', 11, 1, 2, ' Al Najma Shops  ', 'محلات النجمة', '1183416', '1146796', '23', '', '', '858000', '2013', 'No File', 'No File', 'DSC_4177.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4177.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء.pdf', 'DSC_4179.JPG', '/English/Main_Application/Building_File/Image/DSC_4179.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(25, '25', 12, 1, 7, 'Sanyo', 'سانيو', '18915', '8175', '8', '645', 'مصان', '2052811', '2016', 'WhatsApp Image 2023-02-26 at 10.21.07 AM (3).jpeg', '/English/Main_Application/Building_File/Building_Photo/WhatsApp Image 2023-02-26 at 10.21.07 AM (3).jpeg', 'WhatsApp Image 2023-02-26 at 10.21.07 AM (4).jpeg', '/English/Main_Application/Building_File/Entrace_Photo/WhatsApp Image 2023-02-26 at 10.21.07 AM (4).jpeg', 'No File', 'No File', 'رخصة بناء سانيو.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء سانيو.pdf', 'شهادة اتمام بناء سانيو..pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء سانيو..pdf', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(26, '26', 14, 5, 7, 'Um Ghuwailina Hospital', 'أم غويلينة المستشفى', '18996', '8890', '107', '', 'قيد متابعة ', '4357500', '2014', 'No File', 'No File', 'DSC_4195.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4195.JPG', 'No File', 'No File', 'رخصة بناء المستشفى.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء المستشفى.pdf', 'اتمام بناء المستشفى.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء المستشفى.pdf', 'DSC_4193.JPG', '/English/Main_Application/Building_File/Image/DSC_4193.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(27, '27', 15, 6, 16, 'Um Ghuwailina Al Sughra', 'أم غويلينة الصغرى', '183302', '152797', '111', '', 'دراسة صيانة ', '1086000', '2006', 'No File', 'No File', '20220320_092622.jpg', '/English/Main_Application/Building_File/Entrace_Photo/20220320_092622.jpg', 'No File', 'No File', 'رخصة بناء ام غويلينة الصغرى.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء ام غويلينة الصغرى.pdf', 'شهادة اتمام بناء ام غويلينا الصغرى.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء ام غويلينا الصغرى.pdf', 'DSC_4198.JPG', '/English/Main_Application/Building_File/Image/DSC_4198.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(29, '29', 17, 1, 17, 'Um Ghuwailina Al Kubraa', 'أم غويلينة الكبرى', '1026729', '940665', '55', '403.17', 'مصان ', '7935781', '2007', '٢٠٢٢٠٣٢١_١٠٢٤٥٣.jpg', '/English/Main_Application/Building_File/Building_Photo/٢٠٢٢٠٣٢١_١٠٢٤٥٣.jpg', '٢٠٢٢٠٣٢١_١٠٢٥٥٢.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١٠٢٥٥٢.jpg', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '٢٠٢٢٠٣٢١_١٠٢٥٢٦.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣٢١_١٠٢٥٢٦.jpg', 'Typical floor.pdf', '/English/Main_Application/Building_File/Map/Typical floor.pdf', 'No File', 'No File', '1', '0'),
(30, '30', 17, 1, 17, 'Um Ghuwailina Al Kubraa', 'بيت الشوك', '34137', '56703', '7', '2808', 'جديد', ' 8188630', '2021', '٢٠٢٢٠٣٢١_١٠٢٧٠٠.jpg', '/English/Main_Application/Building_File/Building_Photo/٢٠٢٢٠٣٢١_١٠٢٧٠٠.jpg', '٢٠٢٢٠٣٢١_١٠٢٧٥٥.jpg', '/English/Main_Application/Building_File/Entrace_Photo/٢٠٢٢٠٣٢١_١٠٢٧٥٥.jpg', 'No File', 'No File', 'رخصة بناء الشوك.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الشوك.pdf', 'شهادة اتمام بناء الشوك 2 العمارة الجديدة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء الشوك 2 العمارة الجديدة.pdf', '٢٠٢٢٠٣٢١_١٠٢٧٢١.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣٢١_١٠٢٧٢١.jpg', 'empty_Image.jpg', '/English/Main_Application/Building_File/Map/empty_Image.jpg', 'No File', 'No File', '1', '0'),
(31, '31', 18, 1, 10, 'Two Villas in Khalifa City North  ', 'فيلتان مدينة خليفة الشمالية', '1218994', '1160000', '3،5', '', 'جديد', '2850000', '2011', 'No File', 'No File', 'WhatsApp Image 2021-03-21 at 11.15.21 AM.jpeg', '/English/Main_Application/Building_File/Entrace_Photo/WhatsApp Image 2021-03-21 at 11.15.21 AM.jpeg', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء مدينة خليفة ش المنارة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء مدينة خليفة ش المنارة.pdf', 'DSC_4217.JPG', '/English/Main_Application/Building_File/Image/DSC_4217.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(32, '32', 19, 7, 11, 'Villa Zawia', 'فيلا زاوية', '85999', '59387', '32', '', 'دراسة متابعة ', '1011700', '1989', 'DSC_4221.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4221.JPG', 'DSC_4222.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4222.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء فيلا م خ شمالية.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء فيلا م خ شمالية.pdf', 'DSC_4220.JPG', '/English/Main_Application/Building_File/Image/DSC_4220.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(33, '33', 20, 7, 11, 'VillasYumna Wusta', 'فلل يمنى وسطى', '164915', '	125816', '30،28', '', 'دراسة صيانة ', '1916200', '2000', 'DSC_4227.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4227.JPG', 'DSC_4225.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4225.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4223.JPG', '/English/Main_Application/Building_File/Image/DSC_4223.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(34, '34', 21, 6, 11, 'Villas Sharqiat Gharbiat  Al Jamea', 'فلل شرقية غربية  الجامعة', '1052468', '', '45،47', '', 'دراسة صيانة ', '1916200', '2005', 'DSC_4231.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4231.JPG', 'DSC_4229.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4229.JPG', 'No File', 'No File', 'رخصة بناء فلل شرقية غربية الجامعة.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فلل شرقية غربية الجامعة.pdf', 'شهادة اتمام بناء شرقية وغربية مدينة خ ش.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء شرقية وغربية مدينة خ ش.pdf', 'DSC_4231.JPG', '/English/Main_Application/Building_File/Image/DSC_4231.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(35, '35', 22, 1, 7, 'Khalifa City Building Al Wadhia', 'عمارة مدينة خليفة  الوضيحية', '1355153', '1286323', '24،17', ' 1,321 ', 'مصان ', '6791491', '2017', 'DSC_4236.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4236.JPG', 'DSC_4238.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4238.JPG', 'No File', 'No File', 'رخصة بناء مدينة خليفة.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء مدينة خليفة.pdf', 'شهادة اتمام بناء عمارة مدينة خليفة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء عمارة مدينة خليفة.pdf', 'DSC_4242.JPG', '/English/Main_Application/Building_File/Image/DSC_4242.JPG', 'الوضيحية.jpg', '/English/Main_Application/Building_File/Map/الوضيحية.jpg', 'No File', 'No File', '1', '0'),
(36, '36', 23, 1, 19, 'Khalifa City North House', 'منزل مدينة خليفة الشمالية', '24063', '', '9', '', '', '156100', '2011', 'DSC_4251.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4251.JPG', 'DSC_4252.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4252.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4250.JPG', '/English/Main_Application/Building_File/Image/DSC_4250.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(37, '37', 24, 7, 19, ' Gharnata House', 'منزل غرناطة', '46176', '78202', '19', '', 'دراسة صيانة ', '1218000', '1980', 'DSC_4262.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4262.JPG', 'DSC_4263.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4263.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4264.JPG', '/English/Main_Application/Building_File/Image/DSC_4264.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(38, '38', 25, 7, 19, 'House in front of Al Murur ', 'منزل مقابل المرور', '55958', '33568', '109', '', 'دراسة صيانة ', '200000', '1982', 'DSC_4254.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4254.JPG', 'DSC_4257.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4257.JPG', 'No File', 'No File', 'No File', 'No File', 'اتمام بناء منزل مقابل المرور.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء منزل مقابل المرور.pdf', 'DSC_4255.JPG', '/English/Main_Application/Building_File/Image/DSC_4255.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(39, '39', 26, 5, 11, 'Two detached villas', 'فيلتان متلاصقتان', '', '', '35،33', '', 'جديد ', '3000000', '2004', 'DSC_4208.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4208.JPG', 'DSC_4201.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4201.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء المطار العتيق.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء المطار العتيق.pdf', 'DSC_4204.JPG', '/English/Main_Application/Building_File/Image/DSC_4204.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(40, '40', 27, 5, 11, 'Western Villa', 'فيلا غربية', '1055459', '966396', '88', '', 'دراسة صيانة', '1225000', '2006', 'No File', 'No File', 'DSC_4270.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4270.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء ازغوى الغربية.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء ازغوى الغربية.pdf', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(41, '41', 29, 5, 11, 'Eastern Villa    ', 'فيلا شرقية', '1060966', '970330', '86', '', 'دراسة صيانة ', '1225000', '2006', 'DSC_4267.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4267.JPG', 'DSC_4266.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4266.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء ازغوى شرقية.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء ازغوى شرقية.pdf', '20220317_105950.jpg', '/English/Main_Application/Building_File/Image/20220317_105950.jpg', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(42, '42', 35, 6, 11, 'Villa Ain Khaled ', 'فيلا عين خالد', '119612', '1073819', '79', '', 'دراسة صيانة ', '3500000', '1998', 'DSC_4210.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4210.JPG', 'DSC_4214.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4214.JPG', 'No File', 'No File', 'No File', 'No File', 'شهادة اتمام بناء عين خالد.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء عين خالد.pdf', 'DSC_4209.JPG', '/English/Main_Application/Building_File/Image/DSC_4209.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(44, '44', 36, 1, 20, 'New Industrial Garage', 'كراج الصناعية الجديد', '128624', '104618', '177', '', '', '5867000', '', '٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', '/English/Main_Application/Building_File/Building_Photo/٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', '3a266a79-a822-4cc5-a099-90790f36e9e7.jpg', '/English/Main_Application/Building_File/Entrace_Photo/3a266a79-a822-4cc5-a099-90790f36e9e7.jpg', 'No File', 'No File', 'رخصة بناء الصناعية .pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الصناعية .pdf', 'اتمام بناء الصناعية.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء الصناعية.pdf', '٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', '/English/Main_Application/Building_File/Image/٢٠٢٢٠٣٢١_١٦٢٠٥٧.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(45, '45', 43, 6, 11, 'Villa Al Dafna', 'فيلا الدفنة', '178907', '137757', '193', '', 'دراسة صيانة', '1954000', '2000', '20220323_123016.jpg', '/English/Main_Application/Building_File/Building_Photo/20220323_123016.jpg', '20220323_122912.jpg', '/English/Main_Application/Building_File/Entrace_Photo/20220323_122912.jpg', 'No File', 'No File', 'No File', 'No File', 'اتمام بناء فيلا الدفنة.pdf', '/English/Main_Application/Building_File/certificate_completion/اتمام بناء فيلا الدفنة.pdf', '20220323_123006.jpg', '/English/Main_Application/Building_File/Image/20220323_123006.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(47, '47', 38, 1, 11, 'Villa Al Khaysa', 'فيلا الخيسة', '1044652', '959164', '7', '', '', '1366500', '2006', 'No File', 'No File', 'DSC_4298.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4298.JPG', 'No File', 'No File', 'رخصة بناء.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء.pdf', 'شهادة اتمام بناء.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء.pdf', 'DSC_4295.JPG', '/English/Main_Application/Building_File/Image/DSC_4295.JPG', 'Site plan.pdf', '/English/Main_Application/Building_File/Map/Site plan.pdf', 'No File', 'No File', '1', '0'),
(48, '48', 44, 10, 18, 'Ravdat Al Hamamah', 'روضة الحمامة', '', '', '39', '', 'أرض فضاء', '0', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(49, '49', 40, 6, 11, ' Al Ruweys Villas', 'فلل الرويس', '', '', '41', '', 'دراسة صيانة', '1963082', '2009', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'رخصة بناء الرويس.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء الرويس.pdf', 'شهادة اتمام بناء الرويس.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء الرويس.pdf', 'No File', 'No File', 'Site plan.pdf', '/English/Main_Application/Building_File/Map/Site plan.pdf', 'No File', 'No File', '1', '0'),
(50, '50', 41, 1, 11, 'Villa Al Vakeer', 'فيلا الوكير', '1361895', '1291269', '494', '', 'جديد ', '1408095', '2019', 'IMG-20220324-WA0002.jpg', '/English/Main_Application/Building_File/Building_Photo/IMG-20220324-WA0002.jpg', 'IMG-20220324-WA0001.jpg', '/English/Main_Application/Building_File/Entrace_Photo/IMG-20220324-WA0001.jpg', 'No File', 'No File', 'رخصة بناء فيلا الوكير.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء فيلا الوكير.pdf', 'شهادة اتمام بناء الوكير.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء الوكير.pdf', 'IMG-20220324-WA0003.jpg', '/English/Main_Application/Building_File/Image/IMG-20220324-WA0003.jpg', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(51, '51', 37, 1, 2, 'Palm Tower Offices', 'مكاتب برج النخلة ', '1056105', '997132', '3،4،5', '140*3', '', '11739965', '2004', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'سند+اتمام بناء+رخصة الدفاع المدني مكاتب الدفنة.pdf', '/English/Main_Application/Building_File/Building_Permit/سند+اتمام بناء+رخصة الدفاع المدني مكاتب الدفنة.pdf', 'شهادة اتمام بناء.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء.pdf', 'No File', 'No File', 'empty_Image.jpg', '/English/Main_Application/Building_File/Map/empty_Image.jpg', 'No File', 'No File', '1', '0'),
(52, '52', 13, 1, 16, 'HSBC', 'أم غويلينة أتش أس بي سي', '1361066', '1290744', '48', '2674', 'جديد', '6681012', '', 'DSC_4183.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4183.JPG', 'DSC_4182.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4182.JPG', 'No File', 'No File', 'رخصة بناء  hsbc.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء  hsbc.pdf', 'إتمام بناء hsbc.pdf', '/English/Main_Application/Building_File/certificate_completion/إتمام بناء hsbc.pdf', 'DSC_4186.JPG', '/English/Main_Application/Building_File/Image/DSC_4186.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(54, '54', 39, 5, 11, 'Al Qatifia Villa', ' فلة القطيفية', ' 1184490', '', '101', '٦١٣.٤', 'قيد متابعة ', '17989000', '2015', 'DSC_4312.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4312.JPG', 'DSC_4315.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4315.JPG', 'No File', 'No File', 'رخصة بناء القطيفية.pdf', '/English/Main_Application/Building_File/Building_Permit/رخصة بناء القطيفية.pdf', 'شهادة اتمام بناء لقطيفية  البحيرة.pdf', '/English/Main_Application/Building_File/certificate_completion/شهادة اتمام بناء لقطيفية  البحيرة.pdf', 'DSC_4307.JPG', '/English/Main_Application/Building_File/Image/DSC_4307.JPG', 'site plan.pdf', '/English/Main_Application/Building_File/Map/site plan.pdf', 'No File', 'No File', '1', '0'),
(62, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '1 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(63, '11', 6, 1, 7, 'Half Building :عمارتين فريج عبدالعزيز ', '4 شقق في البناء : عمارتين فريج عبدالعزيز ', NULL, NULL, '82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(64, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '3 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(65, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '8 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(66, '31', 18, 1, 10, 'Half Building :فيلتان مدينة خليفة الشمالية', '2 فيلا في البناء : فيلتان مدينة خليفة الشمالية', NULL, NULL, '3،5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(67, '11', 6, 1, 7, 'Half Building :عمارتين فريج عبدالعزيز ', '3 شقق في البناء : عمارتين فريج عبدالعزيز ', NULL, NULL, '82', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(68, '28', 16, 1, 16, 'Half Building :أم غويلينة الجديدة', '3 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(69, '20', 9, 1, 16, 'Half Building :عمارة النجمة  المخبز', '3 شقق في البناء : عمارة النجمة  المخبز', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(70, '20', 9, 1, 16, 'Half Building :عمارة النجمة  المخبز', '3 شقق في البناء : عمارة النجمة  المخبز', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(71, '29', 17, 1, 15, 'Half Building :أم غويلينة الكبرى', '11 شقق في البناء : أم غويلينة الكبرى', NULL, NULL, '55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(72, '8', 4, 1, 15, 'Half Building :شقق فندقية فريج الغانم', '10 محلات في البناء : شقق فندقية فريج الغانم', NULL, NULL, '8-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(73, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(74, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(75, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(76, '76', 45, 1, 11, 'vaill Graft al rayyan', 'فيلا غرافة الريان ', '1145485', '1078480', '494', '', 'جديد ', '1154500', '2013', 'DSC_4282.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4282.JPG', 'DSC_4283.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4283.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4282.JPG', '/English/Main_Application/Building_File/Image/DSC_4282.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(77, '28', 16, 6, 16, 'Half Building :أم غويلينة الجديدة', '2 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(78, '28', 16, 6, 16, 'Half Building :أم غويلينة الجديدة', '2 شقق في البناء : أم غويلينة الجديدة', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(79, '79', 46, 1, 11, 'Villa new Al Khaysa', 'فيلا الخيسة الجديدة ', '', '', '36', '', '', '1171415', '2013', 'DSC_4301.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4301.JPG', 'DSC_4300.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4300.JPG', 'No File', 'No File', 'No File', 'No File', '٧٠٠٦١١١٤  اتمام بناء الخيسة.pdf', '/English/Main_Application/Building_File/certificate_completion/٧٠٠٦١١١٤  اتمام بناء الخيسة.pdf', 'DSC_4304.JPG', '/English/Main_Application/Building_File/Image/DSC_4304.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(81, '81', 48, 5, 11, 'Al Gharafa Villa', 'فيلا الغرافة ', '', '', '48', '', '', '1565008', '2013', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(82, '82', 47, 1, 11, 'Izghawa Housing', 'ازغوى اسكان', '', '', '59', '615', '', '1565008', '2023', 'DSC_4286.JPG', '/English/Main_Application/Building_File/Building_Photo/DSC_4286.JPG', 'DSC_4289.JPG', '/English/Main_Application/Building_File/Entrace_Photo/DSC_4289.JPG', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'DSC_4285.JPG', '/English/Main_Application/Building_File/Image/DSC_4285.JPG', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(84, '39', 26, 5, 11, 'Half Building :فيلتان متلاصقتان', '2 فيلا في البناء : فيلتان متلاصقتان', NULL, NULL, '35،33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(85, '39', 26, 5, 11, 'Half Building :فيلتان متلاصقتان', '2 فيلا في البناء : فيلتان متلاصقتان', NULL, NULL, '35،33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(86, '37', 24, 7, 19, 'Half Building :منزل غرناطة', '3 بيت شعبي في البناء : منزل غرناطة', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(87, '37', 24, 7, 19, 'Half Building :منزل غرناطة', '3 بيت شعبي في البناء : منزل غرناطة', NULL, NULL, '19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(88, '31', 18, 1, 10, 'Half Building :فيلتان مدينة خليفة الشمالية', '2 فيلا في البناء : فيلتان مدينة خليفة الشمالية', NULL, NULL, '3،5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(89, '35', 22, 1, 7, 'Half Building :عمارة مدينة خليفة  الوضيحية', '8 شقق في البناء : عمارة مدينة خليفة  الوضيحية', NULL, NULL, '24،17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(90, '35', 22, 1, 7, 'Half Building :عمارة مدينة خليفة  الوضيحية', '8 شقق في البناء : عمارة مدينة خليفة  الوضيحية', NULL, NULL, '24،17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(91, '52', 13, 1, 16, 'Half Building :أم غويلينة أتش أس بي سي', '12 شقق في البناء : أم غويلينة أتش أس بي سي', NULL, NULL, '48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(92, '26', 14, 5, 7, 'Half Building :أم غويلينة المستشفى', '10 شقق في البناء : أم غويلينة المستشفى', NULL, NULL, '107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(93, '26', 14, 5, 7, 'Half Building :أم غويلينة المستشفى', '10 شقق في البناء : أم غويلينة المستشفى', NULL, NULL, '107', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(94, '31', 18, 1, 10, 'Half Building :فيلتان مدينة خليفة الشمالية', '1 محل في البناء : فيلتان مدينة خليفة الشمالية', NULL, NULL, '3،5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(97, NULL, 39, 5, 11, 'Half Building : فلة القطيفية', '5 فيلا في البناء :  فلة القطيفية', NULL, NULL, '101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(98, NULL, 49, 1, 11, 'Villa Al Kheesa School ', 'فيلا الخيسة المدرسة', '', '', '11', '560', '', '1333333', '2023', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(99, '18', 6, 6, 7, 'Half Building :عمارتين فريج عبدالعزيز 80', '3 شقق في البناء : عمارتين فريج عبدالعزيز 80', NULL, NULL, '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(100, '29', 17, 1, 17, 'Half Building :أم غويلينة الكبرى', '11 شقق في البناء : أم غويلينة الكبرى', NULL, NULL, '55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '0'),
(101, '101', 50, 1, 11, 'Villa Alkheesa Hajar', 'فيلا الخيسة حجر', '', '', '35', '540', '', '1351158', '2023', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(103, NULL, 52, 5, 12, 'Building One Test Two', 'بناء أول  تجربة إثنان', '23232', '3232', '11111', '34434', 'New', '150000', '2011', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '1', '0'),
(104, '104', 54, 6, 21, 'building One Pro Test Fourr', 'بناء واحد ملكية تجربة رابعة', '12345', '6789', '0104', '4000', 'New', '100000', '2010', 'BBUUilding333.jpg', '/English/Main_Application/Building_File/Building_Photo/BBUUilding333.jpg', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'Map_1.jpg', '/English/Main_Application/Building_File/Map/Map_1.jpg', 'No File', 'No File', '1', '0'),
(105, '105', 54, 5, 2, 'Building One Pro Four', 'بناء واحد ملكية رابعة', '1234', '567', '0104', '1100', 'New', '1000', '2009', 'BBUUilding333.jpg', '/English/Main_Application/Building_File/Building_Photo/BBUUilding333.jpg', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'Map_1.jpg', '/English/Main_Application/Building_File/Map/Map_1.jpg', 'No File', 'No File', '1', '0'),
(106, '25', 12, 1, 7, 'Half Building :Sanyo', '4 شقة  في البناء : Sanyo', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `building_cash_amount`
--

CREATE TABLE `building_cash_amount` (
  `Cash_Amount_ID` int(11) NOT NULL,
  `Cash_Amount` varchar(200) DEFAULT NULL,
  `Cash_Date` varchar(200) DEFAULT NULL,
  `tenant_Id` varchar(200) DEFAULT NULL,
  `Contract_Id` varchar(200) DEFAULT NULL,
  `Satuts` varchar(200) DEFAULT NULL,
  `Collection_Date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `building_cash_amount`
--

INSERT INTO `building_cash_amount` (`Cash_Amount_ID`, `Cash_Amount`, `Cash_Date`, `tenant_Id`, `Contract_Id`, `Satuts`, `Collection_Date`) VALUES
(1, '4000', '11/07/2023', '107', '72', 'غير محصل', NULL),
(2, '4000', '11/08/2023', '107', '72', 'غير محصل', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `building_cheques`
--

CREATE TABLE `building_cheques` (
  `Cheques_Id` int(11) NOT NULL,
  `Cheques_No` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cheques_Date` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cheques_Amount` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cheque_Owner` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `beneficiary_person` varchar(200) DEFAULT NULL,
  `Cheques_Status` varchar(45) NOT NULL,
  `Collect_Type` varchar(200) DEFAULT NULL,
  `Collection_Date` varchar(50) DEFAULT NULL,
  `tenants_Tenants_ID` int(11) NOT NULL,
  `cheque_type_Cheque_Type_id` int(11) NOT NULL,
  `bank_Bank_Id` int(11) NOT NULL,
  `building_contract_Contract_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `building_cheques`
--

INSERT INTO `building_cheques` (`Cheques_Id`, `Cheques_No`, `Cheques_Date`, `Cheques_Amount`, `Cheque_Owner`, `beneficiary_person`, `Cheques_Status`, `Collect_Type`, `Collection_Date`, `tenants_Tenants_ID`, `cheque_type_Cheque_Type_id`, `bank_Bank_Id`, `building_contract_Contract_Id`) VALUES
(30, '1002379', '10/09/2022', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/09/2022', 41, 1, 3, 23),
(31, '1002380', '10/10/2022', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/10/2022', 41, 1, 3, 23),
(32, '1002381', '10/11/2022', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/11/2022', 41, 1, 3, 23),
(33, '1002382', '10/12/2022', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/12/2022', 41, 1, 3, 23),
(34, '1002383', '10/01/2023', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/01/2023', 41, 1, 3, 23),
(35, '1002384', '10/02/2023', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/02/2023', 41, 1, 3, 23),
(36, '1002385', '10/03/2023', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/03/2023', 41, 1, 3, 23),
(37, '1002386', '10/04/2023', '130000', 'بروبرتي فنشر', NULL, 'محصل', 'محصل بالشيك', '10/04/2023', 41, 1, 3, 23),
(38, '1002387', '10/05/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(39, '1002388', '10/06/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(40, '1002389', '10/07/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(41, '1002390', '10/08/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(42, '1002391', '10/09/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(43, '1002392', '10/10/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(44, '1002393', '10/11/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(45, '1002394', '10/12/2023', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(46, '1002395', '10/01/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(47, '1002396', '10/02/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(48, '1002397', '10/03/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(49, '1002398', '10/04/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(50, '1002399', '10/05/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(51, '1002400', '10/06/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(52, '1002401', '10/07/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(53, '1002402', '10/08/2024', '130000', 'بروبرتي فنشر', NULL, 'غير محصل', NULL, '', 41, 1, 3, 23),
(114, '415', '10/09/2022', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/09/2022', 61, 1, 1, 26),
(115, '416', '10/10/2022', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/10/2022', 61, 1, 1, 26),
(116, '417', '10/11/2022', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/11/2022', 61, 1, 1, 26),
(117, '418', '10/12/2022', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/12/2022', 61, 1, 1, 26),
(118, '419', '10/01/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/01/2023', 61, 1, 1, 26),
(119, '420', '10/02/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/02/2023', 61, 1, 1, 26),
(120, '421', '10/03/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/03/2023', 61, 1, 1, 26),
(121, '422', '10/04/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'محصل', 'محصل بالشيك', '10/04/2023', 61, 1, 1, 26),
(122, '423', '10/05/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'غير محصل', NULL, '', 61, 1, 1, 26),
(123, '424', '10/06/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'غير محصل', NULL, '', 61, 1, 1, 26),
(124, '425', '10/07/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'غير محصل', NULL, '', 61, 1, 1, 26),
(125, '426', '10/08/2023', '35000', 'قمر السماء للتجارة والمقاولات', NULL, 'غير محصل', NULL, '', 61, 1, 1, 26),
(162, '1000649', '10/08/2022', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/08/2022', 48, 1, 2, 30),
(163, '1000650', '10/09/2022', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/09/2022', 48, 1, 2, 30),
(164, '1000651', '10/10/2022', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/10/2022', 48, 1, 2, 30),
(165, '1000652', '10/11/2022', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/11/2022', 48, 1, 2, 30),
(166, '1000653', '10/12/2022', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/12/2022', 48, 1, 2, 30),
(167, '1000654', '10/01/2023', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/01/2023', 48, 1, 2, 30),
(168, '1000181', '10/02/2023', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/02/2023', 48, 1, 2, 30),
(169, '1000182', '10/03/2023', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/03/2023', 48, 1, 2, 30),
(170, '1000183', '10/04/2023', '10000', 'هادوك تريدينغ', NULL, 'محصل', 'محصل بالشيك', '10/04/2023', 48, 1, 2, 30),
(171, '1000184', '10/05/2023', '10000', 'هادوك تريدينغ', NULL, 'غير محصل', NULL, '', 48, 1, 2, 30),
(172, '1000185', '10/06/2023', '10000', 'هادوك تريدينغ', NULL, 'غير محصل', NULL, '', 48, 1, 2, 30),
(173, '1000186', '10/07/2023', '10000', 'هادوك تريدينغ', NULL, 'غير محصل', NULL, '', 48, 1, 2, 30),
(175, 'تحويل ', '01/03/2023', '74400', 'ادارة الاسكان والمباني', NULL, 'محصل', 'محصل بالشيك', '01/03/2023', 52, 1, 11, 33),
(177, '1000253', '09/02/2023', '14100', 'كهوكان كوريان', NULL, 'محصل', 'محصل بالشيك', '09/02/2023', 3, 1, 2, 39),
(178, '1000254', '09/03/2023', '14100', 'كهوكان كوريان', NULL, 'محصل', 'محصل بالشيك', '09/03/2023', 3, 1, 2, 39),
(179, '1000255', '09/04/2023', '14100', 'كهوكان كوريان', NULL, 'محصل', 'محصل بالشيك', '09/04/2023', 3, 1, 2, 39),
(180, '1000256', '09/05/2023', '14100', 'كهوكان كوريان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 39),
(181, '1000257', '09/06/2023', '14100', 'كهوكان كوريان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 39),
(182, '1000258', '09/07/2023', '14100', 'كهوكان كوريان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 39),
(183, '1000259', '09/08/2023', '14100', 'كهوكان كوريان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 39),
(184, '1000260', '09/09/2023', '14100', 'كهوكان كوريان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 39),
(185, '1000261', '09/10/2023', '14100', 'كهوكان كوريان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 39),
(186, '1000262', '09/11/2023', '14100', 'كهوكان كوريان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 39),
(187, '138', '10/01/2023', '37600', 'اي كي ام اسكندر', NULL, 'محصل', 'محصل بالشيك', '10/01/2023', 9, 1, 9, 40),
(188, '139', '10/02/2023', '37600', 'اي كي ام اسكندر', NULL, 'محصل', 'محصل بالشيك', '10/02/2023', 9, 1, 9, 40),
(189, '140', '10/03/2023', '37600', 'اي كي ام اسكندر', NULL, 'محصل', 'محصل بالشيك', '10/03/2023', 9, 1, 9, 40),
(190, '141', '10/04/2023', '37600', 'اي كي ام اسكندر', NULL, 'محصل', 'محصل بالشيك', '10/04/2023', 9, 1, 9, 40),
(191, '142', '10/05/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(192, '143', '10/06/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(193, '144', '10/07/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(194, '145', '10/08/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(195, '146', '10/09/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(196, '147', '10/10/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(197, '148', '10/11/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(198, '149', '10/12/2023', '37600', 'اي كي ام اسكندر', NULL, 'غير محصل', NULL, '', 9, 1, 9, 40),
(199, '0100701', '25/04/2025', '32000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 4, 2, 41),
(200, '01000500', '25/04/2025', '36000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 4, 2, 41),
(201, '1000877', '25/04/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/04/2022', 67, 1, 2, 41),
(202, '1000878', '25/05/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/05/2022', 67, 1, 2, 41),
(203, '1000879', '25/06/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/06/2022', 67, 1, 2, 41),
(204, '1000880', '25/07/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/07/2022', 67, 1, 2, 41),
(205, '1000881', '25/08/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/08/2022', 67, 1, 2, 41),
(206, '1000882', '25/09/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/09/2022', 67, 1, 2, 41),
(207, '1000883', '25/10/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/10/2022', 67, 1, 2, 41),
(208, '1000884', '25/11/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/11/2022', 67, 1, 2, 41),
(209, '1000885', '25/12/2022', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/12/2022', 67, 1, 2, 41),
(210, '1000886', '25/01/2023', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/01/2023', 67, 1, 2, 41),
(211, '1000887', '25/02/2023', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/02/2023', 67, 1, 2, 41),
(212, '1000888', '25/03/2023', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/03/2023', 67, 1, 2, 41),
(213, '1000889', '25/04/2023', '26000', 'دار الوداد للعقارات', NULL, 'محصل', 'محصل بالشيك', '25/04/2023', 67, 1, 2, 41),
(214, '1000890', '25/05/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(215, '1000891', '25/06/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(216, '1000892', '25/07/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(217, '1000893', '25/08/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(218, '1000894', '25/09/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(219, '1000895', '25/10/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(220, '1000896', '25/11/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(221, '1000897', '25/12/2023', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(222, '1000898', '25/01/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(223, '1000899', '25/02/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(224, '1000900', '25/03/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(225, '1000801', '25/04/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(226, '1000802', '25/05/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(227, '1000803', '25/06/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(228, '1000804', '25/07/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(229, '1000805', '25/08/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(230, '1000806', '25/09/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(231, '1000807', '25/10/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(232, '1000808', '25/11/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(233, '1000809', '25/12/2024', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(234, '1000810', '25/01/2025', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(235, '1000811', '25/02/2025', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(236, '1000812', '25/03/2025', '26000', 'دار الوداد للعقارات', NULL, 'غير محصل', NULL, '', 67, 1, 2, 41),
(237, '00684115', '05/06/2023', '108000', 'ناصر الدين محمد ادريس', NULL, 'غير محصل', NULL, '', 49, 2, 9, 42),
(238, '1000251', '09/12/2022', '14100', 'كهوكان كوربان', NULL, 'محصل', 'محصل بالشيك', '09/12/2022', 3, 1, 2, 43),
(239, '1000252', '09/01/2023', '14100', 'كهوكان كوربان', NULL, 'محصل', 'محصل بالشيك', '09/01/2023', 3, 1, 2, 43),
(240, '1000253', '09/02/2023', '14100', 'كهوكان كوربان', NULL, 'محصل', 'محصل بالشيك', '09/02/2023', 3, 1, 2, 43),
(241, '1000254', '09/03/2023', '14100', 'كهوكان كوربان', NULL, 'محصل', 'محصل بالشيك', '09/03/2023', 3, 1, 2, 43),
(242, '1000255', '09/04/2023', '14100', 'كهوكان كوربان', NULL, 'محصل', 'محصل بالشيك', '09/04/2023', 3, 1, 2, 43),
(243, '1000256', '09/05/2023', '14100', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 43),
(244, '1000257', '09/06/2023', '14100', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 43),
(245, '1000258', '09/07/2023', '14100', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 43),
(246, '1000259', '09/08/2023', '14100', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 43),
(247, '1000260', '09/09/2023', '14100', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 43),
(248, '1000261', '09/10/2023', '14100', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 43),
(249, '1000262', '09/11/2023', '14100', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 1, 2, 43),
(250, '01000019', '30/11/2023', '9400', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 4, 2, 43),
(251, '01000020', '30/11/2023', '4700', 'كهوكان كوربان', NULL, 'غير محصل', NULL, '', 3, 4, 2, 43),
(252, '01000025', '30/11/2023', '6000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 4, 2, 45),
(253, '1000128', '10/12/2022', '9000', 'الالمحمد رحمان', NULL, 'محصل', 'محصل بالشيك', '10/12/2022', 53, 1, 3, 45),
(254, '1000129', '10/01/2023', '9000', 'الالمحمد رحمان', NULL, 'محصل', 'محصل بالشيك', '10/01/2023', 53, 1, 3, 45),
(255, '1000130', '10/02/2023', '9000', 'الالمحمد رحمان', NULL, 'محصل', 'محصل بالشيك', '10/02/2023', 53, 1, 3, 45),
(256, '1000131', '10/03/2023', '9000', 'الالمحمد رحمان', NULL, 'محصل', 'محصل بالشيك', '10/03/2023', 53, 1, 3, 45),
(257, '1000132', '10/04/2023', '9000', 'الالمحمد رحمان', NULL, 'محصل', 'محصل بالشيك', '10/04/2023', 53, 1, 3, 45),
(258, '1000133', '10/05/2023', '9000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 1, 3, 45),
(259, '1000134', '10/06/2023', '9000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 1, 3, 45),
(260, '1000135', '10/07/2023', '9000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 1, 3, 45),
(261, '1000136', '10/08/2023', '9000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 1, 3, 45),
(262, '1000137', '10/09/2023', '9000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 1, 3, 45),
(263, '1000138', '10/10/2023', '9000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 1, 3, 45),
(264, '1000139', '10/11/2023', '9000', 'الالمحمد رحمان', NULL, 'غير محصل', NULL, '', 53, 1, 3, 45),
(265, '100051', '08/08/2022', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/08/2022', 20, 1, 3, 46),
(266, '100052', '08/09/2022', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/09/2022', 20, 1, 3, 46),
(267, '100053', '08/10/2022', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/10/2022', 20, 1, 3, 46),
(268, '100054', '08/11/2022', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/11/2022', 20, 1, 3, 46),
(269, '100055', '08/12/2022', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/12/2022', 20, 1, 3, 46),
(270, '100056', '08/01/2023', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/01/2023', 20, 1, 3, 46),
(271, '100057', '08/02/2023', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/02/2023', 20, 1, 3, 46),
(272, '100058', '08/03/2023', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/03/2023', 20, 1, 3, 46),
(273, '100059', '08/04/2023', '36580', 'برهان محمد', NULL, 'محصل', 'محصل بالشيك', '08/04/2023', 20, 1, 3, 46),
(274, '100060', '08/05/2023', '36580', 'برهان محمد', NULL, 'غير محصل', NULL, '', 20, 1, 3, 46),
(275, '100061', '08/06/2023', '36580', 'برهان محمد', NULL, 'غير محصل', NULL, '', 20, 1, 3, 46),
(276, '100062', '08/07/2023', '36580', 'برهان محمد', NULL, 'غير محصل', NULL, '', 20, 1, 3, 46),
(277, '1000480', '01/01/2023', '40000', 'البركة العالمية', NULL, 'محصل', 'محصل بالشيك', '01/01/2023', 43, 1, 3, 47),
(278, '1000481', '01/02/2023', '40000', 'البركة العالمية', NULL, 'محصل', 'محصل بالشيك', '01/02/2023', 43, 1, 3, 47),
(279, '1000482', '01/03/2023', '40000', 'البركة العالمية', NULL, 'محصل', 'محصل بالشيك', '01/03/2023', 43, 1, 3, 47),
(280, '1000483', '01/04/2023', '40000', 'البركة العالمية', NULL, 'محصل', 'محصل بالشيك', '01/04/2023', 43, 1, 3, 47),
(281, '1000484', '01/05/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(282, '1000485', '01/06/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(283, '1000486', '01/07/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(284, '1000487', '01/08/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(285, '1000488', '01/09/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(286, '1000489', '01/10/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(287, '1000490', '01/11/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(288, '1000491', '01/12/2023', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(289, '1000492', '01/01/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(290, '1000493', '01/02/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(291, '1000494', '01/03/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(292, '1000495', '01/04/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(293, '1000496', '01/05/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(294, '1000497', '01/06/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(295, '1000498', '01/07/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(296, '1000499', '01/08/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(297, '1000500', '01/09/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(298, '1000501', '01/10/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(299, '1000502', '01/11/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(300, '1000503', '01/12/2024', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(301, '1000504', '01/01/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(302, '1000505', '01/02/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(303, '1000506', '01/03/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(304, '1000507', '01/04/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(305, '1000508', '01/05/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(306, '1000509', '01/06/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(307, '1000510', '01/07/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(308, '1000511', '01/08/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(309, '1000512', '01/09/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(310, '1000513', '01/10/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(311, '1000514', '01/11/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(312, '1000515', '01/12/2025', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(313, '1000516', '01/01/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(314, '1000517', '01/02/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(315, '1000518', '01/03/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(316, '1000519', '01/04/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(317, '1000520', '01/05/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(318, '1000521', '01/06/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(319, '1000522', '01/07/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(320, '1000523', '01/08/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(321, '1000524', '01/09/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(322, '1000525', '01/10/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(323, '1000526', '01/11/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(324, '1000527', '01/12/2026', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(325, '1000528', '01/01/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(326, '1000529', '01/02/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(327, '1000530', '01/03/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(328, '1000531', '01/04/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(329, '1000532', '01/05/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(330, '1000533', '01/06/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(331, '1000534', '01/07/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(332, '1000535', '01/08/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(333, '1000536', '01/09/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(334, '1000537', '01/10/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(335, '1000538', '01/11/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(336, '1000539', '01/12/2027', '40000', 'البركة العالمية', NULL, 'غير محصل', NULL, '', 43, 1, 3, 47),
(337, '1000092', '10/02/2023', '9600', 'مصطفى كوتي', NULL, 'محصل', 'محصل بالشيك', '10/02/2023', 8, 1, 3, 51),
(338, '1000093', '10/03/2023', '9600', 'مصطفى كوتي', NULL, 'مؤجل', '', '', 8, 1, 3, 51),
(339, '1000094', '10/04/2023', '9600', 'مصطفى كوتي', NULL, 'مؤجل', '', '', 8, 1, 3, 51),
(340, '1000095', '10/05/2023', '9600', 'مصطفى كوتي', NULL, 'غير محصل', NULL, NULL, 8, 1, 3, 51),
(341, '1000096', '10/06/2023', '9600', 'مصطفى كوتي', NULL, 'غير محصل', NULL, NULL, 8, 1, 3, 51),
(342, '1000097', '10/07/2023', '9600', 'مصطفى كوتي', NULL, 'غير محصل', NULL, NULL, 8, 1, 3, 51),
(343, '1000098', '10/08/2023', '9600', 'مصطفى كوتي', NULL, 'غير محصل', NULL, NULL, 8, 1, 3, 51),
(344, '1000099', '10/09/2023', '9600', 'مصطفى كوتي', NULL, 'غير محصل', NULL, NULL, 8, 1, 3, 51),
(353, '1002100', '01/01/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/01/2020', 41, 1, 3, 58),
(354, '1002101', '01/02/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/02/2020', 41, 1, 3, 58),
(355, '1002102', '01/03/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/03/2020', 41, 1, 3, 58),
(356, '1002103', '01/04/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/04/2020', 41, 1, 3, 58),
(357, '1002104', '01/05/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/05/2020', 41, 1, 3, 58),
(358, '1002105', '01/06/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/06/2020', 41, 1, 3, 58),
(359, '1002106', '01/07/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/07/2020', 41, 1, 3, 58),
(360, '1002107', '01/08/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/08/2020', 41, 1, 3, 58),
(361, '1002108', '01/09/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/09/2020', 41, 1, 3, 58),
(362, '1002109', '01/10/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/10/2020', 41, 1, 3, 58),
(363, '1002110', '01/11/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/11/2020', 41, 1, 3, 58),
(364, '1002111', '01/12/2020', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/12/2020', 41, 1, 3, 58),
(365, '1002112', '01/01/2021', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/01/2021', 41, 1, 3, 58),
(366, '1002113', '01/02/2021', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/02/2021', 41, 1, 3, 58),
(367, '1002114', '01/03/2021', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/03/2021', 41, 1, 3, 58),
(368, '1002115', '01/04/2021', '30000', 'بروبرتي فنشر', 'شركة المناراة للصيانة والتجارة', 'محصل', 'محصل بالشيك', '01/04/2021', 41, 1, 3, 58),
(385, '1001317', '01/04/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '23/01/2020', 41, 1, 3, 60),
(386, '1001318', '01/05/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '31/01/2020', 41, 1, 3, 60),
(387, '1001319', '01/06/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '31/01/2020', 41, 1, 3, 60),
(388, '1001320', '01/07/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '23/08/2020', 41, 1, 3, 60),
(389, '1001321', '01/08/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '06/10/2020', 41, 1, 3, 60),
(390, '1001322', '01/09/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '18/01/2020', 41, 1, 3, 60),
(391, '1001323', '01/10/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '11/11/2020', 41, 1, 3, 60),
(392, '1001324', '01/11/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '03/12/2020', 41, 1, 3, 60),
(393, '1001325', '01/12/2020', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '29/12/2020', 41, 1, 3, 60),
(394, '1001326', '01/01/2021', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '31/01/2021', 41, 1, 3, 60),
(395, '1001327', '01/02/2021', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '21/02/2021', 41, 1, 3, 60),
(396, '1001328', '01/03/2021', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '23/03/2021', 41, 1, 3, 60),
(397, '1001329', '01/04/2021', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '18/04/2021', 41, 1, 3, 60),
(398, '1001330', '01/05/2021', '78000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '25/05/2021', 41, 1, 3, 60),
(399, '1001331', '01/06/2021', '39000', 'بروبرتي فنشر', 'المناراة للصيانة', 'محصل', 'محصل بالشيك', '21/06/2021', 41, 1, 3, 60),
(400, '1002876', '10/12/2021', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/12/2021', 88, 1, 3, 65),
(401, '1002877', '10/01/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/01/2022', 88, 1, 3, 65),
(402, '1002878', '10/02/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/02/2022', 88, 1, 3, 65),
(403, '1002879', '10/03/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/03/2022', 88, 1, 3, 65),
(404, '1002880', '10/04/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/04/2022', 88, 1, 3, 65),
(405, '1002881', '10/05/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/05/2022', 88, 1, 3, 65),
(406, '1002882', '10/06/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/06/2022', 88, 1, 3, 65),
(407, '1002883', '10/07/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/07/2022', 88, 1, 3, 65),
(408, '1002884', '10/08/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/08/2022', 88, 1, 3, 65),
(409, '1002885', '10/09/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/09/2022', 88, 1, 3, 65),
(410, '1002886', '10/10/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/10/2022', 88, 1, 3, 65),
(411, '1002887', '10/11/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/11/2022', 88, 1, 3, 65),
(412, '1002888', '10/12/2022', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/12/2022', 88, 1, 3, 65),
(413, '1002889', '10/01/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/01/2023', 88, 1, 3, 65),
(414, '1002890', '10/02/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/02/2023', 88, 1, 3, 65),
(415, '1002891', '10/03/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/03/2023', 88, 1, 3, 65),
(416, '1002892', '10/04/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', '10/04/2023', 88, 1, 3, 65),
(417, '1002893', '10/05/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65),
(418, '1002894', '10/06/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65),
(419, '1002895', '10/07/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65),
(420, '1002896', '10/08/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65),
(421, '1002897', '10/09/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65),
(422, '1002898', '10/10/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65),
(423, '1002899', '10/11/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65),
(425, '1002900', '10/12/2023', '60000', 'سما القلمون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, NULL, 88, 1, 3, 65);

-- --------------------------------------------------------

--
-- Table structure for table `building_condition`
--

CREATE TABLE `building_condition` (
  `Building_Condition_Id` int(11) NOT NULL,
  `Building_English_Condition` varchar(200) NOT NULL,
  `Building_Arabic_Condition` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `building_condition`
--

INSERT INTO `building_condition` (`Building_Condition_Id`, `Building_English_Condition`, `Building_Arabic_Condition`) VALUES
(1, 'New', 'جديد'),
(5, 'Follow up', 'متابعة'),
(6, 'Maintenance Research', 'دراسة صيانة'),
(7, 'Maintenance Research Two', 'دراسة صيانة اثنان'),
(8, 'Dilapidated', 'متهالك'),
(9, 'Invalid', 'غير صالح'),
(10, 'Multiple', 'متعدد');

-- --------------------------------------------------------

--
-- Table structure for table `building_contract`
--

CREATE TABLE `building_contract` (
  `Contract_Id` int(11) NOT NULL,
  `users_user_ID` int(11) NOT NULL,
  `tenants_Tenants_ID` int(11) NOT NULL,
  `building_Building_Id` int(11) NOT NULL,
  `contract_type_Contract_Type_Id` int(11) NOT NULL,
  `contract_template_Contract_template_Id` int(11) NOT NULL,
  `payment_type_payment_type_Id` int(11) NOT NULL,
  `reason_for_rent_Reason_For_Rent_Id` int(11) NOT NULL,
  `Number_Of_Mounth` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Number_Of_Years` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Payment_Amount` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Payment_Amount_L` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Date_Of_Sgin` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Start_Date` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `End_Date` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Contract_Details` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `New_ReNewed_Expaired` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `Start_Free_Period` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Duration_free_period` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `maintenance` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `Rental_allowed_Or_Not_allowed` varchar(45) CHARACTER SET utf8mb4 NOT NULL,
  `Com_rep` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Paymen_Method` varchar(200) DEFAULT NULL,
  `Real_Contract_FileName` varchar(200) DEFAULT NULL,
  `Real_Contract_Path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `building_contract`
--

INSERT INTO `building_contract` (`Contract_Id`, `users_user_ID`, `tenants_Tenants_ID`, `building_Building_Id`, `contract_type_Contract_Type_Id`, `contract_template_Contract_template_Id`, `payment_type_payment_type_Id`, `reason_for_rent_Reason_For_Rent_Id`, `Number_Of_Mounth`, `Number_Of_Years`, `Payment_Amount`, `Payment_Amount_L`, `Date_Of_Sgin`, `Start_Date`, `End_Date`, `Contract_Details`, `New_ReNewed_Expaired`, `Start_Free_Period`, `Duration_free_period`, `maintenance`, `Rental_allowed_Or_Not_allowed`, `Com_rep`, `Paymen_Method`, `Real_Contract_FileName`, `Real_Contract_Path`) VALUES
(23, 5, 41, 8, 1, 2, 2, 1, '', '2', '130000', 'مئة وثلاثنون الف', '01/09/2022', '01/09/2022', '01/09/2024', '', '1', '', '', '2', '1', '4', 'شيك', NULL, NULL),
(26, 8, 61, 26, 1, 2, 2, 2, '', '1', '35000', 'خمسة وثلاثون الاف', '01/08/2022', '01/09/2022', '15/08/2023', '', '1', '', '', '2', '1', '1', NULL, NULL, NULL),
(30, 8, 48, 18, 1, 2, 2, 2, '', '1', '10000', 'عشرة الاف ', '31/07/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '2', '2', '20', NULL, NULL, NULL),
(31, 8, 52, 25, 1, 2, 2, 1, '', '5', '29700', 'تسعة وعشرون الاف وسبعمئة ', '18/02/2021', '01/08/2021', '31/07/2026', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', NULL, NULL, NULL),
(33, 9, 52, 52, 1, 2, 2, 1, '', '5', '74400', 'اربعة وسبعون الاف واربعمئة ', '23/03/2021', '01/08/2021', '31/07/2026', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(34, 9, 52, 19, 1, 2, 2, 1, '', '5', '80400', 'ثمانون الاف وأربعمئة ', '01/10/2020', '01/08/2021', '30/07/2026', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(39, 8, 3, 64, 1, 3, 2, 3, '', '1', '14100', 'اربعة عشر ومئة ', '09/02/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(40, 8, 9, 65, 1, 3, 2, 3, '', '1', '37600', 'سبعة وثلاثون الاف وستمئة', '01/01/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '1', '1', 'شيك', NULL, NULL),
(41, 8, 67, 66, 1, 3, 2, 1, '', '3', '26000', 'ستة وعشرون الاف ريال فقط ', '30/04/2021', '01/04/2022', '31/03/2025', '', '1', '', '', '1', '2', '37', 'شيك', NULL, NULL),
(42, 9, 49, 67, 1, 3, 2, 1, '', '1', '9000', 'تسعة الاف ريال فقط ', '31/05/2022', '01/06/2022', '31/05/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', NULL, NULL),
(43, 8, 3, 68, 1, 3, 2, 3, '', '3', '14100', 'اربعة عشر الف ومئة ', '01/01/2021', '01/12/2020', '30/11/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(45, 8, 53, 70, 1, 3, 2, 3, '', '1', '9000', 'تسعة الاف ريال ', '01/12/2022', '01/12/2022', '30/11/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(46, 8, 20, 71, 1, 3, 2, 1, '', '1', '36850', 'ستة وثلاثون الاف وثمانمئة وخمسون', '01/08/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(47, 8, 43, 72, 1, 3, 2, 2, '', '5', '40000', 'اربعون الاف ريال ', '01/12/2022', '01/01/2023', '31/12/2027', '', '1', '', '', '1', '2', '5', 'شيك', NULL, NULL),
(50, 8, 48, 75, 4, 3, 2, 3, '2', '', '10400', 'عشرة الاف واربع مئة ', '01/01/2021', '01/01/2021', '31/07/2022', '', '1', '', '', '1', '2', '20', 'نقداً', NULL, NULL),
(51, 8, 8, 77, 1, 3, 2, 3, '', '1', '9600', 'تسعة الاف وستمئة', '24/01/2023', '01/02/2023', '31/01/2024', '', '3', '', '', '1', '2', '1', '1', NULL, NULL),
(53, 8, 83, 84, 1, 3, 2, 1, '', '2', '16000', 'ستة عشرة الاف ريال ', '27/03/2021', '01/04/2023', '30/06/2022', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(54, 8, 114, 85, 1, 3, 2, 1, '', '3', '16000', 'ستة عشر الاف ريال ', '27/03/2021', '01/08/2021', '30/06/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(55, 8, 51, 86, 1, 3, 2, 3, '', '1', '24666', 'اربعة وعشرون الاف وستمئة وسة وستون', '01/05/2021', '01/05/2021', '30/04/2022', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(56, 8, 51, 87, 1, 3, 2, 3, '', '2', '18000', 'ثمن عشر الاف ', '28/04/2022', '01/05/2022', '30/04/2024', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(57, 8, 67, 88, 1, 3, 1, 1, '', '1', '32000', 'اثنان وثلاثون الاف ريال ', '30/03/2019', '01/05/2020', '30/04/2021', '', '1', '', '', '1', '2', '37', 'نقداً', NULL, NULL),
(58, 8, 41, 89, 1, 3, 2, 1, '', '2', '30000', 'ثلاثون الاف ريال ', '19/09/2019', '01/01/2020', '30/04/2021', '', '1', '', '', '2', '2', '4', 'شيك', NULL, NULL),
(60, 8, 41, 91, 1, 3, 2, 1, '', '1', '78000', 'سبعة وثمون الاف ريال ', '23/11/2019', '01/01/2020', '15/06/2021', '', '1', '01/01/2020', '3', '1', '2', '4', 'شيك', NULL, NULL),
(61, 8, 61, 92, 1, 3, 5, 3, '', '1', '31666', 'واحد وثلاثون وستمئة وستون ', '11/06/2020', '01/07/2020', '31/07/2021', '', '1', '', '', '2', '2', '19', 'نقداً', NULL, NULL),
(62, 8, 61, 93, 1, 3, 2, 3, '', '1', '30000', 'ثلاثون الف ريال ', '03/06/2021', '01/08/2021', '15/09/2022', '', '1', '01/08/2022', '2', '2', '2', '19', 'نقداً', NULL, NULL),
(63, 8, 116, 94, 1, 3, 2, 2, '', '4', '2250', 'الفان ومئتان وخمسون ', '01/01/2020', '01/01/2020', '31/12/2023', '', '1', '', '', '2', '2', '42', 'نقداً', NULL, NULL),
(65, 5, 88, 97, 1, 3, 2, 1, '', '2', '60000', 'ستون الاف ريال ', '30/09/2021', '01/12/2021', '01/11/2023', '', '1', '', '', '1', '2', '45', 'Cheques', '', ''),
(66, 8, 88, 54, 1, 2, 5, 1, '', '2', '50000', 'خمسون الاف ريال ', '23/04/2020', '01/04/2020', '01/04/2022', 'تم دفع القيمية الايجارية عن كامل مدة التعاقد 1000000 مليون ريال', '1', '', '', '1', '2', '45', 'نقداً', NULL, NULL),
(68, 9, 52, 35, 1, 2, 3, 1, '', '5', '39600', 'تسعة وثلالثين ألف وستة مئة ريال', '18/10/2020', '01/08/2021', '01/08/2026', '', '1', '', '', '1', '1', '1', 'تحويل', NULL, NULL),
(69, 8, 20, 100, 1, 3, 2, 1, '', '1', '36850', 'ستة وثلاثون الاف وثمان مئة وخمسون ', '29/01/2023', '01/05/2023', '30/04/2024', '', '1', '', '', '2', '2', '1', 'شيك', NULL, NULL),
(70, 5, 134, 82, 1, 2, 2, 2, '', '1', '3000', 'three thousand', '12/07/2023', '14/07/2023', '13/07/2024', '', '1', '', '', '2', '2', '1', 'Transformation', '', ''),
(71, 5, 59, 82, 1, 2, 2, 2, '', '1', '3000', 'three thousand', '12/07/2023', '14/07/2023', '13/07/2024', '', '1', '', '', '2', '2', '32', 'Transformation', '', ''),
(72, 5, 107, 106, 1, 3, 2, 2, '', '1', '4000', 'Four Thousand', '10/07/2023', '11/07/2023', '10/07/2024', '', '1', '', '', '1', '1', '1', 'Cash', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `building_transformation_table`
--

CREATE TABLE `building_transformation_table` (
  `transformation_Table_ID` int(11) NOT NULL,
  `transformation_Bank_ID` varchar(200) DEFAULT NULL,
  `transformation_Date` varchar(200) DEFAULT NULL,
  `Amount` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `tenant_Id` varchar(200) DEFAULT NULL,
  `Contract_Id` varchar(200) DEFAULT NULL,
  `Collection_Date` varchar(200) DEFAULT NULL,
  `transformation_No` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `building_transformation_table`
--

INSERT INTO `building_transformation_table` (`transformation_Table_ID`, `transformation_Bank_ID`, `transformation_Date`, `Amount`, `Status`, `tenant_Id`, `Contract_Id`, `Collection_Date`, `transformation_No`) VALUES
(1, '13', '01/08/2021', '148500', 'محصل', '52', '31', '21/12/2021', '1'),
(3, '13', '01/01/2022', '178200', 'محصل', '52', '31', '02/01/2022', '2'),
(7, '13', '01/07/2022', '178200', 'محصل', '52', '31', '01/07/2022', '3'),
(8, '13', '01/01/2023', '89100', 'غير محصل', '52', '31', NULL, '4'),
(9, '13', '01/04/2023', '89100', 'محصل', '52', '31', '03/04/2023', '5'),
(10, '13', '01/08/2021 ', '372000', 'محصل', '52', '33', '21/12/2021', '1'),
(11, '13', '01/01/2022 ', '446400', 'محصل', '52', '33', '01/01/2022', '2'),
(12, '13', '01/07/2022 ', '446400', 'محصل', '52', '33', '01/07/2022', '3'),
(13, '13', '01/01/2023 ', '223200', 'محصل', '52', '33', '01/01/2023', '4'),
(14, '13', '01/04/2023 ', '223200', 'محصل', '52', '33', '03/04/2023', '5'),
(15, '13', '01/08/2021', '402000', 'محصل', '52', '34', '21/12/2021', '1'),
(16, '13', '01/01/2022', '482400', 'محصل', '52', '34', '01/01/2022', '2'),
(17, '13', '01/07/2022', '482400', 'محصل', '52', '34', '01/07/2022', '3'),
(18, '13', '01/01/2023', '241200', 'محصل', '52', '34', '01/01/2023', '4'),
(19, '13', '01/04/2023', '241200', 'محصل', '52', '34', '03/04/2023', '5'),
(20, '13', '01/01/2022', '237600', 'غير محصل', '52', '68', NULL, '2'),
(21, '13', '01/07/2022', '237600', 'غير محصل', '52', '68', NULL, '3'),
(22, '13', '01/01/2023', '118800', 'غير محصل', '52', '68', NULL, '4'),
(23, '13', '01/04/2023', '118800', 'غير محصل', '52', '68', NULL, '5'),
(24, '13', '01/08/2021', '198000', 'غير محصل', '52', '68', NULL, '1'),
(25, '13', '04/07/2023', '241200', 'غير محصل', '52', '34', NULL, '6'),
(26, '13', '11/07/2023', '3000', 'غير محصل', '134', '70', NULL, '123001'),
(27, '13', '11/08/2023', '3000', 'غير محصل', '134', '70', NULL, '123002'),
(28, '13', '11/09/2023', '3000', 'غير محصل', '134', '70', NULL, '123003'),
(29, '13', '11/07/2023', '3000', 'غير محصل', '134', '71', NULL, '123001'),
(30, '13', '11/08/2023', '3000', 'غير محصل', '134', '71', NULL, '123002'),
(31, '13', '11/09/2023', '3000', 'غير محصل', '134', '71', NULL, '123003');

-- --------------------------------------------------------

--
-- Table structure for table `building_type`
--

CREATE TABLE `building_type` (
  `Building_Type_Id` int(11) NOT NULL,
  `Building_English_Type` varchar(200) NOT NULL,
  `Building_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `building_type`
--

INSERT INTO `building_type` (`Building_Type_Id`, `Building_English_Type`, `Building_Arabic_Type`) VALUES
(2, 'Offices', 'مكاتب'),
(7, ' MultiStory Building', 'عمارة '),
(10, 'Service Villa', 'فيلا خدمية'),
(11, 'Residential Villa', 'فيلا سكنية'),
(12, 'Commercial Villa', 'فيلا تجارية'),
(14, 'Multipurpose Building', 'عمارة متعددة الأغراض'),
(15, ' Apartments and Shops Building', 'عمارة شقق ومحلات'),
(16, 'Residential Building', 'عمارة سكنية'),
(17, 'Apartments', 'شقق'),
(18, 'No details', 'لا تفاصيل'),
(19, 'Popular house', 'بيت شعبي'),
(20, 'Garage', 'كراج'),
(21, 'SHOPS', 'محلات ');

-- --------------------------------------------------------

--
-- Table structure for table `cash_amount`
--

CREATE TABLE `cash_amount` (
  `Cash_Amount_ID` int(11) NOT NULL,
  `Cash_Amount` varchar(200) DEFAULT NULL,
  `Cash_Date` varchar(200) DEFAULT NULL,
  `tenant_Id` varchar(200) DEFAULT NULL,
  `Contract_Id` varchar(200) DEFAULT NULL,
  `Satuts` varchar(200) DEFAULT NULL,
  `Collection_Date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cash_amount`
--

INSERT INTO `cash_amount` (`Cash_Amount_ID`, `Cash_Amount`, `Cash_Date`, `tenant_Id`, `Contract_Id`, `Satuts`, `Collection_Date`) VALUES
(1, '2800', '10/01/2021', '9', '54', 'محصل', '10/01/2021'),
(2, '2500', '10/02/2021', '9', '54', 'محصل', '14/02/2021'),
(3, '2500', '10/03/2021', '9', '54', 'محصل', '18/03/2021'),
(4, '2500', '15/06/2021', '9', '54', 'محصل', '29/04/2021'),
(5, '2500', '15/07/2021', '9', '54', 'محصل', '18/07/2021'),
(6, '2500', '15/08/2021', '9', '54', 'محصل', '30/08/2021'),
(7, '2500', '15/09/2021', '9', '54', 'محصل', '19/09/2021'),
(9, '2500', '15/10/2021', '9', '54', 'محصل', '17/10/2021'),
(10, '2500', '15/11/2021', '9', '54', 'محصل', '04/11/2021'),
(11, '2500', '15/12/2021', '9', '54', 'محصل', '18/12/2021'),
(12, '2500', '15/01/2022', '9', '54', 'محصل', '31/01/2022'),
(13, '2500', '15/02/2022', '9', '54', 'محصل', '17/02/2022'),
(14, '2500', '15/03/2022', '9', '54', 'محصل', '17/03/2022'),
(15, '2500', '15/04/2022', '9', '54', 'محصل', '17/04/2022'),
(16, '2500', '15/05/2022', '9', '54', 'محصل', '15/05/2022'),
(17, '2500', '15/06/2022', '9', '54', 'محصل', '19/06/2022'),
(18, '2500', '15/07/2022', '9', '54', 'محصل', '13/07/2022'),
(19, '3000', '15/01/2021', '9', '55', 'محصل', '17/01/2021'),
(20, '3000', '15/02/2021', '9', '55', 'محصل', '16/02/2021'),
(21, '3000', '15/03/2021', '9', '55', 'محصل', '21/03/2021'),
(22, '3000', '15/04/2021', '9', '55', 'محصل', '18/04/2021'),
(23, '3000', '15/05/2021', '9', '55', 'محصل', '20/05/2021'),
(24, '3000', '15/06/2021', '9', '55', 'محصل', '20/06/2021'),
(25, '3000', '15/07/2021', '9', '55', 'محصل', '18/07/2021'),
(26, '3000', '15/08/2021', '9', '55', 'محصل', '22/08/2021'),
(27, '3000', '15/09/2021', '9', '55', 'محصل', '19/09/2021'),
(28, '3000', '15/10/2021', '9', '55', 'محصل', '17/10/2021'),
(29, '3000', '15/11/2021', '9', '55', 'محصل', '25/11/2021'),
(30, '3000', '15/12/2021', '9', '55', 'محصل', '25/12/2021'),
(31, '3000', '15/01/2022', '9', '55', 'محصل', '13/01/2022'),
(32, '3000', '15/02/2022', '9', '55', 'محصل', '17/02/2022'),
(33, '3000', '15/03/2022', '9', '55', 'محصل', '20/03/2022'),
(34, '3000', '15/04/2022', '9', '55', 'محصل', '13/04/2022'),
(35, '3000', '15/05/2022', '9', '55', 'محصل', '11/05/2022'),
(36, '3000', '15/06/2022', '9', '55', 'محصل', '19/06/2022'),
(37, '3000', '15/07/2022', '9', '55', 'محصل', '13/07/2022'),
(67, '5000', '15/06/2020', '6', '83', 'محصل', '08/06/2020'),
(68, '5000', '15/07/2020', '6', '83', 'محصل', '09/07/2020'),
(69, '5000', '15/08/2020', '6', '83', 'محصل', '09/08/2020'),
(70, '5000', '15/09/2020', '6', '83', 'محصل', '08/09/2020'),
(71, '5000', '15/10/2020', '6', '83', 'محصل', '11/10/2020'),
(72, '5000', '15/11/2020', '6', '83', 'محصل', '08/11/2020'),
(73, '5000', '15/12/2020', '6', '83', 'محصل', '10/12/2020'),
(74, '5000', '15/01/2021', '6', '83', 'محصل', '10/01/2021'),
(75, '5000', '15/02/2021', '6', '83', 'محصل', '08/02/2021'),
(77, '4700', '15/08/2021', '7', '84', 'محصل', '24/06/2021'),
(78, '4700', '15/09/2021', '7', '84', 'محصل', '09/09/2021'),
(79, '4700', '15/10/2021', '7', '84', 'محصل', '10/10/2021'),
(80, '4700', '15/11/2021', '7', '84', 'محصل', '15/11/2021'),
(81, '4700', '15/12/2021', '7', '84', 'محصل', '08/12/2021'),
(82, '4700', '15/01/2022', '7', '84', 'محصل', '09/01/2022'),
(83, '4700', '15/02/2022', '7', '84', 'محصل', '10/02/2022'),
(84, '4700', '15/03/2022', '7', '84', 'محصل', '06/03/2022'),
(85, '4700', '15/04/2022', '7', '84', 'محصل', '10/04/2022'),
(86, '4700', '15/05/2022', '7', '84', 'محصل', '06/05/2022'),
(87, '4700', '15/06/2022', '7', '84', 'محصل', '22/06/2022'),
(88, '5000', '15/02/2021', '8', '87', 'محصل', '28/02/2021'),
(89, '5000', '15/03/2021', '8', '87', 'محصل', '26/03/2021'),
(90, '5000', '15/04/2021', '8', '87', 'محصل', '29/04/2021'),
(91, '5000', '15/05/2021', '8', '87', 'محصل', '30/05/2021'),
(92, '5000', '15/06/2021', '8', '87', 'محصل', '30/06/2021'),
(93, '5000', '15/07/2021', '8', '87', 'محصل', '28/07/2021'),
(94, '5000', '15/08/2021', '8', '87', 'محصل', '30/08/2021'),
(95, '5000', '15/09/2021', '8', '87', 'محصل', '16/09/2021'),
(96, '5000', '15/10/2021', '8', '87', 'محصل', '30/10/2021'),
(97, '5000', '15/11/2021', '8', '87', 'محصل', '30/11/2021'),
(98, '5000', '15/12/2021', '8', '87', 'محصل', '28/12/2021'),
(99, '5000', '15/01/2022', '8', '87', 'محصل', '23/01/2022'),
(101, '5000', '15/06/2020', '117', '82', 'محصل', '15/06/2020'),
(102, '5000', '15/07/2020', '117', '82', 'محصل', '30/07/2020'),
(103, '5000', '15/08/2020', '117', '82', 'محصل', '10/09/2020'),
(104, '5000', '15/09/2020', '117', '82', 'محصل', '10/09/2020'),
(105, '5000', '15/10/2020', '117', '82', 'محصل', '12/10/2020'),
(106, '5000', '15/11/2020', '117', '82', 'محصل', '11/11/2020'),
(107, '5000', '15/12/2020', '117', '82', 'محصل', '10/12/2020'),
(108, '5000', '15/01/2021', '117', '82', 'محصل', '11/01/2021'),
(109, '5000', '15/02/2021', '117', '82', 'محصل', '15/02/2021'),
(110, '5000', '15/03/2021', '117', '82', 'محصل', '15/03/2021'),
(111, '5000', '15/04/2021', '117', '82', 'محصل', '26/04/2021'),
(112, '5000', '15/05/2021', '117', '82', 'محصل', '16/05/2021'),
(113, '4700', '15/02/2022', '8', '88', 'محصل', '27/02/2022'),
(114, '4700', '15/03/2022', '8', '88', 'محصل', '14/03/2022'),
(115, '4700', '15/04/2022', '8', '88', 'محصل', '23/03/2022'),
(116, '4700', '15/05/2022', '8', '88', 'محصل', '17/04/2022'),
(117, '4700', '15/06/2022', '8', '88', 'محصل', '22/06/2022'),
(118, '4700', '15/07/2022', '8', '88', 'محصل', '24/07/2022'),
(119, '4700', '15/08/2022', '8', '88', 'محصل', '17/08/2022'),
(120, '4700', '15/09/2022', '8', '88', 'محصل', '27/09/2022'),
(121, '4700', '15/10/2022', '8', '88', 'محصل', '07/11/2022'),
(122, '4700', '15/11/2022', '8', '88', 'محصل', '07/11/2022'),
(123, '4700', '15/12/2022', '8', '88', 'محصل', '31/12/2022'),
(124, '4700', '15/01/2023', '8', '88', 'محصل', '31/12/2022'),
(126, '4700', '15/04/2021', '5', '90', 'محصل', '01/03/2021'),
(127, '4700', '15/05/2021', '5', '90', 'محصل', '18/05/2021'),
(128, '4700', '15/06/2021', '5', '90', 'محصل', '24/06/2021'),
(129, '4700', '15/07/2021', '5', '90', 'محصل', '28/07/2021'),
(130, '4700', '15/08/2021', '5', '90', 'محصل', '12/08/2021'),
(131, '4700', '15/09/2021', '5', '90', 'محصل', '27/09/2021'),
(132, '4700', '15/10/2021', '5', '90', 'محصل', '12/10/2021'),
(133, '4700', '15/11/2021', '5', '90', 'محصل', '29/11/2021'),
(134, '4700', '15/12/2021', '5', '90', 'محصل', '15/12/2021'),
(135, '4700', '15/01/2022', '5', '90', 'محصل', '30/01/2022'),
(136, '4700', '15/02/2022', '5', '90', 'محصل', '10/02/2022'),
(137, '5500', '15/11/2019', '11', '92', 'محصل', '08/12/2019'),
(138, '5500', '15/12/2019', '11', '92', 'محصل', '15/12/2019'),
(139, '5500', '15/01/2020', '11', '92', 'محصل', '21/01/2020'),
(140, '5500', '15/02/2020', '11', '92', 'محصل', '16/02/2020'),
(141, '5500', '15/03/2020', '11', '92', 'محصل', '15/03/2020'),
(142, '5500', '15/04/2020', '11', '92', 'محصل', '20/04/2020'),
(143, '5500', '15/05/2020', '11', '92', 'محصل', '31/05/2020'),
(144, '5500', '15/06/2020', '11', '92', 'محصل', '30/06/2020'),
(145, '5500', '15/07/2020', '11', '92', 'محصل', '14/07/2020'),
(146, '5500', '15/08/2020', '11', '92', 'محصل', '13/09/2020'),
(147, '5500', '15/09/2020', '11', '92', 'محصل', '13/09/2020'),
(148, '5500', '15/10/2020', '11', '92', 'محصل', '22/10/2020'),
(161, '5000', '15/02/2021', '8', '99', 'محصل', '28/02/2021'),
(162, '5000', '15/03/2021', '8', '99', 'محصل', '26/03/2021'),
(163, '5000', '15/04/2021', '8', '99', 'محصل', '29/04/2021'),
(164, '5000', '15/05/2021', '8', '99', 'محصل', '30/05/2021'),
(165, '5000', '15/06/2021', '8', '99', 'محصل', '30/06/2021'),
(166, '5000', '15/07/2021', '8', '99', 'محصل', '28/07/2021'),
(167, '5000', '15/08/2021', '8', '99', 'محصل', '30/08/2021'),
(168, '5000', '15/09/2021', '8', '99', 'محصل', '16/09/2021'),
(169, '5000', '15/10/2021', '8', '99', 'محصل', '27/10/2021'),
(170, '5000', '15/11/2021', '8', '99', 'محصل', '30/11/2021'),
(171, '5000', '15/12/2021', '8', '99', 'محصل', '28/12/2021'),
(172, '5000', '15/01/2022', '8', '99', 'محصل', '23/01/2022'),
(173, '4700', '15/01/2021', '13', '101', 'محصل', '05/01/2021'),
(174, '4700', '15/02/2021', '13', '101', 'محصل', '04/02/2021'),
(175, '4700', '15/03/2021', '13', '101', 'محصل', '08/03/2021'),
(176, '4700', '15/04/2021', '13', '101', 'محصل', '11/04/2021'),
(177, '4700', '15/05/2021', '13', '101', 'محصل', '05/05/2021'),
(178, '4700', '15/06/2021', '13', '101', 'محصل', '06/06/2021'),
(179, '4700', '15/07/2021', '13', '101', 'محصل', '05/07/2021'),
(180, '4700', '15/08/2021', '13', '101', 'محصل', '05/08/2021'),
(181, '4700', '15/09/2021', '13', '101', 'محصل', '05/09/2021'),
(182, '4700', '15/10/2021', '13', '101', 'محصل', '03/10/2021'),
(183, '4700', '15/11/2021', '13', '101', 'محصل', '04/11/2021'),
(184, '4700', '15/12/2021', '13', '101', 'محصل', '06/12/2021'),
(188, '4700', '15/01/2022', '13', '102', 'محصل', '05/01/2022'),
(189, '4700', '15/02/2022', '13', '102', 'محصل', '07/02/2022'),
(190, '4700', '15/03/2022', '13', '102', 'محصل', '06/03/2022'),
(191, '4700', '15/04/2022', '13', '102', 'محصل', '06/04/2022'),
(192, '4700', '15/05/2022', '13', '102', 'محصل', '01/05/2022'),
(193, '4700', '15/06/2022', '13', '102', 'محصل', '07/06/2022'),
(194, '4700', '15/07/2022', '13', '102', 'محصل', '13/07/2022'),
(195, '4700', '15/08/2022', '13', '102', 'محصل', '07/08/2022'),
(196, '4700', '15/09/2022', '13', '102', 'محصل', '19/09/2022'),
(199, '5000', '15/08/2020', '14', '104', 'محصل', '09/08/2020'),
(200, '5000', '15/09/2020', '14', '104', 'محصل', '06/09/2020'),
(201, '5000', '15/10/2020', '14', '104', 'محصل', '05/10/2020'),
(202, '5000', '15/11/2020', '14', '104', 'محصل', '08/11/2020'),
(203, '5000', '15/12/2020', '14', '104', 'محصل', '01/12/2020'),
(204, '5000', '15/01/2021', '14', '104', 'محصل', '05/01/2021'),
(205, '5000', '15/02/2021', '14', '104', 'محصل', '04/02/2021'),
(206, '5000', '15/03/2021', '14', '104', 'محصل', '01/03/2021'),
(207, '5000', '15/04/2021', '14', '104', 'محصل', '30/03/2021'),
(208, '5000', '15/05/2021', '14', '104', 'محصل', '05/05/2021'),
(209, '5000', '15/06/2021', '14', '104', 'محصل', '30/05/2021'),
(210, '5000', '15/07/2021', '14', '104', 'محصل', '05/07/2021'),
(211, '4700', '15/08/2021', '14', '105', 'محصل', '22/08/2021'),
(212, '4700', '15/09/2021', '14', '105', 'محصل', '29/08/2021'),
(213, '4700', '15/10/2021', '14', '105', 'محصل', '30/10/2021'),
(214, '4700', '15/11/2021', '14', '105', 'محصل', '31/10/2021'),
(215, '4700', '15/12/2021', '14', '105', 'محصل', '29/11/2021'),
(218, '4700', '15/01/2022', '14', '105', 'محصل', '12/01/2022'),
(219, '4700', '15/02/2022', '14', '105', 'محصل', '07/02/2022'),
(220, '4700', '15/03/2022', '14', '105', 'محصل', '06/03/2022'),
(221, '4700', '15/04/2022', '14', '105', 'محصل', '05/04/2022'),
(222, '4700', '15/05/2022', '14', '105', 'محصل', '01/05/2022'),
(223, '4700', '15/06/2022', '14', '105', 'محصل', '05/05/2022'),
(224, '4700', '15/07/2022', '14', '105', 'محصل', '03/07/2022'),
(225, '4700', '15/01/2020', '2', '107', 'محصل', '24/02/2020'),
(226, '4700', '15/02/2020', '2', '107', 'محصل', '07/04/2020'),
(227, '4700', '15/03/2020', '2', '107', 'محصل', '03/05/2020'),
(228, '4700', '15/04/2020', '2', '107', 'محصل', '31/05/2020'),
(229, '4700', '15/05/2020', '2', '107', 'محصل', '31/05/2020'),
(230, '4700', '15/06/2020', '2', '107', 'محصل', '30/06/2020'),
(231, '4700', '15/07/2020', '2', '107', 'محصل', '20/09/2020'),
(232, '4700', '15/08/2020', '2', '107', 'محصل', '20/09/2020'),
(233, '4700', '15/09/2020', '2', '107', 'محصل', '05/11/2020'),
(234, '4700', '15/10/2020', '2', '107', 'محصل', '05/11/2020'),
(235, '4700', '15/11/2020', '2', '107', 'محصل', '31/12/2020'),
(236, '4700', '15/12/2020', '2', '107', 'محصل', '31/12/2020'),
(237, '4700', '15/01/2021', '2', '108', 'محصل', '14/02/2021'),
(238, '4700', '15/02/2021', '2', '108', 'محصل', '26/03/2021'),
(239, '4700', '15/03/2021', '2', '108', 'محصل', '29/04/2021'),
(240, '4700', '15/04/2021', '2', '108', 'محصل', '30/05/2021'),
(241, '4700', '15/05/2021', '2', '108', 'محصل', '30/06/2021'),
(242, '4700', '15/06/2021', '2', '108', 'محصل', '29/07/2021'),
(243, '4700', '15/07/2021', '2', '108', 'محصل', '29/08/2021'),
(244, '4700', '15/08/2021', '2', '108', 'محصل', '19/09/2021'),
(245, '4700', '15/09/2021', '2', '108', 'محصل', '24/10/2021'),
(246, '4700', '15/10/2021', '2', '108', 'محصل', '30/11/2021'),
(247, '4700', '15/11/2021', '2', '108', 'محصل', '28/12/2021'),
(248, '4700', '15/12/2021', '2', '108', 'محصل', '31/12/2021'),
(250, '5000', '15/06/2020', '118', '110', 'محصل', '30/06/2020'),
(251, '5000', '15/07/2020', '118', '110', 'محصل', '15/07/2020'),
(253, '5000', '15/08/2020', '118', '110', 'محصل', '11/08/2020'),
(254, '5000', '15/09/2020', '118', '110', 'محصل', '24/09/2020'),
(255, '5000', '15/10/2020', '118', '110', 'محصل', '11/10/2020'),
(256, '5000', '15/11/2020', '118', '110', 'محصل', '10/11/2020'),
(257, '5000', '15/12/2020', '118', '110', 'محصل', '31/12/2020'),
(258, '5000', '15/01/2021', '118', '110', 'محصل', '10/01/2021'),
(259, '5000', '15/02/2021', '118', '110', 'محصل', '24/02/2021'),
(260, '5000', '15/03/2021', '118', '110', 'محصل', '10/03/2021'),
(261, '5000', '15/04/2021', '118', '110', 'محصل', '12/04/2021'),
(264, '4700', '15/09/2021', '9', '111', 'محصل', '25/08/2021'),
(265, '4700', '15/10/2021', '9', '111', 'محصل', '17/10/2021'),
(266, '4700', '15/11/2021', '9', '111', 'محصل', '18/11/2021'),
(267, '4700', '15/12/2021', '9', '111', 'محصل', '13/12/2021'),
(268, '4700', '15/01/2022', '9', '111', 'محصل', '16/01/2022'),
(269, '4700', '15/02/2022', '9', '111', 'محصل', '10/02/2022'),
(270, '4700', '15/03/2022', '9', '111', 'محصل', '20/03/2022'),
(271, '4700', '15/04/2022', '9', '111', 'محصل', '17/04/2022'),
(272, '4700', '15/05/2022', '9', '111', 'محصل', '15/05/2022'),
(273, '4700', '15/06/2022', '9', '111', 'محصل', '09/06/2022'),
(274, '4700', '15/07/2022', '9', '111', 'محصل', '13/07/2022'),
(275, '4700', '15/08/2022', '9', '111', 'محصل', '08/08/2022'),
(276, '5000', '15/11/2020', '15', '112', 'محصل', '12/11/2020'),
(277, '5000', '15/12/2020', '15', '112', 'محصل', '12/12/2020'),
(278, '5000', '15/01/2021', '15', '112', 'محصل', '10/01/2021'),
(279, '5000', '15/02/2021', '15', '112', 'محصل', '14/02/2021'),
(280, '5000', '15/03/2021', '15', '112', 'محصل', '08/03/2021'),
(281, '5000', '15/04/2021', '15', '112', 'محصل', '11/04/2021'),
(282, '5000', '15/05/2021', '15', '112', 'محصل', '09/05/2021'),
(283, '5000', '15/06/2021', '15', '112', 'محصل', '13/06/2021'),
(284, '5000', '15/07/2021', '15', '112', 'محصل', '07/11/2021'),
(285, '5000', '15/08/2021', '15', '112', 'محصل', '12/08/2021'),
(286, '5000', '15/09/2021', '15', '112', 'محصل', '05/09/2021'),
(287, '5000', '15/10/2021', '15', '112', 'محصل', '06/10/2021'),
(288, '4700', '15/11/2021', '15', '113', 'محصل', '07/11/2021'),
(289, '4700', '15/12/2021', '15', '113', 'محصل', '08/12/2021'),
(290, '4700', '15/01/2022', '15', '113', 'محصل', '09/01/2022'),
(291, '4700', '15/02/2022', '15', '113', 'محصل', '27/02/2022'),
(292, '4700', '15/03/2022', '15', '113', 'محصل', '06/03/2022'),
(293, '4700', '15/04/2022', '15', '113', 'محصل', '10/04/2022'),
(294, '4700', '15/05/2022', '15', '113', 'محصل', '08/05/2022'),
(295, '4700', '15/06/2022', '15', '113', 'محصل', '06/06/2022'),
(296, '4700', '15/07/2022', '15', '113', 'محصل', '14/08/2022'),
(297, '4700', '15/08/2022', '15', '113', 'محصل', '28/08/2022'),
(298, '4700', '15/09/2022', '15', '113', 'محصل', '07/09/2022'),
(300, '2500', '15/02/2021', '63', '115', 'محصل', '16/02/2021'),
(301, '2500', '15/03/2021', '63', '115', 'محصل', '10/03/2021'),
(302, '2500', '15/04/2021', '63', '115', 'محصل', '11/04/2021'),
(303, '2500', '15/05/2021', '63', '115', 'محصل', '10/05/2021'),
(304, '2500', '15/06/2021', '63', '115', 'محصل', '10/05/2021'),
(305, '2500', '15/07/2021', '63', '115', 'محصل', '11/07/2021'),
(306, '2500', '15/08/2021', '63', '115', 'محصل', '12/08/2021'),
(307, '2500', '15/09/2021', '63', '115', 'محصل', '13/09/2021'),
(308, '2500', '15/10/2021', '63', '115', 'محصل', '12/10/2021'),
(309, '2500', '15/11/2021', '63', '115', 'محصل', '14/11/2021'),
(310, '2500', '15/12/2021', '63', '115', 'محصل', '06/12/2021'),
(311, '2500', '15/01/2022', '63', '115', 'محصل', '12/01/2022'),
(312, '2800', '15/01/2020', '62', '117', 'محصل', '13/01/2020'),
(313, '2800', '15/02/2020', '62', '117', 'محصل', '20/02/2020'),
(314, '2800', '15/03/2020', '62', '117', 'محصل', '11/03/2020'),
(315, '2800', '15/04/2020', '62', '117', 'محصل', '13/04/2020'),
(316, '2800', '15/05/2020', '62', '117', 'محصل', '14/05/2020'),
(317, '2800', '15/06/2020', '62', '117', 'محصل', '11/06/2020'),
(318, '2800', '15/07/2020', '62', '117', 'محصل', '13/07/2020'),
(319, '2800', '15/08/2020', '62', '117', 'محصل', '11/08/2020'),
(320, '2800', '15/09/2020', '62', '117', 'محصل', '10/09/2020'),
(321, '2800', '15/10/2020', '62', '117', 'محصل', '11/10/2020'),
(322, '2800', '15/11/2020', '62', '117', 'محصل', '10/11/2020'),
(323, '2800', '15/12/2020', '62', '117', 'محصل', '10/12/2020'),
(324, '2800', '15/01/2021', '62', '117', 'محصل', '01/01/2021'),
(325, '2800', '15/02/2021', '62', '117', 'محصل', '14/02/2021'),
(326, '2800', '15/03/2021', '62', '117', 'محصل', '10/03/2021'),
(327, '2800', '15/04/2021', '62', '117', 'محصل', '29/04/2021'),
(328, '2800', '15/05/2021', '62', '117', 'محصل', '20/05/2021'),
(329, '2800', '15/06/2021', '62', '117', 'محصل', '27/06/2021'),
(330, '2800', '15/07/2021', '62', '117', 'محصل', '05/07/2021'),
(331, '2800', '15/08/2021', '62', '117', 'محصل', '29/08/2021'),
(332, '2800', '15/09/2021', '62', '117', 'محصل', '05/09/2021'),
(333, '2800', '15/10/2021', '62', '117', 'محصل', '21/10/2021'),
(334, '2800', '15/11/2021', '62', '117', 'محصل', '09/11/2021'),
(335, '2800', '15/12/2021', '62', '117', 'محصل', '14/12/2021'),
(336, '2500', '15/01/2020', '120', '123', 'محصل', '11/03/2020'),
(337, '2500', '15/02/2020', '120', '123', 'محصل', '13/04/2020'),
(338, '2500', '15/03/2020', '120', '123', 'محصل', '13/04/2020'),
(339, '2500', '15/04/2020', '120', '123', 'محصل', '11/06/2020'),
(340, '2500', '15/05/2020', '120', '123', 'محصل', '22/06/2020'),
(341, '2500', '15/06/2020', '120', '123', 'محصل', '30/06/2020'),
(342, '2500', '15/07/2020', '120', '123', 'محصل', '16/07/2020'),
(343, '2500', '15/08/2020', '120', '123', 'محصل', '18/08/2020'),
(344, '2500', '15/09/2020', '120', '123', 'محصل', '16/09/2020'),
(345, '2500', '15/10/2020', '120', '123', 'محصل', '15/10/2020'),
(346, '2500', '15/11/2020', '120', '123', 'محصل', '15/11/2020'),
(347, '2500', '15/12/2020', '120', '123', 'محصل', '10/12/2020'),
(348, '2500', '15/01/2021', '120', '123', 'محصل', '10/01/2021'),
(349, '2500', '15/02/2021', '120', '123', 'محصل', '14/02/2021'),
(350, '2500', '15/03/2021', '120', '123', 'محصل', '08/03/2021'),
(351, '10500', '15/04/2021', '9', '129', 'محصل', '04/04/2021'),
(352, '10500', '15/05/2021', '9', '129', 'محصل', '20/05/2021'),
(353, '10500', '15/06/2021', '9', '129', 'محصل', '20/06/2021'),
(354, '10500', '15/07/2021', '9', '129', 'محصل', '18/07/2021'),
(355, '10500', '15/08/2021', '9', '129', 'محصل', '22/08/2021'),
(356, '10500', '15/09/2021', '9', '129', 'محصل', '19/09/2021'),
(357, '10500', '15/10/2021', '9', '129', 'محصل', '17/10/2021'),
(358, '10500', '15/11/2021', '9', '129', 'محصل', '18/11/2021'),
(359, '10500', '15/12/2021', '9', '129', 'محصل', '13/12/2021'),
(364, '120000', '01/07/2019', '82', '151', 'محصل', '09/07/2019'),
(365, '5500', '15/03/2020', '6', '83', 'محصل', '15/03/2019'),
(366, '5500', '15/04/2020', '6', '83', 'محصل', '13/04/2019'),
(367, '5500', '15/05/2020', '6', '83', 'محصل', '13/05/2019'),
(368, '5000', '15/02/2020', '12', '97', 'محصل', '08/03/2020'),
(369, '5000', '15/03/2020', '12', '97', 'محصل', '30/04/2020'),
(370, '5000', '15/04/2020', '12', '97', 'محصل', '30/04/2020'),
(371, '5000', '15/05/2020', '12', '97', 'محصل', '22/06/2020'),
(372, '5000', '15/06/2020', '12', '97', 'محصل', '22/06/2020'),
(373, '5000', '15/07/2020', '12', '97', 'محصل', '22/12/2020'),
(374, '5000', '15/08/2020', '12', '97', 'محصل', '22/12/2020'),
(375, '5000', '15/09/2020', '12', '97', 'محصل', '22/12/2020'),
(376, '5000', '15/10/2020', '12', '97', 'محصل', '22/12/2020'),
(377, '5000', '15/11/2020', '12', '97', 'محصل', '31/12/2020'),
(378, '5000', '15/12/2020', '12', '97', 'محصل', '31/12/2020'),
(379, '5000', '15/01/2021', '12', '97', 'محصل', '24/06/2021'),
(380, '10500', '15/01/2022', '9', '129', 'محصل', '16/01/2022'),
(381, '10500', '15/02/2022', '9', '129', 'محصل', '17/02/2022'),
(382, '10500', '15/03/2022', '9', '129', 'محصل', '15/03/2022'),
(383, '5500', '15/05/2020', '118', '110', 'محصل', '14/05/2020'),
(384, '27900', '01/06/2020', '132', '156', 'محصل', '28/06/2020'),
(385, '27900', '31/12/2020', '132', '156', 'محصل', '31/12/2020'),
(386, '27900', '01/06/2021', '132', '156', 'محصل', '30/06/2021'),
(387, '13950', '01/12/2021', '132', '156', 'محصل', '05/12/2021'),
(388, '10000', '05/02/2020', '100', '158', 'غير محصل', NULL),
(389, '10000', '05/03/2020', '100', '158', 'محصل', '16/03/2020'),
(390, '10000', '05/04/2020', '100', '158', 'محصل', '22/06/2020'),
(391, '10000', '05/05/2020', '100', '158', 'محصل', '30/06/2020'),
(392, '10000', '05/06/2020', '100', '158', 'محصل', '30/06/2020'),
(393, '10000', '05/07/2020', '100', '158', 'محصل', '15/09/2020'),
(394, '10000', '05/08/2020', '100', '158', 'محصل', '15/10/2020'),
(395, '10000', '05/09/2020', '100', '158', 'محصل', '18/10/2020'),
(396, '10000', '05/10/2020', '100', '158', 'محصل', '16/11/2020'),
(397, '10000', '05/11/2020', '100', '158', 'محصل', '30/12/2020'),
(398, '10000', '05/12/2020', '100', '158', 'محصل', '31/12/2020'),
(399, '10000', '05/01/2021', '100', '158', 'محصل', '30/06/2021'),
(400, '10000', '05/02/2021', '100', '158', 'محصل', '30/06/2021'),
(401, '10000', '05/03/2021', '100', '158', 'محصل', '30/06/2021'),
(402, '10000', '05/04/2021', '100', '158', 'محصل', '30/06/2021'),
(403, '10000', '05/05/2021', '100', '158', 'محصل', '30/06/2021'),
(404, '10000', '05/06/2021', '100', '158', 'محصل', '30/06/2021'),
(405, '10000', '05/07/2021', '100', '158', 'محصل', '19/09/2021'),
(406, '10000', '05/08/2021', '100', '158', 'محصل', '19/09/2021'),
(407, '10000', '05/09/2021', '100', '158', 'غير محصل', ''),
(408, '10000', '05/10/2021', '100', '158', 'غير محصل', ''),
(409, '10000', '05/11/2021', '100', '158', 'محصل', '31/12/2021'),
(410, '10000', '05/12/2021', '100', '158', 'محصل', '31/12/2021'),
(411, '10000', '05/01/2022', '100', '158', 'محصل', '20/01/2022'),
(412, '5000', '05/01/2020', '4', '160', 'محصل', '23/01/2020'),
(413, '5000', '05/02/2020', '4', '160', 'محصل', '08/03/2020'),
(414, '5000', '05/03/2020', '4', '160', 'محصل', '22/03/2020'),
(415, '5000', '05/04/2020', '4', '160', 'محصل', '13/05/2020'),
(416, '5000', '05/05/2020', '4', '160', 'محصل', '13/05/2020'),
(417, '5000', '05/06/2020', '4', '160', 'محصل', '22/06/2020'),
(418, '5000', '05/07/2020', '4', '160', 'محصل', '12/07/2020'),
(419, '5000', '05/08/2020', '4', '160', 'محصل', '16/08/2020'),
(420, '5000', '05/09/2020', '4', '160', 'محصل', '08/11/2020'),
(422, '4700', '05/11/2020', '4', '160', 'محصل', '31/12/2020'),
(423, '4700', '05/12/2020', '4', '160', 'محصل', '31/12/2020'),
(424, '4700', '05/01/2021', '4', '161', 'محصل', '08/03/2021'),
(425, '4700', '05/02/2021', '4', '161', 'محصل', '06/05/2021'),
(426, '4700', '05/03/2021', '4', '161', 'محصل', '28/06/2021'),
(427, '4700', '05/04/2021', '4', '161', 'محصل', '11/07/2021'),
(428, '4700', '05/05/2021', '4', '161', 'محصل', '05/08/2021'),
(429, '4700', '05/06/2021', '4', '161', 'محصل', '22/09/2021'),
(430, '4700', '05/07/2021', '4', '161', 'محصل', '24/10/2021'),
(431, '4700', '05/08/2021', '4', '161', 'محصل', '25/11/2021'),
(432, '4700', '05/09/2021', '4', '161', 'محصل', '07/06/2022'),
(433, '4700', '05/10/2021', '4', '161', 'محصل', '07/06/2022'),
(434, '4700', '05/11/2021', '4', '161', 'محصل', '07/06/2022'),
(435, '4700', '05/12/2021', '4', '161', 'محصل', '03/07/2022'),
(436, '4700', '05/01/2022', '4', '161', 'محصل', '14/08/2022'),
(437, '4700', '05/02/2022', '4', '161', 'محصل', '14/08/2022'),
(438, '4700', '05/03/2022', '4', '161', 'محصل', '20/09/2022'),
(439, '4700', '05/04/2022', '4', '161', 'محصل', '12/10/2022'),
(440, '4700', '05/05/2022', '4', '161', 'غير محصل', NULL),
(441, '4700', '05/06/2022', '4', '161', 'غير محصل', NULL),
(442, '4700', '05/07/2022', '4', '161', 'غير محصل', NULL),
(443, '4700', '05/08/2022', '4', '161', 'غير محصل', NULL),
(444, '4700', '05/09/2022', '4', '161', 'غير محصل', NULL),
(445, '4700', '05/10/2022', '4', '161', 'غير محصل', NULL),
(446, '4700', '05/11/2022', '4', '161', 'غير محصل', NULL),
(447, '4700', '05/12/2022', '4', '161', 'غير محصل', NULL),
(448, '4700', '01/01/2023', '4', '162', 'غير محصل', NULL),
(449, '4700', '01/02/2023', '4', '162', 'غير محصل', NULL),
(450, '4700', '01/03/2023', '4', '162', 'غير محصل', NULL),
(451, '4700', '01/04/2023', '4', '162', 'غير محصل', NULL),
(452, '4700', '05/10/2020', '4', '160', 'محصل', '31/12/2020');

-- --------------------------------------------------------

--
-- Table structure for table `cheques`
--

CREATE TABLE `cheques` (
  `Cheques_Id` int(11) NOT NULL,
  `Cheques_No` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cheques_Date` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cheques_Amount` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cheque_Owner` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `beneficiary_person` varchar(200) DEFAULT NULL,
  `Cheques_Status` varchar(200) NOT NULL,
  `Collect_Type` varchar(200) DEFAULT NULL,
  `cheque_type_Cheque_Type_id` int(11) NOT NULL,
  `bank_Bank_Id` int(11) NOT NULL,
  `tenants_Tenants_ID` int(11) NOT NULL,
  `contract_Contract_Id` int(11) NOT NULL,
  `Collection_Date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cheques`
--

INSERT INTO `cheques` (`Cheques_Id`, `Cheques_No`, `Cheques_Date`, `Cheques_Amount`, `Cheque_Owner`, `beneficiary_person`, `Cheques_Status`, `Collect_Type`, `cheque_type_Cheque_Type_id`, `bank_Bank_Id`, `tenants_Tenants_ID`, `contract_Contract_Id`, `Collection_Date`) VALUES
(3, '01000025', '05/01/2023', '5700', 'ابول حسن كريم ', NULL, 'محصل', 'محصل بالشيك', 1, 2, 34, 12, '09/02/2023'),
(4, '01000028', '05/02/2023', '5700', 'ابول حسن كريم', NULL, 'محصل بالشيك', 'محصل بالشيك', 1, 2, 34, 12, '10/02/2023'),
(5, '01000029', '05/03/2023', '5700', 'ابول حسن كريم', NULL, 'محصل بالشيك', NULL, 1, 2, 34, 12, '10/03/2023'),
(6, '01000026', '05/04/2023', '5700', 'ابول حسن كريم ', NULL, 'محصل', 'محصل بالشيك', 1, 2, 34, 12, '05/04/2023'),
(7, '01000032', '05/08/2023', '5700', 'ابول حسن كريم ', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(8, '01000031', '05/07/2023', '5700', 'ابول حسن كريم ', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(9, '01000030', '05/06/2023', '5700', 'ابول حسن كريم ', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(10, '01000027', '05/05/2023', '5700', 'ابول حسن كريم ', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(11, '01000036', '05/12/2023', '5700', 'ابول حسن كريم', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(12, '01000035', '05/11/2023', '5700', 'ابول حسن كريم', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(13, '01000034', '05/10/2023', '5700', 'ابول حسن كريم', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(14, '01000033', '09/09/2023', '5700', 'ابول حسن كريم ', NULL, 'غير محصل', NULL, 1, 2, 34, 12, ''),
(19, '1000091', '03/01/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 17, 18, '03/01/2023'),
(20, '1000092', '03/02/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'محصل بالشيك', NULL, 1, 2, 17, 18, '10/02/2023'),
(21, '1000093', '03/03/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'محصل بالشيك', NULL, 1, 2, 17, 18, '10/03/2023'),
(22, '1000094', '03/04/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 17, 18, '05/04/2022'),
(23, '1000095', '03/05/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(24, '1000096', '03/06/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(25, '1000097', '03/07/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(26, '1000098', '03/08/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(27, '1000099', '03/09/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(28, '1000100', '03/10/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(29, '1000101', '03/11/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(30, '1000102', '03/12/2023', '3500', 'بيرومالسامي بالاسوبراامانيان', NULL, 'غير محصل', NULL, 1, 2, 17, 18, ''),
(31, '1000012', '05/01/2023', '5500', 'لوز فيمي اندا', NULL, 'محصل', 'محصل بالشيك', 1, 2, 33, 19, '05/01/2023'),
(32, '1000013', '05/02/2023', '5500', 'لوز فيمي اندا', NULL, 'محصل بالشيك', NULL, 1, 2, 33, 19, '10/02/2023'),
(33, '1000014', '05/03/2023', '5500', 'لوز فيمي اندا', NULL, 'محصل بالشيك', NULL, 1, 2, 33, 19, '10/03/2023'),
(34, '1000015', '05/04/2023', '5500', 'لوز فيمي اندا', NULL, 'محصل', 'محصل بالشيك', 1, 2, 33, 19, '05/04/2023'),
(35, '1000016', '05/05/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(36, '1000017', '05/06/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(37, '1000018', '05/07/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(38, '1000019', '05/08/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(39, '1000020', '05/09/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(40, '1000021', '05/10/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(41, '1000022', '05/11/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(42, '1000023', '05/12/2023', '5500', 'لوز فيمي اندا', NULL, 'غير محصل', NULL, 1, 2, 33, 19, ''),
(43, '01000048', '01/01/2023', '3500', 'سواراكشيث كومار', NULL, 'محصل', 'محصل بالشيك', 1, 3, 31, 20, '01/01/2023'),
(44, '01000049', '01/02/2023', '3500', 'سواراكشيث كومار', NULL, 'محصل بالشيك', NULL, 1, 3, 31, 20, '10/02/2023'),
(45, '1000071', '01/03/2023', '3500', 'سواراكشيث كومار', NULL, 'محصل بالشيك', NULL, 1, 3, 31, 20, '10/03/2023'),
(46, '1000072', '01/04/2023', '3500', 'سواراكشيث كومار', NULL, 'محصل', 'محصل بالشيك', 1, 3, 31, 20, '01/04/2023'),
(47, '1000073', '01/05/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(48, '1000074', '01/06/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(49, '1000075', '01/07/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(50, '1000076', '01/08/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(51, '1000077', '01/09/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(52, '1000078', '01/10/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(53, '1000079', '01/11/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(54, '1000080', '01/12/2023', '3500', 'سواراكشيث كومار', NULL, 'غير محصل', NULL, 1, 3, 31, 20, ''),
(55, '1000027', '01/01/2023', '3400', 'جكاد ياشواره ردي', NULL, 'محصل', 'محصل بالشيك', 1, 2, 22, 23, '01/01/2023'),
(56, '1000039', '01/02/2023', '3400', 'جكاد ياشواره ردي', NULL, 'محصل بالشيك', NULL, 1, 2, 22, 23, '10/02/2023'),
(57, '1000040', '01/03/2023', '3400', 'جكاد ياشواره ردي', NULL, 'محصل بالشيك', NULL, 1, 2, 22, 23, '10/03/2023'),
(58, '1000041', '01/04/2023', '3400', 'جكاد ياشواره ردي', NULL, 'محصل', 'محصل بالشيك', 1, 2, 22, 23, '01/04/2023'),
(59, '1000042', '01/05/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(60, '1000043', '01/06/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(61, '1000044', '01/07/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(62, '1000045', '01/08/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(63, '1000046', '01/09/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(64, '1000047', '01/10/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(65, '1000048', '01/11/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(66, '1000050', '01/12/2023', '3400', 'جكاد ياشواره ردي', NULL, 'غير محصل', NULL, 1, 2, 22, 23, ''),
(67, '1000014', '07/01/2023', '4500', 'راجيش بت يان', NULL, 'محصل', 'محصل بالشيك', 1, 3, 24, 24, '07/01/2023'),
(68, '1000015', '07/02/2023', '4500', 'راجيش بت يان', NULL, 'محصل بالشيك', NULL, 1, 3, 24, 24, '10/02/2023'),
(69, '1000016', '07/03/2023', '4500', 'راجيش بت يان', NULL, 'محصل بالشيك', NULL, 1, 3, 24, 24, '10/03/2023'),
(70, '1000017', '07/04/2023', '4500', 'راجيش بت يان', NULL, 'محصل', 'محصل بالشيك', 1, 3, 24, 24, '07/04/2023'),
(71, '1000018', '07/05/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(72, '1000019', '07/06/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(73, '1000020', '07/07/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(74, '1000021', '07/08/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(75, '1000022', '07/09/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(76, '1000023', '07/10/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(77, '1000024', '07/11/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(78, '1000025', '07/12/2023', '4500', 'راجيش بت يان', NULL, 'غير محصل', NULL, 1, 3, 24, 24, ''),
(79, '1000035', '06/01/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'محصل', 'محصل بالشيك', 1, 2, 29, 25, '06/01/2023'),
(80, '1000036', '06/02/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'محصل بالشيك', NULL, 1, 2, 29, 25, '10/02/2023'),
(81, '1000037', '06/03/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'محصل بالشيك', NULL, 1, 2, 29, 25, '10/03/2023'),
(82, '1000038', '06/04/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'محصل', 'محصل بالشيك', 1, 2, 29, 25, '06/04/2023'),
(83, '1000039', '06/05/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(84, '1000040', '06/06/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(85, '1000041', '06/07/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(86, '1000042', '06/08/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(87, '1000043', '06/09/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(88, '1000044', '06/10/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(89, '1000045', '06/11/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(90, '1000046', '06/12/2023', '4300', 'احمد نبيل عبد العزيز', NULL, 'غير محصل', NULL, 1, 2, 29, 25, ''),
(103, '1000013', '10/01/2023', '4300', 'محمد قابيل محمد علي', NULL, 'محصل', 'محصل بالشيك', 1, 2, 26, 28, '10/01/2023'),
(104, '1000014', '10/02/2023', '4300', 'محمد قابيل محمد علي', NULL, 'Collected', 'Collected By Cheque', 1, 2, 26, 28, '10/02/2023'),
(105, '1000015', '10/03/2023', '4300', 'محمد قابيل محمد علي', NULL, 'Collected', 'Collected By Cheque', 1, 2, 26, 28, '10/03/2023'),
(106, '1000016', '10/04/2023', '4300', 'محمد قابيل محمد علي', NULL, 'محصل', 'محصل بالشيك', 1, 2, 26, 28, '10/04/2023'),
(107, '1000017', '10/05/2023', '4300', 'محمد قابيل محمد علي', NULL, 'Collected', 'Collected By Transformation', 1, 2, 26, 28, '09/07/2023'),
(108, '1000018', '10/06/2023', '4300', 'محمد قابيل محمد علي', NULL, 'غير محصل', NULL, 1, 2, 26, 28, ''),
(109, '1000019', '10/07/2023', '4300', 'محمد قابيل محمد علي', NULL, 'غير محصل', NULL, 1, 2, 26, 28, ''),
(110, '1000020', '10/08/2023', '4300', 'محمد قابيل محمد علي', NULL, 'غير محصل', NULL, 1, 2, 26, 28, ''),
(111, '1000021', '10/09/2023', '4300', 'محمد قابيل محمد علي', NULL, 'غير محصل', NULL, 1, 2, 26, 28, ''),
(112, '1000022', '10/10/2023', '4300', 'محمد قابيل محمد علي', NULL, 'غير محصل', NULL, 1, 2, 26, 28, ''),
(113, '1000023', '10/11/2023', '4300', 'محمد قابيل محمد علي', NULL, 'غير محصل', NULL, 1, 2, 26, 28, ''),
(114, '1000024', '10/12/2023', '4300', 'محمد قابيل محمد علي', NULL, 'غير محصل', NULL, 1, 2, 26, 28, ''),
(128, '01000063', '01/02/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'Collected', 'Collected By Cheque', 1, 3, 18, 34, '10/02/2023'),
(129, '1000064', '05/03/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'Collected', 'Collected By Cheque', 1, 3, 18, 34, '10/03/2023'),
(130, '1000065', '05/04/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'محصل', 'محصل بالشيك', 1, 3, 18, 34, '05/04/2023'),
(131, '1000066', '05/05/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(132, '1000067', '05/06/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(133, '1000068', '05/07/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(134, '1000069', '05/08/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(135, '1000070', '05/09/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(136, '1000071', '05/10/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(137, '1000072', '05/11/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(138, '1000073', '05/12/2023', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(139, '1000074', '05/01/2024', '4500', 'ايدورد موجادو بير دوس', NULL, 'غير محصل', NULL, 1, 3, 18, 34, ''),
(140, '98', '06/01/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'محصل', 'محصل بالشيك', 1, 1, 32, 35, '06/01/2023'),
(141, '99', '06/02/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'Collected', 'Collected By Cheque', 1, 1, 32, 35, '10/02/2023'),
(142, '100', '06/03/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'Collected', 'Collected By Cheque', 1, 1, 32, 35, '10/02/2023'),
(143, '102', '06/04/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'محصل', 'محصل بالشيك', 1, 1, 32, 35, '06/04/2023'),
(144, '103', '06/05/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(145, '104', '06/06/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(146, '105', '06/07/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(147, '106', '06/08/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(148, '107', '06/09/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(149, '108', '06/10/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(150, '109', '06/11/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(151, '110', '06/12/2023', '4300', 'احمد سعيد عبد السلام', NULL, 'غير محصل', NULL, 1, 1, 32, 35, ''),
(169, '1000039', '05/02/2023', '4500', 'بيفين فيجيناراه', NULL, 'Collected', 'Collected By Cheque', 1, 2, 23, 39, '10/02/2023'),
(170, '1000040', '05/03/2023', '4500', 'بيفين فيجيناراه', NULL, 'Collected', 'Collected By Cheque', 1, 2, 23, 39, '10/02/2023'),
(171, '1000041', '05/04/2023', '4500', 'بيفين فيجيناراه', NULL, 'محصل', 'محصل بالشيك', 1, 2, 23, 39, '05/04/2023'),
(172, '1000042', '05/05/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(173, '1000043', '05/06/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(174, '1000044', '05/07/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(175, '1000045', '05/08/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(176, '1000046', '05/09/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(177, '1000047', '05/10/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(178, '1000048', '05/11/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(179, '1000049', '05/12/2023', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(180, '1000050', '05/01/2024', '4500', 'بيفين فيجيناراه', NULL, 'غير محصل', NULL, 1, 2, 23, 39, ''),
(193, '1000034', '08/01/2023', '4700', 'اشوك لاما', '', 'محصل', 'محصل بالشيك', 1, 2, 13, 41, '08/01/2023'),
(194, '1000035', '08/02/2023', '4700', 'اشوك لاما', NULL, 'Collected', 'Collected By Cheque', 1, 2, 13, 41, '10/02/2023'),
(195, '1000036', '08/03/2023', '4700', 'اشوك لاما', NULL, 'محصل بالشيك', NULL, 1, 2, 13, 41, '10/02/2023'),
(196, '1000037', '08/04/2023', '4700', 'اشوك لاما', NULL, 'محصل', 'محصل بالشيك', 1, 2, 13, 41, '08/04/2023'),
(197, '1000038', '08/05/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(198, '1000039', '08/06/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(199, '1000040', '08/07/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(200, '1000041', '08/08/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(201, '1000042', '08/09/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(202, '1000043', '08/10/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(203, '1000044', '08/11/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(204, '1000045', '08/12/2023', '4700', 'اشوك لاما', NULL, 'غير محصل', NULL, 1, 2, 13, 41, ''),
(205, '12', '10/01/2023', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 42, '10/01/2023'),
(206, '13', '10/02/2023', '4700', 'افزال كريم', NULL, 'محصل بالشيك', NULL, 1, 1, 15, 42, '10/02/2023'),
(207, '14', '10/03/2023', '4700', 'افزال كريم', NULL, 'محصل بالشيك', NULL, 1, 1, 15, 42, '10/02/2023'),
(208, '15', '10/04/2023', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 42, '10/04/2023'),
(209, '16', '10/05/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(210, '17', '10/06/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(211, '18', '10/07/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(212, '19', '10/08/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(213, '20', '10/09/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(214, '21', '10/10/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(215, '22', '10/11/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(216, '23', '10/12/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 42, ''),
(217, '1000005', '05/02/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'محصل بالشيك', NULL, 1, 2, 102, 45, '10/02/2023'),
(218, '1000006', '05/03/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'محصل بالشيك', NULL, 1, 2, 102, 45, '10/03/2023'),
(219, '1000007', '05/04/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'محصل', 'محصل بالشيك', 1, 2, 102, 45, '05/04/2023'),
(220, '1000008', '05/05/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(221, '01000009', '05/06/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(222, '1000011', '05/07/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(223, '1000012', '05/08/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(224, '1000013', '05/09/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(225, '1000014', '05/10/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(226, '1000015', '05/11/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(227, '1000016', '05/12/2023', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(228, '1000017', '05/01/2024', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 1, 2, 102, 45, ''),
(229, '01000018', '01/5/2024', '4300', 'مشيل بولس ندها عبد المسيح', NULL, 'غير محصل', NULL, 4, 2, 102, 45, ''),
(230, '1000001', '03/02/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'محصل بالشيك', NULL, 1, 2, 101, 46, '10/02/2023'),
(231, '1000002', '03/03/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'محصل بالشيك', NULL, 1, 2, 101, 46, '10/03/2023'),
(232, '1000003', '03/04/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'محصل', 'محصل بالشيك', 1, 2, 101, 46, '03/04/2023'),
(233, '1000004', '03/05/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(234, '1000005', '03/06/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(235, '1000006', '03/07/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(236, '1000007', '03/08/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(237, '1000008', '03/09/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(238, '1000009', '03/10/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(239, '1000010', '03/11/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(240, '1000011', '03/12/2023', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(241, '1000012', '03/01/2024', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 1, 2, 101, 46, ''),
(242, '01000014', '03/02/2024', '3300', 'سوداكار يلوو شيفاجي', NULL, 'غير محصل', NULL, 4, 2, 101, 46, ''),
(243, '1002253', '08/02/2023', '10000', 'مطعم المرخية', NULL, 'محصل بالشيك', NULL, 1, 3, 74, 47, '10/02/2023'),
(244, '1002254', '08/03/2023', '10000', 'مطعم المرخية', NULL, 'محصل بالشيك', NULL, 1, 3, 74, 47, '10/03/2023'),
(245, '1002255', '08/04/2023', '10000', 'مطعم المرخية', NULL, 'محصل', 'محصل بالشيك', 1, 3, 74, 47, '08/04/2023'),
(246, '1002256', '08/05/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(247, '1002257', '08/06/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(248, '1002258', '08/07/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(249, '1002259', '08/08/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(250, '1002260', '08/09/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(251, '1002261', '08/10/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(252, '1002262', '08/11/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(253, '1002263', '08/12/2023', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(254, '1002252', '08/01/2024', '10000', 'مطعم المرخية', NULL, 'غير محصل', NULL, 1, 3, 74, 47, ''),
(262, '00000244', '01/12/2022', '13000', 'عبدالله فهد النعيمي', NULL, 'محصل بالشيك', NULL, 1, 8, 75, 49, '10/12/2022'),
(263, '00000245', '30/01/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'محصل بالشيك', NULL, 1, 8, 75, 49, '10/01/2023'),
(264, '246', '05/02/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'محصل بالشيك', NULL, 1, 8, 75, 49, '10/02/2023'),
(265, '247', '05/03/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'محصل بالشيك', NULL, 1, 8, 75, 49, '10/03/2023'),
(266, '248', '05/04/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(267, '249', '05/05/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(268, '250', '05/06/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(269, '251', '05/07/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(270, '502', '05/08/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(271, '503', '05/09/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(272, '504', '05/10/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(273, '505', '05/11/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(274, '506', '05/12/2023', '10000', 'عبدالله فهد النعيمي', NULL, 'غير محصل', NULL, 1, 8, 75, 49, ''),
(275, '1002340', '05/02/2023', '7500', 'كنجو محمد راشد', NULL, 'محصل بالشيك', NULL, 1, 2, 82, 51, '10/02/2023'),
(276, '1002341', '05/03/2023', '7500', 'كنجو محمد راشد', NULL, 'محصل بالشيك', NULL, 1, 2, 82, 51, '10/03/2023'),
(277, '1002342', '05/04/2023', '7500', 'كنجو محمد راشد', NULL, 'محصل', 'محصل بالشيك', 1, 2, 82, 51, '05/04/2023'),
(278, '1002343', '05/05/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(279, '1002344', '05/06/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(280, '1002345', '05/07/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(281, '1002346', '05/08/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(282, '1002347', '05/09/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(283, '1002348', '05/10/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(284, '1002349', '05/11/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(285, '1002350', '05/12/2023', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(286, '1002351', '05/01/2024', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(287, '01002352', '05/02/2024', '7500', 'كنجو محمد راشد', NULL, 'غير محصل', NULL, 1, 2, 82, 51, ''),
(288, '1000063', '05/08/2023', '132000', 'محمد ظروف احمد ابي', NULL, 'غير محصل', NULL, 2, 3, 80, 52, ''),
(289, '00000001', '07/01/2023', '9000', 'رويال كير', NULL, 'محصل', 'محصل بالشيك', 1, 1, 103, 53, '07/01/2023'),
(290, '00000002', '07/02/2023', '9000', 'رويال كير', NULL, 'محصل', 'محصل بالشيك', 1, 1, 103, 53, '07/02/2023'),
(291, '00000003', '07/03/2023', '9000', 'رويال كير', NULL, 'محصل', 'محصل بالشيك', 1, 1, 103, 53, '07/03/2023'),
(292, '00000005', '07/04/2023', '9000', 'رويال كير', NULL, 'محصل', 'محصل بالشيك', 1, 1, 103, 53, '07/04/2023'),
(293, '6', '07/05/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 1, 1, 103, 53, ''),
(294, '7', '07/06/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 1, 1, 103, 53, ''),
(295, '8', '07/07/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 1, 1, 103, 53, ''),
(296, '9', '07/08/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 1, 1, 103, 53, ''),
(297, '10', '07/09/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 1, 1, 103, 53, ''),
(298, '11', '07/10/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 1, 1, 103, 53, ''),
(299, '12', '07/11/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 1, 1, 103, 53, ''),
(300, '00000014', '07/12/2023', '9000', 'رويال كير', NULL, 'غير محصل', NULL, 4, 1, 103, 53, ''),
(301, '00000096', '08/03/2023', '2500', 'ايه كي اسكندر', NULL, 'محصل', 'محصل بالشيك', 1, 9, 9, 54, '08/03/2023'),
(302, '00000096', '03/03/2023', '3000', 'ايه كي اسكندر', NULL, 'محصل', 'محصل بالشيك', 1, 9, 9, 55, '03/03/2023'),
(303, '0000001', '01/09/2020', '96000', 'ليلاس للمفروشات', NULL, 'محصل', 'محصل بالشيك', 1, 1, 87, 56, '01/09/2020'),
(304, '0000002', '01/09/2021', '96000', 'ليلاس للمفروشات', NULL, 'محصل', 'محصل بالشيك', 1, 1, 87, 56, '01/09/2021'),
(305, '0000099', '01/09/2022', '32000', 'ليلاس للمفروشات', NULL, 'محصل', 'محصل بالشيك', 1, 1, 87, 56, '01/09/2022'),
(306, '0000100', '01/01/2023', '32000', 'ليلاس للمفروشات', NULL, 'محصل', 'محصل بالشيك', 1, 1, 87, 56, '01/01/2023'),
(307, '0000100', '01/05/2023', '32000', 'ليلاس للمفروشات', NULL, 'غير محصل', NULL, 1, 1, 87, 56, ''),
(308, '0000100', '01/01/2024', '32000', 'ليلاس للمفروشات', NULL, 'غير محصل', NULL, 1, 1, 87, 56, ''),
(309, '0000100', '01/09/2024', '32000', 'ليلاس للمفروشات', NULL, 'غير محصل', NULL, 1, 1, 87, 56, ''),
(310, '0000100', '01/09/2024', '32000', 'ليلاس للمفروشات', NULL, 'غير محصل', NULL, 1, 1, 87, 56, ''),
(311, '0000109', '29/05/2025', '8000', 'ليلاس للمفروشات', NULL, 'غير محصل', NULL, 4, 1, 87, 56, ''),
(312, '1000176', '05/08/2022', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 57, '05/08/2023'),
(313, '1000177', '05/09/2022', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 57, '05/09/2022'),
(314, '1000178', '05/10/2022', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 57, '05/10/2022'),
(315, '1000179', '05/11/2022', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 57, '05/11/2022'),
(316, '1000180', '05/12/2022', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 57, '05/12/2022'),
(317, '1000181', '05/01/2023', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 57, '05/01/2022'),
(318, '1000182', '05/02/2023', '4700', 'مكتر حسين', NULL, 'محصل بالشيك', NULL, 1, 2, 5, 57, '10/02/2023'),
(319, '1000183', '05/03/2023', '4700', 'مكتر حسين', NULL, 'محصل بالشيك', NULL, 1, 2, 5, 57, '10/03/2023'),
(320, '1000184', '05/04/2023', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 57, '05/04/2023'),
(321, '1000185', '05/05/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 57, ''),
(322, '1000186', '05/06/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 57, ''),
(323, '1000187', '05/07/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 57, ''),
(324, '1000051', '24/08/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 4, 2, 5, 57, ''),
(325, '1', '10/10/2022', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 58, '10/10/2022'),
(326, '2', '10/11/2022', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 58, '10/11/2022'),
(327, '3', '10/12/2022', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 58, '10/12/2022'),
(328, '4', '10/01/2023', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 58, '10/01/2023'),
(329, '5', '10/02/2023', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 58, '10/02/2023'),
(330, '6', '10/03/2023', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 58, '10/03/2023'),
(331, '7', '10/04/2023', '4700', 'افزال كريم', NULL, 'محصل', 'محصل بالشيك', 1, 1, 15, 58, '10/04/2023'),
(332, '8', '10/05/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 58, ''),
(333, '9', '10/06/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 58, ''),
(334, '10', '10/07/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 58, ''),
(335, '11', '10/08/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 58, ''),
(336, '12', '10/09/2023', '4700', 'افزال كريم', NULL, 'غير محصل', NULL, 1, 1, 15, 58, ''),
(337, '1000166', '08/03/2023', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 59, '08/03/2023'),
(338, '01000289', '08/05/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(339, '01000288', '08/04/2023', '4700', 'مكتر حسين', NULL, 'محصل', 'محصل بالشيك', 1, 2, 5, 59, '08/04/2023'),
(340, '01000290', '08/06/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(341, '01000292', '08/07/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(342, '01000165', '08/08/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(343, '01000295', '08/09/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(344, '01000296', '08/10/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(345, '01000297', '08/11/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(346, '01000298', '08/12/2023', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(347, '01000299', '08/01/2024', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(348, '01000300', '08/02/2024', '4700', 'مكتر حسين', NULL, 'غير محصل', NULL, 1, 2, 5, 59, ''),
(349, '70', '07/06/2023', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(350, '71', '07/07/2023', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(351, '72', '07/08/2023', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(352, '73', '07/09/2023', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(353, '74', '07/10/2023', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(354, '75', '07/11/2023', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(355, '76', '07/12/2023', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(356, '77', '07/01/2024', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(357, '78', '07/02/2024', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(358, '79', '07/03/2024', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(359, '80', '07/04/2024', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(360, '81', '07/05/2024', '2000', 'شركة ق للحلول', NULL, 'غير محصل', NULL, 1, 11, 104, 61, ''),
(361, '1000694', '10/06/2021', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/06/2021'),
(362, '1000695', '10/07/2021', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/07/2021'),
(363, '1000696', '10/08/2021', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/08/2021'),
(364, '1000697', '10/09/2021', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/09/2021'),
(365, '1000698', '10/10/2021', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/10/2021'),
(366, '1000699', '10/11/2021', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/11/2021'),
(367, '1000700', '10/12/2021', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/12/2021'),
(368, '1000701', '10/01/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/01/2022'),
(369, '1000702', '10/02/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/02/2022'),
(370, '1000703', '10/03/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/03/2022'),
(371, '1000704', '10/04/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/04/2022'),
(372, '1000705', '10/05/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/05/2022'),
(373, '1000706', '10/06/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/06/2022'),
(374, '1000707', '10/07/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/07/2022'),
(375, '1000708', '10/08/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/08/2022'),
(376, '1000709', '10/09/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/09/2022'),
(377, '1000710', '10/10/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/10/2022'),
(378, '1000711', '10/11/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/11/2022'),
(379, '1000712', '10/12/2022', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/12/2022'),
(380, '1000653', '10/11/2022', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(381, '1000654', '10/12/2022', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(382, '1000655', '10/01/2023', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/01/2023'),
(383, '1000656', '10/02/2023', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/02/2023'),
(384, '1000657', '10/03/2023', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/03/2023'),
(385, '1000658', '10/04/2023', '10000', 'مهدي  رحيمانيان', NULL, 'محصل', 'محصل بالشيك', 1, 2, 73, 65, '10/04/2023'),
(386, '1000659', '10/05/2023', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(387, '1000660', '10/06/2023', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(388, '1000661', '10/07/2023', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(389, '1000662', '10/08/2023', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(390, '1000663', '10/09/2023', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(391, '1000664', '10/10/2023', '10000', 'مهدي  رحيمانيان', NULL, 'غير محصل', NULL, 1, 2, 73, 65, NULL),
(406, '1000003', '03/04/2023', '3700', 'كمال ششيريا', NULL, 'محصل', 'محصل بالشيك', 1, 2, 105, 67, '03/04/2023'),
(407, '1000004', '03/05/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(408, '1000005', '03/06/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(409, '1000006', '03/07/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(410, '1000007', '03/08/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(411, '01000008', '03/09/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(412, '1000010', '03/10/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(413, '1000011', '03/11/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(414, '1000012', '03/12/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(415, '1000013', '03/01/2024', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(416, '1000014', '03/02/2024', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 1, 2, 105, 67, NULL),
(417, '01000001', '03/10/2023', '3700', 'كمال ششيريا', NULL, 'غير محصل', NULL, 4, 2, 105, 67, NULL),
(418, '1000457', '10/03/2023', '4200', 'ناجير ناصر', NULL, 'محصل', 'محصل بالشيك', 1, 2, 30, 70, '10/03/2023'),
(419, '1000458', '10/04/2023', '4200', 'ناجير ناصر', NULL, 'محصل', 'محصل بالشيك', 1, 2, 30, 70, '10/04/2023'),
(420, '1000459', '10/05/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(421, '1000460', '10/06/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(422, '1000461', '10/07/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(423, '1000462', '10/08/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(424, '1000463', '10/09/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(425, '1000464', '10/10/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(426, '1000465', '10/11/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(427, '1000466', '10/12/2023', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(428, '1000467', '10/01/2024', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(429, '1000468', '10/02/2024', '4200', 'ناجير ناصر', NULL, 'غير محصل', NULL, 1, 2, 30, 70, NULL),
(430, '60', '08/03/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'محصل', 'محصل بالشيك', 1, 1, 19, 73, '08/03/2023'),
(431, '61', '08/04/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'محصل', 'محصل بالشيك', 1, 1, 19, 73, '08/04/2023'),
(432, '62', '08/05/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(433, '63', '08/06/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(434, '65', '08/07/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(435, '66', '08/08/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(436, '67', '08/09/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(437, '68', '08/10/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(438, '69', '08/11/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(439, '74', '08/12/2023', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(440, '72', '08/01/2024', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(441, '73', '08/02/2024', '4100', 'امجد ابو زيد', 'الشيخ فهد', 'غير محصل', NULL, 1, 1, 19, 73, NULL),
(442, '01000035', '05/02/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(443, '1000001', '05/03/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(444, '1000002', '05/04/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(445, '1000003', '05/05/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(446, '1000004', '05/06/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(447, '1000005', '05/07/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(448, '1000006', '05/08/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(449, '1000007', '05/09/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(450, '1000008', '05/10/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(451, '1000009', '05/11/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(452, '1000010', '05/12/2024', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(453, '1000011', '05/01/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(454, '1000012', '05/02/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(455, '1000013', '05/03/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(456, '1000014', '05/04/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(457, '1000015', '05/05/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(458, '1000016', '05/06/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(459, '1000017', '05/07/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(460, '1000018', '05/08/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(461, '1000019', '05/09/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(462, '1000020', '05/10/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(463, '1000021', '05/11/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(464, '1000022', '05/12/2025', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(465, '1000023', '05/01/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(466, '1000024', '05/02/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(467, '1000025', '05/03/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(468, '1000026', '05/04/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(469, '1000027', '05/05/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(470, '1000028', '05/06/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(471, '1000029', '05/07/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(472, '1000030', '05/08/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(473, '1000031', '05/09/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(474, '1000032', '05/10/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(475, '1000033', '05/11/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(476, '1000034', '05/12/2026', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 1, 2, 110, 76, NULL),
(477, '1000036', '30/01/2027', '4000', 'علاء سلامة حامد عوضين', NULL, 'غير محصل', NULL, 4, 2, 110, 76, NULL),
(478, 'نقدي', '31/12/2023', '5000', 'محمد شمسو مياه', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 4, 9, 10, 91, NULL),
(479, '000070', '01/01/2023', '6000', 'اسماعيل نلكات', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 4, 8, 11, 92, '01/01/2023'),
(480, '000070', '01/01/2023', '6000', 'اسماعيل نلكات', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 4, 8, 11, 93, NULL),
(483, '123', '05/02/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '05/02/2020'),
(484, '124', '05/03/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '05/03/2020'),
(485, '125', '05/04/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '05/04/2020'),
(486, '126', '05/05/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '05/05/2020'),
(487, '127', '05/06/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '19/07/2020'),
(488, '128', '05/07/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '19/07/2020'),
(489, '129', '05/08/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '23/08/2020'),
(490, '130', '05/09/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/06/2021'),
(491, '131', '05/10/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '06/12/2020'),
(492, '132', '05/11/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '06/12/2020'),
(493, '133', '05/12/2020', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '06/12/2020'),
(494, '134', '05/01/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 1, 65, 121, NULL),
(495, '135', '05/02/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '25/04/2021'),
(496, '136', '05/03/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '25/04/2021'),
(497, '137', '05/04/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '25/04/2021'),
(498, '138', '05/05/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '25/04/2021'),
(499, '139', '05/06/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/06/2021'),
(500, '140', '05/07/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/06/2021'),
(501, '141', '05/08/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/06/2021'),
(502, '142', '05/09/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/06/2021'),
(503, '143', '05/10/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '31/12/2021'),
(504, '144', '05/11/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '31/12/2021'),
(505, '145', '05/12/2021', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '31/12/2021'),
(506, '146', '05/01/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '12/01/2022'),
(507, '147', '05/02/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '27/04/2022'),
(508, '148', '05/03/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '27/04/2022'),
(509, '149', '05/04/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '27/04/2022'),
(510, '150', '05/05/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '08/05/2022'),
(511, '151', '05/06/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/06/2022'),
(512, '152', '05/07/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '05/07/2022'),
(513, '153', '05/08/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '02/08/2022'),
(514, '154', '05/09/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/09/2022'),
(515, '155', '05/10/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '03/10/2022'),
(516, '156', '05/11/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/11/2022'),
(517, '157', '05/12/2022', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 1, 65, 121, '01/12/2022'),
(518, '158', '05/01/2023', '2500', 'كانيون', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 1, 65, 121, NULL),
(519, '00000082', '12/04/2023', '2500', 'ديدار عزيز الله ', 'الشيخ فهد ال ثاني ', 'محصل', 'محصل بالشيك', 1, 1, 63, 116, '12/04/2023'),
(520, '00000081', '12/05/2023', '2500', 'ديدرا عزيز الله ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 1, 63, 116, NULL),
(521, '00000080', '12/06/2023', '2500', 'ديدرا عزيز الله ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 1, 63, 116, NULL),
(522, '00000079', '12/07/2023', '2500', 'ديدرا عزيز الله ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 1, 63, 116, NULL),
(534, '01001513', '01/07/2027', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 2, 8, 84, 131, NULL),
(535, '1001452', '01/07/2022', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(536, '1001453', '01/08/2022', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(537, '1001454', '01/09/2022', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(538, '1001455', '01/10/2022', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(539, '1001456', '01/11/2022', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(540, '1001457', '01/12/2022', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(541, '1001458', '01/01/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(542, '1001459', '01/02/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(543, '1001460', '01/03/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(544, '1001461', '01/04/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(545, '1001462', '01/05/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(546, '1001463', '01/06/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(547, '1001464', '01/07/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(548, '1001465', '01/08/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(549, '1001466', '01/09/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(550, '1001467', '01/10/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(551, '1001468', '01/11/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(552, '1001469', '01/12/2023', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(553, '1001470', '01/01/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(554, '1001471', '01/02/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(555, '1001472', '01/03/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(556, '1001473', '01/04/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(557, '1001474', '01/05/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(558, '1001475', '01/06/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(559, '1001476', '01/07/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(560, '1001477', '01/08/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(561, '1001478', '01/09/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(562, '1001479', '01/10/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL);
INSERT INTO `cheques` (`Cheques_Id`, `Cheques_No`, `Cheques_Date`, `Cheques_Amount`, `Cheque_Owner`, `beneficiary_person`, `Cheques_Status`, `Collect_Type`, `cheque_type_Cheque_Type_id`, `bank_Bank_Id`, `tenants_Tenants_ID`, `contract_Contract_Id`, `Collection_Date`) VALUES
(563, '1001480', '01/11/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(564, '1001481', '01/12/2024', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(565, '1001482', '01/01/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(566, '1001483', '01/02/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(567, '1001484', '01/03/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(568, '1001485', '01/04/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(569, '1001486', '01/05/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(570, '1001487', '01/06/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(571, '1001488', '01/07/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(572, '1001489', '01/08/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(573, '1001490', '01/09/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(574, '1001491', '01/10/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(575, '1001492', '01/11/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(576, '1001493', '01/12/2025', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(577, '1001494', '01/01/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(578, '1001495', '01/02/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(579, '1001496', '01/03/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(580, '1001497', '01/04/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(581, '1001498', '01/05/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(582, '1001499', '01/06/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(583, '1001500', '01/07/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(584, '1001501', '01/08/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(585, '1001502', '01/09/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(586, '1001503', '01/10/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(587, '1001504', '01/11/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(588, '1001505', '01/12/2026', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(589, '1001506', '01/01/2027', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(590, '1001507', '01/02/2027', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(591, '1001508', '01/03/2027', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(592, '1001509', '01/04/2027', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(593, '1001510', '01/05/2027', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(594, '1001511', '01/06/2027', '12000', 'شاين تكنولوجي', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 84, 131, NULL),
(596, '01000575', '08/05/2024', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 4, 2, 9, 136, NULL),
(597, '147', '08/11/2022', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 9, 136, '08/11/2022'),
(598, '148', '08/12/2022', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 9, 136, '08/12/2022'),
(599, '149', '08/01/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 9, 136, '08/01/2023'),
(600, '150', '08/02/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 9, 136, '08/02/2023'),
(601, '151', '08/03/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(602, '152', '08/04/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 9, 136, '08/04/2023'),
(603, '153', '08/05/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(604, '154', '08/06/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(605, '155', '08/07/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(606, '156', '08/08/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(607, '163', '08/09/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(608, '164', '08/10/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(609, '165', '08/11/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(610, '166', '08/12/2023', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(611, '167', '08/01/2024', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(612, '168', '08/02/2024', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(613, '169', '08/03/2024', '10500', 'اي كي ام اسكندر', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 9, 136, NULL),
(614, '1', '10/04/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 8, 59, 143, '10/04/2023'),
(615, '2', '10/05/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(616, '3', '10/06/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(617, '4', '10/07/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(618, '5', '10/08/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(619, '6', '10/09/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(620, '7', '10/10/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(621, '8', '10/11/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(622, '9', '10/12/2023', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(623, '10', '10/01/2024', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(624, '11', '10/02/2024', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(625, '12', '10/03/2024', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 8, 59, 143, NULL),
(626, '00000013', '10/04/2024', '9000', 'جورخا بايك', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 4, 8, 59, 143, NULL),
(627, '1000008', '01/03/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 126, 145, '01/03/2023'),
(628, '1000009', '01/04/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 126, 145, '01/04/2023'),
(629, '1000010', '01/05/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(630, '1000012', '10/06/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(631, '1000013', '10/07/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(632, '1000014', '10/08/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(633, '1000015', '10/09/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(634, '1000016', '10/10/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(635, '1000017', '10/11/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(636, '1000018', '10/12/2023', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(637, '1000019', '10/01/2024', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(638, '1000020', '10/02/2024', '1000', 'محمد راشد  باركوت', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 126, 145, NULL),
(639, '00000172', '15/04/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'محصل', 'محصل بالشيك', 1, 9, 127, 146, '15/04/2023'),
(640, '162', '15/05/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(641, '163', '15/06/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(642, '164', '15/07/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(643, '165', '15/08/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(644, '166', '15/09/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(645, '167', '15/10/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(646, '168', '15/11/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(647, '169', '15/12/2023', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(648, '170', '15/01/2024', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(649, '171', '15/02/2024', '3000', 'علاء شعبان عطا', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 9, 127, 146, NULL),
(663, '01000022', '08/04/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'محصل', 'محصل بالشيك', 1, 2, 125, 144, '08/04/2023'),
(664, '01000023', '08/05/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(665, '01000024', '08/06/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(666, '01000025', '08/07/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(667, '01000026', '08/08/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(668, '01000027', '08/09/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(669, '01000036', '08/10/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(670, '01000029', '08/11/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(671, '01000035', '08/12/2023', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(672, '01000031', '08/01/2024', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(673, '01000032', '08/02/2024', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(674, '01000033', '08/03/2024', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 125, 144, NULL),
(675, '01000037', '08/04/2024', '2500', 'محمد رشيد ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 2, 2, 125, 144, NULL),
(676, '01000064', '08/08/2023', '8000', 'مستفيرور الرحمان ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 129, 147, NULL),
(677, '01000063', '08/10/2023', '8000', 'مستفيرور الرحمان ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 129, 147, NULL),
(678, '01000065', '08/12/2023', '8000', 'مستفيرو الرحمان ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 129, 147, NULL),
(679, '01000066', '08/02/2024', '8000', 'مستفيرو الرحمان ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 129, 147, NULL),
(680, '01000067', '08/04/2024', '8000', 'مستقيرو الرحمان ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 129, 147, NULL),
(681, '01000068', '08/06/2024', '8000', 'مستفيرو الرحمان ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 129, 147, NULL),
(682, '01000069', '08/08/2024', '8000', 'مستفيرو الرحمان ', 'الشيخ فهد ال ثاني ', 'غير محصل', NULL, 1, 2, 129, 147, NULL),
(683, '1000117', '10/03/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'مرتجع', '', 1, 2, 129, 149, ''),
(684, '1000118', '10/04/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'محصل', 'محصل بالشيك', 1, 2, 129, 149, '10/04/2023'),
(685, '1000119', '10/05/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(686, '1000120', '10/06/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(687, '1000121', '10/07/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(688, '1000122', '10/08/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(689, '1000123', '10/09/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(690, '1000124', '10/10/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(691, '1000125', '10/11/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(692, '01000116', '10/12/2023', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(693, '01000052', '10/01/2024', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 1, 2, 129, 149, NULL),
(694, '01000051', '10/02/2024', '3000', 'مستفزور الرحمان', 'الشيخ فهد بن عبدالله ال ثاني', 'غير محصل', NULL, 2, 2, 129, 149, NULL),
(695, '1000039', '12/06/2023', '9000', 'اسد الرحمان', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 100, 159, NULL),
(696, '1000040', '12/07/2023', '9000', 'اسد الرحمان', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 100, 159, NULL),
(697, '1000041', '12/08/2023', '9000', 'اسد الرحمان', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 100, 159, NULL),
(698, '1000042', '12/09/2023', '9000', 'اسد الرحمان', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 100, 159, NULL),
(699, '1000043', '12/10/2023', '9000', 'اسد الرحمان', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 100, 159, NULL),
(700, '1000044', '12/11/2023', '9000', 'اسد الرحمان', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 100, 159, NULL),
(701, '1000045', '12/12/2023', '9000', 'اسد الرحمان', 'الشيخ فهد ال ثاني', 'غير محصل', NULL, 1, 2, 100, 159, NULL),
(702, '10001', '01/08/2023', '3000', 'Ahmad', 'Saeed', 'غير محصل', NULL, 1, 17, 131, 165, NULL),
(703, '10002', '01/09/2023', '3000', 'Ahmad', 'Saeed', 'غير محصل', NULL, 1, 17, 131, 165, NULL),
(704, '10003', '01/10/2023', '3000', 'Ahmad', 'Saeed', 'غير محصل', NULL, 1, 17, 131, 165, NULL),
(705, '10004', '01/11/2023', '3000', 'Ahmad', 'Saeed', 'غير محصل', NULL, 1, 17, 131, 165, NULL),
(706, '10005', '01/12/2023', '3000', 'Ahmad', 'Saeed', 'غير محصل', NULL, 1, 17, 131, 165, NULL),
(707, '10005', '01/01/2024', '3000', 'Ahmad', 'Ahmad', 'غير محصل', NULL, 1, 17, 131, 165, NULL),
(708, '12304', '11/07/2023', '2000', 'Test', 'Fahed', 'Collected', 'Collected By Cheque', 1, 9, 130, 166, '13/07/2023'),
(709, '12305', '11/08/2023', '2000', 'Test', 'Fahed', 'Collected', 'Collected By Cheque', 1, 9, 130, 166, '18/08/2023'),
(710, '12306', '11/09/2023', '2000', 'Test', 'Fahed', 'غير محصل', NULL, 1, 9, 130, 166, NULL),
(711, '12307', '11/10/2023', '2000', 'Test', 'Fahed', 'غير محصل', NULL, 1, 9, 130, 166, NULL),
(712, '12308', '11/11/2023', '2000', 'Test', 'Fahed', 'غير محصل', NULL, 1, 9, 130, 166, NULL),
(713, '12309', '11/12/2023', '2000', 'Test', 'Fahed', 'غير محصل', NULL, 1, 9, 130, 166, NULL),
(714, '123001', '13/07/2023', '2000', 'XXXX', 'CCCCCC', 'غير محصل', NULL, 1, 8, 3, 167, NULL),
(715, '123002', '13/08/2023', '2000', 'XXXX', 'CCCCCC', 'غير محصل', NULL, 1, 8, 3, 167, NULL),
(716, '123003', '13/09/2023', '2000', 'XXXX', 'CCCCCC', 'غير محصل', NULL, 1, 8, 3, 167, NULL),
(717, '123004', '13/10/2023', '2000', 'XXXX', 'CCCCCC', 'غير محصل', NULL, 1, 8, 3, 167, NULL),
(718, '123005', '13/11/2023', '2000', 'XXXX', 'CCCCCC', 'غير محصل', NULL, 1, 8, 3, 167, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cheque_type`
--

CREATE TABLE `cheque_type` (
  `Cheque_Type_id` int(11) NOT NULL,
  `Cheque_english_Type` varchar(200) NOT NULL,
  `Cheque_arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cheque_type`
--

INSERT INTO `cheque_type` (`Cheque_Type_id`, `Cheque_english_Type`, `Cheque_arabic_Type`) VALUES
(1, 'monthly payment Cheque', 'شيك دفع شهري'),
(2, 'Warranty Cheque ', 'شيك ضمان'),
(3, 'annual payment Cheque', 'شيك دفع سنوي'),
(4, 'Insurance Checks', 'شيك تأمين');

-- --------------------------------------------------------

--
-- Table structure for table `collection_table`
--

CREATE TABLE `collection_table` (
  `Id` int(11) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `Ownersip_Id` varchar(45) DEFAULT NULL,
  `Building_Id` varchar(45) DEFAULT NULL,
  `Unit_Id` varchar(45) DEFAULT NULL,
  `Mounth` varchar(45) DEFAULT NULL,
  `Year` varchar(45) DEFAULT NULL,
  `Collection` varchar(45) DEFAULT NULL,
  `Management_Expenses` varchar(45) DEFAULT NULL,
  `RealEstate_Expenses` varchar(45) DEFAULT NULL,
  `Maintenance_Expenses` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `collection_table`
--

INSERT INTO `collection_table` (`Id`, `Type`, `Ownersip_Id`, `Building_Id`, `Unit_Id`, `Mounth`, `Year`, `Collection`, `Management_Expenses`, `RealEstate_Expenses`, `Maintenance_Expenses`) VALUES
(3, NULL, '4', '8', 'إختر رقم الوحدة ....', '12', '2022', '130000', '', '0', '0'),
(6, NULL, '17', '30', '183', '1', '2023', '5700', '', NULL, NULL),
(7, NULL, '4', '8', NULL, '9', '2022', '130000', '', NULL, NULL),
(8, NULL, '4', '8', NULL, '10', '2022', '130000', '', '2060', '0'),
(9, NULL, '4', '8', NULL, '11', '2022', '130000', '', NULL, NULL),
(10, NULL, '4', 'إختر اسم البناء ....', '', '1', '2021', NULL, '', '0', '6000'),
(11, NULL, '4', '8', 'إختر رقم الوحدة ....', '1', '2021', NULL, '', '0', '6000'),
(12, NULL, '17', '30', '168', '1', '2023', '3500', '', NULL, NULL),
(13, NULL, '17', '30', '182', '1', '2023', '5500', '', NULL, NULL),
(14, NULL, '17', '30', '180', '1', '2023', '3500', '', NULL, NULL),
(15, NULL, '17', '30', '171', '1', '2023', '3500', '', NULL, NULL),
(16, NULL, '17', '30', '173', '1', '2023', '4500', '', NULL, NULL),
(17, NULL, '17', '30', '178', '1', '2023', '4300', '', NULL, NULL),
(18, NULL, '17', '30', '181', '1', '2023', '4300', '', NULL, NULL),
(19, NULL, '17', '30', '175', '1', '2023', '4300', '', NULL, NULL),
(20, NULL, '14', '26', NULL, '9', '2022', '35000', '', NULL, NULL),
(21, NULL, '4', '8', 'إختر رقم الوحدة ....', '1', '2023', '130000', '', '', '0'),
(22, NULL, '12', '25', NULL, '1', '2023', '70000', '', NULL, NULL),
(23, NULL, '16', '28', '25', '1', '2023', '47000', '', NULL, NULL),
(24, NULL, '16', '28', '7', '1', '2023', '4700', '', NULL, NULL),
(25, NULL, '43', '45', '220', '9', '2020', '96000', '', NULL, NULL),
(26, NULL, '43', '45', '220', '9', '2021', '96000', '', NULL, NULL),
(27, NULL, '43', '45', '220', '9', '2022', '32000', '', NULL, NULL),
(28, NULL, '43', '45', '220', '1', '2023', '32000', '', NULL, NULL),
(29, NULL, '16', '28', '6', '8', '2022', '4700', '', '981', '460'),
(30, NULL, '16', '28', '6', '9', '2022', '4700', '', NULL, NULL),
(31, NULL, '16', '28', '6', '10', '2022', '4700', '', '0', '500'),
(32, NULL, '16', '28', '6', '11', '2022', '4700', '', '1085', '7210'),
(33, NULL, '16', '28', '6', '12', '2022', '4700', '', '2729', '20'),
(34, NULL, '16', '28', '6', '1', '2023', '4700', '', NULL, NULL),
(35, NULL, '16', '28', '29', '10', '2022', '4700', '', '0', '500'),
(36, NULL, '16', '28', '29', '11', '2022', '4700', '', '1085', '7210'),
(37, NULL, '16', '28', '29', '12', '2022', '4700', '', '2729', '20'),
(38, NULL, '16', '28', '29', '1', '2023', '4700', '', NULL, NULL),
(39, NULL, '4', '53', NULL, '1', '2023', '40000', '', NULL, NULL),
(40, NULL, '14', '26', NULL, '10', '2022', '35000', '', NULL, NULL),
(41, NULL, '14', '26', NULL, '11', '2022', '35000', '', NULL, NULL),
(42, NULL, '14', '26', NULL, '12', '2022', '35000', '', NULL, NULL),
(43, NULL, '14', '26', NULL, '1', '2023', '35000', '', NULL, NULL),
(44, NULL, '17', '29', NULL, '8', '2022', '36850', '', '5', '958'),
(45, NULL, '17', '29', NULL, '9', '2022', '36850', '', NULL, NULL),
(46, NULL, '17', '29', NULL, '10', '2022', '36850', '', '1000', '0'),
(47, NULL, '17', '29', NULL, '11', '2022', '36850', '', NULL, NULL),
(48, NULL, '17', '29', NULL, '1', '2023', '36850', '', NULL, NULL),
(49, NULL, '6', '18', NULL, '8', '2022', '10000', '', NULL, NULL),
(50, NULL, '6', '18', NULL, '9', '2022', '10000', '', NULL, NULL),
(51, NULL, '6', '18', NULL, '10', '2022', '10000', '', NULL, NULL),
(52, NULL, '6', '18', NULL, '11', '2022', '10000', '', NULL, NULL),
(53, NULL, '6', '18', NULL, '12', '2022', '10000', '', NULL, NULL),
(54, NULL, '6', '18', NULL, '1', '2023', '10000', '', NULL, NULL),
(55, NULL, '16', '65', NULL, '1', '2023', '37600', '', NULL, NULL),
(56, NULL, '18', '66', NULL, '4', '2022', '26000', '', NULL, NULL),
(57, NULL, '18', '66', NULL, '5', '2022', '26000', '', NULL, NULL),
(58, NULL, '18', '66', NULL, '6', '2022', '26000', '', NULL, NULL),
(59, NULL, '18', '66', NULL, '7', '2022', '26000', '', NULL, NULL),
(60, NULL, '18', '66', NULL, '8', '2022', '26000', '', NULL, NULL),
(61, NULL, '18', '66', NULL, '9', '2022', '26000', '', NULL, NULL),
(62, NULL, '18', '66', NULL, '10', '2022', '26000', '', NULL, NULL),
(63, NULL, '18', '66', NULL, '11', '2022', '26000', '', NULL, NULL),
(64, NULL, '18', '66', NULL, '12', '2022', '26000', '', NULL, NULL),
(65, NULL, '18', '66', NULL, '1', '2023', '26000', '', NULL, NULL),
(66, NULL, '16', '68', NULL, '12', '2022', '14100', '', '2729', '20'),
(67, NULL, '16', '68', NULL, '1', '2023', '14100', '', NULL, NULL),
(68, NULL, '9', '70', NULL, '12', '2022', '9000', '', NULL, NULL),
(69, NULL, '9', '70', NULL, '1', '2023', '9000', '', NULL, NULL),
(70, NULL, '17', '71', NULL, '8', '2022', '36580', '', '5', '958'),
(71, NULL, '17', '71', NULL, '9', '2022', '36580', '', NULL, NULL),
(72, NULL, '17', '71', NULL, '10', '2022', '36580', '', '1000', '0'),
(73, NULL, '17', '71', NULL, '11', '2022', '36580', '', NULL, NULL),
(74, NULL, '17', '71', NULL, '12', '2022', '36580', '', NULL, NULL),
(75, NULL, '17', '71', NULL, '1', '2023', '36580', '', NULL, NULL),
(76, NULL, '4', '72', NULL, '1', '2023', '40000', '', NULL, NULL),
(77, NULL, '16', '', '', '1', '2021', NULL, '', '0', '16000'),
(78, NULL, '6', '18', '', '1', '2021', NULL, '', '0', '69'),
(79, NULL, '6', '11', 'إختر رقم الوحدة ....', '1', '2021', NULL, '', '0', '69'),
(80, NULL, '6', '18', 'إختر رقم الوحدة ....', '1', '2021', NULL, '', '0', '0'),
(81, NULL, '15', '27', '144', '1', '2021', NULL, '', '0', '238'),
(82, NULL, '15', '27', '146', '1', '2021', NULL, '', '0', '136'),
(83, NULL, '15', '27', '147', '1', '2021', NULL, '', '0', '496'),
(84, NULL, '16', '28', '14', '1', '2021', NULL, '', '0', '155'),
(85, NULL, '16', '28', '19', '1', '2021', NULL, '', '0', '60'),
(86, NULL, '16', '28', '24', '1', '2021', '5000', '', '0', '95'),
(87, NULL, '16', '28', '30', '1', '2021', NULL, '', '0', '242.5'),
(88, NULL, '16', '28', '33', '1', '2021', NULL, '', '0', '242.5'),
(89, NULL, '10', '22', '118', '1', '2021', NULL, '', '0', '0'),
(90, NULL, '10', '22', '121', '1', '2021', NULL, '', '0', '0'),
(91, NULL, '16', '28', '6', '1', '2021', NULL, '', '0', '16000'),
(92, NULL, '16', '28', '17', '1', '2021', NULL, '', '0', '0'),
(93, NULL, '16', '28', '23', '1', '2021', '5000', '', '0', '68'),
(94, NULL, '16', '28', '27', '1', '2021', NULL, '', '0', '0'),
(95, NULL, '16', '28', '29', '1', '2021', NULL, '', '0', '16000'),
(96, NULL, '10', '22', '118', '2', '2021', NULL, '', '0', '2449'),
(97, NULL, '10', '22', '121', '2', '2021', NULL, '', '0', '3064'),
(98, NULL, '15', '27', '147', '2', '2021', NULL, '', '0', '170'),
(99, NULL, '16', '28', '7', '2', '2021', '5000', '', '0', '40'),
(100, NULL, '16', '28', '7', '1', '2021', NULL, '', '0', '0'),
(101, NULL, '16', '28', '14', '2', '2021', NULL, '', '0', '1435'),
(102, NULL, '16', '28', '17', '2', '2021', NULL, '', '0', '560'),
(103, NULL, '16', '28', '23', '2', '2021', '5000', '', '0', '68'),
(104, NULL, '16', '28', '27', '2', '2021', NULL, '', '0', '282'),
(105, NULL, '16', '28', '29', '2', '2021', NULL, '', '0', '1570'),
(106, NULL, '4', '', '', '2', '2021', NULL, '', '0', '6000'),
(107, NULL, '6', '11', '97', '3', '2021', NULL, '', '0', '110'),
(108, NULL, '6', '18', '99', '5', '2021', NULL, '', '0', '2500'),
(109, NULL, '8', '', '', '6', '2021', NULL, '', '0', '0'),
(110, NULL, '8', '', '', '7', '2021', NULL, '', '0', '0'),
(111, NULL, '9', '', '', '7', '2021', NULL, '', '0', '1759'),
(112, NULL, '9', '', '', '12', '2021', NULL, '', '0', '20'),
(113, NULL, '10', '22', '121', '12', '2021', NULL, '', '12286', '0'),
(114, NULL, '15', '', '', '6', '2021', NULL, '', '0', '6782'),
(115, NULL, '15', '', '', '10', '2021', NULL, '', '0', '21'),
(116, NULL, '15', '', '', '12', '2021', NULL, '', '0', '66'),
(117, NULL, '15', '27', '144', '6', '2021', NULL, '', '0', '20'),
(118, NULL, '15', '27', '144', '8', '2021', NULL, '', '0', '375'),
(119, NULL, '15', '27', '146', '8', '2021', NULL, '', '0', '215'),
(120, NULL, '15', '27', '147', '8', '2021', NULL, '', '0', '44'),
(121, NULL, '15', '27', '148', '8', '2021', NULL, '', '0', '5655'),
(122, NULL, '16', '', '', '4', '2021', NULL, '', '0', '905'),
(123, NULL, '16', '', '', '5', '2021', NULL, '', '0', '5525'),
(124, NULL, '16', '', '', '7', '2021', NULL, '', '0', '2259'),
(125, NULL, '16', '', '', '8', '2021', NULL, '', '0', '450'),
(126, NULL, '16', '', '', '9', '2021', NULL, '', '0', '2175'),
(127, NULL, '16', '', '', '10', '2021', NULL, '', '0', '2355'),
(128, NULL, '16', '28', '3', '3', '2021', '4700', '', '0', '500'),
(129, NULL, '16', '28', '3', '4', '2021', '4700', '', '0', '200'),
(130, NULL, '16', '28', '3', '6', '2021', '4700', '', '0', '250'),
(131, NULL, '16', '28', '3', '7', '2021', '4700', '', '0', '250'),
(132, NULL, '16', '28', '3', '10', '2021', '4700', '', '0', '150'),
(133, NULL, '16', '28', '4', '6', '2021', NULL, '', '0', '250'),
(134, NULL, '16', '28', '4', '8', '2021', NULL, '', '0', '150'),
(135, NULL, '16', '28', '5', '8', '2021', NULL, '', '0', '650'),
(136, NULL, '16', '28', '5', '11', '2021', NULL, '', '0', '450'),
(137, NULL, '16', '28', '6', '4', '2021', NULL, '', '0', '560'),
(138, NULL, '16', '28', '6', '7', '2021', NULL, '', '0', '720'),
(139, NULL, '16', '28', '6', '8', '2021', '4700', '', '0', '360'),
(140, NULL, '16', '28', '7', '4', '2021', '5000', '', '0', '250'),
(141, NULL, '16', '28', '7', '5', '2021', '5000', '', '0', '170'),
(142, NULL, '16', '28', '7', '6', '2021', '5000', '', '0', '220'),
(143, NULL, '16', '28', '7', '8', '2021', '5000', '', '0', '270'),
(144, NULL, '16', '28', '7', '9', '2021', '5000', '', '0', '680'),
(145, NULL, '16', '28', '7', '10', '2021', '5000', '', '0', '150'),
(146, NULL, '16', '28', '7', '11', '2021', '5000', '', '0', '300'),
(147, NULL, '16', '28', '7', '12', '2021', '5000', '', '0', '250'),
(148, NULL, '16', '28', '8', '3', '2021', NULL, '', '0', '250'),
(149, NULL, '16', '28', '8', '7', '2021', NULL, '', '0', '1075'),
(150, NULL, '16', '28', '8', '8', '2021', NULL, '', '0', '120'),
(151, NULL, '16', '28', '8', '10', '2021', NULL, '', '0', '220'),
(152, NULL, '16', '28', '10', '3', '2021', NULL, '', '0', '270'),
(153, NULL, '16', '28', '10', '4', '2021', NULL, '', '0', '380'),
(154, NULL, '16', '28', '10', '6', '2021', NULL, '', '0', '250'),
(155, NULL, '16', '28', '10', '8', '2021', NULL, '', '0', '150'),
(156, NULL, '16', '28', '13', '3', '2021', NULL, '', '0', '250'),
(157, NULL, '16', '28', '13', '4', '2021', NULL, '', '0', '30'),
(158, NULL, '16', '28', '13', '12', '2021', NULL, '', '0', '1900'),
(159, NULL, '16', '28', '14', '3', '2021', NULL, '', '0', '60'),
(160, NULL, '16', '28', '14', '4', '2021', NULL, '', '0', '841'),
(161, NULL, '16', '28', '14', '5', '2021', NULL, '', '0', '736'),
(162, NULL, '16', '28', '14', '7', '2021', NULL, '', '0', '250'),
(163, NULL, '16', '28', '14', '8', '2021', NULL, '', '0', '66'),
(164, NULL, '16', '28', '14', '12', '2021', NULL, '', '0', '1050'),
(165, NULL, '16', '28', '15', '4', '2021', NULL, '', '0', '700'),
(166, NULL, '16', '28', '15', '5', '2021', NULL, '', '0', '350'),
(167, NULL, '16', '28', '15', '9', '2021', NULL, '', '0', '250'),
(168, NULL, '16', '28', '15', '10', '2021', NULL, '', '0', '180'),
(169, NULL, '16', '28', '15', '11', '2021', NULL, '', '0', '237'),
(170, NULL, '16', '28', '16', '4', '2021', '5000', '', '0', '600'),
(171, NULL, '16', '28', '16', '6', '2021', '5000', '', '0', '455'),
(172, NULL, '16', '28', '16', '7', '2021', '5000', '', '0', '250'),
(173, NULL, '16', '28', '16', '8', '2021', '5000', '', '0', '250'),
(174, NULL, '16', '28', '16', '10', '2021', '5000', '', '0', '780'),
(175, NULL, '16', '28', '17', '3', '2021', NULL, '', '0', '240'),
(176, NULL, '16', '28', '17', '5', '2021', NULL, '', '0', '1000'),
(177, NULL, '16', '28', '17', '11', '2021', NULL, '', '0', '100'),
(178, NULL, '16', '28', '18', '5', '2021', NULL, '', '0', '180'),
(179, NULL, '16', '28', '18', '6', '2021', NULL, '', '0', '340'),
(180, NULL, '16', '28', '18', '7', '2021', NULL, '', '0', '150'),
(181, NULL, '16', '28', '18', '9', '2021', NULL, '', '0', '1000'),
(182, NULL, '16', '28', '18', '10', '2021', NULL, '', '0', '250'),
(183, NULL, '16', '28', '19', '3', '2021', NULL, '', '0', '780'),
(184, NULL, '16', '28', '19', '5', '2021', NULL, '', '0', '290'),
(185, NULL, '16', '28', '19', '8', '2021', NULL, '', '0', '120'),
(186, NULL, '16', '28', '19', '9', '2021', NULL, '', '0', '360'),
(187, NULL, '16', '28', '19', '10', '2021', NULL, '', '0', '730'),
(188, NULL, '16', '28', '20', '9', '2021', '4700', '', '0', '950'),
(189, NULL, '16', '28', '20', '10', '2021', '4700', '', '0', '300'),
(190, NULL, '16', '28', '22', '3', '2021', '4700', '', '0', '560'),
(191, NULL, '16', '28', '22', '4', '2021', '4700', '', '0', '400'),
(192, NULL, '16', '28', '22', '6', '2021', '4700', '', '0', '340'),
(193, NULL, '16', '28', '22', '8', '2021', '4700', '', '0', '270'),
(194, NULL, '16', '28', '22', '11', '2021', '4700', '', '0', '200'),
(195, NULL, '16', '28', '23', '3', '2021', '5000', '', '0', '200'),
(196, NULL, '16', '28', '23', '4', '2021', '5000', '', '0', '250'),
(197, NULL, '16', '28', '23', '5', '2021', NULL, '', '0', '385'),
(198, NULL, '16', '28', '23', '12', '2021', '13950', '', '0', '70'),
(199, NULL, '16', '28', '24', '3', '2021', '5000', '', '0', '300'),
(200, NULL, '16', '28', '24', '5', '2021', '5000', '', '0', '300'),
(201, NULL, '16', '28', '24', '6', '2021', '5000', '', '0', '550'),
(202, NULL, '16', '28', '24', '7', '2021', '5000', '', '0', '200'),
(203, NULL, '16', '28', '24', '11', '2021', '4700', '', '0', '630'),
(204, NULL, '16', '28', '25', '4', '2021', NULL, '', '0', '280'),
(205, NULL, '16', '28', '25', '6', '2021', NULL, '', '0', '100'),
(206, NULL, '16', '28', '25', '8', '2021', NULL, '', '0', '790'),
(207, NULL, '16', '28', '25', '10', '2021', NULL, '', '0', '100'),
(208, NULL, '16', '28', '25', '11', '2021', NULL, '', '0', '320'),
(209, NULL, '16', '28', '26', '6', '2021', NULL, '', '0', '450'),
(210, NULL, '16', '28', '26', '8', '2021', NULL, '', '0', '155'),
(211, NULL, '16', '28', '26', '9', '2021', NULL, '', '0', '370'),
(212, NULL, '16', '28', '26', '10', '2021', NULL, '', '0', '150'),
(213, NULL, '16', '28', '27', '4', '2021', NULL, '', '0', '200'),
(214, NULL, '16', '28', '27', '6', '2021', NULL, '', '0', '320'),
(215, NULL, '16', '28', '27', '7', '2021', NULL, '', '0', '550'),
(216, NULL, '16', '28', '27', '8', '2021', NULL, '', '0', '1900'),
(217, NULL, '16', '28', '28', '3', '2021', NULL, '', '0', '320'),
(218, NULL, '16', '28', '28', '10', '2021', NULL, '', '0', '180'),
(219, NULL, '16', '28', '28', '12', '2021', NULL, '', '0', '280'),
(220, NULL, '16', '28', '29', '3', '2021', NULL, '', '0', '895'),
(221, NULL, '16', '28', '29', '6', '2021', NULL, '', '0', '150'),
(222, NULL, '16', '28', '29', '7', '2021', NULL, '', '0', '150'),
(223, NULL, '16', '28', '29', '9', '2021', NULL, '', '0', '586'),
(224, NULL, '16', '28', '29', '11', '2021', NULL, '', '0', '566'),
(225, NULL, '16', '28', '29', '12', '2021', NULL, '', '0', '200'),
(226, NULL, '16', '28', '30', '7', '2021', NULL, '', '0', '300'),
(227, NULL, '16', '28', '30', '8', '2021', NULL, '', '0', '150'),
(228, NULL, '16', '28', '30', '10', '2021', NULL, '', '0', '200'),
(229, NULL, '16', '28', '31', '3', '2021', NULL, '', '0', '320'),
(230, NULL, '16', '28', '31', '5', '2021', NULL, '', '0', '580'),
(231, NULL, '16', '28', '31', '6', '2021', NULL, '', '0', '180'),
(232, NULL, '16', '28', '31', '10', '2021', NULL, '', '0', '2680'),
(233, NULL, '16', '28', '31', '11', '2021', NULL, '', '0', '300'),
(234, NULL, '16', '28', '34', '5', '2021', NULL, '', '0', '200'),
(235, NULL, '16', '28', '34', '6', '2021', NULL, '', '0', '150'),
(236, NULL, '16', '28', '34', '12', '2021', NULL, '', '0', '70'),
(237, NULL, '16', '28', '32', '6', '2021', NULL, '', '0', '100'),
(238, NULL, '16', '28', '32', '10', '2021', NULL, '', '0', '545'),
(239, NULL, '16', '28', '33', '9', '2021', NULL, '', '0', '200'),
(240, NULL, '16', '28', '33', '10', '2021', NULL, '', '0', '200'),
(241, NULL, '17', '', '', '6', '2021', NULL, '', '130781', '0'),
(242, NULL, '17', '', '', '10', '2021', NULL, '', '0', '750'),
(243, NULL, '17', '', '', '11', '2021', NULL, '', '0', '218'),
(244, NULL, '17', '', '', '12', '2021', NULL, '', '15000', '0'),
(245, NULL, '17', '29', '150', '5', '2021', NULL, '', '0', '32'),
(246, NULL, '17', '29', '151', '6', '2021', NULL, '', '130781', '0'),
(247, NULL, '17', '29', '152', '4', '2021', NULL, '', '0', '2164'),
(248, NULL, '17', '29', '153', '4', '2021', NULL, '', '0', '360'),
(249, NULL, '17', '29', '154', '4', '2021', NULL, '', '0', '8281'),
(250, NULL, '17', '29', '155', '4', '2021', NULL, '', '0', '8642'),
(251, NULL, '17', '29', '156', '4', '2021', NULL, '', '0', '50'),
(252, NULL, '17', '29', '157', '4', '2021', NULL, '', '0', '1179'),
(253, NULL, '17', '29', '158', '4', '2021', NULL, '', '0', '2525'),
(254, NULL, '17', '29', '160', '4', '2021', NULL, '', '0', '628'),
(255, NULL, '17', '29', '162', '4', '2021', NULL, '', '0', '200'),
(256, NULL, '17', '29', '162', '6', '2021', NULL, '', '130781', '0'),
(257, NULL, '17', '29', '162', '8', '2021', NULL, '', '', '400'),
(258, NULL, '17', '29', '162', '9', '2021', NULL, '', '', '300'),
(259, NULL, '17', '29', '166', '8', '2021', NULL, '', '0', '350'),
(260, NULL, '17', '29', '163', '4', '2021', NULL, '', '0', '600'),
(261, NULL, '17', '29', '163', '7', '2021', NULL, '', '0', '65'),
(262, NULL, '17', '29', '163', '8', '2021', NULL, '', '0', '250'),
(263, NULL, '19', '32', '188', '6', '2021', NULL, '', '0', '5895'),
(264, NULL, '26', '59', '258', '4', '2021', NULL, '', '0', '640'),
(265, NULL, '26', '59', '258', '6', '2021', NULL, '', '0', '7628'),
(266, NULL, '26', '59', '258', '12', '2021', NULL, '', '0', '3000'),
(267, NULL, '26', '60', 'إختر رقم الوحدة ....', '6', '2021', NULL, '', '0', '10416'),
(268, NULL, '35', '42', '217', '5', '2021', NULL, '', '0', '750'),
(269, NULL, '35', '42', '217', '10', '2021', NULL, '', '0', '681'),
(270, NULL, '37', '51', '232', '10', '2021', NULL, '', '24306', '0'),
(271, NULL, '37', '51', '233', '10', '2021', NULL, '', '0', '270'),
(272, NULL, '37', '51', '233', '12', '2021', NULL, '', '0', '539965'),
(273, NULL, '37', '51', '234', '12', '2021', NULL, '', '24306', '0'),
(274, NULL, '4', '', '', '4', '2021', NULL, '', '10320', '0'),
(275, NULL, '4', '', '', '9', '2021', NULL, '', '10159', '0'),
(276, NULL, '4', '', '', '12', '2021', NULL, '', '6000', '0'),
(277, NULL, '6', '18', '102', '6', '2022', NULL, '', '7093', '0'),
(278, NULL, '8', '', '', '3', '2022', NULL, '', '0', '350'),
(279, NULL, '8', '', '', '4', '2022', NULL, '', '0', '50'),
(280, NULL, '8', '', '', '5', '2022', NULL, '', '24380', ''),
(281, NULL, '8', '', '', '6', '2022', NULL, '', '240', ''),
(282, NULL, '8', '', '', '7', '2022', NULL, '', '0', '928'),
(283, NULL, '8', '', '', '8', '2022', NULL, '', '0', '1200'),
(284, NULL, '8', '', '', '9', '2022', NULL, '', '4000', '0'),
(285, NULL, '11', '', '', '5', '2022', NULL, '', '30', '0'),
(286, NULL, '11', '23', '124', '4', '2022', NULL, '', '0', '962'),
(287, NULL, '12', '', '', '2', '2022', NULL, '', '3000', '0'),
(288, NULL, '12', '', '', '5', '2022', NULL, '', '', '130'),
(289, NULL, '12', '', '', '6', '2022', NULL, '', '', '1259'),
(290, NULL, '12', '', '', '7', '2022', NULL, '', '', '841'),
(291, NULL, '12', '', '', '9', '2022', NULL, '', '3000', ''),
(292, NULL, '15', '', '', '2', '2022', NULL, '', '0', '36'),
(293, NULL, '15', '', '', '5', '2022', NULL, '', '0', '54'),
(294, NULL, '15', '', '', '6', '2022', NULL, '', '0', '18'),
(295, NULL, '15', '', '', '8', '2022', NULL, '', '0', '31'),
(296, NULL, '15', '27', '145', '8', '2022', NULL, '', '0', '85'),
(297, NULL, '15', '27', '146', '5', '2022', NULL, '', '0', '1261'),
(298, NULL, '16', '', '', '1', '2022', NULL, '', '11300', '2800'),
(299, NULL, '16', '', '', '2', '2022', NULL, '', '0', '30'),
(300, NULL, '16', '', '', '3', '2022', NULL, '', '6000', '420'),
(301, NULL, '16', '', '', '5', '2022', NULL, '', '0', '1365'),
(302, NULL, '16', '', '', '7', '2022', NULL, '', '0', '180'),
(303, NULL, '16', '28', '3', '8', '2022', NULL, '', '0', '0'),
(304, NULL, '16', '28', '3', '4', '2022', '4700', '', '0', '2749.5'),
(305, NULL, '16', '28', '3', '5', '2022', NULL, '', '0', '250'),
(306, NULL, '16', '28', '4', '1', '2022', NULL, '', '0', '420'),
(307, NULL, '16', '28', '5', '8', '2022', NULL, '', '0', '100'),
(308, NULL, '16', '28', '6', '4', '2022', '4700', '', '981', '3369.5'),
(309, NULL, '16', '28', '6', '5', '2022', '4700', '', '981', '300'),
(310, NULL, '16', '28', '7', '4', '2022', '4700', '', '0', '40'),
(311, NULL, '16', '28', '7', '7', '2022', '4700', '', '0', '100'),
(312, NULL, '16', '28', '7', '8', '2022', '4700', '', '0', '1150'),
(313, NULL, '16', '28', '8', '1', '2022', NULL, '', '0', '245'),
(314, NULL, '16', '28', '8', '3', '2022', NULL, '', '0', '250'),
(315, NULL, '16', '28', '8', '4', '2022', NULL, '', '0', '750'),
(316, NULL, '16', '28', '8', '5', '2022', NULL, '', '0', '560'),
(317, NULL, '16', '28', '8', '7', '2022', NULL, '', '0', '180'),
(318, NULL, '16', '28', '8', '8', '2022', NULL, '', '0', '300'),
(319, NULL, '16', '28', '9', '8', '2022', NULL, '', '0', '100'),
(320, NULL, '16', '28', '10', '3', '2022', NULL, '', '0', '380'),
(321, NULL, '16', '28', '10', '7', '2022', NULL, '', '0', '150'),
(322, NULL, '16', '28', '10', '8', '2022', NULL, '', '0', '250'),
(323, NULL, '16', '28', '14', '8', '2022', NULL, '', '0', '150'),
(324, NULL, '16', '28', '15', '5', '2022', NULL, '', '0', '750'),
(325, NULL, '16', '28', '15', '7', '2022', NULL, '', '0', '320'),
(326, NULL, '16', '28', '16', '3', '2022', NULL, '', '0', '350'),
(327, NULL, '16', '28', '16', '4', '2022', NULL, '', '0', '650'),
(328, NULL, '16', '28', '17', '4', '2022', NULL, '', '0', '700'),
(329, NULL, '16', '28', '17', '8', '2022', NULL, '', '0', '375'),
(330, NULL, '16', '28', '18', '8', '2022', NULL, '', '0', '230'),
(331, NULL, '16', '28', '19', '8', '2022', NULL, '', '0', '250'),
(332, NULL, '16', '28', '20', '3', '2022', '4700', '', '0', '300'),
(333, NULL, '16', '28', '20', '7', '2022', '4700', '', '0', '530'),
(334, NULL, '16', '28', '22', '3', '2022', NULL, '', '0', '500'),
(335, NULL, '16', '28', '22', '8', '2022', NULL, '', '0', '250'),
(336, NULL, '16', '28', '23', '5', '2022', '4700', '', '0', '260'),
(337, NULL, '16', '28', '24', '3', '2022', '4700', '', '282', '0'),
(338, NULL, '16', '28', '24', '7', '2022', '4700', '', '', '200'),
(339, NULL, '16', '28', '24', '8', '2022', '4700', '', '', '470'),
(340, NULL, '16', '28', '25', '1', '2022', NULL, '', '0', '16'),
(341, NULL, '16', '28', '25', '5', '2022', NULL, '', '0', '130'),
(342, NULL, '16', '28', '25', '7', '2022', NULL, '', '0', '490'),
(343, NULL, '16', '28', '25', '8', '2022', NULL, '', '0', '375'),
(344, NULL, '16', '28', '26', '3', '2022', NULL, '', '0', '2046'),
(345, NULL, '16', '28', '26', '5', '2022', NULL, '', '0', '1204'),
(346, NULL, '16', '28', '26', '6', '2022', NULL, '', '0', '81'),
(347, NULL, '16', '28', '26', '8', '2022', NULL, '', '0', '736'),
(348, NULL, '16', '28', '27', '4', '2022', NULL, '', '0', '2929.5'),
(349, NULL, '16', '28', '28', '3', '2022', NULL, '', '0', '150'),
(350, NULL, '16', '28', '28', '5', '2022', NULL, '', '0', '540'),
(351, NULL, '16', '28', '29', '3', '2022', NULL, '', '0', '130'),
(352, NULL, '16', '28', '29', '8', '2022', NULL, '', '0', '270'),
(353, NULL, '16', '28', '30', '5', '2022', NULL, '', '0', '95'),
(354, NULL, '16', '28', '30', '7', '2022', NULL, '', '0', '250'),
(355, NULL, '16', '28', '30', '8', '2022', NULL, '', '0', '550'),
(356, NULL, '16', '28', '31', '7', '2022', NULL, '', '0', '250'),
(357, NULL, '16', '28', '32', '5', '2022', NULL, '', '0', '180'),
(358, NULL, '16', '28', '33', '3', '2022', NULL, '', '0', '2252'),
(359, NULL, '16', '28', '33', '4', '2022', NULL, '', '0', '2749.5'),
(360, NULL, '16', '28', '34', '5', '2022', NULL, '', '0', '180'),
(361, NULL, '17', '29', '162', '1', '2022', NULL, '', '0', '800'),
(362, NULL, '17', '29', '162', '3', '2022', NULL, '', '0', '157'),
(363, NULL, '17', '29', '162', '5', '2022', NULL, '', '10000', '150'),
(364, NULL, '17', '29', '162', '6', '2022', NULL, '', '5', '0'),
(365, NULL, '17', '29', '162', '8', '2022', NULL, '', '5', '958'),
(366, NULL, '17', '29', '150', '1', '2022', NULL, '', '0', '1630'),
(367, NULL, '17', '29', '152', '6', '2022', NULL, '', '5', '0'),
(368, NULL, '17', '29', '163', '5', '2022', NULL, '', '0', '602'),
(369, NULL, '17', '30', 'إختر رقم الوحدة ....', '8', '2022', NULL, '', '847', ''),
(370, NULL, '35', '42', '217', '2', '2022', NULL, '', '0', '117'),
(371, NULL, '35', '42', '217', '6', '2022', NULL, '', '0', '1335'),
(372, NULL, '35', '42', '217', '7', '2022', NULL, '', '0', '1416'),
(373, NULL, '37', '51', '233', '5', '2022', NULL, '', '1467', '0'),
(374, NULL, '37', '51', '233', '6', '2022', NULL, '', '015101.52', ''),
(375, NULL, '37', '51', '234', '2', '2022', NULL, '', '735', '0'),
(376, NULL, '4', '', '', '1', '2022', NULL, '', '6000', '0'),
(377, NULL, '4', '', '', '3', '2022', NULL, '', '4500', '0'),
(378, NULL, '4', '', '', '5', '2022', NULL, '', '8298', '0'),
(379, NULL, '4', '', '', '7', '2022', NULL, '', '32820', '0'),
(380, NULL, '15', '', '', '10', '2022', NULL, '', '15', '450'),
(381, NULL, '11', '', '', '10', '2022', NULL, '', '5', '0'),
(382, NULL, '8', '', '', '10', '2022', NULL, '', '0', '1933'),
(383, NULL, '15', '27', '149', '10', '2022', NULL, '', '15', '450'),
(384, NULL, '12', '', '', '10', '2022', NULL, '', '0', '1130'),
(385, NULL, '13', '', '', '10', '2022', NULL, '', '0', '3130'),
(386, NULL, '22', '', '', '10', '2022', NULL, '', '0', '880'),
(387, NULL, '16', '28', '25', '10', '2022', NULL, '', '0', '500'),
(388, NULL, '16', '28', '14', '10', '2022', NULL, '', '0', '500'),
(389, NULL, '16', '28', '16', '10', '2022', NULL, '', '0', '250'),
(390, NULL, '38', '47', '226', '10', '2022', NULL, '', '0', '30198'),
(391, NULL, '16', '28', '20', '10', '2022', NULL, '', '0', '650'),
(392, NULL, '16', '28', '8', '10', '2022', NULL, '', '0', '150'),
(393, NULL, '16', '28', '26', '10', '2022', NULL, '', '0', '150'),
(394, NULL, '16', '28', '10', '10', '2022', NULL, '', '0', '200'),
(395, NULL, '16', '28', '23', '10', '2022', NULL, '', '0', '220'),
(396, NULL, '16', '28', '7', '10', '2022', '4700', '', '0', '250'),
(397, NULL, '16', '28', '4', '11', '2022', '4700', '', '1085', '7210'),
(398, NULL, '16', '28', '27', '11', '2022', NULL, '', '1085', '7210'),
(399, NULL, '16', '28', '7', '11', '2022', '4700', '', '1085', '7210'),
(400, NULL, '16', '28', '16', '11', '2022', NULL, '', '1085', '7210'),
(401, NULL, '8', '', '', '11', '2022', NULL, '', '496', '954'),
(402, NULL, '16', '28', '22', '11', '2022', NULL, '', '1085', '7210'),
(403, NULL, '22', '', '', '11', '2022', NULL, '', '0', '1843'),
(404, NULL, '12', '', '', '11', '2022', NULL, '', '0', '351'),
(405, NULL, '13', '', '', '11', '2022', NULL, '', '0', '6183'),
(406, NULL, '15', '', '', '11', '2022', NULL, '', '5', '0'),
(407, NULL, '11', '', '', '11', '2022', NULL, '', '15', '0'),
(408, NULL, '10', '22', '121', '11', '2022', NULL, '', '600', '0'),
(409, NULL, '13', '', '', '12', '2022', NULL, '', '0', '2773'),
(410, NULL, '12', '', '', '12', '2022', NULL, '', '0', '1074'),
(411, NULL, '22', '', '', '12', '2022', NULL, '', '0', '4000'),
(412, NULL, '8', '', '', '12', '2022', NULL, '', '0', '1135'),
(413, NULL, '16', '28', '15', '12', '2022', NULL, '', '2729', '20'),
(414, NULL, '17', '29', '163', '12', '2022', NULL, '', '0', '20'),
(415, NULL, '11', '', '', '12', '2022', NULL, '', '25', '0'),
(416, NULL, '8', '', '', '10', '2021', NULL, '', '0', '0'),
(417, NULL, '8', '', '', '12', '2021', NULL, '', '479471.9', '0'),
(418, NULL, '12', '', '', '9', '2021', NULL, '', '20992', '0'),
(419, NULL, '12', '', '', '12', '2021', NULL, '', '36815', '0'),
(420, NULL, '8', '', '', '2', '2021', NULL, '', '0', '0'),
(421, NULL, '12', '', '', '2', '2021', NULL, '', '144390.3', '0'),
(422, NULL, '13', '', '', '2', '2021', NULL, '', '380860', '0'),
(423, NULL, '22', '', '', '2', '2021', NULL, '', '169189.8', ''),
(424, NULL, '8', '', '', '11', '2021', NULL, '', '0', '0'),
(425, NULL, '8', '', '', '3', '2021', NULL, '', '0', '0'),
(426, NULL, '12', '', '', '1', '2021', NULL, '', '4.3', '0'),
(427, NULL, '22', '', '', '1', '2021', NULL, '', '41491', '0'),
(428, NULL, '13', '', '', '3', '2022', NULL, '', '0', '300'),
(429, NULL, '13', '', '', '5', '2022', NULL, '', '0', '3814'),
(430, NULL, '13', '', '', '6', '2022', NULL, '', '0', '532'),
(431, NULL, '13', '', '', '7', '2022', NULL, '', '0', '500'),
(432, NULL, '13', '', '', '8', '2022', NULL, '', '0', '687'),
(433, NULL, '13', '', '', '9', '2022', NULL, '', '0', '1396'),
(434, NULL, '17', '30', '183', '2', '2023', '5,700', NULL, NULL, NULL),
(435, NULL, '12', '25', '125', '3', '2023', '88888', NULL, NULL, NULL),
(436, NULL, '17', '30', '183', '3', '2023', '5,700', NULL, NULL, NULL),
(437, NULL, '17', '30', '168', '2', '2023', '3,500', NULL, NULL, NULL),
(438, NULL, '17', '30', '168', '3', '2023', '3,500', NULL, NULL, NULL),
(439, NULL, '17', '30', '182', '2', '2023', '5,500', NULL, NULL, NULL),
(440, NULL, '17', '30', '182', '3', '2023', '5,500', NULL, NULL, NULL),
(441, NULL, '17', '30', '180', '2', '2023', '3,500', NULL, NULL, NULL),
(442, NULL, '17', '30', '180', '3', '2023', '3,500', NULL, NULL, NULL),
(443, NULL, '17', '30', '171', '2', '2023', '3,400', NULL, NULL, NULL),
(444, NULL, '17', '30', '171', '3', '2023', '3,400', NULL, NULL, NULL),
(445, NULL, '17', '30', '173', '2', '2023', '4,500', NULL, NULL, NULL),
(446, NULL, '17', '30', '173', '3', '2023', '4,500', NULL, NULL, NULL),
(447, NULL, '17', '30', '178', '2', '2023', '4,300', NULL, NULL, NULL),
(448, NULL, '17', '30', '178', '3', '2023', '4,300', NULL, NULL, NULL),
(449, NULL, '17', '30', '175', '2', '2023', '4,300', NULL, NULL, NULL),
(450, NULL, '17', '30', '175', '3', '2023', '4,300', NULL, NULL, NULL),
(451, NULL, '17', '30', '169', '2', '2023', '4,500', NULL, NULL, NULL),
(452, NULL, '17', '30', '169', '3', '2023', '4,500', NULL, NULL, NULL),
(453, NULL, '17', '30', '181', '2', '2023', '4,300', NULL, NULL, NULL),
(454, NULL, '17', '30', '181', '3', '2023', '4,300', NULL, NULL, NULL),
(455, NULL, '17', '30', '172', '2', '2023', '4,500', NULL, NULL, NULL),
(456, NULL, '17', '30', '172', '3', '2023', '4,500', NULL, NULL, NULL),
(457, NULL, '16', '28', '25', '2', '2023', '4,700', NULL, NULL, NULL),
(458, NULL, '16', '28', '25', '3', '2023', '4,700', NULL, NULL, NULL),
(459, NULL, '16', '28', '7', '2', '2023', '4,700', NULL, NULL, NULL),
(460, NULL, '16', '28', '7', '3', '2023', '4,700', NULL, NULL, NULL),
(461, NULL, '17', '30', '176', '2', '2023', '4,300', NULL, NULL, NULL),
(462, NULL, '17', '30', '176', '3', '2023', '4,300', NULL, NULL, NULL),
(463, NULL, '17', '30', '177', '2', '2023', '3,300', NULL, NULL, NULL),
(464, NULL, '17', '30', '177', '3', '2023', '3,300', NULL, NULL, NULL),
(465, NULL, '22', '35', '201', '2', '2023', '10,000', NULL, NULL, NULL),
(466, NULL, '22', '35', '201', '3', '2023', '10,000', NULL, NULL, NULL),
(467, NULL, '22', '35', '202', '12', '2022', '13,000', NULL, NULL, NULL),
(468, NULL, '22', '35', '202', '1', '2023', '10,000', NULL, NULL, NULL),
(469, NULL, '16', '28', '6', '2', '2023', '4,700', NULL, NULL, NULL),
(470, NULL, '16', '28', '6', '3', '2023', '4,700', NULL, NULL, NULL),
(471, NULL, '22', '35', '202', '2', '2023', '10,000', NULL, NULL, NULL),
(472, NULL, '22', '35', '202', '3', '2023', '10,000', NULL, NULL, NULL),
(473, NULL, '25', '38', '212', '2', '2023', '7,500', NULL, NULL, NULL),
(474, NULL, '25', '38', '212', '3', '2023', '7,500', NULL, NULL, NULL),
(479, NULL, '17', '30', '174', '1', '2023', '3500', NULL, NULL, NULL),
(480, NULL, '17', '30', '174', '2', '2023', '3500', NULL, NULL, NULL),
(481, NULL, '17', '30', '174', '3', '2023', '3500', NULL, NULL, NULL),
(482, NULL, '48', '83', '455', '1', '2020', '79000', NULL, NULL, NULL),
(483, NULL, '48', '83', '455', '7', '2020', '79000', NULL, NULL, NULL),
(484, NULL, '48', '83', '455', '1', '2021', '79000', NULL, NULL, NULL),
(485, NULL, '48', '83', '455', '7', '2021', '79000', NULL, NULL, NULL),
(486, NULL, '48', '83', '455', '1', '2022', '79000', NULL, NULL, NULL),
(487, NULL, '48', '83', '455', '7', '2022', '79000', NULL, NULL, NULL),
(488, NULL, '38', '47', '226', '1', '2020', '48000', NULL, NULL, NULL),
(489, NULL, '15', '27', '148', '1', '2021', '2800', NULL, NULL, NULL),
(490, NULL, '15', '27', '5', '2', '2021', '2500', NULL, NULL, NULL),
(491, NULL, '15', '27', '5', '1', '2021', '2500', NULL, NULL, NULL),
(492, NULL, '15', '27', '5', '3', '2021', '2500', NULL, NULL, NULL),
(493, NULL, '15', '27', '5', '6', '2021', '2500', NULL, NULL, NULL),
(494, NULL, '15', '27', '5', '7', '2021', '2500', NULL, NULL, NULL),
(495, NULL, '15', '27', '5', '8', '2021', '2500', NULL, NULL, NULL),
(496, NULL, '15', '27', '5', '9', '2021', '2500', NULL, NULL, NULL),
(497, NULL, '15', '27', '5', '10', '2021', '2500', NULL, NULL, NULL),
(498, NULL, '15', '27', '5', '11', '2021', '2500', NULL, NULL, NULL),
(499, NULL, '15', '27', '5', '12', '2021', '2500', NULL, NULL, NULL),
(500, NULL, '15', '27', '5', '1', '2022', '2500', NULL, NULL, NULL),
(501, NULL, '15', '27', '5', '2', '2022', '2500', NULL, NULL, NULL),
(502, NULL, '15', '27', '5', '3', '2022', '2500', NULL, NULL, NULL),
(503, NULL, '15', '27', '5', '4', '2022', '2500', NULL, NULL, NULL),
(504, NULL, '15', '27', '5', '5', '2022', '2500', NULL, NULL, NULL),
(505, NULL, '15', '27', '5', '6', '2022', '2500', NULL, NULL, NULL),
(506, NULL, '15', '27', '5', '7', '2022', '2500', NULL, NULL, NULL),
(507, NULL, '17', '30', '17', '4', '2023', '5700', NULL, NULL, NULL),
(508, NULL, '17', '30', '2', '4', '2023', '3500', NULL, NULL, NULL),
(509, NULL, '17', '30', '16', '4', '2023', '5500', NULL, NULL, NULL),
(510, NULL, '17', '30', '14', '4', '2023', '3500', NULL, NULL, NULL),
(511, NULL, '17', '30', '7', '4', '2023', '4500', NULL, NULL, NULL),
(512, NULL, '17', '30', '5', '4', '2023', '3400', NULL, NULL, NULL),
(513, NULL, '17', '30', '12', '4', '2023', '4300', NULL, NULL, NULL),
(514, NULL, '17', '30', '9', '4', '2023', '4300', NULL, NULL, NULL),
(515, NULL, '17', '30', '3', '4', '2023', '4500', NULL, NULL, NULL),
(516, NULL, '38', '47', '1', '7', '2020', '48000', NULL, NULL, NULL),
(517, NULL, '38', '47', '1', '1', '2021', '48000', NULL, NULL, NULL),
(518, NULL, '38', '47', '1', '7', '2021', '48000', NULL, NULL, NULL),
(519, NULL, '38', '47', '1', '1', '2022', '48000', NULL, NULL, NULL),
(520, NULL, '38', '47', '1', '7', '2022', '48000', NULL, NULL, NULL),
(521, NULL, '21', '34', '47', '1', '2020', '66000', NULL, NULL, NULL),
(522, NULL, '21', '34', '47', '7', '2020', '66000', NULL, NULL, NULL),
(523, NULL, '21', '34', '47', '1', '2021', '66000', NULL, NULL, NULL),
(524, NULL, '21', '34', '47', '7', '2021', '66000', NULL, NULL, NULL),
(525, NULL, '21', '34', '47', '1', '2022', '66000', NULL, NULL, NULL),
(526, NULL, '21', '34', '47', '7', '2022', '66000', NULL, NULL, NULL),
(527, NULL, '20', '33', '2', '1', '2020', '69000', NULL, NULL, NULL),
(528, NULL, '20', '33', '2', '7', '2020', '69000', NULL, NULL, NULL),
(529, NULL, '20', '33', '2', '1', '2021', '69000', NULL, NULL, NULL),
(530, NULL, '20', '33', '2', '7', '2021', '69000', NULL, NULL, NULL),
(531, NULL, '20', '33', '2', '1', '2022', '69000', NULL, NULL, NULL),
(532, NULL, '20', '33', '2', '7', '2022', '69000', NULL, NULL, NULL),
(533, NULL, '47', '82', '1', '1', '2020', '79200', NULL, NULL, NULL),
(534, NULL, '47', '82', '1', '7', '2020', '79200', NULL, NULL, NULL),
(535, NULL, '47', '82', '1', '1', '2021', '79200', NULL, NULL, NULL),
(536, NULL, '47', '82', '1', '7', '2021', '79200', NULL, NULL, NULL),
(537, NULL, '47', '82', '1', '1', '2022', '79200', NULL, NULL, NULL),
(538, NULL, '47', '82', '1', '7', '2022', '79200', NULL, NULL, NULL),
(539, NULL, '17', '30', '8', '4', '2023', '3500', NULL, NULL, NULL),
(540, NULL, '16', '28', '18', '7', '2020', '36000', NULL, NULL, NULL),
(541, NULL, '16', '28', '18', '12', '2020', '36000', NULL, NULL, NULL),
(542, NULL, '12', '25', NULL, '8', '2021', '148500', NULL, NULL, NULL),
(543, NULL, '12', '25', NULL, '1', '2022', '178200', NULL, NULL, NULL),
(544, NULL, '12', '25', NULL, '7', '2022', '178200', NULL, NULL, NULL),
(545, NULL, '12', '25', NULL, '4', '2023', '89100', NULL, NULL, NULL),
(546, NULL, '13', '52', NULL, '8', '2021', '372000', NULL, NULL, NULL),
(547, NULL, '13', '52', NULL, '1', '2022', '446400', NULL, NULL, NULL),
(548, NULL, '13', '52', NULL, '7', '2022', '446400', NULL, NULL, NULL),
(549, NULL, '13', '52', NULL, '1', '2023', '223200', NULL, NULL, NULL),
(550, NULL, '13', '52', NULL, '4', '2023', '223200', NULL, NULL, NULL),
(551, NULL, '8', '19', NULL, '8', '2021', '402000', NULL, NULL, NULL),
(552, NULL, '8', '19', NULL, '1', '2022', '482400', NULL, NULL, NULL),
(553, NULL, '8', '19', NULL, '7', '2022', '482400', NULL, NULL, NULL),
(554, NULL, '8', '19', NULL, '1', '2023', '241200', NULL, NULL, NULL),
(555, NULL, '8', '19', NULL, '4', '2023', '241200', NULL, NULL, NULL),
(556, NULL, '45', '76', '1', '1', '2023', '45000', NULL, NULL, NULL),
(557, NULL, '45', '76', '1', '4', '2023', '45000', NULL, NULL, NULL),
(558, NULL, '48', '83', '1', '1', '2023', '39600', NULL, NULL, NULL),
(559, NULL, '48', '83', '1', '4', '2023', '39600', NULL, NULL, NULL),
(560, NULL, '17', '29', '13', '1', '2021', '3000', NULL, NULL, NULL),
(561, NULL, '17', '29', '13', '2', '2021', '3000', NULL, NULL, NULL),
(562, NULL, '17', '29', '13', '3', '2021', '3000', NULL, NULL, NULL),
(563, NULL, '17', '29', '13', '4', '2021', '3000', NULL, NULL, NULL),
(564, NULL, '17', '29', '13', '5', '2021', '3000', NULL, NULL, NULL),
(565, NULL, '17', '29', '13', '6', '2021', '3000', NULL, NULL, NULL),
(566, NULL, '17', '29', '13', '7', '2021', '3000', NULL, NULL, NULL),
(567, NULL, '17', '29', '13', '8', '2021', '3000', NULL, NULL, NULL),
(568, NULL, '17', '29', '13', '9', '2021', '3000', NULL, NULL, NULL),
(569, NULL, '17', '29', '13', '10', '2021', '3000', NULL, NULL, NULL),
(570, NULL, '17', '29', '13', '11', '2021', '3000', NULL, NULL, NULL),
(571, NULL, '17', '29', '13', '12', '2021', '3000', NULL, NULL, NULL),
(572, NULL, '17', '29', '13', '1', '2022', '3000', NULL, NULL, NULL),
(573, NULL, '17', '29', '13', '2', '2022', '3000', NULL, NULL, NULL),
(574, NULL, '17', '29', '13', '3', '2022', '3000', NULL, NULL, NULL),
(575, NULL, '17', '29', '13', '4', '2022', '3000', NULL, NULL, NULL),
(576, NULL, '17', '29', '13', '5', '2022', '3000', NULL, NULL, NULL),
(577, NULL, '17', '29', '13', '6', '2022', '3000', NULL, NULL, NULL),
(578, NULL, '17', '29', '13', '7', '2022', '3000', NULL, NULL, NULL),
(579, NULL, '25', '38', '3', '7', '2019', '120000', NULL, NULL, NULL),
(580, NULL, '16', '28', '5', '3', '2020', '5500', NULL, NULL, NULL),
(581, NULL, '16', '28', '5', '4', '2020', '5500', NULL, NULL, NULL),
(582, NULL, '16', '28', '5', '5', '2020', '5500', NULL, NULL, NULL),
(583, NULL, '16', '28', '5', '6', '2020', '5000', NULL, NULL, NULL),
(584, NULL, '16', '28', '5', '7', '2020', '5000', NULL, NULL, NULL),
(585, NULL, '16', '28', '5', '8', '2020', '5000', NULL, NULL, NULL),
(586, NULL, '16', '28', '5', '9', '2020', '5000', NULL, NULL, NULL),
(587, NULL, '16', '28', '5', '10', '2020', '5000', NULL, NULL, NULL),
(588, NULL, '16', '28', '5', '11', '2020', '5000', NULL, NULL, NULL),
(589, NULL, '16', '28', '5', '12', '2020', '5000', NULL, NULL, NULL),
(590, NULL, '16', '28', '5', '1', '2021', '5000', NULL, NULL, NULL),
(591, NULL, '16', '28', '5', '2', '2021', '5000', NULL, NULL, NULL),
(592, NULL, '16', '28', '6', '9', '2021', '4700', NULL, NULL, NULL),
(593, NULL, '16', '28', '6', '10', '2021', '4700', NULL, NULL, NULL),
(594, NULL, '16', '28', '6', '11', '2021', '4700', NULL, NULL, NULL),
(595, NULL, '16', '28', '6', '12', '2021', '4700', NULL, NULL, NULL),
(596, NULL, '16', '28', '6', '1', '2022', '4700', NULL, NULL, NULL),
(597, NULL, '16', '28', '6', '2', '2022', '4700', NULL, NULL, NULL),
(598, NULL, '16', '28', '6', '3', '2022', '4700', NULL, NULL, NULL),
(599, NULL, '16', '28', '6', '6', '2022', '4700', NULL, NULL, NULL),
(600, NULL, '16', '28', '7', '3', '2021', '5000', NULL, NULL, NULL),
(601, NULL, '16', '28', '7', '7', '2021', '5000', NULL, NULL, NULL),
(602, NULL, '16', '28', '7', '1', '2022', '5000', NULL, NULL, NULL),
(603, NULL, '16', '28', '4', '6', '2020', '5000', NULL, NULL, NULL),
(604, NULL, '16', '28', '4', '7', '2020', '5000', NULL, NULL, NULL),
(605, NULL, '16', '28', '4', '9', '2020', '5000', NULL, NULL, NULL),
(606, NULL, '16', '28', '4', '10', '2020', '5000', NULL, NULL, NULL),
(607, NULL, '16', '28', '4', '11', '2020', '5000', NULL, NULL, NULL),
(608, NULL, '16', '28', '4', '12', '2020', '5000', NULL, NULL, NULL),
(609, NULL, '16', '28', '4', '1', '2021', '5000', NULL, NULL, NULL),
(610, NULL, '16', '28', '4', '2', '2021', '5000', NULL, NULL, NULL),
(611, NULL, '16', '28', '4', '3', '2021', '5000', NULL, NULL, NULL),
(612, NULL, '16', '28', '4', '4', '2021', '5000', NULL, NULL, NULL),
(613, NULL, '16', '28', '4', '5', '2021', '5000', NULL, NULL, NULL),
(614, NULL, '16', '28', '4', '8', '2020', '5000', NULL, NULL, NULL),
(615, NULL, '16', '28', '7', '2', '2022', '4700', NULL, NULL, NULL),
(616, NULL, '16', '28', '7', '3', '2022', '4700', NULL, NULL, NULL),
(617, NULL, '16', '28', '7', '5', '2022', '4700', NULL, NULL, NULL),
(618, NULL, '16', '28', '7', '6', '2022', '4700', NULL, NULL, NULL),
(619, NULL, '16', '28', '7', '9', '2022', '4700', NULL, NULL, NULL),
(620, NULL, '16', '28', '7', '12', '2022', '4700', NULL, NULL, NULL),
(621, NULL, '16', '28', '9', '4', '2021', '4700', NULL, NULL, NULL),
(622, NULL, '16', '28', '9', '5', '2021', '4700', NULL, NULL, NULL),
(623, NULL, '16', '28', '9', '6', '2021', '4700', NULL, NULL, NULL),
(624, NULL, '16', '28', '9', '7', '2021', '4700', NULL, NULL, NULL),
(625, NULL, '16', '28', '9', '8', '2021', '4700', NULL, NULL, NULL),
(626, NULL, '16', '28', '9', '9', '2021', '4700', NULL, NULL, NULL),
(627, NULL, '16', '28', '9', '10', '2021', '4700', NULL, NULL, NULL),
(628, NULL, '16', '28', '9', '11', '2021', '4700', NULL, NULL, NULL),
(629, NULL, '16', '28', '9', '12', '2021', '4700', NULL, NULL, NULL),
(630, NULL, '16', '28', '9', '1', '2022', '4700', NULL, NULL, NULL),
(631, NULL, '16', '28', '9', '2', '2022', '4700', NULL, NULL, NULL),
(632, NULL, '16', '28', '12', '11', '2019', '5500', NULL, NULL, NULL),
(633, NULL, '16', '28', '12', '12', '2019', '5500', NULL, NULL, NULL),
(634, NULL, '16', '28', '12', '1', '2020', '5500', NULL, NULL, NULL),
(635, NULL, '16', '28', '12', '2', '2020', '5500', NULL, NULL, NULL),
(636, NULL, '16', '28', '12', '3', '2020', '5500', NULL, NULL, NULL),
(637, NULL, '16', '28', '12', '4', '2020', '5500', NULL, NULL, NULL),
(638, NULL, '16', '28', '12', '5', '2020', '5500', NULL, NULL, NULL),
(639, NULL, '16', '28', '12', '6', '2020', '5500', NULL, NULL, NULL),
(640, NULL, '16', '28', '12', '7', '2020', '5500', NULL, NULL, NULL),
(641, NULL, '16', '28', '12', '8', '2020', '5500', NULL, NULL, NULL),
(642, NULL, '16', '28', '12', '9', '2020', '5500', NULL, NULL, NULL),
(643, NULL, '16', '28', '12', '10', '2020', '5500', NULL, NULL, NULL),
(644, NULL, '16', '28', '16', '2', '2021', '5000', NULL, NULL, NULL),
(645, NULL, '16', '28', '16', '3', '2021', '5000', NULL, NULL, NULL),
(646, NULL, '16', '28', '16', '5', '2021', '5000', NULL, NULL, NULL),
(647, NULL, '16', '28', '16', '9', '2021', '5000', NULL, NULL, NULL),
(648, NULL, '16', '28', '16', '11', '2021', '5000', NULL, NULL, NULL),
(649, NULL, '16', '28', '16', '12', '2021', '5000', NULL, NULL, NULL),
(650, NULL, '16', '28', '16', '1', '2022', '5000', NULL, NULL, NULL),
(651, NULL, '16', '28', '20', '1', '2021', '4700', NULL, NULL, NULL),
(652, NULL, '16', '28', '20', '2', '2021', '4700', NULL, NULL, NULL),
(653, NULL, '16', '28', '20', '3', '2021', '4700', NULL, NULL, NULL),
(654, NULL, '16', '28', '20', '4', '2021', '4700', NULL, NULL, NULL),
(655, NULL, '16', '28', '20', '5', '2021', '4700', NULL, NULL, NULL),
(656, NULL, '16', '28', '20', '6', '2021', '4700', NULL, NULL, NULL),
(657, NULL, '16', '28', '20', '7', '2021', '4700', NULL, NULL, NULL),
(658, NULL, '16', '28', '20', '8', '2021', '4700', NULL, NULL, NULL),
(659, NULL, '16', '28', '20', '11', '2021', '4700', NULL, NULL, NULL),
(660, NULL, '16', '28', '20', '12', '2021', '4700', NULL, NULL, NULL),
(661, NULL, '16', '28', '20', '1', '2022', '4700', NULL, NULL, NULL),
(662, NULL, '16', '28', '20', '2', '2022', '4700', NULL, NULL, NULL),
(663, NULL, '16', '28', '20', '4', '2022', '4700', NULL, NULL, NULL),
(664, NULL, '16', '28', '20', '5', '2022', '4700', NULL, NULL, NULL),
(665, NULL, '16', '28', '20', '6', '2022', '4700', NULL, NULL, NULL),
(666, NULL, '16', '28', '20', '8', '2022', '4700', NULL, NULL, NULL),
(667, NULL, '16', '28', '20', '9', '2022', '4700', NULL, NULL, NULL),
(668, NULL, '16', '28', '21', '8', '2020', '5000', NULL, NULL, NULL),
(669, NULL, '16', '28', '21', '9', '2020', '5000', NULL, NULL, NULL),
(670, NULL, '16', '28', '21', '10', '2020', '5000', NULL, NULL, NULL),
(671, NULL, '16', '28', '21', '11', '2020', '5000', NULL, NULL, NULL),
(672, NULL, '16', '28', '21', '12', '2020', '5000', NULL, NULL, NULL),
(673, NULL, '16', '28', '21', '1', '2021', '5000', NULL, NULL, NULL),
(674, NULL, '16', '28', '21', '2', '2021', '5000', NULL, NULL, NULL),
(675, NULL, '16', '28', '21', '3', '2021', '5000', NULL, NULL, NULL),
(676, NULL, '16', '28', '21', '4', '2021', '5000', NULL, NULL, NULL),
(677, NULL, '16', '28', '21', '5', '2021', '5000', NULL, NULL, NULL),
(678, NULL, '16', '28', '21', '6', '2021', '5000', NULL, NULL, NULL),
(679, NULL, '16', '28', '21', '7', '2021', '5000', NULL, NULL, NULL),
(680, NULL, '16', '28', '21', '8', '2021', '4700', NULL, NULL, NULL),
(681, NULL, '16', '28', '21', '9', '2021', '4700', NULL, NULL, NULL),
(682, NULL, '16', '28', '21', '10', '2021', '4700', NULL, NULL, NULL),
(683, NULL, '16', '28', '21', '11', '2021', '4700', NULL, NULL, NULL),
(684, NULL, '16', '28', '21', '12', '2021', '4700', NULL, NULL, NULL),
(685, NULL, '16', '28', '21', '1', '2022', '4700', NULL, NULL, NULL),
(686, NULL, '16', '28', '21', '2', '2022', '4700', NULL, NULL, NULL),
(687, NULL, '16', '28', '21', '3', '2022', '4700', NULL, NULL, NULL),
(688, NULL, '16', '28', '21', '4', '2022', '4700', NULL, NULL, NULL),
(689, NULL, '16', '28', '21', '5', '2022', '4700', NULL, NULL, NULL),
(690, NULL, '16', '28', '21', '7', '2022', '4700', NULL, NULL, NULL),
(691, NULL, '16', '28', '21', '6', '2022', '4700', NULL, NULL, NULL),
(692, NULL, '16', '28', '22', '1', '2020', '4700', NULL, NULL, NULL),
(693, NULL, '16', '28', '22', '2', '2020', '4700', NULL, NULL, NULL),
(694, NULL, '16', '28', '22', '3', '2020', '4700', NULL, NULL, NULL),
(695, NULL, '16', '28', '22', '4', '2020', '4700', NULL, NULL, NULL),
(696, NULL, '16', '28', '22', '5', '2020', '4700', NULL, NULL, NULL),
(697, NULL, '16', '28', '22', '6', '2020', '4700', NULL, NULL, NULL),
(698, NULL, '16', '28', '22', '7', '2020', '4700', NULL, NULL, NULL),
(699, NULL, '16', '28', '22', '8', '2020', '4700', NULL, NULL, NULL),
(700, NULL, '16', '28', '22', '9', '2020', '4700', NULL, NULL, NULL),
(701, NULL, '16', '28', '22', '10', '2020', '4700', NULL, NULL, NULL),
(702, NULL, '16', '28', '22', '11', '2020', '4700', NULL, NULL, NULL),
(703, NULL, '16', '28', '22', '12', '2020', '4700', NULL, NULL, NULL),
(704, NULL, '16', '28', '22', '1', '2021', '4700', NULL, NULL, NULL),
(705, NULL, '16', '28', '22', '2', '2021', '4700', NULL, NULL, NULL),
(706, NULL, '16', '28', '22', '5', '2021', '4700', NULL, NULL, NULL),
(707, NULL, '16', '28', '22', '7', '2021', '4700', NULL, NULL, NULL),
(708, NULL, '16', '28', '22', '9', '2021', '4700', NULL, NULL, NULL),
(709, NULL, '16', '28', '22', '10', '2021', '4700', NULL, NULL, NULL),
(710, NULL, '16', '28', '22', '12', '2021', '4700', NULL, NULL, NULL),
(711, NULL, '16', '28', '15', '2', '2020', '5000', NULL, NULL, NULL),
(712, NULL, '16', '28', '15', '3', '2020', '5000', NULL, NULL, NULL),
(713, NULL, '16', '28', '15', '4', '2020', '5000', NULL, NULL, NULL),
(714, NULL, '16', '28', '15', '5', '2020', '5000', NULL, NULL, NULL),
(715, NULL, '16', '28', '15', '6', '2020', '5000', NULL, NULL, NULL),
(716, NULL, '16', '28', '15', '7', '2020', '5000', NULL, NULL, NULL),
(717, NULL, '16', '28', '15', '8', '2020', '5000', NULL, NULL, NULL),
(718, NULL, '16', '28', '15', '9', '2020', '5000', NULL, NULL, NULL),
(719, NULL, '16', '28', '15', '10', '2020', '5000', NULL, NULL, NULL),
(720, NULL, '16', '28', '15', '11', '2020', '5000', NULL, NULL, NULL),
(721, NULL, '16', '28', '15', '12', '2020', '5000', NULL, NULL, NULL),
(722, NULL, '16', '28', '15', '1', '2021', '5000', NULL, NULL, NULL),
(723, NULL, '29', '41', '86', '4', '2021', '10500', NULL, NULL, NULL),
(724, NULL, '29', '41', '86', '5', '2021', '10500', NULL, NULL, NULL),
(725, NULL, '29', '41', '86', '6', '2021', '10500', NULL, NULL, NULL),
(726, NULL, '29', '41', '86', '7', '2021', '10500', NULL, NULL, NULL),
(727, NULL, '29', '41', '86', '8', '2021', '10500', NULL, NULL, NULL),
(728, NULL, '29', '41', '86', '9', '2021', '10500', NULL, NULL, NULL),
(729, NULL, '29', '41', '86', '10', '2021', '10500', NULL, NULL, NULL),
(730, NULL, '29', '41', '86', '11', '2021', '10500', NULL, NULL, NULL),
(731, NULL, '29', '41', '86', '12', '2021', '10500', NULL, NULL, NULL),
(732, NULL, '29', '41', '86', '1', '2022', '10500', NULL, NULL, NULL),
(733, NULL, '29', '41', '86', '2', '2022', '10500', NULL, NULL, NULL),
(734, NULL, '29', '41', '86', '3', '2022', '10500', NULL, NULL, NULL),
(735, NULL, '16', '28', '23', '9', '2021', '4700', NULL, NULL, NULL),
(736, NULL, '16', '28', '23', '10', '2021', '4700', NULL, NULL, NULL),
(737, NULL, '16', '28', '23', '11', '2021', '4700', NULL, NULL, NULL),
(738, NULL, '16', '28', '23', '1', '2022', '4700', NULL, NULL, NULL),
(739, NULL, '16', '28', '23', '2', '2022', '4700', NULL, NULL, NULL),
(740, NULL, '16', '28', '23', '3', '2022', '4700', NULL, NULL, NULL),
(741, NULL, '16', '28', '23', '4', '2022', '4700', NULL, NULL, NULL),
(742, NULL, '16', '28', '23', '6', '2022', '4700', NULL, NULL, NULL),
(743, NULL, '16', '28', '23', '7', '2022', '4700', NULL, NULL, NULL),
(744, NULL, '16', '28', '23', '8', '2022', '4700', NULL, NULL, NULL),
(745, NULL, '16', '28', '24', '11', '2020', '5000', NULL, NULL, NULL),
(746, NULL, '16', '28', '24', '2', '2021', '5000', NULL, NULL, NULL),
(747, NULL, '16', '28', '24', '4', '2021', '5000', NULL, NULL, NULL),
(748, NULL, '16', '28', '24', '8', '2021', '5000', NULL, NULL, NULL),
(749, NULL, '16', '28', '24', '9', '2021', '5000', NULL, NULL, NULL),
(750, NULL, '16', '28', '24', '10', '2021', '5000', NULL, NULL, NULL),
(751, NULL, '16', '28', '24', '12', '2021', '4700', NULL, NULL, NULL),
(752, NULL, '16', '28', '24', '1', '2022', '4700', NULL, NULL, NULL),
(753, NULL, '16', '28', '24', '2', '2022', '4700', NULL, NULL, NULL),
(754, NULL, '16', '28', '24', '4', '2022', '4700', NULL, NULL, NULL),
(755, NULL, '16', '28', '24', '5', '2022', '4700', NULL, NULL, NULL),
(756, NULL, '16', '28', '24', '6', '2022', '4700', NULL, NULL, NULL),
(757, NULL, '16', '28', '24', '9', '2022', '4700', NULL, NULL, NULL),
(758, NULL, '16', '28', '24', '12', '2020', '5000', NULL, NULL, NULL),
(759, NULL, '38', '47', '1', '1', '2023', '24000', NULL, NULL, NULL),
(760, NULL, '38', '47', '1', '4', '2023', '24000', NULL, NULL, NULL);
INSERT INTO `collection_table` (`Id`, `Type`, `Ownersip_Id`, `Building_Id`, `Unit_Id`, `Mounth`, `Year`, `Collection`, `Management_Expenses`, `RealEstate_Expenses`, `Maintenance_Expenses`) VALUES
(761, NULL, '47', '82', '1', '1', '2023', '39600', NULL, NULL, NULL),
(762, NULL, '47', '82', '1', '4', '2023', '39600', NULL, NULL, NULL),
(763, NULL, '21', '34', '47', '1', '2023', '33000', NULL, NULL, NULL),
(764, NULL, '21', '34', '47', '4', '2023', '33000', NULL, NULL, NULL),
(765, NULL, '20', '33', '2', '1', '2023', '34500', NULL, NULL, NULL),
(766, NULL, '20', '33', '2', '4', '2023', '34500', NULL, NULL, NULL),
(767, NULL, '15', '27', '1', '1', '2020', '2800', NULL, NULL, NULL),
(768, NULL, '15', '27', '1', '2', '2020', '2800', NULL, NULL, NULL),
(769, NULL, '15', '27', '1', '3', '2020', '2800', NULL, NULL, NULL),
(770, NULL, '15', '27', '1', '4', '2020', '2800', NULL, NULL, NULL),
(771, NULL, '15', '27', '1', '5', '2020', '2800', NULL, NULL, NULL),
(772, NULL, '15', '27', '1', '6', '2020', '2800', NULL, NULL, NULL),
(773, NULL, '15', '27', '1', '7', '2020', '2800', NULL, NULL, NULL),
(774, NULL, '15', '27', '1', '8', '2020', '2800', NULL, NULL, NULL),
(775, NULL, '15', '27', '1', '9', '2020', '2800', NULL, NULL, NULL),
(776, NULL, '15', '27', '1', '10', '2020', '2800', NULL, NULL, NULL),
(777, NULL, '15', '27', '1', '11', '2020', '2800', NULL, NULL, NULL),
(778, NULL, '15', '27', '1', '12', '2020', '2800', NULL, NULL, NULL),
(779, NULL, '15', '27', '1', '1', '2021', '2800', NULL, NULL, NULL),
(780, NULL, '15', '27', '1', '2', '2021', '2800', NULL, NULL, NULL),
(781, NULL, '15', '27', '1', '3', '2021', '2800', NULL, NULL, NULL),
(782, NULL, '15', '27', '1', '4', '2021', '2800', NULL, NULL, NULL),
(783, NULL, '15', '27', '1', '5', '2021', '2800', NULL, NULL, NULL),
(784, NULL, '15', '27', '1', '6', '2021', '2800', NULL, NULL, NULL),
(785, NULL, '15', '27', '1', '7', '2021', '2800', NULL, NULL, NULL),
(786, NULL, '15', '27', '1', '8', '2021', '2800', NULL, NULL, NULL),
(787, NULL, '15', '27', '1', '9', '2021', '2800', NULL, NULL, NULL),
(788, NULL, '15', '27', '1', '10', '2021', '2800', NULL, NULL, NULL),
(789, NULL, '15', '27', '1', '11', '2021', '2800', NULL, NULL, NULL),
(790, NULL, '15', '27', '1', '12', '2021', '2800', NULL, NULL, NULL),
(791, NULL, '15', '27', '2', '2', '2021', '2500', NULL, NULL, NULL),
(792, NULL, '15', '27', '2', '3', '2021', '2500', NULL, NULL, NULL),
(793, NULL, '15', '27', '2', '4', '2021', '2500', NULL, NULL, NULL),
(794, NULL, '15', '27', '2', '5', '2021', '2500', NULL, NULL, NULL),
(795, NULL, '15', '27', '2', '6', '2021', '2500', NULL, NULL, NULL),
(796, NULL, '15', '27', '2', '7', '2021', '2500', NULL, NULL, NULL),
(797, NULL, '15', '27', '2', '8', '2021', '2500', NULL, NULL, NULL),
(798, NULL, '15', '27', '2', '9', '2021', '2500', NULL, NULL, NULL),
(799, NULL, '15', '27', '2', '10', '2021', '2500', NULL, NULL, NULL),
(800, NULL, '15', '27', '2', '11', '2021', '2500', NULL, NULL, NULL),
(801, NULL, '15', '27', '2', '12', '2021', '2500', NULL, NULL, NULL),
(802, NULL, '15', '27', '2', '1', '2022', '2500', NULL, NULL, NULL),
(803, NULL, '15', '27', '5', '1', '2020', '2500', NULL, NULL, NULL),
(804, NULL, '15', '27', '5', '2', '2020', '2500', NULL, NULL, NULL),
(805, NULL, '15', '27', '5', '3', '2020', '2500', NULL, NULL, NULL),
(806, NULL, '15', '27', '5', '4', '2020', '2500', NULL, NULL, NULL),
(807, NULL, '15', '27', '5', '5', '2020', '2500', NULL, NULL, NULL),
(808, NULL, '15', '27', '5', '6', '2020', '2500', NULL, NULL, NULL),
(809, NULL, '15', '27', '5', '7', '2020', '2500', NULL, NULL, NULL),
(810, NULL, '15', '27', '5', '8', '2020', '2500', NULL, NULL, NULL),
(811, NULL, '15', '27', '5', '9', '2020', '2500', NULL, NULL, NULL),
(812, NULL, '15', '27', '5', '10', '2020', '2500', NULL, NULL, NULL),
(813, NULL, '15', '27', '5', '11', '2020', '2500', NULL, NULL, NULL),
(814, NULL, '15', '27', '5', '12', '2020', '2500', NULL, NULL, NULL),
(815, NULL, '16', '28', '23', '6', '2020', '27900', NULL, NULL, NULL),
(816, NULL, '16', '28', '23', '7', '2020', '5000', NULL, NULL, NULL),
(817, NULL, '16', '28', '23', '8', '2020', '5000', NULL, NULL, NULL),
(818, NULL, '16', '28', '23', '9', '2020', '5000', NULL, NULL, NULL),
(819, NULL, '16', '28', '23', '10', '2020', '5000', NULL, NULL, NULL),
(820, NULL, '16', '28', '23', '11', '2020', '5000', NULL, NULL, NULL),
(821, NULL, '16', '28', '23', '12', '2020', '27900', NULL, NULL, NULL),
(822, NULL, '16', '28', '23', '5', '2020', '5500', NULL, NULL, NULL),
(823, NULL, '16', '28', '23', '6', '2021', '27900', NULL, NULL, NULL),
(824, NULL, '11', '23', '3', '3', '2020', '10000', NULL, NULL, NULL),
(825, NULL, '11', '23', '3', '4', '2020', '10000', NULL, NULL, NULL),
(826, NULL, '11', '23', '3', '5', '2020', '10000', NULL, NULL, NULL),
(827, NULL, '11', '23', '3', '6', '2020', '10000', NULL, NULL, NULL),
(828, NULL, '11', '23', '3', '7', '2020', '10000', NULL, NULL, NULL),
(829, NULL, '11', '23', '3', '8', '2020', '10000', NULL, NULL, NULL),
(830, NULL, '11', '23', '3', '9', '2020', '10000', NULL, NULL, NULL),
(831, NULL, '11', '23', '3', '10', '2020', '10000', NULL, NULL, NULL),
(832, NULL, '11', '23', '3', '11', '2020', '10000', NULL, NULL, NULL),
(833, NULL, '11', '23', '3', '12', '2020', '10000', NULL, NULL, NULL),
(834, NULL, '11', '23', '3', '1', '2021', '10000', NULL, NULL, NULL),
(835, NULL, '11', '23', '3', '2', '2021', '10000', NULL, NULL, NULL),
(836, NULL, '11', '23', '3', '3', '2021', '10000', NULL, NULL, NULL),
(837, NULL, '11', '23', '3', '4', '2021', '10000', NULL, NULL, NULL),
(838, NULL, '11', '23', '3', '5', '2021', '10000', NULL, NULL, NULL),
(839, NULL, '11', '23', '3', '6', '2021', '10000', NULL, NULL, NULL),
(840, NULL, '11', '23', '3', '7', '2021', '10000', NULL, NULL, NULL),
(841, NULL, '11', '23', '3', '8', '2021', '10000', NULL, NULL, NULL),
(842, NULL, '11', '23', '3', '9', '2021', '', NULL, NULL, NULL),
(843, NULL, '11', '23', '3', '10', '2021', '', NULL, NULL, NULL),
(844, NULL, '11', '23', '3', '11', '2021', '10000', NULL, NULL, NULL),
(845, NULL, '11', '23', '3', '12', '2021', '10000', NULL, NULL, NULL),
(846, NULL, '11', '23', '3', '1', '2022', '10000', NULL, NULL, NULL),
(847, NULL, '4', '8', NULL, '2', '2023', '130000', NULL, NULL, NULL),
(848, NULL, '4', '8', NULL, '3', '2023', '130000', NULL, NULL, NULL),
(849, NULL, '4', '8', NULL, '4', '2023', '130000', NULL, NULL, NULL),
(850, NULL, '14', '26', NULL, '2', '2023', '35000', NULL, NULL, NULL),
(851, NULL, '14', '26', NULL, '3', '2023', '35000', NULL, NULL, NULL),
(852, NULL, '14', '26', NULL, '4', '2023', '35000', NULL, NULL, NULL),
(853, NULL, '17', '30', '183', '4', '2023', '5700', NULL, NULL, NULL),
(854, NULL, '17', '30', '2', '1', '2023', '3500', NULL, NULL, NULL),
(855, NULL, '17', '30', '16', '1', '2023', '5500', NULL, NULL, NULL),
(856, NULL, '17', '30', '5', '1', '2023', '3400', NULL, NULL, NULL),
(857, NULL, '17', '30', '14', '1', '2023', '3500', NULL, NULL, NULL),
(858, NULL, '17', '30', '7', '1', '2023', '4500', NULL, NULL, NULL),
(859, NULL, '17', '30', '12', '1', '2023', '4300', NULL, NULL, NULL),
(860, NULL, '17', '30', '9', '1', '2023', '4300', NULL, NULL, NULL),
(861, NULL, '17', '30', '15', '1', '2023', '4300', NULL, NULL, NULL),
(862, NULL, '16', '28', '20', '1', '2023', '4700', NULL, NULL, NULL),
(863, NULL, '16', '28', '5', '1', '2023', '4700', NULL, NULL, NULL),
(864, NULL, '43', '45', '1', '9', '2020', '96000', NULL, NULL, NULL),
(865, NULL, '43', '45', '1', '9', '2021', '96000', NULL, NULL, NULL),
(866, NULL, '43', '45', '1', '9', '2022', '32000', NULL, NULL, NULL),
(867, NULL, '43', '45', '1', '1', '2023', '32000', NULL, NULL, NULL),
(868, NULL, '16', '28', '4', '8', '2022', '4700', NULL, NULL, NULL),
(869, NULL, '16', '28', '4', '9', '2022', '4700', NULL, NULL, NULL),
(870, NULL, '16', '28', '4', '10', '2022', '4700', NULL, NULL, NULL),
(871, NULL, '16', '28', '24', '10', '2022', '4700', NULL, NULL, NULL),
(872, NULL, '16', '28', '4', '12', '2022', '4700', NULL, NULL, NULL),
(873, NULL, '16', '28', '24', '11', '2022', '4700', NULL, NULL, NULL),
(874, NULL, '16', '28', '4', '1', '2023', '4700', NULL, NULL, NULL),
(875, NULL, '16', '28', '24', '12', '2022', '4700', NULL, NULL, NULL),
(876, NULL, '16', '28', '24', '1', '2023', '4700', NULL, NULL, NULL),
(877, NULL, '6', '18', NULL, '2', '2023', '10000', NULL, NULL, NULL),
(878, NULL, '6', '18', NULL, '3', '2023', '10000', NULL, NULL, NULL),
(879, NULL, '6', '18', NULL, '4', '2023', '10000', NULL, NULL, NULL),
(880, NULL, '13', '52', NULL, '3', '2023', '74400', NULL, NULL, NULL),
(881, NULL, '8', '19', NULL, '3', '2023', '80400', NULL, NULL, NULL),
(882, NULL, '16', '64', NULL, '2', '2023', '14100', NULL, NULL, NULL),
(883, NULL, '16', '64', NULL, '3', '2023', '14100', NULL, NULL, NULL),
(884, NULL, '16', '64', NULL, '4', '2023', '14100', NULL, NULL, NULL),
(885, NULL, '16', '65', NULL, '2', '2023', '37600', NULL, NULL, NULL),
(886, NULL, '16', '65', NULL, '3', '2023', '37600', NULL, NULL, NULL),
(887, NULL, '16', '65', NULL, '4', '2023', '37600', NULL, NULL, NULL),
(888, NULL, '18', '66', NULL, '2', '2023', '26000', NULL, NULL, NULL),
(889, NULL, '18', '66', NULL, '3', '2023', '26000', NULL, NULL, NULL),
(890, NULL, '18', '66', NULL, '4', '2023', '26000', NULL, NULL, NULL),
(891, NULL, '16', '68', NULL, '2', '2023', '14100', NULL, NULL, NULL),
(892, NULL, '16', '68', NULL, '3', '2023', '14100', NULL, NULL, NULL),
(893, NULL, '16', '68', NULL, '4', '2023', '14100', NULL, NULL, NULL),
(894, NULL, '9', '70', NULL, '2', '2023', '9000', NULL, NULL, NULL),
(895, NULL, '9', '70', NULL, '3', '2023', '9000', NULL, NULL, NULL),
(896, NULL, '9', '70', NULL, '4', '2023', '9000', NULL, NULL, NULL),
(897, NULL, '17', '71', NULL, '2', '2023', '36580', NULL, NULL, NULL),
(898, NULL, '17', '71', NULL, '3', '2023', '36580', NULL, NULL, NULL),
(899, NULL, '17', '71', NULL, '4', '2023', '36580', NULL, NULL, NULL),
(900, NULL, '4', '72', NULL, '2', '2023', '40000', NULL, NULL, NULL),
(901, NULL, '4', '72', NULL, '3', '2023', '40000', NULL, NULL, NULL),
(902, NULL, '4', '72', NULL, '4', '2023', '40000', NULL, NULL, NULL),
(903, NULL, '16', '77', NULL, '2', '2023', '9600', NULL, NULL, NULL),
(904, NULL, '22', '89', NULL, '1', '2020', '30000', NULL, NULL, NULL),
(905, NULL, '22', '89', NULL, '2', '2020', '30000', NULL, NULL, NULL),
(906, NULL, '22', '89', NULL, '3', '2020', '30000', NULL, NULL, NULL),
(907, NULL, '22', '89', NULL, '4', '2020', '30000', NULL, NULL, NULL),
(908, NULL, '22', '89', NULL, '5', '2020', '30000', NULL, NULL, NULL),
(909, NULL, '22', '89', NULL, '6', '2020', '30000', NULL, NULL, NULL),
(910, NULL, '22', '89', NULL, '7', '2020', '30000', NULL, NULL, NULL),
(911, NULL, '22', '89', NULL, '8', '2020', '30000', NULL, NULL, NULL),
(912, NULL, '22', '89', NULL, '9', '2020', '30000', NULL, NULL, NULL),
(913, NULL, '22', '89', NULL, '10', '2020', '30000', NULL, NULL, NULL),
(914, NULL, '22', '89', NULL, '11', '2020', '30000', NULL, NULL, NULL),
(915, NULL, '22', '89', NULL, '12', '2020', '30000', NULL, NULL, NULL),
(916, NULL, '22', '89', NULL, '1', '2021', '30000', NULL, NULL, NULL),
(917, NULL, '22', '89', NULL, '2', '2021', '30000', NULL, NULL, NULL),
(918, NULL, '22', '89', NULL, '3', '2021', '30000', NULL, NULL, NULL),
(919, NULL, '22', '89', NULL, '4', '2021', '30000', NULL, NULL, NULL),
(920, NULL, '13', '91', NULL, '4', '2020', '78000', NULL, NULL, NULL),
(921, NULL, '13', '91', NULL, '5', '2020', '78000', NULL, NULL, NULL),
(922, NULL, '13', '91', NULL, '6', '2020', '78000', NULL, NULL, NULL),
(923, NULL, '13', '91', NULL, '7', '2020', '78000', NULL, NULL, NULL),
(924, NULL, '13', '91', NULL, '8', '2020', '78000', NULL, NULL, NULL),
(925, NULL, '13', '91', NULL, '9', '2020', '78000', NULL, NULL, NULL),
(926, NULL, '13', '91', NULL, '10', '2020', '78000', NULL, NULL, NULL),
(927, NULL, '13', '91', NULL, '11', '2020', '78000', NULL, NULL, NULL),
(928, NULL, '13', '91', NULL, '12', '2020', '78000', NULL, NULL, NULL),
(929, NULL, '13', '91', NULL, '1', '2021', '78000', NULL, NULL, NULL),
(930, NULL, '13', '91', NULL, '2', '2021', '78000', NULL, NULL, NULL),
(931, NULL, '13', '91', NULL, '3', '2021', '78000', NULL, NULL, NULL),
(932, NULL, '13', '91', NULL, '4', '2021', '78000', NULL, NULL, NULL),
(933, NULL, '13', '91', NULL, '5', '2021', '78000', NULL, NULL, NULL),
(934, NULL, '13', '91', NULL, '6', '2021', '39000', NULL, NULL, NULL),
(935, NULL, '39', '97', NULL, '12', '2021', '60000', NULL, NULL, NULL),
(936, NULL, '39', '97', NULL, '1', '2022', '60000', NULL, NULL, NULL),
(937, NULL, '39', '97', NULL, '2', '2022', '60000', NULL, NULL, NULL),
(938, NULL, '39', '97', NULL, '3', '2022', '60000', NULL, NULL, NULL),
(939, NULL, '39', '97', NULL, '4', '2022', '60000', NULL, NULL, NULL),
(940, NULL, '39', '97', NULL, '5', '2022', '60000', NULL, NULL, NULL),
(941, NULL, '39', '97', NULL, '6', '2022', '60000', NULL, NULL, NULL),
(942, NULL, '39', '97', NULL, '7', '2022', '60000', NULL, NULL, NULL),
(943, NULL, '39', '97', NULL, '8', '2022', '60000', NULL, NULL, NULL),
(944, NULL, '39', '97', NULL, '9', '2022', '60000', NULL, NULL, NULL),
(945, NULL, '39', '97', NULL, '10', '2022', '60000', NULL, NULL, NULL),
(946, NULL, '39', '97', NULL, '11', '2022', '60000', NULL, NULL, NULL),
(947, NULL, '39', '97', NULL, '12', '2022', '60000', NULL, NULL, NULL),
(948, NULL, '39', '97', NULL, '1', '2023', '60000', NULL, NULL, NULL),
(949, NULL, '39', '97', NULL, '2', '2023', '60000', NULL, NULL, NULL),
(950, NULL, '39', '97', NULL, '3', '2023', '60000', NULL, NULL, NULL),
(951, NULL, '39', '97', NULL, '4', '2023', '60000', NULL, NULL, NULL),
(952, NULL, '16', '28', '3', '1', '2020', '5000', NULL, NULL, NULL),
(953, NULL, '16', '28', '3', '2', '2020', '5000', NULL, NULL, NULL),
(954, NULL, '16', '28', '3', '3', '2020', '5000', NULL, NULL, NULL),
(955, NULL, '16', '28', '3', '4', '2020', '5000', NULL, NULL, NULL),
(956, NULL, '16', '28', '3', '5', '2020', '5000', NULL, NULL, NULL),
(957, NULL, '16', '28', '3', '6', '2020', '5000', NULL, NULL, NULL),
(958, NULL, '16', '28', '3', '7', '2020', '5000', NULL, NULL, NULL),
(959, NULL, '16', '28', '3', '8', '2020', '5000', NULL, NULL, NULL),
(960, NULL, '16', '28', '3', '9', '2020', '5000', NULL, NULL, NULL),
(961, NULL, '16', '28', '3', '10', '2020', '4700', NULL, NULL, NULL),
(962, NULL, '16', '28', '3', '11', '2020', '4700', NULL, NULL, NULL),
(963, NULL, '16', '28', '3', '12', '2020', '4700', NULL, NULL, NULL),
(964, NULL, '16', '28', '3', '1', '2021', '4700', NULL, NULL, NULL),
(965, NULL, '16', '28', '3', '2', '2021', '4700', NULL, NULL, NULL),
(966, NULL, '16', '28', '3', '5', '2021', '4700', NULL, NULL, NULL),
(967, NULL, '16', '28', '3', '8', '2021', '4700', NULL, NULL, NULL),
(968, NULL, '16', '28', '3', '9', '2021', '4700', NULL, NULL, NULL),
(969, NULL, '16', '28', '3', '11', '2021', '4700', NULL, NULL, NULL),
(970, NULL, '16', '28', '3', '12', '2021', '4700', NULL, NULL, NULL),
(971, NULL, '16', '28', '3', '1', '2022', '4700', NULL, NULL, NULL),
(972, NULL, '16', '28', '3', '2', '2022', '4700', NULL, NULL, NULL),
(973, NULL, '16', '28', '3', '3', '2022', '4700', NULL, NULL, NULL),
(974, NULL, '17', '30', '15', '4', '2023', '4300', NULL, NULL, NULL),
(975, NULL, '17', '30', '6', '4', '2023', '4500', NULL, NULL, NULL),
(976, NULL, '16', '28', '20', '4', '2023', '4700', NULL, NULL, NULL),
(977, NULL, '16', '28', '5', '4', '2023', '4700', NULL, NULL, NULL),
(978, NULL, '17', '30', '10', '4', '2023', '4300', NULL, NULL, NULL),
(979, NULL, '17', '30', '11', '4', '2023', '3300', NULL, NULL, NULL),
(980, NULL, '22', '35', '1', '4', '2023', '10000', NULL, NULL, NULL),
(981, NULL, '25', '38', '3', '4', '2023', '7500', NULL, NULL, NULL),
(982, NULL, '11', '23', '1', '1', '2023', '9000', NULL, NULL, NULL),
(983, NULL, '11', '23', '1', '2', '2023', '9000', NULL, NULL, NULL),
(984, NULL, '11', '23', '1', '3', '2023', '9000', NULL, NULL, NULL),
(985, NULL, '11', '23', '1', '4', '2023', '9000', NULL, NULL, NULL),
(986, NULL, '15', '27', '5', '3', '2023', '2500', NULL, NULL, NULL),
(987, NULL, '17', '29', '13', '3', '2023', '3000', NULL, NULL, NULL),
(988, NULL, '16', '28', '4', '4', '2023', '4700', NULL, NULL, NULL),
(989, NULL, '16', '28', '24', '3', '2023', '4700', NULL, NULL, NULL),
(990, NULL, '16', '28', '24', '2', '2023', '4700', NULL, NULL, NULL),
(991, NULL, '16', '28', '24', '4', '2023', '4700', NULL, NULL, NULL),
(992, NULL, '16', '28', '9', '3', '2023', '4700', NULL, NULL, NULL),
(993, NULL, '16', '28', '9', '4', '2023', '4700', NULL, NULL, NULL),
(994, NULL, '21', '34', '45', '6', '2021', '10000', NULL, NULL, NULL),
(995, NULL, '21', '34', '45', '7', '2021', '10000', NULL, NULL, NULL),
(996, NULL, '21', '34', '45', '8', '2021', '10000', NULL, NULL, NULL),
(997, NULL, '21', '34', '45', '9', '2021', '10000', NULL, NULL, NULL),
(998, NULL, '21', '34', '45', '10', '2021', '10000', NULL, NULL, NULL),
(999, NULL, '21', '34', '45', '11', '2021', '10000', NULL, NULL, NULL),
(1000, NULL, '21', '34', '45', '12', '2021', '10000', NULL, NULL, NULL),
(1001, NULL, '21', '34', '45', '1', '2022', '10000', NULL, NULL, NULL),
(1002, NULL, '21', '34', '45', '2', '2022', '10000', NULL, NULL, NULL),
(1003, NULL, '21', '34', '45', '3', '2022', '10000', NULL, NULL, NULL),
(1004, NULL, '21', '34', '45', '4', '2022', '10000', NULL, NULL, NULL),
(1005, NULL, '21', '34', '45', '5', '2022', '10000', NULL, NULL, NULL),
(1006, NULL, '21', '34', '45', '6', '2022', '10000', NULL, NULL, NULL),
(1007, NULL, '21', '34', '45', '7', '2022', '10000', NULL, NULL, NULL),
(1008, NULL, '21', '34', '45', '8', '2022', '10000', NULL, NULL, NULL),
(1009, NULL, '21', '34', '45', '9', '2022', '10000', NULL, NULL, NULL),
(1010, NULL, '21', '34', '45', '10', '2022', '10000', NULL, NULL, NULL),
(1011, NULL, '21', '34', '45', '11', '2022', '10000', NULL, NULL, NULL),
(1012, NULL, '21', '34', '45', '12', '2022', '10000', NULL, NULL, NULL),
(1013, NULL, '21', '34', '45', '1', '2023', '10000', NULL, NULL, NULL),
(1014, NULL, '21', '34', '45', '2', '2023', '10000', NULL, NULL, NULL),
(1015, NULL, '21', '34', '45', '3', '2023', '10000', NULL, NULL, NULL),
(1016, NULL, '21', '34', '45', '4', '2023', '10000', NULL, NULL, NULL),
(1017, NULL, '17', '29', '12', '4', '2023', '3700', NULL, NULL, NULL),
(1018, NULL, '17', '30', '13', '3', '2023', '4200', NULL, NULL, NULL),
(1019, NULL, '17', '30', '13', '4', '2023', '4200', NULL, NULL, NULL),
(1020, NULL, '17', '30', '4', '3', '2023', '4100', NULL, NULL, NULL),
(1021, NULL, '17', '30', '4', '4', '2023', '4100', NULL, NULL, NULL),
(1022, NULL, '16', '28', '12', '1', '2023', '6000', NULL, NULL, NULL),
(1023, NULL, '15', '27', '4', '2', '2020', '2500', NULL, NULL, NULL),
(1024, NULL, '15', '27', '4', '3', '2020', '2500', NULL, NULL, NULL),
(1025, NULL, '15', '27', '4', '4', '2020', '2500', NULL, NULL, NULL),
(1026, NULL, '15', '27', '4', '5', '2020', '2500', NULL, NULL, NULL),
(1027, NULL, '6', '11', '4', '4', '2023', '3000', NULL, NULL, NULL),
(1028, NULL, '15', '27', '4', '6', '2020', '2500', NULL, NULL, NULL),
(1029, NULL, '15', '27', '4', '7', '2020', '2500', NULL, NULL, NULL),
(1030, NULL, '15', '27', '4', '8', '2020', '2500', NULL, NULL, NULL),
(1031, NULL, '15', '27', '4', '10', '2020', '2500', NULL, NULL, NULL),
(1032, NULL, '15', '27', '4', '11', '2020', '2500', NULL, NULL, NULL),
(1033, NULL, '15', '27', '4', '12', '2020', '2500', NULL, NULL, NULL),
(1034, NULL, '15', '27', '4', '2', '2021', '2500', NULL, NULL, NULL),
(1035, NULL, '15', '27', '4', '3', '2021', '2500', NULL, NULL, NULL),
(1036, NULL, '15', '27', '4', '4', '2021', '2500', NULL, NULL, NULL),
(1037, NULL, '15', '27', '4', '5', '2021', '2500', NULL, NULL, NULL),
(1038, NULL, '15', '27', '4', '6', '2021', '2500', NULL, NULL, NULL),
(1039, NULL, '15', '27', '4', '7', '2021', '2500', NULL, NULL, NULL),
(1040, NULL, '15', '27', '4', '8', '2021', '2500', NULL, NULL, NULL),
(1041, NULL, '15', '27', '4', '9', '2020', '2500', NULL, NULL, NULL),
(1042, NULL, '15', '27', '4', '9', '2021', '2500', NULL, NULL, NULL),
(1043, NULL, '15', '27', '4', '10', '2021', '2500', NULL, NULL, NULL),
(1044, NULL, '15', '27', '4', '11', '2021', '2500', NULL, NULL, NULL),
(1045, NULL, '15', '27', '4', '12', '2021', '2500', NULL, NULL, NULL),
(1046, NULL, '15', '27', '4', '1', '2022', '2500', NULL, NULL, NULL),
(1047, NULL, '15', '27', '4', '2', '2022', '2500', NULL, NULL, NULL),
(1048, NULL, '15', '27', '4', '3', '2022', '2500', NULL, NULL, NULL),
(1049, NULL, '15', '27', '4', '5', '2022', '2500', NULL, NULL, NULL),
(1050, NULL, '15', '27', '4', '4', '2022', '2500', NULL, NULL, NULL),
(1051, NULL, '15', '27', '4', '6', '2022', '2500', NULL, NULL, NULL),
(1052, NULL, '15', '27', '4', '7', '2022', '2500', NULL, NULL, NULL),
(1053, NULL, '15', '27', '4', '8', '2022', '2500', NULL, NULL, NULL),
(1054, NULL, '15', '27', '4', '9', '2022', '2500', NULL, NULL, NULL),
(1055, NULL, '15', '27', '4', '10', '2022', '2500', NULL, NULL, NULL),
(1056, NULL, '15', '27', '4', '11', '2022', '2500', NULL, NULL, NULL),
(1057, NULL, '15', '27', '4', '12', '2022', '2500', NULL, NULL, NULL),
(1058, NULL, '15', '27', '2', '4', '2023', '2500', NULL, NULL, NULL),
(1059, NULL, '11', '23', '2', '4', '2023', '9000', NULL, NULL, NULL),
(1060, NULL, '29', '41', '86', '11', '2022', '10500', NULL, NULL, NULL),
(1061, NULL, '29', '41', '86', '12', '2022', '10500', NULL, NULL, NULL),
(1062, NULL, '29', '41', '86', '1', '2023', '10500', NULL, NULL, NULL),
(1063, NULL, '29', '41', '86', '2', '2023', '10500', NULL, NULL, NULL),
(1064, NULL, '29', '41', '86', '4', '2023', '10500', NULL, NULL, NULL),
(1065, NULL, '10', '22', '3', '4', '2023', '2500', NULL, NULL, NULL),
(1066, NULL, '10', '22', '1', '3', '2023', '1000', NULL, NULL, NULL),
(1067, NULL, '10', '22', '1', '4', '2023', '1000', NULL, NULL, NULL),
(1068, NULL, '6', '11', '6', '4', '2023', '3000', NULL, NULL, NULL),
(1069, NULL, '17', '30', '9', '2', '2023', '4300', NULL, NULL, NULL),
(1070, NULL, '17', '30', '9', '3', '2023', '4300', NULL, NULL, NULL),
(1071, NULL, '17', '30', '3', '2', '2023', '4500', NULL, NULL, NULL),
(1072, NULL, '17', '30', '3', '3', '2023', '4500', NULL, NULL, NULL),
(1073, NULL, '17', '30', '15', '2', '2023', '4300', NULL, NULL, NULL),
(1074, NULL, '17', '30', '15', '3', '2023', '4300', NULL, NULL, NULL),
(1075, NULL, '17', '30', '9', '5', '2023', '4300', NULL, NULL, NULL),
(1076, NULL, '17', '30', '6', '2', '2023', '4500', NULL, NULL, NULL),
(1077, NULL, '17', '30', '6', '3', '2023', '4500', NULL, NULL, NULL),
(1078, NULL, '16', '28', '20', '2', '2023', '4700', NULL, NULL, NULL),
(1079, NULL, '54', '104', '010104', '7', '2023', '2000', NULL, NULL, NULL),
(1080, NULL, '54', '104', '010104', '8', '2023', '2000', NULL, NULL, NULL),
(1081, NULL, '45', '76', '1', '7', '2023', '45000', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE `company_info` (
  `Company_Id` int(11) NOT NULL,
  `Company_Name` varchar(200) NOT NULL,
  `Company_Address` varchar(200) NOT NULL,
  `Company_Tel` varchar(200) NOT NULL,
  `Company_Fax` varchar(200) NOT NULL,
  `Company_Email` varchar(200) NOT NULL,
  `Company_Website` varchar(200) NOT NULL,
  `Company_CR_Number` varchar(200) NOT NULL,
  `Company_Logo_Path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company_representative`
--

CREATE TABLE `company_representative` (
  `Company_representative_Id` int(11) NOT NULL,
  `Com_rep_Ar_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Com_rep_En_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Com_rep_Mobile` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Com_rep_Email` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Com_rep_QID_NO` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Com_rep_QID` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Com_rep_QID_Path` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `nationality_nationality_ID` int(11) NOT NULL,
  `tenants_Tenants_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_representative`
--

INSERT INTO `company_representative` (`Company_representative_Id`, `Com_rep_Ar_Name`, `Com_rep_En_Name`, `Com_rep_Mobile`, `Com_rep_Email`, `Com_rep_QID_NO`, `Com_rep_QID`, `Com_rep_QID_Path`, `nationality_nationality_ID`, `tenants_Tenants_ID`) VALUES
(1, 'فارغ', 'Empty', 'Empty', 'Empty', 'Empty', '', '', 165, 0),
(4, 'الاسم بالعربية', 'كورمان كاندوتس كناران', '55805309', '', '23535601551', 'No File', 'No File', 19, 41),
(5, 'الاسم بالعربية', 'محمد علي محمد انور الخطيب', '74000051', '', '28276000599', 'No File', 'No File', 147, 43),
(19, 'mohamad dedrol', 'محمد ديدارول علام', '', '', '28205026129', 'No File', 'No File', 44, 61),
(20, 'abd algaufur', 'عبد الغفور اربيل ', '', '', '27235601160', 'No File', 'No File', 19, 48),
(24, 'amer tabal', 'عامر محمد ديب تبارا', '33760074', '', '28776002193', 'No File', 'No File', 147, 84),
(26, 'Hamad Fahad Jasem', 'حمد فهد جاسم عبدالعزيز ال ثاني', '66113337', '', '27763402882', 'No File', 'No File', 130, 74),
(27, 'Yousef Ahmad Yousef Abdulrahman Molla', 'يوسف احمد يوسف عبد الرحمن الملا', '77001997', '', '29763400015', 'No File', 'No File', 130, 76),
(28, 'Ickbal Mayam Veettil Sayed Mohammed', 'اقبال ميام ويتيل سيد محمد', '', '', '26535624245', 'No File', 'No File', 19, 98),
(29, 'Mohammad Saad Mohammad AL Binali AL Muhannadi', 'محمد سعد محمد البنعلي المهندى', '', '', '29663400385', 'No File', 'No File', 130, 78),
(30, 'Mohammad Hossain Mohammed Saijuddin', 'محمد ادريس حسين', '55439758', '', '27105000481', 'No File', 'No File', 44, 77),
(31, 'Aman Muftah Aman Jaber Al Hamad', 'امان مفتاح امان جابر الحمد', '33357687', '', '26963401510', 'No File', 'No File', 165, 99),
(32, 'Khadka Bahadur Paa', 'كادكا بهادور با ', '30834466', '', '27752400219', 'No File', 'No File', 116, 59),
(33, 'Mohamed Ali Husain Al Ansari', 'محمد علي حسين الانصاري', '', '', '2593400347', 'No File', 'No File', 165, 100),
(34, 'Thoenis Johannes Cotes', 'ثيونيس جوهانيس كوتيز', '', '', '26171000098', 'No File', 'No File', 142, 90),
(35, 'Monzer Saleem Faraj Qrinawi', 'منذر سليم فرج القرناوي', '55854972', '', '27799900232', 'No File', 'No File', 166, 89),
(37, 'الاسم بالعربية', 'فاياليل ناصر ', '55852431', '', '26635603162', 'No File', 'No File', 19, 67),
(38, 'md juwal abdul aziz', 'مد جويل عبد العزيز ', '33357687', '', '28905027384', 'No File', 'No File', 44, 103),
(39, 'hazem al shoed', 'حازم عبدالرحمن الشحود ', '30000797', '', '28776001150', 'No File', 'No File', 147, 87),
(40, 'belal abed al badea ', 'بلال عبد البديع عثمان صابر ', '', '', '26140000072', 'No File', 'No File', 91, 104),
(41, 'Rashed al koarey', 'راشد غانم محمد الربيعه الكواري ', '44138888', '', '27063400348', 'No File', 'No File', 130, 106),
(42, 'talal', 'طلال زيد نصر الدوسري ', '', '', '28063402965', 'No File', 'No File', 130, 116),
(43, 'mohamad', 'محمد عمر الكردي ', '44727280', '', '26140000012', 'No File', 'No File', 91, 117),
(44, 'mohamad abdulkader', 'محمد عبد القادر ', '55513142', '', '26335601314', 'No File', 'No File', 19, 118),
(45, 'abeda ', 'عبيدة احمد جميل المنجد', '66009737', '', '28076000722', 'No File', 'No File', 147, 88);

-- --------------------------------------------------------

--
-- Table structure for table `complaint_report_request`
--

CREATE TABLE `complaint_report_request` (
  `Complaint_Report_Request_Id` int(11) NOT NULL,
  `source` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Tenant_ID` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Employee_ID` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Order_Classification` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Report_Type` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Report_Direction` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `priority_Danger` int(11) DEFAULT NULL,
  `Date` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Report_Text` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Report_Description` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `precaution` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Activ` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `urgent` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Danger` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `building_Building_Id` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Unit_Id` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Image_Befor_FileName` varchar(200) DEFAULT NULL,
  `Image_Befor_Path` varchar(200) DEFAULT NULL,
  `Image_After_FileName` varchar(200) DEFAULT NULL,
  `Image_After_Path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `complaint_report_request`
--

INSERT INTO `complaint_report_request` (`Complaint_Report_Request_Id`, `source`, `Tenant_ID`, `Employee_ID`, `Order_Classification`, `Report_Type`, `Report_Direction`, `priority_Danger`, `Date`, `Report_Text`, `Report_Description`, `precaution`, `Activ`, `urgent`, `Danger`, `building_Building_Id`, `Unit_Id`, `Image_Befor_FileName`, `Image_Befor_Path`, `Image_After_FileName`, `Image_After_Path`) VALUES
(1, 'Censorship', '', '4', 'Report', 'Maintenance', 'Customer Affairs', 2, '01/11/2022', 'اغلاق انبوب القمامة وتراكم القمامة داخل الانبوب ', 'اغلاق انبوب القمامة ', 'قص الكوع الموجود بنهاية الانبوب ', 'Done', 'Disable', 'Low Risk Risk', '', '', 'No File', 'No File', 'No File', 'No File'),
(2, 'Censorship', '', '4', 'Complaint', 'Cleanliness', 'Customer Affairs', 2, '10/11/2022', 'وجود روائح وحشرات في مكب القمامة', 'وجد قمامة متعلقة بيت الطابق 3 و المدخل. أنبوبة القمامة في نهايتها لا تسمح بنزول النفايات . فتم جلب عامل نظافة أجرته 120 ريال لتفضية وتنظيف الأنبوب من القمامة.', 'تنبيه العملاء لعدم رمي قمامة لا تتسع ولا تمر من انبوبة رمي النفايات. لقد تم قفل أبوب رمي القمامة الى أن تحل المشاكل الفنية لمرافق رمي القمامة.', 'Done', 'Disable', 'Low Risk Risk', '', '', 'No File', 'No File', 'No File', 'No File'),
(3, 'Censorship', '', '4', 'Report', 'Cleanliness', 'Censorship', 3, '09/11/2022', 'طلب من الناطور عبدالله تنظيف بيت الشوك ', 'لقد تم دفع 50 ريال لعمله وتم التدقيق والفحص في نفس اليوم', '', 'Done', 'Transient Nuisance', 'Low Risk Risk', '', '', 'No File', 'No File', 'No File', 'No File'),
(4, 'Censorship', '', '4', 'Report', 'Cleanliness', 'Censorship', 3, '19/10/2022', 'طلب من الناطور عبدالله تنظيف بيت الشوك', 'لقد تم دفع 50 ريال لعمله وتم التدقيق والفحص في نفس اليوم', '', 'Done', 'Transient Nuisance', 'Low Risk Risk', '', '', 'No File', 'No File', 'No File', 'No File'),
(8, 'عميل', '25', '', 'بلاغ', 'نظافة', 'شؤون العملاء', 1, '20/03/2023', 'Test Test Test', '', '', 'معلق', 'تعطيل', 'خطورة على الحياة', '30', '174', 'No File', 'No File', 'No File', 'No File'),
(9, 'عميل', '25', '', 'بلاغ', 'مخالفة', 'شؤون العملاء', 2, '20/03/2023', ' One TwoOne TwoOne TwoOne Two', '', '', 'معلق', 'Temporary inconvenience', 'Dangerous to the property', '30', '174', 'No File', 'No File', 'No File', 'No File'),
(10, 'عميل', '25', '', 'بلاغ', 'صيانة', 'شؤون العملاء', 1, '21/03/2023', 'اصلاح المكيف ', '', '', 'معلق', 'تعطيل', 'خطورة على الحياة', '30', '174', '', '', '', ''),
(12, 'Censorship', '', '4', 'Complaint', 'Maintenance', 'Censorship', 1, '04/07/2023', '', '', '', 'On Hold', 'Disable', 'Dangerous To Properties', '23', '123', 'No File', 'No File', 'No File', 'No File'),
(13, 'Censorship', '', '2', 'Report', 'Maintenance', 'Censorship', 1, '12/07/2023', 'XXXXXXXXXXXXXXX', 'YYYYYYYYYYY ZZZZZZZZZZZZ', '', 'On Hold', 'Disable', 'Dangerous To Properties', '82', '476', '', '', '', ''),
(14, 'Censorship', '', '2', 'Report', 'Maintenance', 'Customer Affairs', 1, '13/07/2023', 'dvahgdvavd ajbnfjhabf ajnfjbaf\r\ndjkanjdbnajd\r\nakdjbajdhbhabd', 'dvahgdvavd ajbnfjhabf ajnfjbaf\r\ndjkanjdbnajd\r\nakdjbajdhbhabd', '', 'On Hold', 'Disable', 'Dangerous To Life', '82', '476', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `Contract_Id` int(11) NOT NULL,
  `users_user_ID` int(11) NOT NULL,
  `tenants_Tenants_ID` int(11) NOT NULL,
  `units_Unit_ID` int(11) NOT NULL,
  `contract_type_Contract_Type_Id` int(11) NOT NULL,
  `contract_template_Contract_template_Id` int(11) NOT NULL,
  `payment_type_payment_type_Id` int(11) NOT NULL,
  `reason_for_rent_Reason_For_Rent_Id` int(11) NOT NULL,
  `Number_Of_Mounth` varchar(45) DEFAULT NULL,
  `Number_Of_Years` varchar(45) DEFAULT NULL,
  `Payment_Amount` varchar(200) NOT NULL,
  `Payment_Amount_L` varchar(200) NOT NULL,
  `Date_Of_Sgin` varchar(200) NOT NULL,
  `Start_Date` varchar(200) NOT NULL,
  `End_Date` varchar(200) NOT NULL,
  `Contract_Details` varchar(2000) DEFAULT NULL,
  `New_ReNewed_Expaired` varchar(45) NOT NULL,
  `Start_Free_Period` varchar(200) DEFAULT NULL,
  `Duration_free_period` varchar(200) DEFAULT NULL,
  `maintenance` varchar(45) NOT NULL,
  `Rental_allowed_Or_Not_allowed` varchar(45) NOT NULL,
  `Com_rep` varchar(45) DEFAULT NULL,
  `Paymen_Method` varchar(200) DEFAULT NULL,
  `Real_Contract_FileName` varchar(200) DEFAULT NULL,
  `Real_Contract_Path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`Contract_Id`, `users_user_ID`, `tenants_Tenants_ID`, `units_Unit_ID`, `contract_type_Contract_Type_Id`, `contract_template_Contract_template_Id`, `payment_type_payment_type_Id`, `reason_for_rent_Reason_For_Rent_Id`, `Number_Of_Mounth`, `Number_Of_Years`, `Payment_Amount`, `Payment_Amount_L`, `Date_Of_Sgin`, `Start_Date`, `End_Date`, `Contract_Details`, `New_ReNewed_Expaired`, `Start_Free_Period`, `Duration_free_period`, `maintenance`, `Rental_allowed_Or_Not_allowed`, `Com_rep`, `Paymen_Method`, `Real_Contract_FileName`, `Real_Contract_Path`) VALUES
(3, 5, 76, 203, 1, 1, 2, 2, '', '1', '11000', 'إحدى عشر ألف', '01/02/2022', '01/02/2022', '01/02/2023', '', '1', '', '', '2', '2', '5', '', NULL, NULL),
(7, 5, 25, 174, 1, 1, 2, 1, '', '1', '3500', 'ثلاثة الف وخمس مئة ', '', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(12, 8, 34, 183, 1, 1, 2, 1, '', '1', '5700', 'خمسة الف وسبع مئة ', '', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(18, 8, 17, 168, 1, 1, 2, 1, '', '1', '3500', 'ثلاثة الف وخمسئة', '20/11/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(19, 8, 33, 182, 1, 1, 2, 1, '', '1', '5500', 'خمسة الف وخمسمئة', '20/11/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(20, 8, 31, 180, 1, 1, 2, 1, '', '1', '3500', 'ثلاثة الف وخمسمئة ', '01/12/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(23, 8, 22, 171, 1, 1, 2, 1, '', '1', '3400', 'ثلاثة الف واربعمئة ', '25/11/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(24, 8, 24, 173, 1, 1, 2, 1, '', '1', '4500', 'اربع الف وخمسمئة', '25/12/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', '', NULL, NULL),
(25, 8, 29, 178, 1, 1, 2, 1, '', '1', '4300', 'اربعة الف وثلاثمئة', '20/11/2022', '06/01/2023', '05/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(28, 8, 26, 175, 1, 1, 2, 1, '', '1', '4300', 'اربعة الاف وثلاثمئة ', '20/12/2022', '10/01/2023', '9/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(31, 8, 28, 167, 1, 1, 2, 1, '', '1', '4400', 'اربعة الاف واربعمئة ', '08/01/2023', '08/01/2023', '07/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(34, 8, 18, 169, 1, 1, 2, 1, '', '1', '4500', 'اربعة الاف وخمسمئة ', '03/01/2023', '31/01/2023', '31/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(35, 8, 32, 181, 1, 1, 2, 1, '', '1', '4300', 'اربعة الاف وثلاثمئة ', '20/12/2022', '05/01/2023', '04/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(39, 8, 23, 172, 1, 1, 2, 1, '', '1', '4500', 'اربعة الاف وخمسمئة ', '20/12/2023', '31/01/2023', '30/01/2024', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(41, 8, 13, 25, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '14/01/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(42, 8, 15, 7, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '01/01/2023', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', '', NULL, NULL),
(45, 8, 102, 176, 1, 1, 2, 1, '', '1', '4300', 'اربعة الاف وثلاثمئة ', '26/01/2022', '01/02/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(46, 8, 101, 177, 1, 1, 2, 1, '', '1', '3300', 'ثلاثة الاف وثلاثمئة ', '28/01/2023', '01/02/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(47, 8, 74, 201, 1, 1, 2, 2, '', '1', '10000', 'عشرة الاف ريال فقط لاغير', '30/1/2023', '01/02/2023', '28/01/2024', '', '1', '', '', '1', '2', '26', 'شيك', NULL, NULL),
(49, 8, 75, 202, 1, 1, 2, 2, '', '1', '10000', 'عشر الاف ريال ', '30/1/2023', '30/01/2023', '30/01/2024', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(51, 8, 82, 212, 1, 1, 2, 1, '', '1', '7500', 'سبعة الاف وخمسمئة ', '01/02/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(52, 8, 80, 208, 1, 1, 2, 1, '', '3', '11000', 'احدا عشر الاف ريال فقط ', '30/07/2020', '01/08/2020', '31/07/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(53, 8, 103, 122, 1, 1, 2, 2, '', '1', '9000', 'تسعة الاف ريال فقط ', '12/11/2022', '01/12/2022', '30/11/2023', '', '1', '', '', '1', '2', '38', 'شيك', NULL, NULL),
(54, 8, 9, 148, 1, 1, 2, 1, '', '1', '2500', 'الافان وخمسة مئة ', '01/01/2021', '01/01/2021', '13/03/2023', 'شهر اربعة  فارغ شهر خمسة  سماح ', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(55, 8, 9, 162, 1, 1, 2, 1, '', '1', '3000', 'ثلاثة الاف ريال ', '01/01/2021', '01/01/2021', '31/03/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(56, 8, 87, 220, 1, 1, 4, 1, '', '5', '8000', 'ثمن الاف ريال فقط ', '01/09/2020', '01/09/2020', '31/08/2025', 'تم دفع سنتين مقدم \r\nعللى راس كل سنة من العقد حتى 30 8 2022 من 1 9 2022 شيك كل اربع شهور ', '1', '', '', '1', '2', '39', 'شيك', NULL, NULL),
(57, 8, 5, 6, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف و سبعمئة ', '01/08/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(58, 8, 15, 29, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '01/08/2022', '01/10/2022', '30/09/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(59, 8, 5, 13, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ', '01/03/2023', '01/03/2023', '29/02/2024', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(61, 8, 104, 233, 1, 1, 2, 2, '', '1', '2000', 'الافان ريال ', '28/01/2023', '01/02/2023', '31/05/2024', 'استأجر مساحة إدارية خمسة عشرة متر مربع  ', '1', '01/02/2023', '4', '1', '2', '40', 'شيك', NULL, NULL),
(62, 8, 47, 99, 1, 1, 2, 1, '', '5', '5000', 'خمسة الاف ريال ', '20/11/2018', '01/11/2018', '01/11/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(64, 8, 70, 189, 1, 1, 2, 1, '', '2', '10000', 'عشر الاف ريال ', '24/12/2020', '01/01/2021', '30/04/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(65, 8, 73, 191, 1, 1, 2, 1, '', '2', '10000', 'عشرة الاف ريال ', '31/05/2021', '01/06/2021', '31/10/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(67, 8, 105, 161, 1, 1, 2, 3, '', '1', '3700', 'ثلاثة الاف وسبعة مئة ', '25/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(69, 8, 107, 327, 1, 1, 2, 3, '', '1', '1500', 'الف وخمس مئة ريال ', '18/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', '3', NULL, NULL),
(70, 8, 30, 179, 1, 1, 2, 1, '', '1', '4200', 'اربعة الاف ومئتين ', '18/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', '1', NULL, NULL),
(71, 8, 108, 323, 1, 1, 2, 3, '', '1', '1800', 'الف وثمئة ', '25/02/2023', '01/03/2023', '28/02/2024', '', '1', '', '', '1', '2', '1', '3', NULL, NULL),
(72, 8, 109, 324, 1, 1, 2, 3, '', '1', '1800', 'الف وثمنمئة ', '30/01/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '1', '2', '1', '3', NULL, NULL),
(73, 8, 19, 170, 1, 1, 1, 1, '', '1', '4100', 'اربعة الاف ومئة ريال ', '25/01/2022', '28/02/2023', '28/02/2024', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'شيك', NULL, NULL),
(76, 8, 110, 230, 1, 1, 2, 1, '', '3', '4000', 'اربعة الاف ريال فقط ', '25/02/2023', '01/03/2023', '01/01/2027', '', '1', '01/03/2023', '10', '1', '1', '1', '1', NULL, NULL),
(77, 8, 91, 231, 1, 1, 2, 1, '', '2', '5000', 'خمسة الاف ريال ', '28/08/2021', '01/09/2021', '31/08/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(78, 8, 85, 217, 1, 1, 2, 1, '', '2', '20000', 'عشرون الاف ريال ', '14/05/2021', '01/06/2021', '31/05/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(79, 8, 90, 234, 1, 1, 1, 2, '', '3', '20000', 'عشرون الاف ريال ', '15/01/2020', '15/04/2020', '14/04/2023', 'يتم تحويل القيمية الايجارية بداية كل سنة ميلادية في بداية العقد ', '1', '', '', '1', '2', '34', 'تحويل', NULL, NULL),
(80, 8, 2, 3, 1, 1, 2, 3, '', '3', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2020', '01/01/2020', '30/09/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(82, 8, 117, 6, 1, 1, 2, 1, '', '1', '5000', 'خمسة الاف ريال ', '01/06/2020', '01/06/2020', '31/05/2021', '', '1', '', '', '1', '2', '43', 'نقداً', '', ''),
(83, 8, 6, 7, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '03/03/2020', '01/03/2020', '28/02/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(84, 8, 7, 8, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '20/06/2021', '01/07/2021', '01/08/2022', '', '1', '01/07/2021', '1', '1', '2', '1', 'نقداً', '', ''),
(86, 8, 7, 8, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '04/06/2022', '01/08/2022', '31/07/2023', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(87, 8, 8, 9, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '31/01/2021', '01/02/2021', '31/01/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(88, 8, 8, 9, 1, 1, 2, 3, '', '1', '4800', 'اربعة الاف وثمانمائة ', '24/01/2022', '01/02/2022', '31/01/2023', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(89, 8, 2, 9, 1, 1, 2, 3, '', '4', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2020', '01/01/2020', '31/12/2024', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(90, 8, 5, 13, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '07/02/2021', '01/03/2021', '28/02/2022', '', '1', '01/03/2021', '1', '1', '2', '1', 'نقداً', '', ''),
(91, 8, 10, 15, 1, 1, 2, 3, '', '4', '5000', 'خمسة الاف ريال ', '29/12/2019', '01/01/2020', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(92, 8, 11, 16, 1, 1, 2, 3, '', '1', '5500', 'خمسة الاف وخمسمائة ', '28/10/2019', '01/11/2019', '31/10/2020', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(93, 8, 11, 16, 1, 1, 2, 3, '', '1', '4800', 'اربعة الاف وثمانمائة ', '31/10/2020', '01/11/2020', '31/10/2021', '', '1', '', '', '2', '2', '1', 'نقداً', NULL, NULL),
(94, 5, 11, 16, 1, 1, 2, 3, '', '2', '4700', 'اربعة الاف وسبعمئة ريال ', '31/10/2021', '01/11/2021', '29/11/2023', '', '1', '', '', '1', '2', '1', 'Cash', '', ''),
(96, 8, 97, 17, 1, 1, 3, 1, '', '11', '5500', 'خمسة الاف وخمسمائة ريال ', '12/08/2012', '12/08/2012', '11/08/2023', '', '1', '', '', '1', '2', '1', 'تحويل', NULL, NULL),
(97, 8, 12, 19, 1, 1, 2, 3, '', '1', '500', 'خمسة الاف  ', '16/01/2020', '01/02/2020', '31/01/2021', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(98, 8, 12, 19, 1, 1, 2, 3, '', '2', '4700', 'اربعة الاف وسبعمئة ريال ', '23/10/2021', '01/12/2021', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(99, 8, 8, 20, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '30/01/2021', '01/02/2021', '31/01/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(100, 8, 97, 23, 1, 1, 3, 1, '', '9', '6000', 'ستة الاف ريال ', '18/09/2012', '18/09/2012', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(101, 8, 13, 25, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '08/12/2020', '01/01/2021', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(102, 8, 13, 25, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '25/10/2021', '01/10/2021', '01/10/2022', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(104, 8, 14, 26, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '18/07/2020', '01/08/2020', '31/07/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(105, 8, 14, 26, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '21/08/2021', '01/08/2021', '31/07/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(106, 8, 14, 26, 4, 1, 2, 3, '1', '', '4500', 'اربعة الاف وخمسمائة ', '01/02/2022', '01/01/2022', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(107, 8, 2, 27, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '01/01/2020', '01/01/2020', '31/12/2020', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(108, 8, 2, 27, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '01/01/2021', '01/01/2021', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(109, 8, 2, 27, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(110, 8, 118, 28, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '01/05/2020', '01/05/2020', '30/04/2021', '', '1', '', '', '1', '2', '44', 'نقداً', '', ''),
(111, 8, 9, 28, 4, 1, 2, 3, '14', '', '4700', 'اربعة الاف وسبعمائة ريال ', '05/07/2021', '01/07/2021', '01/11/2022', '', '1', '01/07/2021', '2', '1', '2', '1', 'نقداً', '', ''),
(112, 8, 15, 29, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '01/11/2020', '01/11/2020', '30/11/2021', '', '1', '01/11/2020', '1', '2', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(113, 8, 15, 29, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمائة ريال ', '26/09/2021', '01/10/2021', '30/09/2022', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(115, 8, 63, 145, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ', '01/02/2021', '01/02/2021', '31/01/2022', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(116, 8, 63, 145, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ', '10/12/2022', '01/01/2023', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(117, 8, 62, 144, 1, 1, 2, 3, '', '1', '2800', 'الفان وثمانمئة ', '01/01/2020', '01/01/2020', '31/12/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(118, 5, 62, 144, 1, 1, 2, 3, '', '2', '2500', 'الفان وخمسمائة', '01/01/2022', '02/01/2021', '31/12/2023', '', '1', '', '', '1', '2', '1', 'Cash', '', ''),
(119, 8, 63, 145, 1, 1, 2, 3, '', '4', '2500', 'الفان وخمسمائة ', '01/01/2020', '01/01/2020', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(120, 8, 119, 146, 1, 1, 1, 3, '', '3', '2500', 'الفان وخمسمائة ', '01/11/2020', '01/11/2020', '31/10/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(121, 8, 65, 147, 1, 1, 2, 3, '', '3', '2500', 'الفان وخمسمائة ', '01/02/2021', '01/02/2021', '31/01/2024', 'تم دفع اربع شهور بشيك واحد ', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(122, 8, 66, 149, 1, 1, 2, 3, '', '4', '2500', 'الفان وخمسمائة ', '01/01/2020', '01/01/2020', '31/12/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(123, 8, 120, 148, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ', '01/01/2010', '01/01/2020', '30/03/2021', '', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(127, 8, 106, 322, 1, 1, 4, 1, '', '5', '15000', 'خمسة عشر الف ريال ', '16/01/2023', '01/01/2023', '31/12/2027', '', '1', '', '', '1', '2', '41', 'تحويل', NULL, NULL),
(128, 8, 122, 201, 1, 1, 2, 2, '', '2', '13000', 'ثلاثة عشر الاف رياال ', '13/09/2019', '15/09/2019', '31/10/2021', '', '1', '', '', '1', '2', '1', 'شيك', NULL, NULL),
(129, 8, 9, 216, 1, 1, 2, 3, '', '1', '10500', 'عشرة الاف وخمسمائة ', '28/03/2021', '01/04/2021', '31/03/2022', '', '1', '', '', '1', '2', '1', 'نقداً', '', ''),
(131, 8, 84, 215, 1, 1, 2, 2, '', '5', '12000', 'اثني عشر الف ريال ', '25/06/2022', '01/07/2022', '30/06/2027', '', '1', '', '', '1', '2', '24', 'شيك', NULL, NULL),
(132, 8, 76, 203, 1, 1, 2, 2, '', '1', '14000', 'اربعة عشر الف ريال ', '25/12/2019', '01/01/2020', '31/01/2021', '', '1', '', '', '1', '2', '27', 'نقداً', NULL, NULL),
(133, 8, 76, 203, 1, 1, 2, 2, '', '1', '13000', 'ثلاثة عشر الف ريال', '31/01/2021', '01/02/2021', '30/11/2021', '', '1', '', '', '1', '2', '27', 'نقداً', NULL, NULL),
(134, 8, 76, 203, 4, 1, 2, 2, '5', '', '11000', 'احدى عشر الف ريال ', '01/12/2021', '01/12/2021', '31/05/2022', '', '1', '', '', '1', '2', '27', 'نقداً', NULL, NULL),
(136, 8, 9, 216, 1, 1, 2, 3, '', '2', '10500', 'عشرة الاف وخمسمائة ', '01/04/2022', '01/04/2022', '31/03/2024', '', '1', '', '', '1', '1', '1', 'شيك', NULL, NULL),
(138, 8, 52, 455, 1, 1, 3, 1, '', '3', '13200', 'ثلاثة عشر الف ومئتان ريال ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(139, 8, 52, 226, 1, 1, 3, 1, '', '3', '8000', 'ثمن الاف ريال فقط ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '1', '1', 'تحويل', NULL, NULL),
(140, 8, 52, 192, 1, 1, 3, 1, '', '3', '11000', 'احدى عشر الف ريال ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '2', '1', 'تحويل', NULL, NULL),
(141, 8, 52, 190, 1, 1, 3, 1, '', '3', '11500', 'احدى عشر الف وخمسمائة ريال ', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '2', '1', 'تحويل', NULL, NULL),
(142, 8, 52, 456, 1, 1, 3, 1, '', '3', '13200', 'ثلاثة عشر الف ومئتان', '01/01/2020', '01/01/2020', '31/12/2022', '', '2', '', '', '1', '1', '1', 'تحويل', NULL, NULL),
(143, 8, 59, 123, 1, 1, 2, 2, '', '1', '9000', 'تسعة الاف ربال فقط ', '16/03/2023', '01/04/2023', '31/03/2024', '', '1', '', '', '1', '1', '32', 'شيك', NULL, NULL),
(144, 8, 125, 120, 1, 1, 2, 3, '', '1', '2500', 'الفان وخمسمائة ريال فقط  ', '19/03/2023', '01/04/2023', '31/03/2024', '', '1', '', '', '2', '2', '1', 'شيك', '', ''),
(145, 8, 126, 118, 1, 1, 2, 2, '', '1', '1000', 'الف ريال ', '19/03/2023', '01/03/2023', '29/02/2024', '', '1', '', '', '2', '1', '1', 'شيك', NULL, NULL),
(146, 8, 127, 96, 1, 1, 2, 3, '', '1', '3000', 'ثلاثة الاف ريال ', '01/03/2023', '01/03/2023', '29/02/2024', '', '1', '', '', '2', '2', '1', 'شيك', NULL, NULL),
(147, 8, 129, 121, 1, 1, 2, 3, '', '1', '4000', 'اربعة الاف ريال ', '20/03/2023', '01/04/2023', '01/08/2024', 'تم تحصيل الشهر الاول مقدما بموجب شيك ', '1', '01/04/2023', '4', '2', '1', '1', 'شيك', '', ''),
(149, 8, 129, 98, 1, 1, 2, 3, '', '1', '3000', 'ثلاثة الاف ريال ', '18/01/2023', '01/02/2023', '31/01/2024', '', '1', '', '', '2', '2', '1', 'شيك', NULL, NULL),
(150, 9, 52, 455, 1, 1, 4, 1, '', '1', '13200', 'ثلاثة عشر الف ومئتان ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '1', '1', 'تحويل', '', ''),
(151, 8, 82, 212, 1, 1, 5, 3, '', '1', '10000', 'عشر الاف ربال ', '28/02/2019', '01/03/2019', '29/02/2020', 'تم دفع الايجار مقدما', '1', '', '', '2', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(152, 9, 52, 226, 1, 1, 4, 1, '', '1', '8000', 'ثمن الاف ريال فقط ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(153, 9, 52, 456, 1, 1, 4, 1, '', '1', '13200', 'ثلاثة عشر الف ومئتان', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '1', 'إختر اسم الممثل ....', 'تحويل', '', ''),
(154, 9, 52, 192, 1, 1, 4, 1, '', '1', '11000', 'احدى عشر الف ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '2', '1', 'تحويل', '', ''),
(155, 9, 52, 190, 1, 1, 4, 1, '', '1', '11500', 'احدى عشر الف وخمسمائة ريال ', '01/01/2023', '01/01/2023', '01/01/2024', '', '1', '', '', '1', '2', '1', 'تحويل', '', ''),
(156, 8, 132, 28, 1, 1, 3, 3, '', '2', '4650', 'اربعة الاف وستمئة وخمسون', '01/01/2020', '01/01/2020', '31/12/2021', 'القيمية الايجارية تحول بدل اجور محامي', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(157, 8, 105, 5, 1, 1, 2, 3, '', '1', '4700', 'اربعة الاف وسبعمئة ريال ', '29/04/2023', '01/05/2023', '30/04/2024', '', '1', '', '', '1', '1', '1', 'شيك', NULL, NULL),
(158, 8, 100, 124, 1, 1, 2, 2, '', '2', '10000', 'عشرة الاف ريال ', '01/02/2020', '01/02/2020', '01/04/2022', 'فترة سماح شهرين تسعة وعشرة ', '1', '01/09/2021', '2', '2', '2', '33', 'نقداً', '', ''),
(159, 8, 100, 124, 1, 1, 2, 2, '', '1', '9000', 'تسعة الاف ريال ', '01/02/2022', '01/02/2022', '01/02/2023', '', '1', '', '', '2', '2', '33', 'شيك', NULL, NULL),
(160, 8, 4, 5, 1, 1, 2, 3, '', '1', '5000', 'خمسة الاف ريال ', '01/01/2020', '01/01/2020', '31/12/2020', 'تم تنزل الايجار الشهري ل اربعة الاف وسبعمئة  اخر شهرين ', '1', '', '', '1', '2', 'إختر اسم الممثل ....', 'نقداً', '', ''),
(161, 8, 4, 5, 1, 1, 2, 3, '', '2', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2021', '01/01/2021', '31/12/2022', '', '1', '', '', '1', '1', '1', 'نقداً', NULL, NULL),
(162, 8, 4, 5, 4, 1, 2, 3, '4', '', '4700', 'اربعة الاف وسبعمئة ريال ', '01/01/2023', '01/01/2023', '30/04/2023', '', '1', '', '', '1', '2', '1', 'نقداً', NULL, NULL),
(164, 5, 130, 126, 1, 1, 2, 1, '', '1', '3000', 'Three Thousands', '11/07/2023', '11/07/2023', '10/07/2024', '', '1', '', '', '1', '2', '...............', 'Cheques', '', ''),
(165, 5, 131, 311, 1, 1, 2, 3, '', '1', '3000', 'Three Thousands', '03/07/2023', '04/07/2023', '03/07/2024', '', '1', '', '', '1', '2', '...............', 'Cheques', '', ''),
(166, 5, 130, 471, 1, 1, 2, 3, '', '1', '2000', 'Two thousand ', '11/07/2023', '11/07/2023', '10/07/2024', '', '1', '', '', '2', '2', '1', 'Cheques', '', ''),
(167, 5, 3, 4, 1, 1, 2, 1, '', '1', '2000', 'Two Thao sand', '14/07/2023', '14/07/2023', '13/07/2024', '', '1', '', '', '1', '1', '1', 'Cheques', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contractor`
--

CREATE TABLE `contractor` (
  `Contractor_ID` int(11) NOT NULL,
  `Contractor_Ar_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Contractor_En_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Contractor_Company_Name` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Contractor_Company_Address` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Contractor_Phon` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contractor`
--

INSERT INTO `contractor` (`Contractor_ID`, `Contractor_Ar_Name`, `Contractor_En_Name`, `Contractor_Company_Name`, `Contractor_Company_Address`, `Contractor_Phon`) VALUES
(1, 'مقاول مؤقت', 'temp', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `contract_template`
--

CREATE TABLE `contract_template` (
  `Contract_template_Id` int(11) NOT NULL,
  `Contract_English_template` varchar(200) NOT NULL,
  `Contract_Arabic_template` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_template`
--

INSERT INTO `contract_template` (`Contract_template_Id`, `Contract_English_template`, `Contract_Arabic_template`) VALUES
(1, 'Single ', ' مفرد'),
(2, 'Inclusive', 'مجمل '),
(3, 'Multiple', 'متعدد');

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE `contract_type` (
  `Contract_Type_Id` int(11) NOT NULL,
  `Contract_English_Type` varchar(200) NOT NULL,
  `Contract_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contract_type`
--

INSERT INTO `contract_type` (`Contract_Type_Id`, `Contract_English_Type`, `Contract_Arabic_Type`) VALUES
(1, 'Yearly', 'سنوي'),
(4, 'Monthly', 'شهري');

-- --------------------------------------------------------

--
-- Table structure for table `delete_archive`
--

CREATE TABLE `delete_archive` (
  `Delete_Archive_ID` int(11) NOT NULL,
  `User_Id` varchar(200) DEFAULT NULL,
  `Delete_Date` varchar(200) DEFAULT NULL,
  `OS_B_U` varchar(200) DEFAULT NULL,
  `Item_Id` varchar(200) DEFAULT NULL,
  `Reason_Delete` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delete_archive`
--

INSERT INTO `delete_archive` (`Delete_Archive_ID`, `User_Id`, `Delete_Date`, `OS_B_U`, `Item_Id`, `Reason_Delete`) VALUES
(1, '8', '26/04/2023', 'C', '63', 'ادخال خطاء'),
(2, '8', '26/04/2023', 'C', '85', 'مكرر'),
(3, '8', '30/04/2023', 'BC', '59', 'مكرر'),
(4, '8', '30/04/2023', 'BC', '59', 'مكرر'),
(5, '8', '30/04/2023', 'BC', '59', 'مكرر'),
(6, '8', '01/05/2023', 'C', '148', 'تبديل مستأجر لم يتم اجرأت التعقد '),
(7, '8', '01/05/2023', 'BC', '67', 'مكرر'),
(8, '9', '02/05/2023', 'BC', '52', 'مكرر'),
(9, '9', '02/05/2023', 'C', '81', 'مكرر'),
(10, '5', '11/05/2023', 'C', '163', 'مجرد تجربة'),
(11, '5', '12/05/2023', 'OS', '53', 'تجربة'),
(12, '9', '13/05/2023', 'B', '83', 'مكرر'),
(13, '9', '13/05/2023', 'B', '96', 'مكرر'),
(14, '9', '13/05/2023', 'B', '80', 'مكرر'),
(15, '5', '03/07/2023', 'B', '102', 'XXXXXX');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Department_Id` int(11) NOT NULL,
  `Department_English_Name` varchar(200) NOT NULL,
  `Department_Arabic_Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Department_Id`, `Department_English_Name`, `Department_Arabic_Name`) VALUES
(1, 'Registration and coordination', 'قسم التسجيل والتنسيق'),
(3, 'Department of Financial Management and Accounts', 'قسم الادارة المالية والحسابات'),
(4, 'Technical Management Department', 'قسم الادارة الفنية'),
(5, 'Real Estate Management Department', 'قسم الادارة العقارية');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_Id` int(11) NOT NULL,
  `Employee_English_name` varchar(200) NOT NULL,
  `Employee_Arabic_name` varchar(200) NOT NULL,
  `Employee_Photo` varchar(200) NOT NULL,
  `Employee_Photo_Path` varchar(200) NOT NULL,
  `Employee_Mobile` varchar(200) NOT NULL,
  `Employee_Tell` varchar(200) DEFAULT NULL,
  `Employee_Designation` varchar(200) NOT NULL,
  `department_Department_Id` int(11) NOT NULL,
  `employee_level_Employee_Level_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_Id`, `Employee_English_name`, `Employee_Arabic_name`, `Employee_Photo`, `Employee_Photo_Path`, `Employee_Mobile`, `Employee_Tell`, `Employee_Designation`, `department_Department_Id`, `employee_level_Employee_Level_Id`) VALUES
(2, 'Saib alobedait ', 'صائب العبيدات ', 'Saeb.jpeg', '/English/Master_Panal/Employee_Photo/Saeb.jpeg', '50300588', '50300588', 'مسوول', 1, 2),
(4, 'Saadettin SABAH', 'سعد الدين صباح ', 'Saaed.jpeg', '/English/Master_Panal/Employee_Photo/Saaed.jpeg', '12365488', '12365488', 'شوون عملاء', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee_level`
--

CREATE TABLE `employee_level` (
  `Employee_Level_Id` int(11) NOT NULL,
  `Employee_English_Level` varchar(200) NOT NULL,
  `Employee_Arabic_Level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_level`
--

INSERT INTO `employee_level` (`Employee_Level_Id`, `Employee_English_Level`, `Employee_Arabic_Level`) VALUES
(1, 'Manager', 'المدير'),
(2, 'Administrator', 'المسوول'),
(3, 'Executive', 'التنفيذي'),
(4, 'Assistant', 'المساعد'),
(6, 'technician', 'فني'),
(7, 'Worker', 'عامل');

-- --------------------------------------------------------

--
-- Table structure for table `furniture_case`
--

CREATE TABLE `furniture_case` (
  `Furniture_case_Id` int(11) NOT NULL,
  `Furniture_Ar_case` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Furniture_En_case` varchar(200) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `furniture_case`
--

INSERT INTO `furniture_case` (`Furniture_case_Id`, `Furniture_Ar_case`, `Furniture_En_case`) VALUES
(1, 'غير محدد', 'undefined'),
(2, 'مفروش', 'complete furniture'),
(3, 'نصف مفروش', 'Half full furniture'),
(4, 'غير مفروش', 'without furniture');

-- --------------------------------------------------------

--
-- Table structure for table `gggggggg`
--

CREATE TABLE `gggggggg` (
  `zone_arabic_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Inventory_Id` int(11) NOT NULL,
  `employee_Employee_Id` int(11) NOT NULL,
  `Inventory_English_name` varchar(200) NOT NULL,
  `Inventory_arabic_name` varchar(200) NOT NULL,
  `Inventory_Location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Inventory_Id`, `employee_Employee_Id`, `Inventory_English_name`, `Inventory_arabic_name`, `Inventory_Location`) VALUES
(1, 2, 'Main', 'الرئيسي ', 'الدوحة');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `ID` int(11) NOT NULL,
  `EN` varchar(200) DEFAULT NULL,
  `AR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`ID`, `EN`, `AR`) VALUES
(1, 'DashBoard', 'لوحة المؤشرات'),
(2, 'Properties', 'الملكيات'),
(3, 'Buildings', 'الأبنية'),
(4, 'Units', 'الوحدات'),
(5, 'Properties Archive', 'أرشيف الملكيات'),
(6, 'Mortgaged Properties', 'الملكيات المرهونة عقارياً'),
(7, 'Contracting', 'التعاقد'),
(8, 'All Contracts', 'قائمة العقود'),
(9, 'Rental Disclosure', 'كشف المؤجرات'),
(10, 'Contract Archive', 'أرشيف العقود'),
(11, 'Customer Affairs', 'شؤون العملاء'),
(12, 'Tenants List', 'قائمة المستأجرين'),
(13, 'Tenants Disclosure', 'كشف المستأجرين'),
(14, 'Notices & Communications', 'الإشعارات و المراسلات'),
(15, 'Customer Evaluation', 'تقييم العملاء'),
(16, ' Asset Management', 'إدارة الاصول'),
(17, 'Requests List', 'قائمة الطلبات'),
(18, 'Periodic Maintenance', 'الصيانة الدورية'),
(19, '(Receipt / Delivery) Unit ', '( إستلام / تسليم ) وحدة'),
(20, '(Receipt / Delivery) Units List', 'قائمة ( إستلام / تسليم ) وحدة'),
(21, 'Building Periodic Control', 'الرقابة الدورية للبناء'),
(22, 'Buildings  Periodic Control List', 'قائمة الرقابة الدورية للبناء'),
(23, 'Collection', 'التحصيل'),
(24, 'Collection Disclosure', 'كشف التحصيل المالي'),
(25, 'Collection Process', 'عمليات التحصيل المالي'),
(26, 'Financial Statements', 'البيانات المالية'),
(27, 'Real Estate Investment', 'الإستثمار العقاري'),
(28, 'Marketing', 'التسويق'),
(29, 'Task Management', 'إدارة المهام'),
(30, 'Tasks List', 'قائمة المهام'),
(31, 'Add Task', 'إضافة مهمة'),
(32, 'Missing Fields', 'كشف النواقص'),
(33, 'Settings', 'إعدادات النظام'),
(34, 'Tenants Notification', 'إشعارات العملاء'),
(35, 'Notification', 'الإشعارات'),
(36, 'Add New Propertie', 'إضافة ملكية جديدة'),
(37, 'Zone', 'المنطقة'),
(38, 'Propertie Code', 'كود الملكية'),
(39, 'Owner', 'المالك'),
(40, 'BIN', 'الرقم المساحي'),
(41, 'Area', 'المساحة'),
(42, 'Bond No', 'رقم السند'),
(43, 'Building Count', 'عدد المباني'),
(44, 'Units Type', 'نوع الوحدات'),
(45, ' Propertie Name', 'اسم الملكية'),
(46, 'Propertie List', 'قائمة الملكيات'),
(47, ' Propertie Number', 'رقم الملكية'),
(48, 'Land Value', 'قيمة الأرض'),
(49, 'Street Number', 'رقم الشارع'),
(50, 'Street Name', 'اسم الشارع'),
(51, 'Bond Date', 'تاريخ السند'),
(52, 'Bond', 'سند الملكية'),
(53, 'Shema', 'المخطط'),
(54, 'Add Propertie', 'إضافة ملكية'),
(55, 'Back To Properties List', 'العودة لقائمة الملكيات'),
(56, 'Property Added Successfully', 'تمت إضافة الملكية بنجاح'),
(57, 'Only English', 'إنكليزية فقط'),
(58, 'Only Arabic', 'عربية فقط'),
(59, 'Only Numbers', 'أرقام فقط'),
(60, 'Building Name', 'اسم البناء'),
(61, 'Building Area', 'مساحة البناء'),
(62, 'Building Status', 'حالة البناء'),
(63, 'Building Type', 'نوع البناء'),
(64, 'Maintenance Status', 'وضع الصيانة'),
(65, 'Water Meter', 'عداد الماء'),
(66, 'Electric Meter', 'عداد الكهرباء'),
(67, 'Completion Date', 'تاريخ إتمام البناء'),
(68, 'Building Number', 'رقم البناء'),
(69, 'Building Photo', 'صورة المبنى'),
(70, 'Plan', 'المسقط الأفقي'),
(71, 'Statement', 'الإفادة'),
(72, 'Maps', 'الخرائط'),
(73, 'Building License', 'رخصة البناء'),
(74, 'Certificate Of Completion', 'شهادة الإتمام'),
(75, 'Entrance Photo', 'صورة المدخل'),
(76, 'Add Building', 'إضافة بناء'),
(77, 'Building Value', 'قيمة البناء'),
(78, 'building Added Successfully', 'تمت إضافة البناء بنجاح'),
(79, 'Back To Building List', 'العودة لقائمة الأبنية'),
(80, 'Unit Type', 'نوع الوحدة'),
(81, 'Rental Status', 'الحالة الإيجارية'),
(82, 'Unit Details', 'تفاصيل الوحدة'),
(83, 'Unit Area', 'مساحة الوحدة'),
(84, 'Current Situation', 'الوضع الحالي'),
(85, 'Virtual Value', 'القيمة الإفتراضية'),
(86, 'Ooredoo Number', 'رقم أوريدو'),
(87, 'Unit Number', 'رقم الوحدة'),
(88, 'Floor Number', 'رقم الطابق'),
(89, 'Add unit', 'إضافة وحدة'),
(90, 'Back To Units List', 'العودة لقائمة الوحدات'),
(91, 'Furniture Case', 'حالة الفرش'),
(92, 'Unit Added Successfully', 'تمت إضافة الوحدة بنجاح'),
(93, 'Edit Property ', 'تعديل الملكية '),
(94, 'Edit Building ', 'تعديل البناء '),
(95, 'Edit Unit ', 'تعديل الوحدة '),
(96, 'Reason For Deletion', 'سبب الحذف'),
(97, 'Statement Date', 'تاريخ الإفادة'),
(98, 'Statement ', 'الإفادة'),
(99, 'units Count', 'عدد الوحدات'),
(100, 'Edit Bulidng ', 'تعديل بناء '),
(101, 'Edit Unit ', 'تعديل الوحدة '),
(102, 'Mortgaged Properties', 'الملكيات المرهونة'),
(103, 'End Date of Mortgage', 'تاريخ التحرير'),
(104, 'Start Date', 'تاريخ البدء'),
(105, 'End Date', 'تاريخ الإنتهاء'),
(106, 'Installment Value', 'قيمة القسط'),
(107, 'Payment Cycle', 'دورة السداد'),
(108, 'Mortgage Value', 'قيمة الرهن'),
(109, 'Bank Name', 'اسم البنك'),
(110, 'Select Date', 'إختر التاريخ'),
(111, 'Remaining Amount', 'المبلغ المتبقي'),
(112, 'Amount Paid', 'المبلغ المسدد'),
(113, 'Remaining Installments', 'الأقساط المتبقية'),
(115, 'Remaining Installments', 'الأقساط المتبقية'),
(116, 'Add New Contract', 'إبرام عقد جديد');

-- --------------------------------------------------------

--
-- Table structure for table `languages_contract`
--

CREATE TABLE `languages_contract` (
  `ID` int(11) NOT NULL,
  `EN` varchar(200) DEFAULT NULL,
  `AR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages_contract`
--

INSERT INTO `languages_contract` (`ID`, `EN`, `AR`) VALUES
(1, 'Add New Contract', 'إبرام عقد جديد'),
(2, 'Contract Type', 'نموذج العقد'),
(3, 'Tenant Name', 'اسم المستأجر'),
(4, 'Representative Name ', 'اسم الممثل عن الشركة'),
(5, 'Property Name', 'اسم الملكية'),
(6, 'Building Name', 'اسم البناء'),
(7, 'Unit Number', 'رقم الوحدة'),
(8, 'The Purpose Of The Rent', 'الغرض من الإيجار'),
(9, 'Contract Time Unit', 'الوحدة الزمنية للتعاقد'),
(10, 'Signature Date', 'تاريخ توقيع العقد'),
(11, 'Start Date', 'تاريخ البدء'),
(12, 'End Date', 'تاريخ الإنتهاء'),
(13, 'Payments Type', 'نوع الدفعات'),
(14, 'Rental Amount In Numbers', 'مبلغ الإيجار بالأرقام'),
(15, 'Rrental Amount In Letters', 'مبلغ الإيجار بالأحرف'),
(16, 'Maintenance', 'الصيانة'),
(17, 'The Possibility Of Selling Or Renting', 'التنازل والبيع والايجار من الباطن'),
(18, 'Notes And Additional Items', 'ملاحظات و بنود إضافية'),
(19, 'Free Period', 'فترة سماح'),
(20, 'Free Period Duration', 'مدة فترة السماح'),
(21, 'Payment Method ', 'طريقة السداد'),
(22, 'Select Date', 'إختر التاريخ'),
(23, 'Cheque Number', 'رقم الشيك'),
(24, 'Cheque Date', 'تاريخ الشيك'),
(25, 'Cheque Value', 'قيمة الشيك'),
(26, 'Cheque Type', 'نوع الشيك'),
(27, 'Bank Name', 'اسم البنك'),
(28, 'Owner Name', 'اسم المالك'),
(29, 'Beneficiary Name', 'اسم المستفيد'),
(30, 'Transformation Number', 'رقم الحوالة'),
(31, 'Transformation Date', 'تاريخ الحوالة'),
(32, 'Transformation Value', 'قيمة الحوالة'),
(33, 'Cash Value', 'قيمة الدفعة'),
(34, 'Cash Date', 'تاريخ الدفعة'),
(35, 'Add Contract', 'إبرام عقد'),
(36, 'Back To Contracts List', 'العودة لقائمة العقود'),
(37, 'Unit Type', 'نوع الوحدة'),
(38, 'Unit No', 'رقم الوحدة'),
(39, 'Floor', 'الطابق'),
(40, 'Area', 'المساحة'),
(41, 'Status', 'الوضع'),
(42, 'Ooredoo No', 'رقم أوريدو'),
(43, 'Electricity No ', 'رقم الكهرباء'),
(44, 'Water No', 'رقم الماء'),
(45, 'Renewal Of The Tenant Contract :', 'تجديد عقد المستأجر  :'),
(46, 'Edit Contract', 'تعديل عقد'),
(47, 'Contracts List', 'قائمة العقود'),
(48, 'All Contracts', 'كافة العقود'),
(49, 'New Contracts', 'عقود جديدة'),
(50, 'Expired Contracts', 'عقود منتهية'),
(51, 'Contracts Expiring', 'عقود قيد الإنتهاء'),
(52, 'Single Contracts', 'العقود المفردة'),
(53, 'Multiple Contracts', 'العقود المجملة'),
(54, 'Contract No', 'رقم العقد'),
(55, 'Zone', 'المنطقة'),
(56, 'Property Code', 'رمز الملكية'),
(57, 'Nationality', 'الجنسية'),
(58, 'Years Number ', 'عدد السنوات'),
(59, 'Rental Amount', 'مبلغ الإيجار'),
(60, 'Details', 'تفاصيل '),
(61, 'Phone', 'هاتف'),
(62, 'P.O Box', 'ص.ب'),
(63, 'Contract Duration', 'مدة العقد'),
(64, 'Amount ', 'مبلغ الإيجار'),
(65, 'Notes', 'ملاحظات'),
(66, 'User Name', 'اسم المستخدم'),
(67, 'Delete Date', 'تاريخ الحذف'),
(68, 'Property Code', 'رمز الملكية'),
(69, 'Building Number', 'رقم البناء'),
(70, 'Unit Details', 'تفاصيل الوحدة'),
(71, 'Collection Disclosure', 'كشف التحصيل'),
(72, 'Cheque', 'الشيكات'),
(73, 'Transformation', 'الحولات'),
(74, 'Cash', 'الدفعات النقدية'),
(75, 'All', 'الكل'),
(76, 'All / Collected / Uncollected', 'الكل / تم تحصيله / غير محصل'),
(77, 'All / Single / Multiple', 'الكل / مفردة / متعددة'),
(78, 'All / Today\'s Date', 'الكل / تاريخ اليوم'),
(79, 'Satuts', 'الحالة'),
(80, 'Collection Date', 'تاريخ التحصيل'),
(81, 'Account Number', 'رقم الحساب'),
(82, 'Swift Code', 'سويفت كود'),
(83, 'Collection Type', 'نوع التحصيل'),
(84, 'Submit', 'تأكيد'),
(85, 'Back', 'رجوع');

-- --------------------------------------------------------

--
-- Table structure for table `languages_expensess`
--

CREATE TABLE `languages_expensess` (
  `ID` int(11) NOT NULL,
  `EN` varchar(200) DEFAULT NULL,
  `AR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages_expensess`
--

INSERT INTO `languages_expensess` (`ID`, `EN`, `AR`) VALUES
(1, 'Management  , Real Estate And Maintenance Expenses', 'المصاريف الإدارية و العقارية و مصاريف الصيانة'),
(2, 'Expenses At The Level Of (Property / Building / Unit / Management Expenses)', 'المصاريف على مستوى ( ملكية / بناء / وحدة / مصاريف إدارية)'),
(3, 'Month', 'الشهر'),
(4, 'Year', 'السنة'),
(5, 'Property Name', 'اسم الملكية'),
(6, 'Building Name', 'اسم البناء'),
(7, 'Unit No', 'رقم الوحدة'),
(8, 'Management  Expenses', 'المصاريف الإدارية'),
(9, 'Real estate Expenses', 'المصاريف العقارية'),
(10, 'Maintenance Expenses', 'مصاريف الصيانة'),
(11, 'Only Numbers', 'أرقام فقط'),
(12, '* Required', '* مطلوب'),
(13, 'Save', 'حفظ'),
(14, 'Adding a New Real Estate Investment', 'إضافة إستثمار عقاري جديد'),
(15, 'Property Or Building', 'ملكية أو بناء'),
(16, 'Investment Value', 'قيمة الإستثمار'),
(17, 'Investment Name', 'اسم الإستثمار'),
(18, 'Adding the company\'s services to the public website', 'إضافة خدمات الشركة إلى الموقع العام'),
(19, 'Service Name (AR)', 'اسم الخدمة بالعربية'),
(20, 'Service Name (EN)', 'اسم الخدمة باللإنكليزية'),
(21, 'Service Description (AR)', 'وصف الخدمة بالعربية'),
(22, 'Service Description (EN)', 'وصف الخدمة باللإنكليزية'),
(23, 'Image', 'الصورة'),
(24, 'Add basic information to the general website', 'إضافة المعلومات الأساسية إلى الموقع العام'),
(25, 'Who We Are (AR)', 'من نحن (بالعربية)'),
(26, 'Who We Are (EN)', 'من نحن (بالإنكليزية)'),
(27, 'Mobile / Telephone Number', 'رقم الجوال / الهاتف'),
(28, 'Address (AR)', 'العنوان (بالعربية)'),
(29, 'Address (EN)', 'العنوان (بالإنكليزية)'),
(30, 'Email', 'البريد الإلكتروني'),
(31, 'FaceBook Link', 'رابط الفيس بوك'),
(32, 'Whatssapp', 'وتس أب'),
(33, 'Domain Information', 'معلومات الدومين'),
(34, 'Choose the units that will be displayed in the public website', 'إختيار الواحدات التي ستعرض في الموقع العام '),
(35, 'Submit', 'تأكيد');

-- --------------------------------------------------------

--
-- Table structure for table `languages_maintenance`
--

CREATE TABLE `languages_maintenance` (
  `ID` int(11) NOT NULL,
  `EN` varchar(200) DEFAULT NULL,
  `AR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages_maintenance`
--

INSERT INTO `languages_maintenance` (`ID`, `EN`, `AR`) VALUES
(1, 'Add Request', 'إضافة طلب'),
(2, 'Request Added Successfully', 'تمت إضافة الطلب بنجاح'),
(3, 'Request Source', 'مصدر الطلب'),
(4, 'Tenant Name', 'اسم المستأجر'),
(5, 'Source Name', 'اسم المصدر'),
(6, 'Building Or Unit', 'بناء أو وحدة'),
(7, 'Request Classification', 'تصنيف الطلب'),
(8, 'Building Name', 'اسم البناء'),
(9, 'Unit Number', 'رقم الوحدة'),
(10, 'Request  Type', 'نوع الطلب'),
(11, 'Request  Direction', 'توجيه الطلب'),
(12, 'Request  Text', 'نص الطلب'),
(13, 'Request Description', 'وصف تقرير الفحص'),
(14, 'The Extent Of Urgency', 'مدى العاجلية'),
(15, 'How Dangerous', 'درجة الخطورة'),
(16, 'Request Date', 'تاريخ تقديم الطلب'),
(17, 'Image Before', 'صورة قبل'),
(18, 'Image After', 'صورة بعد'),
(19, 'Completion Status', 'حالة الإنجاز'),
(20, 'Preventive Action', 'الإجراء الوقائي'),
(21, 'Add Maintenance  Request', 'إضافة طلب صيانة'),
(22, 'Maintenance  Request Status', 'حالة طلب الصيانة'),
(23, 'Maintenance type', 'نوع الصيانة'),
(24, 'Maintenance SubType', 'النوع الفرعي للصيانة'),
(25, 'The Asset', 'الأصل'),
(26, 'Cost On', 'التكلفة على'),
(27, 'Executing Agency', 'الجهة المنفذة'),
(28, 'Technical', 'الفني المسؤول'),
(29, 'Observer', 'المراقب'),
(30, 'Start Date', 'تاريخ البدء'),
(31, 'End Date', 'تاريخ الإنتهاء'),
(32, 'Cost', 'التكلفة'),
(33, 'back To Request  Lists', 'العودة لقائمة الطلبات'),
(34, 'Select Date', 'إختر التاريخ'),
(35, 'Priority', 'الأولوية'),
(36, 'Procedures', 'الإجراءات'),
(37, 'Edit  Request', 'تعديل طلب'),
(38, 'Requests List', 'قائمة الطلبات'),
(39, 'All Requests', 'كافة الطلبات'),
(40, 'First Level Priority', 'أولوية من الدرجة الأولى'),
(41, 'Second Level Priority', 'أولوية من الدرجة  الثانية'),
(42, 'Third Level Priority', 'أولوية من الدرجة الثالثة'),
(43, 'Search By Status', 'البحث حسب الحالة'),
(44, 'Number', 'رقم'),
(45, 'Employee Name', 'اسم الموظف'),
(46, 'Address', 'العنوان'),
(47, 'Customer Affairs Department', 'قسم خدمة شؤون العملاء'),
(48, 'Al-Manara Company for Maintenance and Trade', 'شركة المنارة للصيانة و التجارة'),
(49, 'Requests, communications and complaints', 'الطلبات البلاغات و الشكاوي'),
(50, 'Asset And Facilities Management', 'إدارة الأصول و المرافق'),
(51, 'Maintenance Request', 'طلب صيانة'),
(52, 'Warrenty', 'الضمان'),
(53, 'Warranty Direction', 'جهة الضمان'),
(54, 'Cost Direction', 'جهة التكلفة'),
(55, 'Asset Type', 'نوع الأصل'),
(56, 'Asset Name', 'اسم الاصل'),
(57, 'Serial Number', 'الرقم التسلسلي'),
(58, 'Asset Status', 'حالة الأصل'),
(59, 'Asset Site', 'موقع الأصل'),
(60, 'Asset Location', 'مكان الاصل'),
(61, 'Purchase Date', 'تاريخ الشراء'),
(62, 'Last Maintenence Date', 'تاريخ أخر صيانة دورية'),
(63, 'Supplier', 'المورد'),
(64, 'Employee Name', 'اسم الموظف'),
(65, 'Date', 'التاريخ'),
(66, 'Note', 'ملاحظات'),
(67, 'Add', 'إضافة'),
(68, 'Select Date', 'إختر التاريخ'),
(69, 'Periodic Maintenance', 'الصيانة الدورية'),
(70, 'Inventory', 'قائمة الجرد'),
(71, 'Condition', 'الحالة'),
(72, 'Note', 'ملاحظات'),
(73, 'Keys', 'المفاتيح'),
(74, 'Furniture', 'الأثاث'),
(75, 'Household Appliance', 'الأجهزة المنزلية'),
(76, 'Kitchen', 'المطبخ'),
(77, 'Electrical Outlet', 'المنافذ الكهربائية'),
(78, 'Flooring', 'الأرضيات'),
(79, 'Bathrooms/Laundry Room', 'الحمامات / غرفة الغسيل'),
(80, 'Walls And Ceilings', 'الجدران والأسقف'),
(81, 'Doors', 'الأبواب'),
(82, 'Windows', 'النوافذ'),
(83, 'AC', 'المكيفات'),
(84, 'Property Name', 'اسم الملكية'),
(85, 'Action', 'العملية'),
(86, 'Receipt /  Delivery  Apartment', 'إستلام و تسليم شقة'),
(87, 'Intact', 'سليم'),
(88, 'Damaged', 'متضرر'),
(89, 'Information  From The Site', 'معلومات من الموقع'),
(90, 'Utility', 'المرافق'),
(91, 'Cleanliness', 'نظافة'),
(92, 'Protection', 'حماية'),
(93, 'Maintenance', 'صيانة'),
(94, 'Violations', 'مخالفات'),
(95, 'Parking', 'مواقف'),
(96, 'Entrances', 'مداخل'),
(97, 'Stairs', 'الدرج'),
(98, 'Surface', 'السطح'),
(99, 'The Basement', 'القبو'),
(100, 'Generator Room', 'غرفة المولد'),
(101, 'Electricity Room', 'غرفة الكهرباء'),
(102, 'Civil Defense Room', 'غرفة الدفاع المدني'),
(103, 'Garbage Dump', 'مكب القمامة'),
(104, 'Elevators', 'المصاعد'),
(105, 'Arcade', 'الممرات'),
(106, 'General Appliances / General Furniture', 'أجهزة عامة / أثاث عام'),
(107, 'Last Maintenance Date', 'تاريخ أخر صيانة '),
(108, 'Last Cleaning Date', 'تاريخ أخر نظافة'),
(109, 'Type', 'النوع'),
(110, 'Periodically', 'دورية'),
(111, 'Non-Periodic', 'حادثة'),
(112, 'Building  periodic control form', 'نموذج الرقابة الدورية للعقار');

-- --------------------------------------------------------

--
-- Table structure for table `languages_master`
--

CREATE TABLE `languages_master` (
  `ID` int(11) NOT NULL,
  `EN` varchar(200) DEFAULT NULL,
  `AR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages_master`
--

INSERT INTO `languages_master` (`ID`, `EN`, `AR`) VALUES
(1, 'Master Panal', 'اللوحة الرئيسية'),
(2, 'owners', 'الملاك'),
(3, 'Zones', 'المناطق'),
(4, 'Buildings Items', 'عناصر الأبنية'),
(5, 'Buildings Type', 'نوع البناء'),
(6, 'Buildings Conditions', 'حالة البناء'),
(7, 'Units Items', 'عناصر الوحدات'),
(8, 'Units Types', 'نوع الوحدة'),
(9, 'Units Details', 'تفاصيل الوحدة'),
(10, 'Units Conditions', 'حالة الوحدة'),
(11, 'Tenants Items', 'عناصر المستأجرين'),
(12, 'Tenants Type', 'أنواع المستأجرين'),
(13, 'Companies Representatives', 'ممثلو الشركات'),
(14, 'Tenants Evaluation Main Types', 'الأنواع الرئيسية لتقييم العملاء'),
(15, 'Tenants Evaluation Subtypes', 'الأنواع الفرعية لتقيم العملاء'),
(16, 'Contracts Items', 'عناصر العقود'),
(17, 'Contracts Type', 'نوع العقد '),
(18, 'Contracts Templetes', 'نموذج العقد'),
(19, 'Payment types', 'نوعه الدفعات'),
(20, 'Payment Method', 'نوع الدفع'),
(21, 'Maintenance Items', 'عناصر الصيانة '),
(22, 'Maintenance Main Types', 'الأنواع الرئيسية للصيانة'),
(23, 'Maintenance Subtypes', 'الأنواع الفرعية للصيانة'),
(24, 'Request  Sources', 'مصادر الطلبات'),
(25, 'Inventory And Stores', 'الجرد و المخازن'),
(26, 'Assets', 'الاصول'),
(27, 'Assets Type', 'أنواع الأصول'),
(28, 'Assets Conditions', 'حالات الاصول'),
(29, 'Assets Locations', 'أماكن الاصول'),
(30, 'Inventory', 'المخزون'),
(31, 'Contractors', 'المقاولين'),
(32, 'Cheques Items', 'عناصر الشيكات'),
(33, 'Banks', 'المصارف'),
(34, 'Transformations Banks', 'مصارف الحوالات'),
(35, 'Lists Items', 'عناصر القوائم'),
(36, 'Employees', 'الموظفين'),
(37, 'Users Accounts', 'حسابات المستخدمين'),
(38, 'Roles', 'الصلاحيات'),
(39, 'Departments', 'الأقسام'),
(40, 'Employees Levels', 'درجو الموظف'),
(41, 'Task type', 'أنواع المهام'),
(42, 'Amlak Application', 'تطبيق أملاك'),
(43, 'Cheques Type', 'أنواع الشيكات'),
(44, 'Lists Types', 'أنواع القوائم'),
(45, 'Add New Owner', 'إضافة مالك جديد'),
(46, 'Owner Name (EN)', 'اسم المالك (بالإنكليزية)'),
(47, 'Owner Name (AR)', 'اسم المالك (بالعربية)'),
(48, 'Tell', 'هاتف'),
(49, 'Notes', 'ملاحظات'),
(50, 'Monthly Salary', 'الراتب الشهري'),
(51, 'Mobile', 'موبايل'),
(52, 'Email', 'البريد الإلكتروني'),
(53, 'Website', 'موقع الويب'),
(54, 'Q ID', ' البطاقة الشخصية'),
(55, 'Add', 'إضافة'),
(56, 'Back To owners List', 'العودة لقائمة المُلاك'),
(57, 'Edit owner :', 'تعديل المالك :'),
(58, 'Save Changes', 'حفظ التغيرات'),
(59, 'Add New Zone', 'إضافة منطقة جديدة'),
(60, 'Zone Name (EN)', 'اسم المنطقة (بالإنكليزية)'),
(61, 'Zone Name (AR)', 'اسم المنطقة (بالعربية)'),
(62, 'Zone Number', 'رقم المنطقة'),
(63, 'Back To Zones List', 'العودة لقائمة المناطق'),
(64, 'Edit Zone :', 'تعديل المنطقة :'),
(65, 'Add New Building Type', 'إضافة نوع بناء جديد'),
(66, 'Building Type (EN)', 'نوع البناء (بالإنكليزية)'),
(67, 'Building Type (AR)', 'نوع البناء بالعربية'),
(68, 'Bacl To Builiding Types Lsit', 'العودة لقائمة أنواع الابنية'),
(69, 'Edit Building Type :', 'تعديل نوع بناء :'),
(70, 'Add New Building Condition', 'إضافة حالة بناء جديدة'),
(71, 'Building Condition (EN)', 'حالة البناء (بالإنكليزية)'),
(72, 'Building Condition(AR)', 'حالة البناء (بالعربية)'),
(73, 'Bakl To Builiding Conditions Lsit', 'العودة لقائمة حالات الأبنية'),
(74, 'Edit Building Condition:', 'تعديل حالة بناء :'),
(75, 'Add New Unit Type', 'إضافة نوع وحدة جديدة'),
(76, 'Unit Type (EN)', 'نوع الوحدة (بالإنكليزية)'),
(77, 'Unit type (AR)', 'نوع الوحدة (بالعربية)'),
(78, 'Back To Unit Types List', 'العودة لقائمة أنواع الوحدات'),
(79, 'Edit Unit Type :', 'نعديل نوع وحدة :'),
(80, 'Add New Unit Details', 'إضافة تفاصيل وحدة جديدة'),
(81, 'Unit Details (EN)', 'تفاصيل الوحدة (بالإنكليزية)'),
(82, 'Unit Details (AR)', 'تفاصيل الوحدة (بالعربية)'),
(83, 'Back To Unit Details List', 'العودة لقائمة تفاصيل الوحدات'),
(84, 'Edit Unit Details :', 'تعديل تفاصيل الوحدة :'),
(85, 'Add New Unit Condition', 'إضافة حالة وحدة جديدة'),
(86, ' Unit Condition(EN)', 'حالة الوحدة (بالإنكليزية)'),
(87, ' Unit Condition (AR)', 'حالة الوحدة (بالعربية)'),
(88, 'Back To  Unit Conditions List', 'العودة لقائمة حالات الوحدات'),
(89, 'Edit  Unit Condition', 'تعديل حالة وحدة :'),
(90, 'Add New Tenant Type', 'إضافة نوع مستأجر جديد'),
(91, 'Tenant Type (EN)', 'نوع المستأجر (بالإنكليزية)'),
(92, 'Tenant Type(AR)', 'نوع المستأجر (بالعربية)'),
(93, 'Back To Tenant Types List', 'العودة لقائمة أنواع المستأجرين'),
(94, 'Edit Tenant Type :', 'تعديل نوع المستأجر :'),
(95, 'Name (EN)', 'الاسم (بالإنكليزية)'),
(96, 'Name (AR)', 'الاسم (بالعربية)'),
(97, 'Nationality', 'الجنسية'),
(98, 'The Company', 'الشركة '),
(99, 'Q ID No', 'رقم البطاقة الشخصية'),
(100, 'Back To company representatives List', 'العودة لقائمة ممثلي الشركات'),
(101, 'Add New Company Representative', 'إضافة ممثل شركة جديد'),
(102, 'Edit Company Representative :', 'تعديل الممثل :'),
(103, 'Add New Main Type', 'إضافة نوع رئيسي جديد'),
(104, 'Type Name (EN)', 'اسم النوع (بالإنكليزية)'),
(105, 'Type Name (AR)', 'اسم النوع (بالعربية)'),
(106, 'Type', 'النوع'),
(107, 'Back To Main Types List', 'العودة لقائمة الأنواع الرئيسية'),
(108, 'Main Type', 'النوع الرئيسي'),
(109, 'Add new SubType', 'إضافة نوع فرعي جديد'),
(110, 'The weight', 'الوزن'),
(111, 'Percentage', 'النسبة المؤية'),
(112, 'Back To SubTypes List', 'العودة لقائمة الأنواع الفرعية'),
(113, 'Edit SubType :', 'تعديل النوع الفرعي :'),
(114, 'Add new Contract Type', 'إضافة نوع عقد جديد'),
(115, 'Contract Type(EN)', 'نوع العقد (بالإنكليزية)'),
(116, 'Contract Type (AR)', 'نوع العقد (بالعربية)'),
(117, 'Back To Contract Types List', 'العودة لقائمة أنواع العقود'),
(118, 'Edit Contract Type :', 'تعديل نوع عقد :'),
(119, 'Add new Contract Template', 'إضافة نموذج عقد جديد'),
(120, 'Contract Template(EN)', 'نموذج العقد (بالإنكليزية)'),
(121, 'Contract Template(AR)', 'نموذج العقد (بالعربية)'),
(122, 'Back To Contract Templates List', 'العودة لقائمة نماذج العقود'),
(123, 'Edit Contract Template:', 'تعديل نموذج عقد :'),
(124, 'Add new Payment Type', 'إضافة نوع دفع جديد'),
(125, 'Contract Payment (EN)', 'نوع الدفع( بالإنكليزية)'),
(126, 'Contract Payment (AR)', 'نوع الدفع( (بالعربية)'),
(127, 'Back To Payment Types List', 'العودة لقائمة أنواع الدفعات'),
(128, 'Edit Payment Type :', 'تعديل نوع الدفع:'),
(129, 'Add Maintenance Main type ', 'إضافة نوع رئيسي للصيانة'),
(130, 'Maintenance Type (EN)', 'نوع الصيانة (بالإنكليزية)'),
(131, 'Maintenance Type (AR)', 'نوع الصيانة (بالعربية)'),
(132, 'Back To Maintenance Main types List', 'العودة لقائمة الأنواع الرئيسية للصيانة'),
(133, 'Edit Maintenance Main type :', 'تعديل نوع رئيسي للصيانة :'),
(134, 'Maintenance Main Type', 'نوع الصيانة  الرئيسي'),
(135, 'Add Maintenance Sub Type ', 'إضافة نوع فرعي للصيانة'),
(136, 'Back To Maintenance Sub types List', 'العودة لقائمة الأنواع الفرعية للصيانة'),
(137, 'Edit Maintenance Sub type :', 'تعديل نوع فرعي للصيانة :'),
(138, 'Add New Requst Source', 'إضافة مصدر طلبات جديد '),
(139, 'Requst Source(EN)', 'مصدر الطلب (بالإنكليزية)'),
(140, 'Requst Source (AR)', 'مصدر الطلب (بالعربية)'),
(141, 'Back To Requst Sources List', 'العودة لقائمة مصادر الطلبات'),
(142, 'Edit Requst Source :', 'تعديل مصدر الطلب :'),
(143, 'Property / building / unit / store', 'ملكية / بناء / وحدة / مخزن'),
(144, 'Store Name', 'اسم المخزن'),
(145, 'Asset Main Type', 'النوع الرئيسي للأصل'),
(146, 'Asset Sub Type', 'النوع الفرعي للأصل'),
(147, 'Add New Asset', 'إضافة أصل جديد'),
(148, 'Asset Condition', 'حالة الأصل'),
(149, 'Property Name', 'اسم الملكية'),
(150, 'Building Name', 'اسم البناء'),
(151, 'Unit Number', 'رقم الوحدة'),
(152, 'Method Of Ownership', 'طريقة التملك'),
(153, 'Contractor', 'المقاول'),
(154, 'Purchasing Officer', 'مسؤول الشراء'),
(155, 'Supplier', 'موّرد '),
(156, 'Contractor Warranty Period', 'فترة ضمان المقاول'),
(157, 'Asset Name (EN)', 'اسم الاصل (بالإنكليزية)'),
(158, 'Asset Name (AR)', 'اسم الأصل (بالعربية)'),
(159, 'Serial Number', 'الرقم التسلسلي'),
(160, 'Purchase Date', 'تاريخ الشراء'),
(161, 'Select Date', 'إختر التاريخ'),
(162, 'Asset Value', 'قيمة الأصل'),
(163, 'Asset Description', 'وصف الأصل'),
(164, 'Add Warranty', 'إضافة ضمان'),
(165, 'Warranty Period', 'مدة الضمان'),
(166, 'Warranty Sart Date', 'تاريخ بدء الضمان'),
(167, 'Warranty End Date', 'تاريخ إنتهاءالضمان'),
(168, 'Warranty Attachments', 'صورة شهادة الضمان'),
(169, 'Back To Assets List', 'العودة لقائمة الأصلول'),
(170, 'Asset Location', 'مكان الأصل'),
(171, 'Edit Asset :', 'تعديل الأصل :'),
(172, 'Add New Asset type', 'إضافة نوع اصل جديد'),
(173, 'Asset Type (EN)', 'نوع الأصل (بالإنكليزية)'),
(174, 'Asset Type (AR)', 'نوع الأصل (بالعربية)'),
(175, 'Back To Asset Types List', 'العودة لقائمة أنواع الأصول'),
(176, 'Edit Asset Type :', 'تعديل نوع أصل :'),
(177, 'Add New Asset Condition ', 'إضافة حالة أصل جديد'),
(178, 'Asset Condition (EN)', 'حالة الأصل (بالإنكليزية)'),
(179, 'Asset Condition (AR)', 'حالة الأصل (بالعربية)'),
(180, 'Back To Asset Conditions List', 'العودة لقائمة حالات الأصول'),
(181, 'Edit Asset Condition :', 'تعديل حالة أصل :'),
(182, 'Add New Asset Location', 'إضافة موقع اصل جديد'),
(183, 'Asset Location (EN)', 'موقع الأصل (بالإنكليزية)'),
(184, 'Asset Location (AR)', 'موقع الأصل (بالعربية)'),
(185, 'Back To Asset Locations List', 'العودة لقائمة مواقع الأصول'),
(186, 'Edit Asset Location :', 'تعديل موقع اصل :'),
(187, 'Add New Inventory', 'إضافة مخزن جديد'),
(188, ' Inventory Name (EN)', 'اسم المخزن(بالإنكليزية)'),
(189, ' Inventory Name (AR)', 'اسم المخزن (بالعربية)'),
(190, ' Inventory Location', 'مكان المخزن'),
(191, 'Warehouse clerk', 'أمين المخزن'),
(192, 'Back To Inventories List', 'العودة لقائمة المخازن'),
(193, 'Edit Inventory ', 'تعديل المخزن :'),
(194, 'Add New Contractor', 'إضافة مقاول جديد'),
(195, 'Contractor Name (EN)', 'اسم المقاول (بالإنكليزية)'),
(196, 'Contractor Name (AR)', 'اسم المقاول (بالعربية)'),
(197, 'Phone', 'الهاتف'),
(198, 'Company Name', 'اسم الشركة '),
(199, 'Company Adress', 'عنوان الشركة'),
(200, 'Bacl To Contractors List', 'العودة لقائمة المقاولين'),
(201, 'Edit Contractor :', 'تعديل المقاول :'),
(202, 'Add New Cheque Type', 'إضافة نوع شيك جديد'),
(203, 'Cheque Type (EN)', 'نوع الشيك(بالإنكليزية)'),
(204, 'Cheque Type (AR)', 'نوع الشيك (بالعربية)'),
(205, 'Back To Cheque Types List', 'العودة لقائمة أنواع الشيكات'),
(206, 'Edit Cheque Type :', 'تعديل نوع الشيك :'),
(207, 'Add New Bank', 'إضافة مصرف جديد'),
(208, 'Bank Name (EN)', 'اسم المصرف (بالإنكليزية)'),
(209, 'Bank Name (AR)', 'اسم المصرف (بالعربية)'),
(210, 'Back To Banks List', 'العودة لقائمة المصارف'),
(211, 'Edit Bank :', 'تعديل المصرف :'),
(212, 'Add New Transformations Bank', 'إضافة مصرف جديد للحوالات'),
(213, 'Back To Transformations Banks List', 'العودة لقائمة مصارف الحوالات'),
(214, 'Add New Employee ', 'إضافة موظف جديد'),
(215, 'Employee Name (EN)', 'اسم الموظف (بالإنكليزية)'),
(216, 'Employee Name (AR)', 'اسم الموظف (بالعربية)'),
(217, 'Employee Designation', 'تعيين الموظف'),
(218, 'Department', 'القسم'),
(219, 'Level', 'الدرجة'),
(220, 'Employee Photo', 'صورة الموظف'),
(221, 'Back To Employee List', 'العودة لقائمة الموظفين'),
(222, 'Edit Employee :', 'تعديل الموظف :'),
(223, 'Add New User Account', 'إضافة حساب مستخدم جديد'),
(224, 'Employee', 'الموظف'),
(225, 'First Name', 'الاسم الأول'),
(226, 'Last name', 'الاسم الأخير'),
(227, 'User Name', 'اسم المستخدم'),
(228, 'Password', 'كلمة السر'),
(229, 'Password Confirmation', 'تأكيد كلمة السر'),
(230, 'Roles', 'الصلاحية'),
(231, 'Back To User Accounts  List', 'العودة لقائمة حسابات المستخدمين'),
(232, 'Edit User Account', 'تعديل حساب مستخدم'),
(233, 'Add New Role', 'إضافة صلاحية جديدة'),
(234, 'Role Name', 'اسم الصلاحية'),
(235, 'Module', 'القسم'),
(236, 'Read', 'عرض'),
(237, 'Add', 'إضافة'),
(238, 'Edit', 'تعديل '),
(239, 'Delete', 'حذف'),
(240, 'Properties', 'الملكيات'),
(241, 'Contracting', 'التعاقد'),
(242, 'Customer Affairs', 'شؤون العملاء'),
(243, ' Asset Management', 'إدارة الأصول'),
(244, 'Collection', 'التحصيل'),
(245, 'Financial Statements', 'البيانات المالية'),
(246, 'Marketing', 'التسويق'),
(247, 'Task Management', 'إدارة المهام'),
(248, 'Missing Fields', 'كشف النواقص'),
(249, 'Settings', 'إعدادات النظام'),
(250, 'Back To Roles List', 'العودة لقائمة الصلاحيات'),
(251, 'Edit Role', 'تعديل صلاحية'),
(252, 'Add New Department', 'إضافة قسم جديد'),
(253, 'Department Name (EN)', 'اسم القسم (بالإنكليزية)'),
(254, 'Department Name (AR)', 'اسم القسم (بالعربية)'),
(255, 'Back To Departments List', 'العودة لقائمة الأقسام'),
(256, 'Edit Department :', 'تعديل القسم :'),
(257, 'Add New Employee Level', 'إضافة مستوى موظف جديد'),
(258, 'Level Name (EN)', 'اسم المستوى (بالإنكليزية)'),
(259, 'Level Name (AR)', 'اسم المستوى (بالعربية)'),
(260, 'Back To Employee Levels List', 'العودة لقائمة مستويات الموظيفين'),
(261, 'Edit Employee Level :', 'تعديل المستوى :'),
(262, 'Owners List', 'قائمة المُلاّك'),
(263, 'Zones List ', 'قائمة المناطق'),
(264, 'building types List', 'قائمة أنواع الأبنية'),
(265, 'building Conditions List', 'قائمة حالات الأبنية'),
(266, 'unit types List', 'قائمة أنواع الوحدات'),
(267, 'unit Conditions List', 'قائمة حالات الوحدات'),
(268, 'unit Details List', 'قائمة تفاصيل الوحدات'),
(269, 'tenants types List', 'قائمة أنواع المستأجرين'),
(270, 'Company Representatives List', 'قائمة ممثلو الشركات'),
(271, 'Main Type Evaluation List', 'قائمة الأنواع الرئيسية لتقيم العملاء'),
(272, 'Sub Type Evaluation List', 'قائمة الأنواع الفرعية لتقيم العملاء'),
(273, 'Main Type', 'النوع الرئيسي'),
(274, 'Sub Type', 'النوع الفرعي'),
(275, 'Contract types list', 'قائمة أنواع العقود'),
(276, 'Contract Templates  list', 'قائمة نماذج العقود'),
(277, 'payment types list', 'قائمة أنواع الدفعات'),
(278, 'Maintenance Main Types List', 'قائمة الأنواع الرئيسية للصيانة'),
(279, 'Maintenance SubTypes List', 'قائمة الأنواع الفرعية للصيانة'),
(280, 'Request Source List', 'قائمة مصادر الطلبات'),
(281, 'Assets List', 'قائمة الأصول'),
(282, 'Asset Type', 'نوع الأصل'),
(283, 'Inventory, Stores And Assets Department', 'قسم الجرد و المخازن و الاصول'),
(284, 'Al Manara Maintenance and Trading Company', 'شركة المنارة للصيانة والتجارة'),
(285, 'Details Of The Asset With Serial Number', 'تفاصيل الأصل ذو الرقم التسلسلي '),
(286, 'Remaining Days', 'الأيام المتبقية'),
(287, 'Asset Main Site', 'الموقع العام للأصل'),
(288, 'Asset  Address In Detail', 'عنوان الأصل بالتفصيل'),
(289, 'The Warranty Period Of The Supplier', 'فترة ضمان المُوّرد'),
(290, 'Assets Types List', 'قائمة أنواع الأصول'),
(291, 'Asset Condition List', 'قائمة حالات الأوصل'),
(292, 'Asset Locations List', 'قائمة أماكن الأوصل'),
(293, 'Inventorys List', 'قائمة المخازن'),
(294, 'Contractors List', 'قائمة المقاولين'),
(295, 'Cheque Type List', 'قئامة أنواع الشيكات'),
(296, 'Banks List', 'قائمة المصارف'),
(297, 'Transformations Banks List', 'قائمة مصارف الحوالات'),
(298, 'Bank Name', 'اسم المصرف'),
(299, 'Account Number', 'رقم الحساب'),
(300, 'Swift Code', 'سويفت كود'),
(301, 'Address', 'العنوان'),
(302, 'Currency', 'العملة'),
(303, 'Beneficiary Name', 'اسم المستفيد'),
(304, 'Bank NO', 'رقم البنك'),
(305, 'Employee Name', 'اسم الموظف'),
(306, 'Employee List', 'قائمة الموظفين'),
(307, 'Users Accounts  List ', 'قائمة حسابات المستخدمين'),
(308, 'Roles List', 'قائمة الصلاحيات'),
(309, 'Departments List', 'قائمة الأقسام'),
(310, 'Employee Levels  List', 'قائمة مستويات الموظفين');

-- --------------------------------------------------------

--
-- Table structure for table `languages_task`
--

CREATE TABLE `languages_task` (
  `ID` int(11) NOT NULL,
  `EN` varchar(200) DEFAULT NULL,
  `AR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages_task`
--

INSERT INTO `languages_task` (`ID`, `EN`, `AR`) VALUES
(1, 'The task', 'المهمة'),
(2, 'Direct to ...', 'توجيه إلى ...'),
(3, 'Employee Name', 'اسم الموظف'),
(4, 'Task Description ', 'وصف المهمة'),
(5, 'Start Date', 'تاريخ البدء'),
(6, 'End Date', 'تاريخ الإنتهاء'),
(7, 'Select Date', 'إختر التاريخ'),
(8, 'Priority Level', 'مستوى الأولوية'),
(9, 'Add New task', 'إضافة مهمة'),
(10, 'Back To Tasks List', 'العودة لقائمة المهام'),
(11, 'Edit Task', 'تعديل المهمة'),
(12, 'Reason for deletion', 'سبب الحذف'),
(13, 'Tasks List', 'قائمة المهام'),
(14, 'Department', 'القسم'),
(15, 'Actual End Date', 'تاريخ الإنتهاء الفعلي'),
(16, 'Status', 'الحالة'),
(17, 'Report And Notes', 'التقرير و الملاحظات'),
(18, 'Edit', 'تعديل '),
(19, 'Update', 'تحديث'),
(20, 'Cancel', 'إلغاء'),
(21, 'Segmentation', 'تجزئة'),
(22, 'Task Parts', 'أجزاء المهمة'),
(23, 'Delete', 'حذف');

-- --------------------------------------------------------

--
-- Table structure for table `languages_tenant`
--

CREATE TABLE `languages_tenant` (
  `ID` int(11) NOT NULL,
  `EN` varchar(200) DEFAULT NULL,
  `AR` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages_tenant`
--

INSERT INTO `languages_tenant` (`ID`, `EN`, `AR`) VALUES
(1, 'Add New Tenant', 'إضافة مستأجر جديد'),
(2, 'Tenant Name ( EN )', 'إسم المستأجر بالإنكليزية'),
(3, 'Tenant Name ( AR )', 'اسم المستأجر بالعربية'),
(4, 'Tenant Type', 'نوع المستأجر'),
(5, 'P O Box', 'صندوق بريد'),
(6, 'Commercial Register', 'السجل التجاري'),
(7, 'Tenant Nationality ', 'جنسية المستأجر'),
(8, 'Address In The Country Of Origin', 'العنوان في البلد الأصل'),
(9, 'Copy Of  Commercial Register', 'صورة عن السجل التجاري'),
(10, 'Establishment registration number', 'رقم قيد المنشأة'),
(11, 'Copy Of Establishment registration', 'صورة عن قيد المنشأة'),
(12, 'Add  Representative Of the Company', 'إضافة ممثل عن الشركة'),
(13, 'Phone', 'هاتف'),
(14, 'Mobile', 'جوال'),
(15, 'Fax', 'فاكس'),
(16, 'E-mail', 'البريد الألكتروني'),
(17, 'Tenant Address', 'عنوان المستأجر'),
(18, 'Passport', 'جواز سفر'),
(19, 'ID Card', ' بطاقة شخصية'),
(20, 'ID Expiration Date', 'تاريخ إنتهاء البطاقة'),
(21, 'Back to the list of tenants', 'العودة إلى قائمة المستأجرين'),
(22, 'Select Date', 'إختر التاريخ'),
(23, 'Numbers Only', 'أرقام فقط'),
(24, 'Letters Only', 'أحرف فقط'),
(25, 'Invalid Email', 'بريد إلكتروني غير صالح'),
(26, 'Only Arabic', 'إنكليزي فقط'),
(27, 'only English', 'عربي فقط'),
(28, 'Edit Tenant :', 'تعديل المستأجر :'),
(29, 'Edit', 'تعديل'),
(30, 'Create An Account On AlManara Website', 'إنشاء حساب موقع المنارة'),
(31, 'User Name', 'اسم المستخدم'),
(32, 'Password', 'كلمة السر'),
(33, 'Show Password', 'إظهار كلمة السر'),
(34, 'Tenants List', 'قائمة المستأجرين'),
(35, 'Evaluation', 'التقييم'),
(36, 'tenant Name', 'اسم المستأجر'),
(37, 'Tenants Evaluation ', 'تقييم العملاء'),
(38, 'Evaluation Main Type', 'النوع الرئيسي للتقييم'),
(39, 'Evaluation Sub Type', 'النوع الفرعي للتقييم'),
(40, 'Status', 'الحالة'),
(41, 'Date', 'التاريخ'),
(42, 'Tenants Disclosure', '  كشف المستأجرين'),
(43, 'Tenants Disclosure ( Singel Contract )', 'كشف مستأجرين العقود المفردة'),
(44, 'Tenants Disclosure ( Multi Contract )', 'كشف مستأجرين العقود المجملة'),
(45, 'Tenants Disclosure ( All Contract )', 'كشف مستاجرين الكل'),
(46, 'Communication With Tenants ( SMS )', 'التواصل مع العملاء SMS '),
(47, 'Correspondence And Attachments', 'المراسلات و المرفقات'),
(48, 'Choose Who You Want To Send', 'إختر  لمن تريد أن ترسل'),
(49, 'All Tenants   / Tenant Iin a Specific / Tenant In Specific Building', 'كافة العملاء / عملاء في بناء محدد / عميل محدد'),
(50, 'Building Name', 'اسم البناء'),
(51, 'SMS Text', 'نص الرسالة'),
(52, 'Upload Attachment', 'تحميل مرفق'),
(53, 'Description', 'شرح'),
(54, 'Type', 'النوع'),
(55, 'Send', 'إرسال'),
(56, 'Submit', 'تأكيد'),
(57, 'Attachments', 'مرفقات'),
(58, 'The name of the representative of the company', 'اسم الممثل عن الشركة');

-- --------------------------------------------------------

--
-- Table structure for table `listing_type`
--

CREATE TABLE `listing_type` (
  `Listing_Type_Id` int(11) NOT NULL,
  `Listing_English_Type` varchar(200) NOT NULL,
  `Listing_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `listing_type`
--

INSERT INTO `listing_type` (`Listing_Type_Id`, `Listing_English_Type`, `Listing_Arabic_Type`) VALUES
(1, 'Listing Type One', 'نوع العرض الأول');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `LogId` int(11) NOT NULL,
  `LogTime` datetime DEFAULT NULL,
  `LogByUser` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Ownership` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Building` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Unit` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Contract` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `LogData` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_categoty`
--

CREATE TABLE `maintenance_categoty` (
  `Categoty_Id` int(11) NOT NULL,
  `Categoty_AR` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Categoty_En` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Main_Categoty` int(11) DEFAULT NULL,
  `Active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maintenance_categoty`
--

INSERT INTO `maintenance_categoty` (`Categoty_Id`, `Categoty_AR`, `Categoty_En`, `Main_Categoty`, `Active`) VALUES
(1, 'تشطيب', 'finishing', 0, 1),
(2, 'إلكتروميكانيكال', 'Electromechanical', 0, 1),
(3, 'إنشائي', 'structural', 0, 1),
(4, 'أثاث', 'furniture', 0, 1),
(5, 'أجهزة منزلية', 'Appliances', 0, 1),
(6, 'أجهزة أمنية', 'security devices', 0, 1),
(7, 'دهان', 'paint ', 1, 1),
(8, 'نجارة', 'Carpentry', 1, 1),
(9, 'أرضيات', 'Floors', 1, 1),
(10, 'إضاءة', 'Lighting', 2, 1),
(11, 'مصادر طاقة', 'Energy Sources', 2, 1),
(12, 'سباكة', 'Plumbing', 2, 1),
(13, 'تكيف و تهوية', 'Air Conditioning and Ventilation', 2, 1),
(14, 'دفاع مدني', 'Civil Defense', 2, 1),
(15, 'مصاعد', 'Elevators', 2, 1),
(16, 'نظام أمني - مراقبة', 'Security System - Surveillance', 2, 1),
(17, 'نظام أمني - أنتركوم', 'Security system - intercom', 2, 1),
(18, 'عزل', 'Isolation', 3, 1),
(19, 'الهيكل', 'the structure', 3, 1),
(20, 'جدران وأسقف', 'walls and ceilings', 3, 1),
(30, 'منافذ ', 'Door Windows', 1, 1),
(31, 'طاولات', 'tables', 4, 1),
(32, 'كراسي', 'Chairs', 4, 1),
(33, 'تلفاز', 'television', 4, 1),
(34, 'غسالة', 'washing machine', 4, 1),
(35, 'براد', 'refrigerator', 4, 1),
(36, 'مضخات', 'Pumps', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_request`
--

CREATE TABLE `maintenance_request` (
  `Maintenance_Request_ID` int(11) NOT NULL,
  `complaint_report_request_Complaint_Report_Request_Id` int(11) NOT NULL,
  `maintenance_categoty_Categoty_Id` int(11) NOT NULL,
  `assets_Assets_Id` int(11) NOT NULL,
  `Start_Date` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `End_Date` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cost` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Activ` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Cost_Direction` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Executing_Agency` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Technical` int(11) DEFAULT NULL,
  `Watcher` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maintenance_request`
--

INSERT INTO `maintenance_request` (`Maintenance_Request_ID`, `complaint_report_request_Complaint_Report_Request_Id`, `maintenance_categoty_Categoty_Id`, `assets_Assets_Id`, `Start_Date`, `End_Date`, `Cost`, `Activ`, `Cost_Direction`, `Executing_Agency`, `Technical`, `Watcher`) VALUES
(1, 12, 13, 3, '04/07/2023', '05/07/2023', '6000', 'On Hold', 'Contractor', 'Maintenance Team', 2, 4),
(2, 13, 12, 4, '12/07/2023', '16/07/2023', '1000', 'On Hold', 'Supplier', 'Maintenance Team', 2, 4),
(3, 14, 12, 4, '14/07/2023', '16/07/2023', '3000', 'On Hold', 'Supplier', 'Contractor', 2, 4),
(4, 14, 12, 4, '14/07/2023', '16/07/2023', '3000', 'On Hold', 'Supplier', 'Contractor', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_type`
--

CREATE TABLE `maintenance_type` (
  `Maintenance_Type_Id` int(11) NOT NULL,
  `Maintenance_English_Type` varchar(200) NOT NULL,
  `Maintenance_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maintenece_templete`
--

CREATE TABLE `maintenece_templete` (
  `Maintenece_Templete_Id` int(11) NOT NULL,
  `Employee_ID` varchar(45) DEFAULT NULL,
  `Building_ID` varchar(45) DEFAULT NULL,
  `Type` varchar(200) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL,
  `Clean` varchar(45) DEFAULT NULL,
  `Save` varchar(45) DEFAULT NULL,
  `Maintenece` varchar(45) DEFAULT NULL,
  `disclaimer` varchar(45) DEFAULT NULL,
  `Note` longtext,
  `Last_Maintenece_Date` varchar(200) DEFAULT NULL,
  `Last_Maintenece_Type` varchar(200) DEFAULT NULL,
  `Last_Clean_Date` varchar(200) DEFAULT NULL,
  `Last_Clean_Type` varchar(200) DEFAULT NULL,
  `Discription` longtext,
  `Location_Ifo` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maintenece_templete`
--

INSERT INTO `maintenece_templete` (`Maintenece_Templete_Id`, `Employee_ID`, `Building_ID`, `Type`, `Date`, `Clean`, `Save`, `Maintenece`, `disclaimer`, `Note`, `Last_Maintenece_Date`, `Last_Maintenece_Type`, `Last_Clean_Date`, `Last_Clean_Type`, `Discription`, `Location_Ifo`) VALUES
(1, '2', '8', 'مواقف', '19/03/2023', '1', '1', '0', '0', 'ملاحظات 1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2', '8', 'مداخل', '19/03/2023', '0', '1', '1', '0', 'ملاحظات 2', NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2', '8', 'الدرج', '19/03/2023', '0', '0', '1', '1', 'ملاحظات3', NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2', '8', 'السطح', '19/03/2023', '0', '0', '1', '1', 'ملاحظات 4', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2', '8', 'القبو', '19/03/2023', '0', '1', '1', '0', 'ملاحظات 5', NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2', '8', 'غرفة المولد', '19/03/2023', '1', '0', '0', '0', 'ملاحظات 6', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2', '8', 'غرفة الكهرباء', '19/03/2023', '1', '1', '0', '0', 'ملاحظات 7', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2', '8', 'غرفة الدفاع المدني', '19/03/2023', '0', '1', '1', '0', 'ملاحظات 8', NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2', '8', 'مكب القمامة', '19/03/2023', '0', '0', '1', '0', 'ملاحظات 9', NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2', '8', 'المصاعد', '19/03/2023', '0', '0', '0', '1', 'ملاحظات10', NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2', '8', 'الممرات', '19/03/2023', '1', '0', '1', '0', 'ملاحظات 11', NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2', '8', 'أجهزة عامة / أثاث عام', '19/03/2023', '0', '0', '0', '0', 'ملاحظات 12', NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2', '8', 'معلومات', '19/03/2023', '', '', '', '', '', '27/02/2023', '2', '28/02/2023', '1', 'ملاحظات ملاحظات ملاحظات ملاحظات ملاحظات ملاحظات ملاحظات ملاحظات', '');

-- --------------------------------------------------------

--
-- Table structure for table `main_type_evaluation`
--

CREATE TABLE `main_type_evaluation` (
  `Main_Type_Evaluation_Id` int(11) NOT NULL,
  `Ar_Name` varchar(200) DEFAULT NULL,
  `EN_Name` varchar(200) DEFAULT NULL,
  `Main_Weight` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `main_type_evaluation`
--

INSERT INTO `main_type_evaluation` (`Main_Type_Evaluation_Id`, `Ar_Name`, `EN_Name`, `Main_Weight`) VALUES
(1, 'التحصيل', 'Collection', '50'),
(2, 'السلوك', 'Behavior', '50');

-- --------------------------------------------------------

--
-- Table structure for table `management_expensess`
--

CREATE TABLE `management_expensess` (
  `Management_Expensess_Id` int(11) NOT NULL,
  `Mounth` varchar(200) DEFAULT NULL,
  `Year` varchar(200) DEFAULT NULL,
  `Management_Expensess` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `management_expensess`
--

INSERT INTO `management_expensess` (`Management_Expensess_Id`, `Mounth`, `Year`, `Management_Expensess`) VALUES
(1, '2', '2023', ''),
(2, '1', '2023', '0'),
(3, '1', '2021', '272267.16'),
(4, '2', '2021', '282853.71'),
(5, '3', '2021', '323923.88'),
(6, '4', '2021', '3126334.06'),
(7, '5', '2021', '322861.02'),
(8, '6', '2021', '341578.43'),
(9, '7', '2021', '331737.77'),
(10, '8', '2021', '305620.13'),
(11, '9', '2021', '163885.817'),
(12, '10', '2021', '351041.67'),
(13, '11', '2021', '277210.37'),
(14, '12', '2021', '0332724.77'),
(15, '1', '2022', '338889'),
(16, '2', '2022', '561921.42'),
(17, '3', '2022', '526918'),
(18, '4', '2022', '295284.78'),
(19, '5', '2022', '599326.01'),
(20, '6', '2022', '1306004'),
(21, '7', '2022', '3450460.75'),
(22, '8', '2022', '292919.72'),
(23, '9', '2022', '394878.86'),
(24, '10', '2022', '375553.76'),
(25, '11', '2022', '295459.49'),
(26, '12', '2022', '243778.47');

-- --------------------------------------------------------

--
-- Table structure for table `mortgaged_wonership`
--

CREATE TABLE `mortgaged_wonership` (
  `Mortgaged_Wonership_Id` int(11) NOT NULL,
  `Ownership_Id` varchar(45) DEFAULT NULL,
  `Bank_Id` varchar(45) DEFAULT NULL,
  `Mortgage_Value` varchar(45) DEFAULT NULL,
  `Installment_Value` varchar(45) DEFAULT NULL,
  `Start_Date` varchar(45) DEFAULT NULL,
  `End_Date` varchar(45) DEFAULT NULL,
  `Paymen_Type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mortgaged_wonership`
--

INSERT INTO `mortgaged_wonership` (`Mortgaged_Wonership_Id`, `Ownership_Id`, `Bank_Id`, `Mortgage_Value`, `Installment_Value`, `Start_Date`, `End_Date`, `Paymen_Type`) VALUES
(8, '13', '11', '8445689', '67419', '2020-02-05', '2030-10-05', 'شهري'),
(9, '12', '11', '4222845', '33710', '2020-02-05', '2030-10-05', 'شهري'),
(10, '22', '11', '4222845', '33710', '2020-02-05', '2030-10-05', 'شهري'),
(11, '4', '7', '17531788', '515640', '2018-08-24', '2026-11-24', 'ربع سنوي'),
(12, '41', '7', '1408095', '3359', '2020-01-01', '2055-01-01', 'شهري'),
(15, '40', '11', '1404860', '11707', '2014-05-01', '2024-10-01', 'شهري');

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `nationality_ID` int(11) NOT NULL,
  `English_nationality` varchar(200) NOT NULL,
  `Arabic_nationality` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`nationality_ID`, `English_nationality`, `Arabic_nationality`) VALUES
(1, 'British', 'بريطاني'),
(2, 'Argentinian', 'أرجنتيني'),
(3, 'Australian', 'الاسترالية'),
(4, 'Bahamian', 'جزر البهاما'),
(5, 'Belgian', 'بلجيكي'),
(6, 'Brazilian', 'برازيلي'),
(7, 'Canadian', 'كندي'),
(8, 'Chinese', 'صينى'),
(9, 'Colombian', 'الكولومبي'),
(10, 'Cuban', 'الكوبي'),
(11, 'Dominican', 'الدومينيكان'),
(12, 'Ecuadorean', 'الاكوادوري'),
(13, 'Salvadorean', 'سلفادوري'),
(14, 'French', 'فرنسي'),
(15, 'German', 'ألمانية'),
(16, 'Guatemalan', 'غواتيمالا'),
(17, 'Haitian', 'الهايتية'),
(18, 'Honduran', 'هندوراس'),
(19, 'Indian', 'هندي'),
(20, 'Ireland', 'أيرلندا'),
(21, 'Israeli', 'إسرائيلي'),
(22, 'Italian', 'إيطالي'),
(23, 'Japanese', 'اليابانية'),
(24, 'South Korean', 'كوريا الجنوبية'),
(25, 'Mexican', 'مكسيكي'),
(26, 'Dutch', 'هولندي'),
(27, 'Philippine', 'فلبيني'),
(28, 'Spanish', 'الأسبانية'),
(29, 'Swedish', 'السويدية'),
(30, 'Swiss', 'سويسري'),
(31, 'Taiwanese', 'تايواني'),
(32, 'Venezuelan', 'فنزويلي'),
(33, 'Vietnamese', 'فيتنامي'),
(34, 'Afghan', 'أفغاني'),
(35, 'Albanian', 'الألبانية'),
(36, 'Algerian', 'جزائري'),
(37, 'Samoan', 'ساموا'),
(38, 'Andorran', 'أندورا'),
(39, 'Angolan', 'الأنغولية'),
(40, 'Armenian', 'أرميني'),
(41, 'Austrian', 'النمساوي'),
(42, 'Azerbaijani', 'الأذربيجانية'),
(43, 'Bahraini', 'بحريني'),
(44, 'Bangladeshi', 'بنجلاديشية'),
(45, 'Barbadian', 'بربادوس'),
(46, 'Belarusian', 'البيلاروسية'),
(47, 'Belizean', 'بليز'),
(48, 'Beninese', 'بنين'),
(49, 'Bermudian', 'البرمودي'),
(50, 'Bhutanese', 'بوتاني'),
(51, 'Bolivian', 'بوليفي'),
(52, 'Bosnian', 'البوسنية'),
(53, 'Botswanan', 'بوتسوانا'),
(54, 'Bulgarian', 'البلغارية'),
(55, 'Burkinese', 'البوركيني'),
(56, 'Burundian', 'بوروندي'),
(57, 'Cambodian', 'كمبودي'),
(58, 'Cameroonian', 'كاميروني'),
(59, 'Cape Verdean', 'الرأس الأخضر'),
(60, 'Chadian', 'تشادي'),
(61, 'Chilean', 'تشيلي'),
(62, 'Congolese', 'الكونغوليين'),
(63, 'Costa Rican', 'كوستاريكا'),
(64, 'Croat', 'الكرواتية'),
(65, 'Cypriot', 'القبرصي'),
(66, 'Czech', 'التشيكية'),
(67, 'Danish', 'دانماركي'),
(68, 'Djiboutian', 'جيبوتي'),
(69, 'Dominican', 'الدومينيكان'),
(70, 'Egyptian', 'مصري'),
(71, 'Eritrean', 'اريتريا'),
(72, 'Estonian', 'الإستونية'),
(73, 'Ethiopian', 'إثيوبي'),
(74, 'Fijian', 'فيجي'),
(75, 'Finnish', 'الفنلندية'),
(76, 'Polynesian', 'بولينيزية'),
(77, 'Gabonese', 'الجابونى'),
(78, 'Gambian', 'غامبيا'),
(79, 'Georgian', 'الجورجية'),
(80, 'Ghanaian', 'الغانية'),
(81, 'Greek', 'اليونانية'),
(82, 'Grenadian', 'غرينادا'),
(83, 'Guinean', 'غينيا'),
(84, 'Guyanese', 'جوياني'),
(85, 'Hungarian', 'المجرية'),
(86, 'Icelandic', 'ايسلندي'),
(87, 'Indonesian', 'الأندونيسية'),
(88, 'Iranian', 'إيراني'),
(89, 'Iraqi', 'عراقي'),
(90, 'Jamaican', 'جامايكا'),
(91, 'Jordanian', 'أردني'),
(92, 'Kazakh', 'الكازاخستانية'),
(93, 'Kenyan', 'كيني'),
(94, 'North Korean', 'كوري شمالي'),
(95, 'Kuwaiti', 'كويتي'),
(96, 'Latvian', 'لاتفيا'),
(97, 'Lebanese', 'لبناني'),
(98, 'Liberian', 'ليبيري'),
(99, 'Libyan', 'ليبي'),
(100, 'Lithuanian', 'الليتوانية'),
(101, 'LUXEMBOURG', 'لوكسمبورغ'),
(102, 'Madagascan', 'مدغشقر'),
(103, 'Malawian', 'ملاوي'),
(104, 'Malaysian', 'ماليزية'),
(105, 'Maldivian', 'جزر المالديف'),
(106, 'Malian', 'مالي'),
(107, 'Maltese', 'المالطية'),
(108, 'Mauritanian', 'موريتاني'),
(109, 'Mauritian', 'موريشيوس'),
(110, 'Monacan', 'موناكان'),
(111, 'Mongolian', 'المنغولية'),
(112, 'Montenegrin', 'الجبل الأسود'),
(113, 'Moroccan', 'مغربي'),
(114, 'Mozambican', 'موزمبيقى'),
(115, 'Namibian', 'الناميبي'),
(116, 'Nepalese', 'نيبالي'),
(117, 'New Zealand', 'نيوزيلاندا'),
(118, 'Nicaraguan', 'نيكاراغوا'),
(119, 'Nigerien', 'النيجر'),
(120, 'Nigerian', 'نيجيري'),
(121, 'Norwegian', 'النرويجية'),
(122, 'Omani', 'عماني'),
(123, 'Pakistani', 'باكستاني'),
(124, 'Panamanian', 'بنمي'),
(125, 'Guinean', 'غينيا'),
(126, 'Paraguayan', 'باراغواي'),
(127, 'Peruvian', 'بيرو'),
(128, 'Polish', 'تلميع'),
(129, 'Portuguese', 'البرتغالية'),
(130, 'Qatari', 'قطري'),
(131, 'Romanian', 'روماني'),
(132, 'Rwandan', 'رواندي'),
(133, 'Saudi Arabian', 'سعودي'),
(134, 'Senegalese', 'سنغالي'),
(135, 'Serb or Serbian', 'الصربية أو الصربية'),
(136, 'Sierra Leonian', 'سيراليوني'),
(137, 'Singaporean', 'سنغافوري'),
(138, 'Slovak', 'السلوفاكية'),
(139, 'Slovenian', 'السلوفينية'),
(140, 'Slomoni', 'سلوموني'),
(141, 'Somali', 'صومالي'),
(142, 'South African', 'جنوب افريقيا'),
(143, 'Sri Lankan', 'سري لانكا'),
(144, 'Sudanese', 'سوداني'),
(145, 'Surinamese', 'سورينام'),
(146, 'Swazi', 'سوازي'),
(147, 'Syrian', 'سوري'),
(148, 'Tajik', 'طاجيك'),
(149, 'Thai', 'التايلاندية'),
(150, 'Togolese', 'توغو'),
(151, 'Trinidadian', 'ترينيدادية'),
(152, 'Tunisian', 'تونسي'),
(153, 'Turkish', 'اللغة التركية'),
(154, 'Turkoman', 'التركمان'),
(155, 'Tuvaluan', 'توفالوان'),
(156, 'Ugandan', 'أوغندا'),
(157, 'Ukrainian', 'الأوكرانية'),
(158, 'Emirati', 'إماراتي'),
(159, 'American', 'أمريكي'),
(160, 'Uruguayan', 'أوروغواي'),
(161, 'Uzbek', 'أوزبكي'),
(162, 'Vanuatuan', 'فانواتوان'),
(163, 'Yemeni', 'يمني'),
(165, 'Null', 'شركات'),
(166, 'Palestinian', 'فلسطيني'),
(167, 'Turki', 'تركي');

-- --------------------------------------------------------

--
-- Table structure for table `notification_type`
--

CREATE TABLE `notification_type` (
  `Notification_Id` int(11) NOT NULL,
  `Notification_English_Type` varchar(200) NOT NULL,
  `Notification_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `Owner_Id` int(11) NOT NULL,
  `Owner_English_name` varchar(200) DEFAULT NULL,
  `Owner_Arabic_name` varchar(200) DEFAULT NULL,
  `Owner_Email` varchar(200) DEFAULT NULL,
  `Owner_Website` varchar(200) DEFAULT NULL,
  `Owner_Notes` varchar(200) DEFAULT NULL,
  `Salary` varchar(200) DEFAULT NULL,
  `Owner_Tell` varchar(200) DEFAULT NULL,
  `Owner_Mobile` varchar(200) DEFAULT NULL,
  `Owner_QID` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`Owner_Id`, `Owner_English_name`, `Owner_Arabic_name`, `Owner_Email`, `Owner_Website`, `Owner_Notes`, `Salary`, `Owner_Tell`, `Owner_Mobile`, `Owner_QID`, `path`) VALUES
(4, 'ALMANARA COMPANY FOR MAINTENANCE AND TRADE', 'شركة المنارة للصيانة والتجارة', 'almanara03@hotmail.com', 'almanarare.com', '', '', '', '', 'قيد المنشاة شركة المنارة للصيانة والتجارة2022.pdf', '/English/Master_Panal/Owners_QID/قيد المنشاة شركة المنارة للصيانة والتجارة2022.pdf'),
(5, 'SHIEKH FAHAD ABDULLA S F AL THANI', 'الشيخ فهد عبد الله سعود فهد ال ثاني', 'almanara03@hotmail.com', '', '', '', '', '', 'WhatsApp Image 2022-06-14 at 3.53.54 PM.jpeg', '/English/Master_Panal/Owners_QID/WhatsApp Image 2022-06-14 at 3.53.54 PM.jpeg'),
(9, 'Inheritors and Government  ', 'الدولة/ ورثة', '', '', '', '', '', '', 'No File', 'No File'),
(10, 'Inheritors', 'ورثة', '', '', '', '', '', '', 'No File', 'No File'),
(11, 'Shiekh Proceedings', 'الشيخ اجراءات', '', '', '', NULL, '', '', 'No File', 'No File'),
(12, 'Government', 'الدولة', '', '', '', '', '', '', 'No File', 'No File');

-- --------------------------------------------------------

--
-- Table structure for table `ownership_statment`
--

CREATE TABLE `ownership_statment` (
  `Statment_Id` int(11) NOT NULL,
  `Ownership_Id` varchar(200) DEFAULT NULL,
  `Statment_FileName` longtext,
  `Statment_Path` longtext,
  `Statment_Date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ownership_statment`
--

INSERT INTO `ownership_statment` (`Statment_Id`, `Ownership_Id`, `Statment_FileName`, `Statment_Path`, `Statment_Date`) VALUES
(2, '4', 'ملاحظات ومقترحات المنارة.docx', '/English/Main_Application/Ownership_Images/Statment/ملاحظات ومقترحات المنارة.docx', '08/03/2023');

-- --------------------------------------------------------

--
-- Table structure for table `ownership_status`
--

CREATE TABLE `ownership_status` (
  `ownership_status_id` int(11) NOT NULL,
  `ownership_english_status` varchar(200) NOT NULL,
  `ownership_arabic_status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ownership_status`
--

INSERT INTO `ownership_status` (`ownership_status_id`, `ownership_english_status`, `ownership_arabic_status`) VALUES
(1, 'Status One', 'حالة واحد'),
(2, 'Status Two', 'حالة ثانية'),
(3, 'Status Three', 'حالة ثالثة'),
(4, 'dadad', 'يسيسي'),
(5, 'adaddad', 'شيشيشي'),
(6, 'daadadad', 'شيشيشي');

-- --------------------------------------------------------

--
-- Table structure for table `owner_ship`
--

CREATE TABLE `owner_ship` (
  `Owner_Ship_Id` int(11) NOT NULL,
  `owner_Owner_Id` int(11) NOT NULL,
  `zone_zone_Id` int(11) NOT NULL,
  `Owner_Ship_EN_Name` varchar(200) NOT NULL,
  `Owner_Ship_AR_Name` varchar(200) NOT NULL,
  `ownership_NO` varchar(200) NOT NULL,
  `Parcel_Area` varchar(200) DEFAULT NULL,
  `Bond_NO` varchar(200) DEFAULT NULL,
  `Bond_Date` varchar(200) DEFAULT NULL,
  `Street_NO` varchar(200) DEFAULT NULL,
  `Street_Name` varchar(200) DEFAULT NULL,
  `Land_Value` varchar(45) DEFAULT NULL,
  `Appreciation_octagon` varchar(200) DEFAULT NULL,
  `PIN_Number` varchar(200) NOT NULL,
  `owner_ship_Code` varchar(200) DEFAULT NULL,
  `owner_ship_Certificate_Image` varchar(200) NOT NULL,
  `owner_ship_Certificate_Image_Path` varchar(200) NOT NULL,
  `Property_Scheme_Image` varchar(200) NOT NULL,
  `Property_Scheme_Image_Path` varchar(200) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Mab_Url` varchar(200) DEFAULT NULL,
  `IsRealEsataeInvesment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `owner_ship`
--

INSERT INTO `owner_ship` (`Owner_Ship_Id`, `owner_Owner_Id`, `zone_zone_Id`, `Owner_Ship_EN_Name`, `Owner_Ship_AR_Name`, `ownership_NO`, `Parcel_Area`, `Bond_NO`, `Bond_Date`, `Street_NO`, `Street_Name`, `Land_Value`, `Appreciation_octagon`, `PIN_Number`, `owner_ship_Code`, `owner_ship_Certificate_Image`, `owner_ship_Certificate_Image_Path`, `Property_Scheme_Image`, `Property_Scheme_Image_Path`, `Active`, `Mab_Url`, `IsRealEsataeInvesment`) VALUES
(4, 5, 8, 'Fereej Alghanim Hotel Apartments', 'شقق فندقية فريج الغانم ', '1', '1089', '119830', '', '852', 'شارع الأصمعي', '23826000', ' ', '06120023', '06/1', 'سند الغانم العتيق.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند الغانم العتيق.pdf', 'No File', 'No File', 0, 'https://goo.gl/maps/znuPdPCE1BeYzSF37', '0'),
(6, 5, 14, 'Fereej Abdulaziz Twin Buildings', 'عمارتين فريج عبدالعزيز', '1', '455', '66530', NULL, '920', 'شارع السليمي', '8571500', ' ', '14070007', '14/1', 'سند ومخطط فريج عبدالعزيز 2.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ومخطط فريج عبدالعزيز 2.pdf', 'No File', 'No File', 0, '', '0'),
(8, 5, 29, 'Bin Dirham Al Kubraa', 'بن درهم الكبرى', '2', '495', '30235', '', '816', 'شارع ضرار بن الخطاب', '10656000', ' ', '25680034', '25/2', 'سند ملكية رقم 30235 (بن درهم شيخ ).pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 30235 (بن درهم شيخ ).pdf', 'بن درهم الكبرى مخطط.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/بن درهم الكبرى مخطط.pdf', 0, 'No File', '0'),
(9, 5, 30, 'Al Najma Building AL Makhbez', 'عمارة النجمة المخبز', '3', '112', '42363', '', '930', 'شارع ابن الربيع', '1809000', ' ', '26230049', '26/3', 'سند ملكية النجمة المخبز.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية النجمة المخبز.pdf', 'النجمة المخبز مخطط.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/النجمة المخبز مخطط.pdf', 0, 'No File', '0'),
(10, 5, 30, 'Al Najma 2 Stores and Shop', 'عمارة دورين ومحل', '4', '216', '125846', '', '937', 'شارع بشر بن البراء', '3952500', ' ', '26240024', '26/4', 'سند ملكية عمارة دورين ومحل النجمة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية عمارة دورين ومحل النجمة .pdf', 'سند ملكية ومخطط رقم 125846.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 125846.pdf', 0, 'No File', '0'),
(11, 5, 30, ' Al Najma Shops', 'محلات النجمة', '5', '143', '52875', '', '938', 'شارع حارثة الخزاعي', '1350000', ' ', '26250005', '26/5', 'سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', 'سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 52875 ( محلات نجمه ).pdf', 0, 'No File', '0'),
(12, 5, 31, 'Sanyo', 'سانيو', '2', '285', '2773', NULL, '894', 'لشارع العدالة', '5804800', ' ', '27110015', '27/2', 'سند ومخطط سانيو..pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ومخطط سانيو..pdf', 'سند ومخطط سانيو..pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط سانيو..pdf', 0, '', '0'),
(13, 5, 31, 'HSBCc', 'أتش أس بي سي', '1', '641', '3709', '', '896', 'لشارع الحباب بن جبير', '13551450', ' ', '27070021', '27/1', 'مخطط و سند HSBC المنارة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/مخطط و سند HSBC المنارة.pdf', 'مخطط و سند HSBC المنارة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط و سند HSBC المنارة.pdf', 0, 'No File', '0'),
(14, 4, 31, 'Um Ghuwailina Hospital', 'أم غويلينة المستشفى', '3', '447', '12138', '', '880', 'شارع سميسمة', '8902200', ' ', '27230009', '27/3', 'سند ملكية ومخطط الصحي.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط الصحي.pdf', 'سند ملكية ومخطط الصحي.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط الصحي.pdf', 0, 'No File', '0'),
(15, 5, 31, 'Um Ghuwailina Al Sughra', 'أم غويلينة الصغرى', '5', '209', '2609', '', '810', 'شارع ابن الجوزي', '4050000', ' ', '27720003', '27/5', 'سند ملكية الصغرى.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية الصغرى.pdf', 'سند ملكية ومخطط رقم 2609.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 2609.pdf', 0, 'No File', '0'),
(16, 5, 31, 'Um Ghuwailina Al Jadida', 'أم غويلينة الجديدة', '7', '824', '4831', '', '940', 'شارع حارثة بن سهل', '15966000', ' ', '27800009', '27/7', 'سند ملكية ام غويلينة الجديدة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ام غويلينة الجديدة .pdf', 'سند ومخطط ام غ الجديدة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط ام غ الجديدة.pdf', 0, 'No File', '0'),
(17, 5, 31, 'Um Ghuwailina Al Kubraa', 'أم غويلينة الكبرى', '8', '917', '174368', '', '810', 'شارع ابن الجوزي', '16187700', ' ', '27870015', '27/8', 'سند ملكيةام غويلينة الكبرى .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكيةام غويلينة الكبرى .pdf', 'سند ومخطط الشوك والكبرى.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط الشوك والكبرى.pdf', 0, 'No File', '0'),
(18, 4, 37, 'Two Villas in Khalifa City North', 'فيلتان مدينة خليفة الشمالية', '1', '741', '43951', '', '884', 'شارع الظعاين', '4386800', ' ', '32080001', '32/1', 'سند ملكية ومخطط رقم43951.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط رقم43951.pdf', 'سند ملكية ومخطط رقم43951.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم43951.pdf', 0, 'No File', '0'),
(19, 5, 37, 'Villa Zawia', 'فيلا زاوية', '2', '372', '87709', NULL, '834', 'شارع غشام', '2002000', ' ', '32230029', '32/2', 'سند ملكية رقم 87709.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 87709.pdf', 'مخطط فيلا زاويا.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط فيلا زاويا.pdf', 0, '', '0'),
(20, 5, 37, 'Villas Yumna Wusta', 'فلل يمنى وسطى', '3', '739', '87710', NULL, '834', 'شارع غشام', '4375250', ' ', '32230030', '32/3', 'سند ملكية رقم 87710.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 87710.pdf', 'سند ملكية رقم 87710.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية رقم 87710.pdf', 0, '', '0'),
(21, 5, 37, 'Villas Sharqiat Gharbiat  Al Jamea', 'فلل شرقية غربية الجامعة', '4', '739', '26207', NULL, '980', 'شارع الرويس', '4375250', ' ', '32230035', '32/4', 'سند فيلا غربية شرقية م خ ش.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند فيلا غربية شرقية م خ ش.pdf', 'سند فيلا غربية شرقية م خ ش.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند فيلا غربية شرقية م خ ش.pdf', 0, '', '0'),
(22, 4, 37, 'Khalifa City Building  Al Wadhia', 'عمارة مدينة خليفة الوضيحية', '5', '737', '6228', NULL, '958', 'شارع الوضيحية', ' 4398900', ' ', '32240043', '32/5', '1سند  ومخطط ملكية عمارة مدينة خليفة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/1سند  ومخطط ملكية عمارة مدينة خليفة.pdf', 'سند ملكية عمارة مدينة خليفة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية عمارة مدينة خليفة.pdf', 0, '', '0'),
(23, 4, 37, 'Khalifa City North House', 'منزل مدينة خليفة الشمالية', '6', '648', '137108', NULL, '884', 'شارع الظعاين', ' 3836250', ' ', '32080034', '32/6', 'سند ملكية.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية.pdf', 'مخطط.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط.pdf', 0, '', '0'),
(24, 4, 40, ' Gharnata House', 'منزل غرناطة', '1', '1804', '143088', NULL, '925', 'شارع الانوار', ' 10679900', ' ', '34060042', '34/1', 'سند ملكية رقم 143088.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 143088.pdf', 'سند ملكية رقم 143088.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية رقم 143088.pdf', 0, '', '0'),
(25, 5, 40, 'House in front of Al Murur', 'منزل مقابل المرور', '2', '404', '25946', NULL, '810', 'شارع عمر بن عبدالعزيز', '2175500', ' ', '34300029', '34/2', 'سند ملكية مقابل المرور.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية مقابل المرور.pdf', 'سند ملكية مقابل المرور.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية مقابل المرور.pdf', 0, '', '0'),
(26, 5, 56, 'Two detached villas', 'فيلتان متلاصقتان', '1', '750', '42149', NULL, '903', 'شارع أحد', '3961000', ' ', '45014054', '45/1', 'سند فلل المطار.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند فلل المطار.pdf', 'مخطط فلل المطار.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط فلل المطار.pdf', 0, '', '0'),
(27, 5, 71, 'Western Villa', 'فيلا غربية', '1', '515', '81231', '', '836', 'شارع وادى السمريه', '2772000', ' ', '51610130', '51/1', 'سند ملكية ازغوى غربية .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ازغوى غربية .pdf', 'سند ومخطط ملكية رقم 81231.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط ملكية رقم 81231.pdf', 0, 'No File', '0'),
(29, 5, 71, 'Eastern Villa   ', 'فيلا شرقية', '2', '451', '81232', '', '836', 'شارع وادى السمريه', '2772000', ' ', '51610131', '51/2', 'سند ملكية رقم 81232.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 81232.pdf', 'مخطط 81232 فيلا شرقية.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط 81232 فيلا شرقية.pdf', 0, 'No File', '0'),
(35, 5, 72, 'Villa Ain Khaled ', 'فيلا عين خالد', '1', '1047', '43368', '', '452', 'شارع 452', '4580000', ' ', '56130046', '56/1', 'سند ملكية رقم 43368.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 43368.pdf', 'سند ملكية رقم 43368.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية رقم 43368.pdf', 0, 'No File', '0'),
(36, 4, 73, 'New Industrial Garage', 'كراج الصناعية الجديد', '2', '2413', 'لا يوجد', '', '51', '	شارع 51', '11733000', ' ', '57010371', '57/2', 'عقد ايجار بلدية  الصناعية.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/عقد ايجار بلدية  الصناعية.pdf', 'مخطط الصناعية .pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الصناعية .pdf', 0, 'No File', '0'),
(37, 5, 74, 'Palm Tower Offices', 'مكاتب برج النخلة', '1', '643', '113439', '', '810', 'شارع ام حصاه', '000', ' ', '60030014', '60/1', 'عقد بيع مكتب 4603.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/عقد بيع مكتب 4603.pdf', 'عقد بيع مكتب رقم  4604.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/عقد بيع مكتب رقم  4604.pdf', 0, 'No File', '0'),
(38, 5, 69, 'Villa Al Khaysa', 'فيلا الخيسة', '1', '600', '422181', NULL, '585', 'شارع 585', '2906100', ' ', '70093257', '70/1', 'سند ومخطط فيلا الخيسة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ومخطط فيلا الخيسة.pdf', 'سند ومخطط فيلا الخيسة.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ومخطط فيلا الخيسة.pdf', 0, '', '0'),
(39, 4, 76, 'Al Qatifia Villas', 'فلل القطيفية', '1', '3067', '90250', '', '2', 'شارع الامير', '27013000', ' ', '66170565', '66/1', 'سند ملكية ومخطط رقم 90250.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ومخطط رقم 90250.pdf', 'سند ملكية ومخطط رقم 90250.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند ملكية ومخطط رقم 90250.pdf', 0, 'No File', '0'),
(40, 5, 68, ' Al Ruweys Villas', 'فلل الرويس', '1', '1273', '403853', '', '961', 'شارع 961', '800000', ' ', '79050397', '79/1', 'سند ملكية الرويس.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية الرويس.pdf', 'مخطط الرويس.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الرويس.pdf', 0, 'No File', '0'),
(41, 5, 70, 'Villa Al Vakeer', 'فيلا الوكير', '1', '1019', '217469', NULL, '1200', 'شارع روضة الغزلانية', '300', ' ', '91060946', '91/1', 'سند الملكية والمخطط الوكير.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند الملكية والمخطط الوكير.pdf', 'سند الملكية والمخطط الوكير.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/سند الملكية والمخطط الوكير.pdf', 0, '', '0'),
(42, 9, 73, 'Garage 27th Street', 'جراج شارع 27', '1', '1100', 'لا يوجد  سند و رقم مساحي ', NULL, '27', 'شارع 27', '0', ' ', '57000000', '57/1', 'No File', 'No File', 'No File', 'No File', 0, '', '0'),
(43, 10, 76, 'Villa Al Dafna', 'فيلا الدفنة', '1', '1225', '81551', '', '	801', 'شارع ام الزبد', '7252300', ' ', '66160121', '66/1', 'سند ملكية فيلا الدفنة.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية فيلا الدفنة.pdf', 'مخطط بيت الدفنة ٦٦١٦٠١٢١.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط بيت الدفنة ٦٦١٦٠١٢١.pdf', 0, 'No File', '0'),
(44, 11, 69, 'Ravdat Al Hamamah', 'روضة الحمامه', '2', '1281', '116182', NULL, '	1215', 'شارع 1215', '0', ' ', '70101529', '70/2', 'سند ملكية رقم 116182.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية رقم 116182.pdf', 'No File', 'No File', 0, '', '0'),
(45, 5, 67, 'vaill garaft al ryan', 'فيلا غرافة الريان ', '3', '450', '158462', '', '511', '', '1680000', ' ', '51258088', '51/3', 'سند ملكية فيلا غرافة الريان.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية فيلا غرافة الريان.pdf', 'مخطط 158462 فيلا غرافة الريان_pdf.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط 158462 فيلا غرافة الريان_pdf.pdf', 0, 'No File', '0'),
(46, 5, 69, 'Villa Alkheesa New', 'فيلا الخيسة جديدة ', '3', '542', '426990', '', '660', '', '1656600', ' ', '70061114', '70/3', 'سند ملكية الخيسة الجديدة  .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية الخيسة الجديدة  .pdf', 'مخطط الخيسة الجديدة  .pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الخيسة الجديدة  .pdf', 0, 'No File', '0'),
(47, 5, 71, 'Izghawa', 'ازغوى اسكان ', '4', '615', '104155', '', '52', 'جري الساعي ', '1565992', 'مثمن', '71080436', '71/4', 'سند ملكية ازغوى اسكان .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية ازغوى اسكان .pdf', 'مخطط ازغوى اسكان 104155.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط ازغوى اسكان 104155.pdf', 0, 'No File', '0'),
(48, 5, 77, 'Al Gharafa Villa', 'الغرافة ', '5', '569', '463589', '', '839', 'رأس الغارية', '1565992', 'تقديري', '51610362', '51/5', 'سند ملكية فيلا الغرافة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكية فيلا الغرافة .pdf', 'مخطط الغرافة  463589.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/مخطط الغرافة  463589.pdf', 0, 'No File', '0'),
(49, 5, 69, 'Villa Al Kheesa School', 'الخيسة المدرسة', '4', '560', '467245', NULL, '174', '174', '2000000', 'مثمن', '70093624', '70/4', 'سند ملكيةالخيسة المدرسة .pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكيةالخيسة المدرسة .pdf', 'No File', 'No File', NULL, '', '0'),
(50, 5, 69, 'Villa Alkheesa Hajar', 'فيلا الخيسة حجر', '5', '540', '559799', '', '170', 'شارع 170', '2024064', 'مثمن', '70093653', '70/5', 'سند ملكيةفيلا الخيسة الجديدة 2_230513_105413.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/سند ملكيةفيلا الخيسة الجديدة 2_230513_105413.pdf', 'No File', 'No File', 0, 'No File', '0'),
(51, 12, 13, 'Test Onexxxx', 'تجربة واحد', '01', '50000', '001', '', '01', 'St01', '1500000', 'مثمن', '13569645', '13/01', 'No File', 'No File', 'No File', 'No File', 0, 'No File', '0'),
(52, 5, 10, 'Test two', 'تجربة إثنان', '020', '5000', '02002', '20/10/2014', '20', 'ST20', '50000', 'مثمن', '12569658', '12/020', 'Jud 1.pdf', '/English/Main_Application/Ownership_Images/Ownership_Certificate/Jud 1.pdf', 'Wolfgang 1.pdf', '/English/Main_Application/Ownership_Images/Property_Scheme/Wolfgang 1.pdf', 0, 'No File', '0'),
(53, 9, 15, 'test Three', 'تجربة ثالثة', '030', '565656', '03003', '', '30', 'ST30', '5656565', ' ', '15696554', '15/030', 'No File', 'No File', 'No File', 'No File', 0, 'No File', '0'),
(54, 10, 25, 'Test Four Property', 'ملكية تجربة رابعة', '040', '600', '04004', '', '04', 'ST04', '400000', 'تقديري', '23659258', '23/040', 'No File', 'No File', 'No File', 'No File', 0, 'No File', '0');

-- --------------------------------------------------------

--
-- Table structure for table `payment_frequency`
--

CREATE TABLE `payment_frequency` (
  `Payment_Frequency_Id` int(11) NOT NULL,
  `Payment_English_Frequency` varchar(200) NOT NULL,
  `Payment_Arabic_Frequency` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `payment_type_Id` int(11) NOT NULL,
  `payment_English_type` varchar(200) NOT NULL,
  `payment_Arabic_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type_Id`, `payment_English_type`, `payment_Arabic_type`) VALUES
(1, 'Annually', 'سنويا'),
(2, 'Monthly', 'شهريا'),
(3, 'Half a year', 'نصف سنة'),
(4, 'Quarter of a year', 'ربع سنة'),
(5, 'Advsnce', 'مقدم');

-- --------------------------------------------------------

--
-- Table structure for table `periodec_maintenance_new`
--

CREATE TABLE `periodec_maintenance_new` (
  `Periodec_Maintenance_ID` int(11) NOT NULL,
  `Aseet_ID` varchar(50) DEFAULT NULL,
  `Employee_ID` varchar(50) DEFAULT NULL,
  `Datre` varchar(50) DEFAULT NULL,
  `Notic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `periodec_maintenance_new`
--

INSERT INTO `periodec_maintenance_new` (`Periodec_Maintenance_ID`, `Aseet_ID`, `Employee_ID`, `Datre`, `Notic`) VALUES
(1, '3', '2', '01/08/2022', 'XXXXXXX');

-- --------------------------------------------------------

--
-- Table structure for table `periodic_maintenence`
--

CREATE TABLE `periodic_maintenence` (
  `Periodic_Maintenence_ID` int(11) NOT NULL,
  `Asset_ID` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_1` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_1` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_1` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_2` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_2` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_2` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_3` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_3` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_3` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_4` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_4` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_4` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_5` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_5` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_5` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_6` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_6` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_6` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_7` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_7` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_7` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_8` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_8` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_8` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_9` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_9` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_9` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_10` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_10` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_10` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_11` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_11` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_11` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `M_12` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `E_M_12` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `D_M_12` varchar(200) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Year` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Last_Periodic_Maintenance_Date` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `periodic_maintenence`
--

INSERT INTO `periodic_maintenence` (`Periodic_Maintenence_ID`, `Asset_ID`, `M_1`, `E_M_1`, `D_M_1`, `M_2`, `E_M_2`, `D_M_2`, `M_3`, `E_M_3`, `D_M_3`, `M_4`, `E_M_4`, `D_M_4`, `M_5`, `E_M_5`, `D_M_5`, `M_6`, `E_M_6`, `D_M_6`, `M_7`, `E_M_7`, `D_M_7`, `M_8`, `E_M_8`, `D_M_8`, `M_9`, `E_M_9`, `D_M_9`, `M_10`, `E_M_10`, `D_M_10`, `M_11`, `E_M_11`, `D_M_11`, `M_12`, `E_M_12`, `D_M_12`, `Year`, `Last_Periodic_Maintenance_Date`) VALUES
(1, '1', '09/01/2023', '4', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2023', '09/01/2023'),
(2, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023', '09/01/2023'),
(3, '2', '05/01/2022', '2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2023', '05/01/2022'),
(4, '3', '16/01/2022', '2', '55555', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2023', '16/01/2022');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_delivery`
--

CREATE TABLE `pickup_delivery` (
  `Pickup_Delivery_Id` int(11) NOT NULL,
  `Unit_Id` varchar(200) DEFAULT NULL,
  `Tenant_ID` varchar(200) DEFAULT NULL,
  `Type` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL,
  `Prosses` varchar(200) DEFAULT NULL,
  `Discription` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pickup_delivery`
--

INSERT INTO `pickup_delivery` (`Pickup_Delivery_Id`, `Unit_Id`, `Tenant_ID`, `Type`, `Status`, `Note`, `Date`, `Prosses`, `Discription`) VALUES
(1, '35', NULL, 'المفاتيح', '1', 'Test Test', '18/03/2023', '2', NULL),
(2, '35', NULL, 'الأثاث', '1', 'Test Test', '18/03/2023', '2', NULL),
(3, '35', NULL, 'الأجهزة المنزلية', '1', '', '18/03/2023', '2', NULL),
(4, '35', NULL, 'المطبخ', '2', 'Test Test', '18/03/2023', '2', NULL),
(5, '35', NULL, 'المنافذ الكهربائية', '2', '', '18/03/2023', '2', NULL),
(6, '35', NULL, 'الأرضيات', '1', 'Test Test', '18/03/2023', '2', NULL),
(7, '35', NULL, 'الحمامات / غرف الغسيل', '1', '', '18/03/2023', '2', NULL),
(8, '35', NULL, 'الجدران و الأسقف', '1', '', '18/03/2023', '2', NULL),
(9, '35', NULL, 'الأبواب', '', '', '18/03/2023', '2', NULL),
(10, '35', NULL, 'النوافذ', '2', 'Test Test', '18/03/2023', '2', NULL),
(11, '35', NULL, 'المكيفات', '1', '', '18/03/2023', '2', NULL),
(12, '93', NULL, 'المفاتيح', '1', 'Test Test', '19/03/2023', '1', NULL),
(13, '93', NULL, 'الأثاث', '2', '', '19/03/2023', '1', NULL),
(14, '93', NULL, 'الأجهزة المنزلية', '1', 'Test Test', '19/03/2023', '1', NULL),
(15, '93', NULL, 'المطبخ', '2', '', '19/03/2023', '1', NULL),
(16, '93', NULL, 'المنافذ الكهربائية', '1', 'Test Test', '19/03/2023', '1', NULL),
(17, '93', NULL, 'الأرضيات', '2', '', '19/03/2023', '1', NULL),
(18, '93', NULL, 'الحمامات / غرف الغسيل', '1', 'Test Test', '19/03/2023', '1', NULL),
(19, '93', NULL, 'الجدران و الأسقف', '2', '', '19/03/2023', '1', NULL),
(20, '93', NULL, 'الأبواب', '1', 'Test Test', '19/03/2023', '1', NULL),
(21, '93', NULL, 'النوافذ', '1', '', '19/03/2023', '1', NULL),
(22, '93', NULL, 'المكيفات', '1', '', '19/03/2023', '1', NULL),
(23, '124', '130', 'المفاتيح', '1', '', '12/05/2023', '2', NULL),
(24, '124', '130', 'الأثاث', '1', '', '12/05/2023', '2', NULL),
(25, '124', '130', 'الأجهزة المنزلية', '1', '', '12/05/2023', '2', NULL),
(26, '124', '130', 'المطبخ', '1', '', '12/05/2023', '2', NULL),
(27, '124', '130', 'المنافذ الكهربائية', '2', '', '12/05/2023', '2', NULL),
(28, '124', '130', 'الأرضيات', '2', '', '12/05/2023', '2', NULL),
(29, '124', '130', 'الحمامات / غرف الغسيل', '2', '', '12/05/2023', '2', NULL),
(30, '124', '130', 'الجدران و الأسقف', '1', '', '12/05/2023', '2', NULL),
(31, '124', '130', 'الأبواب', '1', '', '12/05/2023', '2', NULL),
(32, '124', '130', 'النوافذ', '2', '', '12/05/2023', '2', NULL),
(33, '124', '130', 'المكيفات', '1', '', '12/05/2023', '2', NULL),
(34, '124', '130', 'ملاحظات', '0', NULL, '12/05/2023', '2', 'ملاحظات تجربة \r\n ');

-- --------------------------------------------------------

--
-- Table structure for table `real_estate_investment`
--

CREATE TABLE `real_estate_investment` (
  `Id` int(11) NOT NULL,
  `Year` varchar(200) DEFAULT NULL,
  `Value` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `real_estate_investment`
--

INSERT INTO `real_estate_investment` (`Id`, `Year`, `Value`, `Name`) VALUES
(7, '2021', '2834500', 'فيلا غرافة الريان '),
(8, '2022', '2333333', 'فيلا الخيسة مدرسة ');

-- --------------------------------------------------------

--
-- Table structure for table `reason_for_rent`
--

CREATE TABLE `reason_for_rent` (
  `Reason_For_Rent_Id` int(11) NOT NULL,
  `Reason_AR_For_Rent` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Reason_En_For_Rent` varchar(200) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reason_for_rent`
--

INSERT INTO `reason_for_rent` (`Reason_For_Rent_Id`, `Reason_AR_For_Rent`, `Reason_En_For_Rent`) VALUES
(1, 'سكن عائلي', 'family residence'),
(2, 'سكن عذاب', 'Singel  residence'),
(3, 'عمل تجاري', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `relateddocuments`
--

CREATE TABLE `relateddocuments` (
  `DocId` int(11) NOT NULL,
  `TransactionTime` datetime DEFAULT NULL,
  `TransactionByUser` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Ownership` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Building` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Unit` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Tenant` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Contract` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Note` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requst_source`
--

CREATE TABLE `requst_source` (
  `Requst_Source_id` int(11) NOT NULL,
  `Ar_Requst_Source` varchar(200) DEFAULT NULL,
  `En_Requst_Source` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requst_source`
--

INSERT INTO `requst_source` (`Requst_Source_id`, `Ar_Requst_Source`, `En_Requst_Source`) VALUES
(1, 'عميل', 'Tenant'),
(2, 'رقابة', 'supervision'),
(3, 'أخرى', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Role_ID` int(11) NOT NULL,
  `Role_name` varchar(200) DEFAULT NULL,
  `properties` varchar(200) DEFAULT NULL,
  `Contracting` varchar(200) DEFAULT NULL,
  `Customer_Affairs` varchar(200) DEFAULT NULL,
  `Asset_Management` varchar(200) DEFAULT NULL,
  `Collecting` varchar(200) DEFAULT NULL,
  `Financial_Statements` varchar(200) DEFAULT NULL,
  `Marketing` varchar(200) DEFAULT NULL,
  `Task_Management` varchar(200) DEFAULT NULL,
  `Deficiency_Detection` varchar(200) DEFAULT NULL,
  `System_Settings` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Role_ID`, `Role_name`, `properties`, `Contracting`, `Customer_Affairs`, `Asset_Management`, `Collecting`, `Financial_Statements`, `Marketing`, `Task_Management`, `Deficiency_Detection`, `System_Settings`) VALUES
(1, 'Super Admin', 'R,A,E,D', 'R,A,E,D', 'R,A,E,D', 'R,A,E,D', 'R,0,0,0', 'R,A,E,D', 'R,A,E,D', 'R,A,E,D', 'R,0,E,0', 'R'),
(2, 'Admin', 'R,A,E,D', 'R,A,E,D', 'R,A,E,D', 'R,A,E,D', 'R,0,E,0', 'R,A,E,D', 'R,A,E,D', 'R,A,E,D', 'R,0,E,0', 'R'),
(3, 'محاسب المنارة', '0,0,0,0', '0,0,0,0', '0,0,0,0', '0,0,0,0', 'R,E', 'R,A,E,D', '0,0,0,0', '0,0,0,0', '0,0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sub_type_evaluation`
--

CREATE TABLE `sub_type_evaluation` (
  `Sub_Type_Evaluation_Id` int(11) NOT NULL,
  `Main_Type_Evaluation_Id` varchar(50) DEFAULT NULL,
  `Ar_Name` varchar(200) DEFAULT NULL,
  `En_Name` varchar(200) DEFAULT NULL,
  `Sub_Weight` varchar(200) DEFAULT NULL,
  `R_Sub_Weight` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_type_evaluation`
--

INSERT INTO `sub_type_evaluation` (`Sub_Type_Evaluation_Id`, `Main_Type_Evaluation_Id`, `Ar_Name`, `En_Name`, `Sub_Weight`, `R_Sub_Weight`) VALUES
(1, '1', 'شيك مرتجع', 'Chueqe Back', '30', '18'),
(2, '1', 'طلب تأجيل', 'Request for postponement', '40', '24'),
(3, '1', 'تأخير في الدفع', 'delay in payment', '30', '18'),
(4, '2', 'شكوى من الجيران', 'A complaint from the neighbors', '25', '10'),
(5, '2', 'شكوى من الرقابة', 'Censorship complaint', '25', '10'),
(6, '2', 'شكوى من جهات أخرى', 'Complaint from others', '50', '20');

-- --------------------------------------------------------

--
-- Table structure for table `task_management`
--

CREATE TABLE `task_management` (
  `Task_Management_ID` int(11) NOT NULL,
  `Task_Type` longtext,
  `Department_Id` varchar(45) DEFAULT NULL,
  `Employee_Id` varchar(45) DEFAULT NULL,
  `Task_Descrioption` longtext,
  `Start_date` varchar(200) DEFAULT NULL,
  `End_Date` varchar(200) DEFAULT NULL,
  `Actual_End_Date` varchar(200) DEFAULT NULL,
  `Task_Status` varchar(45) DEFAULT NULL,
  `Task_Priority` varchar(45) DEFAULT NULL,
  `Task_Priority_Word` varchar(45) DEFAULT NULL,
  `Notification_Activ` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task_management`
--

INSERT INTO `task_management` (`Task_Management_ID`, `Task_Type`, `Department_Id`, `Employee_Id`, `Task_Descrioption`, `Start_date`, `End_Date`, `Actual_End_Date`, `Task_Status`, `Task_Priority`, `Task_Priority_Word`, `Notification_Activ`) VALUES
(10, 'تبييض التدفق العملياتي', '3', '4', 'ok', '08/02/2023', '03/01/2023', '', 'إنتظار', '1', 'اولوية من الدرجة الأولى', '0'),
(11, 'تجديد العقود ', '1', '2', 'تجديد العقود القريبة على الانتهاء ', '28/02/2023', '12/03/2023', NULL, 'معلقة', '2', 'اولوية من الدرجة الثانية', '0'),
(12, 'رسم الخرائط ', '5', '', 'رسم الخرائط الناقصة ', '28/02/2023', '11/03/2023', NULL, 'معلقة', '3', 'اولوية من الدرجة الثالثة', '0'),
(13, ' استخراج سندات ملكية ', '4', '', '', '22/02/2023', '12/03/2023', NULL, 'معلقة', '4', 'اولوية من الدرجة الرابعة', '0'),
(14, 'دفع مخالفات  ', '1', '', '', '28/02/2023', '30/03/2023', NULL, 'معلقة', '5', 'اولوية من الدرجة الخامسة', '0'),
(15, 'XXXXX', '1', '2', 'dadadadadad', '13/07/2023', '23/07/2023', NULL, 'معلقة', '2', 'Second Level Priority', '0');

-- --------------------------------------------------------

--
-- Table structure for table `task_part`
--

CREATE TABLE `task_part` (
  `Task_Part_Id` int(11) NOT NULL,
  `Task_Id` varchar(45) DEFAULT NULL,
  `Task_Part_Discription` longtext,
  `Status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `task_type`
--

CREATE TABLE `task_type` (
  `Task_Type_Id` int(11) NOT NULL,
  `Task_Arabic_Type` varchar(200) DEFAULT NULL,
  `Task_English_Type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task_type`
--

INSERT INTO `task_type` (`Task_Type_Id`, `Task_Arabic_Type`, `Task_English_Type`) VALUES
(1, 'اضافة ملكيات', 'Add Ownership'),
(2, 'اضافة أبنية', 'Add Building');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `Tenants_ID` int(11) NOT NULL,
  `tenant_type_Tenant_Type_Id` int(11) NOT NULL,
  `nationality_nationality_ID` int(11) NOT NULL,
  `Tenants_English_Name` varchar(200) NOT NULL,
  `Tenants_Arabic_Name` varchar(200) NOT NULL,
  `Tenants_Tell` varchar(200) DEFAULT NULL,
  `Tenants_Mobile` varchar(200) NOT NULL,
  `Tenants_Fax` varchar(200) DEFAULT NULL,
  `Tenants_Email` varchar(200) NOT NULL,
  `Tenants_Address` varchar(200) NOT NULL,
  `Tenants_Nationality_Address` varchar(200) NOT NULL,
  `ID_NO` varchar(200) DEFAULT NULL,
  `ID_Expiry` varchar(200) DEFAULT NULL,
  `business_records` varchar(200) DEFAULT NULL,
  `P_O_Box` varchar(200) DEFAULT NULL,
  `Tenants_QId` varchar(200) NOT NULL,
  `Tenants_QId_Path` varchar(200) NOT NULL,
  `PassPort` varchar(200) NOT NULL,
  `PassPort_Path` varchar(200) NOT NULL,
  `business_records_FileName` varchar(200) DEFAULT NULL,
  `business_records_Path` varchar(200) DEFAULT NULL,
  `Company_registration_No` varchar(200) DEFAULT NULL,
  `Company_registration_FileName` varchar(200) DEFAULT NULL,
  `Company_registration_Path` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`Tenants_ID`, `tenant_type_Tenant_Type_Id`, `nationality_nationality_ID`, `Tenants_English_Name`, `Tenants_Arabic_Name`, `Tenants_Tell`, `Tenants_Mobile`, `Tenants_Fax`, `Tenants_Email`, `Tenants_Address`, `Tenants_Nationality_Address`, `ID_NO`, `ID_Expiry`, `business_records`, `P_O_Box`, `Tenants_QId`, `Tenants_QId_Path`, `PassPort`, `PassPort_Path`, `business_records_FileName`, `business_records_Path`, `Company_registration_No`, `Company_registration_FileName`, `Company_registration_Path`) VALUES
(2, 1, 163, 'Shahad Kandasil', 'شهد كانداسيل', '50067988', '50067988', '', '', '', '', '28735602092', '', '', '', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', '', '', '', '', ''),
(3, 1, 44, 'Gokkhan Kurban', 'كهوكان كوربان', '66221695', '66221695', '', '', '', '', '28705005739', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(4, 1, 120, 'Sabinus Ugochukwu Duru', 'سبونوس وجكوة درو', '70797231', '70797231', '', '', '', '', '28656600478', '24/04/2022', NULL, NULL, 'ام غويلينة الجديدة شقة 3.pdf', '/English/Main_Application/Tenant_QID/ام غويلينة الجديدة شقة 3.pdf', 'ام غويلينة الجديدة شقة 3.pdf', '/English/Main_Application/Tenant_Passport/ام غويلينة الجديدة شقة 3.pdf', NULL, NULL, NULL, NULL, NULL),
(5, 1, 44, 'Maktar hussein shamoun', 'مكتر حسين شمون', '55517067', '55517067', '', '', '', '', '28705025589', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(6, 1, 27, 'Giulito Flamble', 'جوليتو فلامبل', '50789059', '50789059', '', '', '', '', '26560807476', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(7, 1, 19, 'Mohammed Nehal Akther', 'محمد نيهل أكتار', '33838491', '33838491', '', '', '', '', '27835634095', '10/1/2022', NULL, NULL, 'ام غويلينة الجديدة شقة 6.pdf', '/English/Main_Application/Tenant_QID/ام غويلينة الجديدة شقة 6.pdf', 'ام غويلينة الجديدة شقة 6.pdf', '/English/Main_Application/Tenant_Passport/ام غويلينة الجديدة شقة 6.pdf', NULL, NULL, NULL, NULL, NULL),
(8, 1, 19, 'Mustafa Abdullah Kuti', 'مصطفى عبدالله كوتي', '66542432', '66542432', '', '', '', '', '28735601086', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(9, 1, 44, 'A K M Sikander Hossain', 'ايه كي أم سكيندر حسين', '33204089', '33204089', '', '', '', '', '28805005223', '8/9/2022', NULL, NULL, 'ام غويلينة الجديدة شقة 10.pdf', '/English/Main_Application/Tenant_QID/ام غويلينة الجديدة شقة 10.pdf', 'ام غويلينة الجديدة شقة 10.pdf', '/English/Main_Application/Tenant_Passport/ام غويلينة الجديدة شقة 10.pdf', NULL, NULL, NULL, NULL, NULL),
(10, 1, 44, 'Mohamed Shamso Miyah Mohammed Ali', 'محمد شمسو مياه محمد علي', '66752176', '66752176', '', '', '', '', '26305000575', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(11, 1, 19, 'Ismail Nelkat Kolek', 'اسماعيل نلكات كوليك', '66907260', '66907260', '', '', '', '', '28735604732', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(12, 1, 97, 'Waleed Ahmed Khazal', 'وليد احمد خزعل', '33507932', '33507932', '', '', '', '', '27742200491', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(13, 1, 116, 'ASHOK LAMA', 'اشوك لاما', '50911682', '50911682', '', '', '', '', '28552450500', '28/11/2023', NULL, NULL, 'ام غويلينة الجديدة شقة 20.pdf', '/English/Main_Application/Tenant_QID/ام غويلينة الجديدة شقة 20.pdf', 'ام غويلينة الجديدة شقة 20.pdf', '/English/Main_Application/Tenant_Passport/ام غويلينة الجديدة شقة 20.pdf', NULL, NULL, NULL, NULL, NULL),
(14, 1, 141, 'Abdi Ismail Rageh', 'عبدي اسماعيل راجه', '55496397', '55496397', '', '', '', '', '26570600025', '11/9/2022 55', NULL, NULL, 'ام غويلينة الجديدة 21.pdf', '/English/Main_Application/Tenant_QID/ام غويلينة الجديدة 21.pdf', 'ام غويلينة الجديدة 21.pdf', '/English/Main_Application/Tenant_Passport/ام غويلينة الجديدة 21.pdf', NULL, NULL, NULL, NULL, NULL),
(15, 1, 19, 'Afzal Kareem', 'افزال كريم', '70096672', '70096672', '', '', '', '', '27235612887', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(16, 1, 70, 'Islam Mohammad Khalaf Ahmed', 'إسلام محمد خلف أحمد', '30366040', '30366040', '', '', '', '', '28881805807', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(17, 1, 19, 'Perumalsamy Balasubramanian', 'بيرومالسامي بالاسوبرامانيان', '55704747', '55704747', '', '', '', '', '28135643919', '24/04/2023', NULL, NULL, 'شقة 2.pdf', '/English/Main_Application/Tenant_QID/شقة 2.pdf', 'شقة 2.pdf', '/English/Main_Application/Tenant_Passport/شقة 2.pdf', NULL, NULL, NULL, NULL, NULL),
(18, 1, 27, 'Edward Mojado Berdos', 'ايدورد موجادو بيردوس', '4445155', '4445155', '', '', '', '', '27760819341', '18/10/2022', NULL, NULL, 'شقة 3.pdf', '/English/Main_Application/Tenant_QID/شقة 3.pdf', 'شقة 3.pdf', '/English/Main_Application/Tenant_Passport/شقة 3.pdf', NULL, NULL, NULL, NULL, NULL),
(19, 1, 91, 'Amjad Zaid', 'امجد يحيى حسن أبو زيد', '55206105', '55206105', '', '', '', '', '28540001132', '27/02/2022', NULL, NULL, 'شقة 4.pdf', '/English/Main_Application/Tenant_QID/شقة 4.pdf', 'شقة 4.pdf', '/English/Main_Application/Tenant_Passport/شقة 4.pdf', NULL, NULL, NULL, NULL, NULL),
(20, 1, 44, ' Borhan Uddin MD Anatur Rahman ', ' برهان محمد ', '55148460', '55148460', '', '', 'rented 11 units from 1 to 11 on the building number 55/ street 810 /zone 27', '', '28505000899', '22/02/2024', '', '', 'ام غويلينة الكبرى 11 شقة.pdf', '/English/Main_Application/Tenant_QID/ام غويلينة الكبرى 11 شقة.pdf', 'ام غويلينة الكبرى 11 شقة.pdf', '/English/Main_Application/Tenant_Passport/ام غويلينة الكبرى 11 شقة.pdf', '', '', '', '', ''),
(21, 2, 165, 'Vodafone', 'فودافون', '', '0', '', '', '', 'Null', '', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(22, 1, 19, 'Jagadeswara Reddy Panjugulla', 'جكاد يشوارا ريدي بنجيكولا', '50137714', '50137714', '', '', '', '', '28635677091', '15/06/2022', NULL, NULL, 'شقة 5.pdf', '/English/Main_Application/Tenant_QID/شقة 5.pdf', 'شقة 5.pdf', '/English/Main_Application/Tenant_Passport/شقة 5.pdf', NULL, NULL, NULL, NULL, NULL),
(23, 1, 19, 'Bevin Viginarah', 'بيفين فيجيناراه', '70618952', '70618952', '', '', '', '', '28735622113', '26/03/2023', '', '', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', '', '', '', '', ''),
(24, 1, 19, 'Rajesh Bit Yan', 'راجيش بت يان', '70651954', '70651954', '', '', '', '', '26735616475', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(25, 1, 152, 'SANA JEMAI', 'سناء الجميعي', '31315274', '31315274', '', '', '', '', '28478801085', '28/05/2022', NULL, NULL, 'شقة 8.pdf', '/English/Main_Application/Tenant_QID/شقة 8.pdf', 'شقة 8.pdf', '/English/Main_Application/Tenant_Passport/شقة 8.pdf', NULL, NULL, NULL, NULL, NULL),
(26, 1, 70, 'Mohamed Qabeel Mohamed Ali', 'محمد قابيل محمد علي', '33562557', '33562557', '', '', '', '', '28681811844', '11/10/2023', '', '', 'شقة 9.pdf', '/English/Main_Application/Tenant_QID/شقة 9.pdf', 'شقة 9.pdf', '/English/Main_Application/Tenant_Passport/شقة 9.pdf', '', '', '', '', ''),
(27, 1, 113, 'Mohamed Eljannus', 'محمد الخنوس', '50166278', '50166278', '', '', '', '', '28950400881', '19/06/2022', NULL, NULL, 'شقة 10.pdf', '/English/Main_Application/Tenant_QID/شقة 10.pdf', 'شقة 10.pdf', '/English/Main_Application/Tenant_Passport/شقة 10.pdf', NULL, NULL, NULL, NULL, NULL),
(28, 1, 19, 'Shwayta Kristi Orkyam', 'شويتا كريستى اوركيام', '33708856', '33708856', '', '', '', '', '28435675426', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'شقة 11.pdf', '/English/Main_Application/Tenant_Passport/شقة 11.pdf', NULL, NULL, NULL, NULL, NULL),
(29, 1, 70, 'Ahmed Nabil Abedalazez Abedalbast', 'احمد نبيل عبد الغزيز عبدالباسط', '5573821', '55573821', '', '', '', '', '28281807027', '23/05/2024', '', '', 'شقة 12.pdf', '/English/Main_Application/Tenant_QID/شقة 12.pdf', 'شقة 12.pdf', '/English/Main_Application/Tenant_Passport/شقة 12.pdf', '', '', '', '', ''),
(30, 1, 19, 'Najer Nasser', 'ناجير ناصر', '55157676', '55157676', '', '', '', '', '29535602105', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(31, 1, 19, 'Surakshith Kumar Ramesh Seena', 'سوراكشيث كومار', '66304607', '66304607', '', '', '', '', '28735621560', '22/07/2022', NULL, NULL, 'شقة 14.pdf', '/English/Main_Application/Tenant_QID/شقة 14.pdf', 'شقة 14.pdf', '/English/Main_Application/Tenant_Passport/شقة 14.pdf', NULL, NULL, NULL, NULL, NULL),
(32, 1, 70, 'Ahmed Saeed Abdeslam ', 'احمد سعيد عبد السلام ', '66680433', '66680433', '', '', '', '', '27981806006', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(33, 1, 27, 'Luz Vimi Anda Salvani', 'لوز فيمينداسالفاني', '6698577', '6698577', '', '', '', '', '27460810938', '', NULL, NULL, 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', NULL, NULL, NULL, NULL, NULL),
(34, 1, 123, 'Abul Hassan Karim', 'ابول حسن كريم', '6636972', '6636972', '', '', '', '', '27658603033', '', '', '', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/Main_Image/empty_Image.jpg', '', '', '', '', ''),
(40, 1, 166, 'Monzer Saleem Faraj Qrinawi', 'منذر سليم فرج القرناوي', '55854972', '55854972', '', '', '', '', '27799900232', '03/07/2022', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(41, 2, 165, 'Property Venture Qatar', 'شركة بروبرتي فنشر قطر', '55805309', '55805309', '', '', '', 'Null', '12-8241-00', '03/11/2021', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(42, 2, 165, 'Kaheel Company', 'شركة كحيل', '55805309', '55805309', '', '', '', 'Null', '', '', '39286', '47681', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(43, 2, 165, 'AL Baraka International', 'البركة العالمية', '31000046', '31000046', '', '', '', 'Null', '', '', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(47, 1, 44, 'Mohammad Khan', 'محمد خان زينات خان', '50475149', '50475149', '', '', '', '', '25905001689', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(48, 2, 165, 'Hadook Trading and Contracting Real Estate', 'هادوك تريدينغ اند كونتراكتينغ ريل استيت', '30207090', '66983786', '', '', '', 'Null', '17-1871-40', '06/02/2022', '141309', '217', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(49, 1, 44, 'Nasser Al Din Mohamed Idris Ali', 'ناصرالدين محمد ادريس علي', '77770943', '77770943', '', '', '', '', '27305001423', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(50, 2, 165, 'Al Saltanah Lights', 'اضواء السلطنة', '30030650', '30030650', '', '', '', 'Null', '', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(51, 1, 44, 'MD MOZIBURRAHMAN MD ABDULBARAK', 'محمد مجيب الرحمن محمد عبد البارك', '77090455', '77090455', '', '', '', '', '26705000500', '02/05/2020', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(52, 3, 165, 'Government Housing and Building Department', 'الاسكان الحكومي', '', '0', '', '', '', 'Null', '', '', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(53, 1, 44, 'Mohammad Sayedur Rahman', 'الاولمحمد رحمان', '30207090', '66665935', '', '', '', '', '27805009671', '05/06/2021', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(54, 1, 19, 'Chakanat Panamkiti Sassi Kumar', 'شاكانات بانامكيتي ساسي كومار', '55267813', '55267813', '', '', '', '', '25735601989', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(55, 2, 165, 'Cobalt Trading And Contracting Company', 'شركة كوبالت تريدينج اند كونتراكتينغ', '55947576', '55947576', '', '', '61639 ', 'Null', '61639', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(56, 1, 130, 'Khalifa Saeed Ramadan Al Otaibi', 'خليفة سعيد رمضان العتيبي', '66249867', '66528649', '', '', '', '', '27363401813', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(57, 1, 44, 'Fazhla Rabi', 'فظلا  رابي', '50739912', '50739912', '', '', '', '', '28105013241', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(58, 2, 165, 'Fast and Care  Trading and Car  maintenance', 'فاست اند كاير للتجارة وصيانة السيارات', '33357687', '33357687', '', '', '', 'Null', '162655', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(59, 2, 165, 'Jurkha Bike Readers Trading', 'جورخا بايك ريديرس تريدينغ', '74745253', '74745253', '', '', '', 'Null', '152858', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(60, 1, 165, 'Mohamed Ali Al Ansari', 'محمد علي الانصاري', '55372779', '55372779', '', '', '', '', '2593400347', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(61, 2, 165, 'Sky Moon Trading and Contracting', 'قمر السماء للتجارة والمقاولات', '66664983', '66664983', '', '', '', 'Null', '119146', '', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(62, 1, 58, 'Sauer Ngino Nata', 'ساور نجينو ناتا', '55012375', '55012375', '', '', '', '', '28912000039', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(63, 1, 44, 'Didar Azizullah', 'ديدار عزيز الله', '33585856', '33585856', '', '', '', '', '27305004727', '01/05/2021', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(64, 1, 44, 'Stan', 'ستان', '50285504', '50285504', '', '', '', '', '', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(65, 1, 44, 'Canyon', 'كانيون', '55510503', '55510503', '', '', '', '', '', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(66, 1, 123, 'Aagaz Ahmad Khan Mubashir Ahmad', 'اعجاز احمد خان مبشر احمد', '66684541', '66684541', '', '', '', '', '26958600778', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(67, 2, 165, 'Dar Al Widad Real Estate ', 'دار الوداد للعقارات', '55852431', '44423965', '', '', '', 'Null', '161010', '', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(68, 1, 165, 'Talal Al Dosari', 'طلال الدوسري', '55708615', '55708615', '', '', '', '', '', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(69, 1, 165, 'Joanna', 'جوانا', '74038292', '74038292', '', '', '', '', '', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(70, 1, 27, 'Nathan Delos Reyes Biala', 'ناثان ديلوس ريس بيلا', '55056062', '55056062', '', '', '', '', '27560800377', '27/08/2020', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(73, 1, 88, 'Mehdi Rahimanian', 'مهدي رحيمانيان', '55303799', '55303799', '', '', '', '', '28036400141', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(74, 2, 165, 'Al Markhiya Restaurant', 'مطعم المرخية', '66113337', '70022822', '', '', '', 'Null', '156131', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(75, 1, 130, 'Abdullah Fahd Mohammed Al Fahd Al Nuaimi', 'عبدالله فهد محمد الفهد النعيمي', '70022822', '70022822', '', '', '', '', '29863401630', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(76, 2, 165, 'Mashakik Doha Restaurant', 'مطعم مشاكيك الدوحة', '77001997', '77001997', '', '', '', 'Null', '135842', '', '135842', '1117', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(77, 2, 165, 'Doha Light for Trading and Services', 'دوحة لايت للتجارة والخدمات ', '55439758', '55439758', '', '', '', 'Null', '153239', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(78, 2, 165, 'Friends Burger Restaurant', 'مطعم فريندس برجر', '66333353', '66333353', '', '', '', 'Null', '150448', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(79, 2, 165, 'Oreedo', 'أوريدو', '0', '0', '', '', '', 'Null', '0', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(80, 1, 143, 'Mohammed Jaroof Ahmed Lebbe', 'محمد ظروف احمد لبي', '77707379', '77707379', '', '', '', '', '28314401048', '14/05/2023', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(81, 1, 44, 'Mujibur Rahman Talukar ', 'مجيب الرحمن تالوكار ', '55234480', '55234480', '', '', '', '', '2750500806', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(82, 1, 19, 'Kengo Mohamed Rashed', 'كنجو محمد راشيد', '70228830', '70228830', '', '', '', '', '27935602282', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(83, 1, 27, 'Marcel Baring Al Jabri', 'مارسيل بارنج الجابري ', '50191760', '50191760', '', '', '', '', '27560808003', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(84, 2, 165, 'Shine Technology Co', 'شركة شاين تكنولوجي', '33760074', '33760074', '', '', '', 'Null', '13-3740-00', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(85, 1, 130, 'Latifa Ali Rashid Al Khater', 'لطيفه علي راشد الخاطر', '55881281', '55881281', '', '', '', '', '26063401739', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(86, 1, 130, 'Mohammed Mubarak Saeed al Amer Al Kaabi', 'محمد مبارك سعيد ال عامر الكعبي', '', '', '', '', '', '', '26363400230', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(87, 2, 165, 'Lilas Furniture', 'ليلاس للمفروشات', '30000797', '30000797', '', '', '', 'Null', '130513', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(88, 2, 165, 'Sama Qalamoun Investment and Real Estate Management', 'سما القلمون للاستثمار وإدارة الأملاك العقارية', '44164168', '44164168', '', '', '', 'Null', '104457', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(89, 2, 165, ' Akdeniz Proje CO ', 'شركة آكدينيز بروجه', '', '', '', '', '', 'Null', '52041', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(90, 2, 165, 'British Standards Institution Middle East', 'شركة بريتش ستاندردز انستيتيوشن ميدل ايست', '44727280', '44727280', '', '', '', 'Null', '59887', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(91, 1, 166, 'Abdulrahman Rafiq Ahmed Samour', 'عبدالرحمن رفيق احمد سمور', '', '', '', '', '', '', '28699900206', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(92, 1, 166, 'Bilal Ismail Shadha Qudeih', 'بلال إسماعيل شدحه قديح', '', '', '', '', '', '', '28799900484', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(93, 1, 19, 'Abdul Shamir Badikal', 'عبدالشامير باديكال', '', '', '', '', '', '', '2773560706', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(94, 3, 165, 'Ministry of Finance', 'وزارة المالية', '', '', '', '', '', 'Null', '', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(96, 1, 166, 'Abdelrahman R A Sammour', 'عبد الرحمن رفيق احمد سمور ', '66269255', '66269255', '', '', '', '', '2869900206', '', NULL, NULL, 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL),
(97, 3, 165, 'Awqaf Ministry', 'وزارة الأوقاف', '', '', '', '', '', 'Null', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(98, 2, 165, 'Sahara', 'صحارى لادارة المرافق والمقاولات', '', '', '', '', '', 'Null', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '17183285', 'No File', 'No File'),
(99, 2, 165, 'Fast and Care', 'فاست اند كير للتجارة وصيانة السيارات', '', '33357787', '', '', '', 'Null', '', '', '162655', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(100, 2, 165, 'Mohamed Ali Al Ansari Auto Electricity ', 'محمد علي الانصاري لكهرباء السيارات ', '', '55372779', '', '', '', 'Null', '', '', '125593', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(101, 1, 19, 'Sudhakar yellu shivajl ressy ', 'سوداكار يلوو شيفاجي ريدي يلوو', '66345197', '66345197', '', '', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(102, 1, 70, 'Michael boules abdelmassih', 'مشيل بولس ندها عبد المسيح ', '50767299', '50767299', '', '', '', '', '28781805839', '5/6/2023', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(103, 2, 165, 'royl keer', 'رويال كير لتجارة واصلاح السيارات ', '33357687', '', '', '', '', 'Null', '', '', '178277', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(104, 2, 165, 'Q Solutions Company', 'شركة ق للحلول ', '0000000', '', '', '', '', 'Null', '', '', '46301', '16048', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(105, 1, 116, 'Kamal sherpa', 'كمال ششيربا', '', '', '', '', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(106, 2, 165, 'Al SAQUR co', 'شركة الصقر ', '44138888', '', '', '', '', 'Null', '', '', '', '201124', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(107, 1, 147, 'mohammad ashraf ', 'محمد اشرف اسامة عيسى ', '55376112', '0097455376112', '', '', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(108, 1, 70, 'Mohamed ElmaGraby', 'محمد المغربي عبدالرافع', '', '70009591', '', '', '', '', '', '03/08/2023', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(109, 1, 91, 'ali yousef ibrahim ', ' علي يوسف ابراهيم العطيات ', '74077800', '74077800', '', '', '', '', '', '11/09/2023', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(110, 1, 70, 'ALAA SALAMA HAMED AWADEIN', 'علاء سلامة حامد عوضين', '33616259', '33616259', '', 'gaalaa088@gmail.com', '', '', '28081810880', '13/04/2023', '', '', 'jpg2pdf.pdf', '/English/Main_Application/Tenant_QID/jpg2pdf.pdf', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(111, 1, 122, 'Said Mohamed S Albadarani', 'سعيد محمد سالم البدراني', '66117841', '66117841', '', '', '', '', '26051200002', '02/02/2021', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(112, 1, 43, 'Ali Ebrahim S A Al Fadhala', 'علي ابراهيم سند علي الفضالة', '33332404', '33332404', '', '', '', '', '26604800077', '30/05/2021', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(113, 1, 130, ' Saif Essa M K AL FADALA', 'سيف عيسى مبارك خليفة الفضالة', '55543334', '55543334', '', '', '', '', '26563400500', '27/12/2025', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(114, 1, 28, 'ayman ayyub', 'ايمن ايوب ', '30102321', '30102321', '', '', '', '', '29364300040', '28/09/2023', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(115, 2, 165, 'betrokim ', 'بتروكيم للهندسة والخدمات ', '55852431', '', '', '', '', 'Null', '', '', '35835', '37987', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '12-5175-00', 'No File', 'No File'),
(116, 2, 165, 'ragda', 'رغده الدوسري', '55708615', '', '', '', '', 'Null', '', '', '113236', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(117, 2, 165, '', 'مطاعم وحلويات جبري ', '55517067', '', '', '', '', 'Null', '', '', '21800', '158', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '11-3171-00', 'No File', 'No File'),
(118, 2, 165, '', 'شركة قطر للصباغة ', '55513142', '', '', '', '', 'Null', '', '', '27652', '120', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '11-8983-00', 'No File', 'No File'),
(119, 1, 83, '', 'محمد منتلا غودول ', '50285504', '', '', '', '', '', '29028800242', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(120, 1, 70, '', 'حسن الديدامونيالسيد خليل ', '55432015', '', '', '', '', '', '2688180006', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(121, 1, 130, '', 'حمد فهد جاسم عبدالعزيز ال ثاني ', '66113337', '', '', '', '', '', '27763402882', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(122, 1, 130, 'mohammad ', 'محمد فهد محمد النعيمي ', '70022822', '', '', '', '', '', '29663403499', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(123, 1, 1, 'jhjkgk', 'محمد', '', '', '', '', '', 'الدوحة', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(124, 1, 30, 'Aaaaa', 'تجربة', '66046374', '66046374', '', '', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(125, 1, 19, '', 'شهاب الدين كيناتيعيل', '', '30380916', '', '', '', '', '28935619435', '27/04/2025', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(126, 1, 19, '', 'محمد راشد باروكوت ', '', '', '', '', '', '', '2883566664', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(127, 1, 70, 'alaa shaban', 'علاء شعبان عطا السيد ', '77090455', '77090455', '', '', '', '', '27081801129', '26/07/2026', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(128, 1, 144, '', 'امير الطيب محمد الامير ', '55544018', '55544018', '', '', '', '', '29473602142', '29/11/2024', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(129, 1, 44, 'm', 'مستفيزور الرحمان ام دي امير اودين ', '', '55989338', '', '', '', '', '30105001122', '06/03/2025', '', '', 'No File', 'No File', 'No File', 'No File', '', '', '', '', ''),
(130, 1, 5, 'Test Test 2', 'تجربة تجربة 2', '123456789', '123456789', '123456789', 'Test@test.com', '', 'ْْْْْXXXXXXXXXXXXXX', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(131, 1, 44, 'mostafizur', 'مستفرور الرحمان امى دي امير اودين  ', '55989338', '55080338', '', '', '', '', '30105001122', '06/03/2025', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(132, 1, 130, ' ABDELA', 'عبدالله محمد عبدالله المطوع ', '66797970', '66797970', '', '', '', '', '28263400635', '01/01/2025', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(133, 1, 147, 'Ashraf Issa', 'اشرف عيسى', '55376112', '55376112', '', 'ashraf.90.issa@mail.com', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File'),
(134, 1, 1, 'test Three', 'تجربة ثالثة', '12345678', '1234567', '', '', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', '', 'No File', 'No File');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_accounts`
--

CREATE TABLE `tenant_accounts` (
  `Tenant_Accounts_Id` int(11) NOT NULL,
  `Tenant_ID` varchar(45) DEFAULT NULL,
  `User_Name` varchar(200) DEFAULT NULL,
  `Pass_Word` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenant_accounts`
--

INSERT INTO `tenant_accounts` (`Tenant_Accounts_Id`, `Tenant_ID`, `User_Name`, `Pass_Word`) VALUES
(1, '25', 'SANA', '456'),
(2, '48', 'Yazeed', '555'),
(3, '107', '', ''),
(4, '2', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_evaluation`
--

CREATE TABLE `tenant_evaluation` (
  `Tenant_Evaluation_Id` int(11) NOT NULL,
  `Tenant_Id` varchar(50) DEFAULT NULL,
  `Main_Type_Id` varchar(50) DEFAULT NULL,
  `Sup_Type_Id` varchar(50) DEFAULT NULL,
  `Weight` varchar(200) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenant_evaluation`
--

INSERT INTO `tenant_evaluation` (`Tenant_Evaluation_Id`, `Tenant_Id`, `Main_Type_Id`, `Sup_Type_Id`, `Weight`, `Date`) VALUES
(1, '124', '1', '1', '18', NULL),
(2, '124', '2', '4', '10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_notification`
--

CREATE TABLE `tenant_notification` (
  `Tenant_Notification_Id` int(11) NOT NULL,
  `Tenant_ID` varchar(50) DEFAULT NULL,
  `Request_Classification` varchar(50) DEFAULT NULL,
  `Seen` varchar(50) DEFAULT NULL,
  `From_Who` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenant_notification`
--

INSERT INTO `tenant_notification` (`Tenant_Notification_Id`, `Tenant_ID`, `Request_Classification`, `Seen`, `From_Who`) VALUES
(1, '25', 'بلاغ', '1', 'Ahmad'),
(2, '25', 'بلاغ', '1', 'Ahmad'),
(3, '25', 'بلاغ', '1', 'Ahmad'),
(4, '25', 'بلاغ', '1', 'Ahmad');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_sending`
--

CREATE TABLE `tenant_sending` (
  `Tenant_Sending_Id` int(11) NOT NULL,
  `Level` varchar(200) DEFAULT NULL,
  `EN_Level` varchar(200) DEFAULT NULL,
  `Type` varchar(200) DEFAULT NULL,
  `EN_Type` varchar(200) DEFAULT NULL,
  `Mounth` varchar(200) DEFAULT NULL,
  `Year` varchar(200) DEFAULT NULL,
  `Tenant_Tenant_Id` varchar(50) DEFAULT NULL,
  `User_Name` varchar(200) DEFAULT NULL,
  `User_EN_Name` varchar(200) DEFAULT NULL,
  `SMS` longtext,
  `Attatchment_File_Name` longtext,
  `Attatchment_File_Path` longtext,
  `Discription` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenant_sending`
--

INSERT INTO `tenant_sending` (`Tenant_Sending_Id`, `Level`, `EN_Level`, `Type`, `EN_Type`, `Mounth`, `Year`, `Tenant_Tenant_Id`, `User_Name`, `User_EN_Name`, `SMS`, `Attatchment_File_Name`, `Attatchment_File_Path`, `Discription`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, 'تجربة ', NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, '4', NULL, NULL, NULL, 'ملف تجربة', '/English/Main_Application/Tenant_Att/تعديلات الجمعة 3-3-2023.docx', 'تعديلات الجمعة 3-3-2023.docx'),
(3, NULL, NULL, NULL, NULL, NULL, NULL, '40', NULL, NULL, 'اختبار', NULL, NULL, NULL),
(4, 'عميل محدد', NULL, 'رسالة SMS', NULL, '3', '2023', '40', 'أحمد', NULL, 'السلام عليكم ', NULL, NULL, NULL),
(6, 'عميل محدد', NULL, 'رسالة SMS', NULL, '5', '2023', '107', 'أحمد', NULL, 'السلام عليكم تجربة ', NULL, NULL, NULL),
(7, 'عميل محدد', NULL, 'رسالة SMS', NULL, '5', '2023', '107', 'أحمد', NULL, 'السلام عليكم تجربة	2', NULL, NULL, NULL),
(8, 'عميل محدد', 'Specific Tenant', 'رسالة SMS', ' SMS', '7', '2023', '107', 'أحمد', 'Ahmad', 'test test test', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_type`
--

CREATE TABLE `tenant_type` (
  `Tenant_Type_Id` int(11) NOT NULL,
  `Tenant_English_Type` varchar(200) NOT NULL,
  `Tenant_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tenant_type`
--

INSERT INTO `tenant_type` (`Tenant_Type_Id`, `Tenant_English_Type`, `Tenant_Arabic_Type`) VALUES
(1, 'Individual', 'أفراد'),
(2, 'Corporate', 'شركة'),
(3, 'Government', 'حكومة');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `Transaction_Type_Id` int(11) NOT NULL,
  `Transaction_English_Type` varchar(200) NOT NULL,
  `Transaction_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`Transaction_Type_Id`, `Transaction_English_Type`, `Transaction_Arabic_Type`) VALUES
(1, 'transaction type One ', 'نمط أول');

-- --------------------------------------------------------

--
-- Table structure for table `transformation_bank`
--

CREATE TABLE `transformation_bank` (
  `transformation_Bank_ID` int(11) NOT NULL,
  `Bank_No` varchar(200) DEFAULT NULL,
  `Bank_No_En` varchar(200) DEFAULT NULL,
  `Bank_Id` varchar(200) DEFAULT NULL,
  `Bank_Name` varchar(200) DEFAULT NULL,
  `Bank_Name_En` varchar(200) DEFAULT NULL,
  `Account_No` varchar(200) DEFAULT NULL,
  `Account_No_En` varchar(200) DEFAULT NULL,
  `Soaft_Code_No` varchar(200) DEFAULT NULL,
  `Soaft_Code_No_En` varchar(200) DEFAULT NULL,
  `Bank_Adress` varchar(200) DEFAULT NULL,
  `Bank_Adress_En` varchar(200) DEFAULT NULL,
  `currency_type` varchar(200) DEFAULT NULL,
  `currency_type_En` varchar(200) DEFAULT NULL,
  `Beneficiary_Name` varchar(200) DEFAULT NULL,
  `Beneficiary_Name_En` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transformation_bank`
--

INSERT INTO `transformation_bank` (`transformation_Bank_ID`, `Bank_No`, `Bank_No_En`, `Bank_Id`, `Bank_Name`, `Bank_Name_En`, `Account_No`, `Account_No_En`, `Soaft_Code_No`, `Soaft_Code_No_En`, `Bank_Adress`, `Bank_Adress_En`, `currency_type`, `currency_type_En`, `Beneficiary_Name`, `Beneficiary_Name_En`) VALUES
(13, '1', '1', '11', 'مصرف الريان', 'AL RAYAN BANK', '344434', '344434', 'QA04MAFR00000000000344434100', 'QA04MAFR00000000000344434100', 'شارع حمد الكبير ', '', 'ريال قطري ', '', 'الشيخ فهد عبدالله سعود ال ثاني ', ''),
(14, '2', '2', '1', ' بنك قطر الوطني', 'QNB', '441001', '441001', 'QA61QNBA00000000019777441001', 'QA61QNBA00000000019777441001', 'الدوحة ', '', 'ريال قطري ', '', 'الشيخ فهدبن عبدالله سعود ال ثاني', '');

-- --------------------------------------------------------

--
-- Table structure for table `transformation_table`
--

CREATE TABLE `transformation_table` (
  `transformation_Table_ID` int(11) NOT NULL,
  `transformation_Bank_ID` varchar(200) DEFAULT NULL,
  `transformation_No` varchar(200) DEFAULT NULL,
  `transformation_Date` varchar(200) DEFAULT NULL,
  `Amount` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `tenant_Id` varchar(200) DEFAULT NULL,
  `Contract_Id` varchar(200) DEFAULT NULL,
  `Collection_Date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transformation_table`
--

INSERT INTO `transformation_table` (`transformation_Table_ID`, `transformation_Bank_ID`, `transformation_No`, `transformation_Date`, `Amount`, `Status`, `tenant_Id`, `Contract_Id`, `Collection_Date`) VALUES
(84, '13', '1', '01/01/2020', '79000', 'محصل', '52', '138', ''),
(85, '13', '2', '01/07/2020', '79000', 'محصل', '52', '138', ''),
(86, '13', '3', '01/01/2021', '79000', 'محصل', '52', '138', ''),
(87, '13', '4', '01/07/2021', '79000', 'محصل', '52', '138', ''),
(88, '13', '5', '01/01/2022', '79000', 'محصل', '52', '138', ''),
(89, '13', '6', '01/07/2022', '79000', 'محصل', '52', '138', ''),
(90, '13', '1', '01/01/2020', '48000', 'محصل', '52', '139', ''),
(91, '13', '2', '01/07/2020', '48000', 'محصل', '52', '139', '01/07/2020'),
(92, '13', '3', '01/01/2021', '48000', 'محصل', '52', '139', '01/10/2021'),
(93, '13', '4', '01/07/2021', '48000', 'محصل', '52', '139', '01/07/2021'),
(94, '13', '5', '01/01/2022', '48000', 'محصل', '52', '139', '01/01/2022'),
(95, '13', '6', '01/07/2022', '48000', 'محصل', '52', '139', '01/07/2022'),
(96, '13', '1', '01/01/2020', '66000', 'محصل', '52', '140', '01/01/2020'),
(97, '13', '2', '01/07/2020', '66000', 'محصل', '52', '140', '01/07/2020'),
(98, '13', '3', '01/01/2021', '66000', 'محصل', '52', '140', '01/01/2021'),
(99, '13', '4', '01/07/2021', '66000', 'محصل', '52', '140', '01/07/2021'),
(100, '13', '5', '01/01/2022', '66000', 'محصل', '52', '140', '01/01/2022'),
(101, '13', '6', '01/07/2022', '66000', 'محصل', '52', '140', '01/07/2022'),
(102, '13', '1', '01/01/2020', '69000', 'محصل', '52', '141', '01/01/2020'),
(103, '13', '2', '01/07/2020', '69000', 'محصل', '52', '141', '01/07/2020'),
(104, '13', '3', '01/01/2021', '69000', 'محصل', '52', '141', '01/01/2021'),
(105, '13', '4', '01/07/2021', '69000', 'محصل', '52', '141', '01/07/2021'),
(106, '13', '5', '01/01/2022', '69000', 'محصل', '52', '141', '01/01/2022'),
(107, '13', '6', '01/07/2022', '69000', 'محصل', '52', '141', '01/07/2022'),
(108, '13', '1', '01/01/2020', '79200', 'محصل', '52', '142', '01/01/2020'),
(109, '13', '2', '01/07/2020', '79200', 'محصل', '52', '142', '01/07/2020'),
(110, '13', '3', '01/01/2021', '79200', 'محصل', '52', '142', '03/01/2021'),
(111, '13', '4', '01/07/2021', '79200', 'محصل', '52', '142', '01/07/2021'),
(112, '13', '5', '01/01/2022', '79200', 'محصل', '52', '142', '02/01/2022'),
(113, '13', '6', '01/07/2022', '79200', 'محصل', '52', '142', '03/07/2021'),
(114, '13', '1', '01/01/2023', '45000', 'محصل', '106', '127', '02/02/2023'),
(115, '13', '2', '01/04/2023', '45000', 'محصل', '106', '127', '01/04/2023'),
(116, '13', '3', '01/07/2023', '45000', 'Collected', '106', '127', '14/07/2023'),
(118, '13', '4', '01/10/2023', '45000', 'غير محصل', '106', '127', NULL),
(119, '13', '5', '01/01/2024', '45000', 'غير محصل', '106', '127', NULL),
(120, '13', '6', '01/04/2024', '45000', 'غير محصل', '106', '127', NULL),
(121, '13', '7', '01/07/2024', '45000', 'غير محصل', '106', '127', NULL),
(122, '13', '8', '01/10/2024', '45000', 'غير محصل', '106', '127', NULL),
(123, '13', '9', '01/01/2024', '45000', 'غير محصل', '106', '127', NULL),
(124, '13', '10', '01/04/2024', '45000', 'غير محصل', '106', '127', NULL),
(125, '13', '11', '01/07/2024', '45000', 'غير محصل', '106', '127', NULL),
(126, '13', '12', '01/10/2024', '45000', 'غير محصل', '106', '127', NULL),
(127, '13', '13', '01/01/2025', '45000', 'غير محصل', '106', '127', NULL),
(128, '13', '14', '01/04/2025', '45000', 'غير محصل', '106', '127', NULL),
(129, '13', '15', '01/07/2025', '45000', 'غير محصل', '106', '127', NULL),
(130, '13', '16', '01/10/2025', '45000', 'غير محصل', '106', '127', NULL),
(131, '13', '17', '01/01/2026', '45000', 'غير محصل', '106', '127', NULL),
(132, '13', '18', '01/04/2026', '45000', 'غير محصل', '106', '127', NULL),
(133, '13', '19', '01/07/2026', '45000', 'غير محصل', '106', '127', NULL),
(134, '13', '20', '01/10/2026', '45000', 'غير محصل', '106', '127', NULL),
(136, '14', '2', '01/01/2023', '3500', 'محصل', '25', '7', '01/01/2023'),
(137, '14', '2', '01/02/2023', '3500', 'محصل', '25', '7', '01/02/2023'),
(138, '14', '3', '01/03/2023', '3500', 'محصل', '25', '7', '01/03/2023'),
(139, '14', '4', '01/04/2023', '3500', 'محصل', '25', '7', '07/04/2023'),
(140, '14', '5', '01/05/2023', '3500', 'غير محصل', '25', '7', NULL),
(141, '14', '6', '01/06/2023', '3500', 'غير محصل', '25', '7', NULL),
(142, '14', '7', '01/07/2023', '3500', 'غير محصل', '25', '7', NULL),
(143, '14', '8', '01/08/2023', '3500', 'غير محصل', '25', '7', NULL),
(144, '14', '9', '01/09/2023', '3500', 'غير محصل', '25', '7', NULL),
(145, '14', '10', '01/10/2023', '3500', 'غير محصل', '25', '7', NULL),
(146, '14', '11', '01/11/2023', '3500', 'غير محصل', '25', '7', NULL),
(147, '14', '12', '01/12/2023', '3500', 'غير محصل', '25', '7', NULL),
(148, '13', '1', '01/07/2020', '36000', 'محصل', '97', '100', '01/07/2020'),
(149, '13', '1', '01/12/2020', '36000', 'محصل', '97', '100', '01/12/2020'),
(150, '13', '1', '01/01/2023', '39600', 'محصل', '52', '150', '01/01/2023'),
(151, '13', '2', '01/04/2023', '39600', 'محصل', '52', '150', '01/04/2023'),
(152, '13', '3', '01/07/2023', '39600', 'غير محصل', '52', '150', NULL),
(153, '13', '4', '01/10/2023', '39600', 'غير محصل', '52', '150', NULL),
(154, '13', '1', '01/01/2023', '24000', 'محصل', '52', '152', '01/01/2023'),
(155, '13', '2', '01/04/2023', '24000', 'محصل', '52', '152', '03/04/2023'),
(156, '13', '3', '01/07/2023', '24000', 'غير محصل', '52', '152', NULL),
(157, '13', '4', '01/10/2023', '24000', 'غير محصل', '52', '152', NULL),
(158, '13', '1', '01/01/2023', '39600', 'محصل', '52', '153', '01/01/2023'),
(159, '13', '2', '01/04/2023', '39600', 'محصل', '52', '153', '03/04/2023'),
(160, '13', '3', '01/07/2023', '39600', 'غير محصل', '52', '153', NULL),
(161, '13', '4', '01/10/2023', '39600', 'غير محصل', '52', '153', NULL),
(162, '13', '1', '01/01/2023', '33000', 'محصل', '52', '154', '01/01/2023'),
(163, '13', '2', '01/04/2023', '33000', 'محصل', '52', '154', '03/04/2023'),
(164, '13', '3', '01/07/2023', '33000', 'غير محصل', '52', '154', NULL),
(165, '13', '4', '01/10/2023', '33000', 'غير محصل', '52', '154', NULL),
(166, '13', '1', '01/01/2023', '34500', 'محصل', '52', '155', '01/01/2023'),
(167, '13', '2', '01/04/2023', '34500', 'محصل', '52', '155', '03/04/2023'),
(168, '13', '3', '01/07/2023', '34500', 'غير محصل', '52', '155', NULL),
(169, '13', '4', '01/10/2023', '34500', 'غير محصل', '52', '155', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `under_contract`
--

CREATE TABLE `under_contract` (
  `Under_Contract_Id` int(11) NOT NULL,
  `Under_Contractt_English_Type` varchar(200) NOT NULL,
  `Under_Contract_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `Unit_ID` int(11) NOT NULL,
  `unit_condition_Unit_Condition_Id` int(11) NOT NULL,
  `unit_detail_Unit_Detail_Id` int(11) NOT NULL,
  `unit_type_Unit_Type_Id` int(11) NOT NULL,
  `building_Building_Id` int(11) NOT NULL,
  `furniture_case_Furniture_case_Id` int(11) NOT NULL,
  `Unit_Number` varchar(200) DEFAULT NULL,
  `Floor_Number` varchar(200) DEFAULT NULL,
  `Unit_Space` varchar(200) DEFAULT NULL,
  `current_situation` varchar(200) DEFAULT NULL,
  `Oreedo_Number` varchar(200) DEFAULT NULL,
  `Electricityt_Number` varchar(200) DEFAULT NULL,
  `Water_Number` varchar(200) DEFAULT NULL,
  `virtual_Value` varchar(200) DEFAULT NULL,
  `Image_One` varchar(200) DEFAULT NULL,
  `Image_One_Path` varchar(200) DEFAULT NULL,
  `Image_Two` varchar(200) DEFAULT NULL,
  `Image_Two_Path` varchar(200) DEFAULT NULL,
  `Image_Three` varchar(200) DEFAULT NULL,
  `Image_Three_Path` varchar(200) DEFAULT NULL,
  `Image_Four` varchar(200) DEFAULT NULL,
  `Image_Four_Path` varchar(200) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Image_One_Path_Website` varchar(200) DEFAULT NULL,
  `Image_Two_Path_Website` varchar(200) DEFAULT NULL,
  `Image_Three_Path_Website` varchar(200) DEFAULT NULL,
  `Image_Four_Path_Website` varchar(200) DEFAULT NULL,
  `Half` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`Unit_ID`, `unit_condition_Unit_Condition_Id`, `unit_detail_Unit_Detail_Id`, `unit_type_Unit_Type_Id`, `building_Building_Id`, `furniture_case_Furniture_case_Id`, `Unit_Number`, `Floor_Number`, `Unit_Space`, `current_situation`, `Oreedo_Number`, `Electricityt_Number`, `Water_Number`, `virtual_Value`, `Image_One`, `Image_One_Path`, `Image_Two`, `Image_Two_Path`, `Image_Three`, `Image_Three_Path`, `Image_Four`, `Image_Four_Path`, `Active`, `Image_One_Path_Website`, `Image_Two_Path_Website`, `Image_Three_Path_Website`, `Image_Four_Path_Website`, `Half`) VALUES
(3, 1, 2, 1, 8, 4, '1', '1', '95', '', '', '١٠٨٦٩٧', '١٠٠٠٣٩٩', '5250', 'U_1.jpg', '/English/Main_Application/units_Photo/U_1.jpg', 'U_2.jpg', '/English/Main_Application/units_Photo/U_2.jpg', 'U_3.jpeg', '/English/Main_Application/units_Photo/U_3.jpeg', 'U_4.jpg', '/English/Main_Application/units_Photo/U_4.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_1.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_2.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_3.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_4.jpg', '0'),
(4, 1, 2, 1, 8, 4, '2', '1', '100', '', '', '١٠٨٩٦٩٨', '١٠٠٠٤٠٠', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0'),
(5, 1, 2, 1, 8, 4, '3', '1', '105', '', '', '1089699', '1000401', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(6, 1, 2, 1, 8, 4, '4', '1', '105', '', '', '1089700', '1000402', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(7, 1, 2, 1, 8, 4, '5', '2', '95', '', '', '1089701', '1000403', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(8, 1, 2, 1, 8, 4, '6', '2', '100', '', '', '1089702', '1000404', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(9, 1, 2, 1, 8, 1, '7', '2', '105', '', '', '1089703', '1000405', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(10, 1, 2, 1, 8, 1, '8', '2', '105', '', '', '1089704', '1000406', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(13, 1, 2, 1, 8, 4, '9', '3', '95', '', '', '1089705', '1000407', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(14, 1, 2, 1, 8, 4, '10', '3', '100', '', '', '1089706', '1000408', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(15, 1, 2, 1, 8, 4, '11', '3', '105', '', '', '1089707', '1000409', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(16, 1, 2, 1, 8, 1, '12', '3', '105', '', '', '1089708', '1000410', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(17, 1, 2, 1, 8, 4, '13', '4', '95', '', '', '1089710', '1000412', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(18, 1, 2, 1, 8, 4, '14', '4', '100', '', '', '1089711', '1000413', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(19, 1, 2, 1, 8, 1, '15', '4', '105', '', '', '1089712', '1000414', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(20, 1, 2, 1, 8, 4, '16', '4', '105', '', '', '1089713', '1000415', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(22, 1, 2, 1, 8, 4, '17', '5', '95', '', '', '1089714', '1000416', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(23, 1, 2, 1, 8, 1, '18', '5', '100', '', '', '1089715', '1000417', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(24, 1, 2, 1, 8, 4, '19', '5', '105', '', '', '1089715', '1000417', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(25, 1, 2, 1, 8, 1, '20', '5', '105', '', '', '1089717', '1000419', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(26, 1, 2, 1, 8, 4, '21', '6', '95', '', '', '1089718', '1000420', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(27, 1, 2, 1, 8, 4, '22', '6', '100', '', '', '1089719', '1000421', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(28, 1, 2, 1, 8, 4, '23', '6', '105', '', '', '1089720', '1000422', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(29, 1, 2, 1, 8, 4, '24', '6', '105', '', '', '1089721', '1000423', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(30, 1, 2, 1, 8, 4, '25', '7', '95', '', '', '1089722', '1000424', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(31, 1, 2, 1, 25, 1, '26', '7', '100', '', '', '1089723', '1000425', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(32, 1, 2, 1, 8, 4, '27', '7', '105', '', '', '1089723', 'مشمول في 25', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(33, 1, 2, 1, 8, 4, '28', '7', '105', '', '', '1089722', 'مشمول في 26', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(34, 5, 3, 5, 8, 4, '29', '8', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(35, 1, 4, 1, 8, 2, '104', '1', '128', '', '', '1261803', '1217640', '4000', 'U_5.jpg', '/English/Main_Application/units_Photo/U_5.jpg', 'U_6.jpg', '/English/Main_Application/units_Photo/U_6.jpg', 'U_7.jpg', '/English/Main_Application/units_Photo/U_7.jpg', 'U_8.jpeg', '/English/Main_Application/units_Photo/U_8.jpeg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_5.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_6.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_7.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_8.jpeg', '0'),
(36, 1, 4, 1, 8, 1, '105', '1', '128', '', '', '1261801', '1217687', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(37, 1, 4, 1, 8, 1, '204', '2', '128', '', '', '1261802', '1217688', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(38, 1, 4, 1, 8, 1, '205', '2', '128', '', '', '1261803', '1217689', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(39, 1, 4, 1, 8, 1, '304', '3', '128', '', '', '1261804', '1217690', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(40, 1, 4, 1, 8, 1, '305', '3', '128', '', '', '1261805', '1217691', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(41, 1, 4, 1, 8, 1, '404', '4', '128', '', '', '1261806', '1217692', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(42, 1, 4, 1, 8, 1, '405', '4', '128', '', '', '1261807', '1217693', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(43, 1, 4, 1, 8, 1, '504', '5', '128', '', '', '1261808', '1217694', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(44, 1, 4, 1, 8, 1, '505', '5', '128', '', '', '1261809', '1217695', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(45, 1, 4, 1, 8, 1, '604', '6', '128', '', '', '1261810', '1217696', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(46, 1, 4, 1, 8, 1, '605', '6', '128', '', '', '1261811', ' 1217697', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(47, 1, 6, 1, 8, 2, '101', '1', '64', '', '', '1261800', '1217637', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(48, 1, 6, 1, 8, 2, '102', '1', '64', '', '', '1261801', '1217638', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(49, 1, 6, 1, 8, 2, '103', '1', '64', '', '', '1261802', '1217639', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(50, 1, 6, 1, 8, 1, '106', '1', '64', '', '', '1261815', '1217701', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(51, 1, 6, 1, 8, 1, '107', '1', '64', '', '', '1261816', '1217702', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(52, 1, 6, 1, 8, 1, '108', '1', '64', '', '', '1261817', '1217703', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(53, 1, 6, 1, 8, 1, '201', '2', '64', '', '', '1261818', '1217704', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(54, 1, 6, 1, 8, 1, '202', '2', '64', '', '', '1261819', '1217705', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(55, 1, 6, 1, 8, 1, '203', '2', '64', '', '', '1261820', '1217706', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(56, 1, 6, 1, 8, 1, '206', '2', '64', '', '', '1261821', '1217707', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(57, 1, 6, 1, 8, 1, '207', '2', '64', '', '', '1261822', '1217708', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(58, 1, 6, 1, 8, 1, '208', '2', '64', '', '', '1261823', '1217709', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(59, 1, 6, 1, 8, 1, '301', '3', '64', '', '', '1261824', '1217710', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(60, 1, 6, 1, 8, 1, '302', '3', '64', '', '', '1261825', '1217711', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(61, 1, 6, 1, 8, 1, '303', '3', '64', '', '', '1261826', '1217712', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(62, 1, 6, 1, 8, 1, '306', '3', '64', '', '', '1261827', '1217713', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(63, 1, 6, 1, 8, 1, '307', '3', '64', '', '', '1261828', '1217714', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(64, 1, 6, 1, 8, 1, '308', '3', '64', '', '', '1261829', '1217715', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(65, 1, 6, 1, 8, 1, '401', '4', '64', '', '', '1261830', '1217716', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(66, 1, 6, 1, 8, 1, '402', '4', '64', '', '', '1261833', '1217719', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(67, 1, 6, 1, 8, 1, '403', '4', '64', '', '', '1261834', '1217720', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(68, 1, 6, 1, 8, 1, '406', '4', '64', '', '', '1261835', '1217721', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(69, 1, 6, 1, 8, 1, '407', '4', '64', '', '', '1261836', '1217722', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(70, 1, 6, 1, 8, 1, '408', '4', '64', '', '', '1261837', '1217723', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(71, 1, 6, 1, 8, 1, '501', '5', '64', '', '', '1261838', '1217724', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(72, 1, 6, 1, 8, 1, '502', '5', '64', '', '', '1261839', '1217725', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(73, 1, 6, 1, 8, 1, '503', '5', '64', '', '', '1261840', '1217726', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(74, 1, 6, 1, 8, 1, '506', '5', '64', '', '', '1261841', '1217727', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(75, 1, 6, 1, 8, 1, '507', '5', '64', '', '', '1261842', '1217728', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(76, 1, 6, 1, 8, 1, '508', '5', '64', '', '', '1261843', '1217729', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(77, 1, 6, 1, 8, 1, '601', '6', '64', '', '', '1261844', '1217730', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(78, 1, 6, 1, 8, 1, '602', '6', '64', '', '', '1261845', '1217731', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(79, 1, 6, 1, 8, 1, '603', '6', '64', '', '', '1261846', '1217732', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(80, 1, 6, 1, 8, 1, '606', '6', '64', '', '', '1261847', '1217733', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(81, 1, 6, 1, 8, 1, '607', '6', '64', '', '', '1261831', '1217717', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(82, 1, 6, 1, 8, 1, '608', '6', '64', '', '', '1261832', '1217718', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(83, 1, 7, 2, 8, 1, '49', '1', '40', '', '', '1262790', '1217627', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(84, 1, 7, 2, 8, 1, '50', '1', '40', '', '', '1262791', '1217628', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(85, 1, 7, 2, 8, 1, '51', '1', '40', '', '', '1262792', '1217629', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(86, 1, 7, 2, 8, 1, '52', '1', '40', '', '', '1262793', '1217630', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(87, 1, 7, 2, 8, 1, '53', '1', '40', '', '', '1262794', '1217631', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(88, 1, 7, 2, 8, 1, '54', '1', '40', '', '', '1262795', '1217632', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(89, 1, 7, 2, 8, 1, '55', '1', '40', '', '', '1262796', '1217633', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(90, 1, 7, 2, 8, 1, '56', '1', '40', '', '', '1262797', '1217634', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(91, 1, 7, 2, 8, 1, '57', '1', '40', '', '', '1262798', '1217635', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(92, 1, 7, 2, 8, 1, '58', '1', '40', '', '', '1262799', '1217636', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(93, 1, 8, 1, 11, 1, '1', '1', '100', '', '', '125148', '91966', '3800', 'U_9.jpg', '/English/Main_Application/units_Photo/U_9.jpg', 'U_10.jpg', '/English/Main_Application/units_Photo/U_10.jpg', 'U_11.jpg', '/English/Main_Application/units_Photo/U_11.jpg', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_9.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_10.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_11.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', '0'),
(94, 1, 8, 1, 11, 1, '2', '1', '100', '', '', '125149', '91965', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(95, 1, 8, 1, 11, 1, '3', '2', '100', '', '', '125149', '91967', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(96, 1, 8, 1, 11, 1, '4', '2', '100', '', '', '125150', '91968', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(97, 1, 8, 1, 11, 1, '5', '3', '100', '', '', '125151', '91969', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(98, 1, 8, 1, 11, 1, '6', '3', '100', '', '', '125152', '91970', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(99, 1, 4, 1, 18, 1, '1', '1', '310', 'رقم المبنى 80', '', '1251073', '1191369', '3800', 'U_3.jpeg', '/English/Main_Application/units_Photo/U_3.jpeg', 'U_2.jpg', '/English/Main_Application/units_Photo/U_2.jpg', 'U_11.jpg', '/English/Main_Application/units_Photo/U_11.jpg', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_3.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_2.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_11.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', '0'),
(100, 1, 4, 1, 18, 1, '2', '1', '160', 'رقم المبنى 80', '', '1251074', '1191370', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(101, 1, 4, 1, 18, 1, '3', '1', '310', 'رقم المبنى 80', '', '1251075', '1191371', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(102, 1, 4, 1, 18, 1, '4', '1', '160', 'رقم المبنى 80 شقة أرضية', '', '', '', '3800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(103, 1, 2, 1, 8, 2, '1', '1', '120', '', '', '1181983', '1152740', '5250', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 'U_3.jpeg', '/English/Main_Application/units_Photo/U_3.jpeg', 'U_8.jpeg', '/English/Main_Application/units_Photo/U_8.jpeg', 'U_12.jpg', '/English/Main_Application/units_Photo/U_12.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_3.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_8.jpeg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_12.jpg', '0'),
(104, 1, 2, 1, 8, 2, '2', '1', '125', '', '', '1181984', '1152741', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(105, 1, 2, 1, 8, 2, '3', '2', '120', '', '', '1181985', '1152742', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(106, 1, 2, 1, 8, 2, '4', '2', '125', '', '', '1181986', '1152743', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(107, 1, 2, 1, 8, 2, '5', '3', '120', '', '', '1181987', '1152744', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(108, 1, 2, 1, 8, 2, '6', '3', '125', '', '', '1181988', '1152745', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(109, 1, 2, 1, 8, 2, '7', '4', '120', '', '', '1181989', '1152746', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(110, 1, 2, 1, 8, 2, '8', '4', '125', '', '', '1181990', '1152747', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(111, 1, 2, 1, 8, 2, '9', '5', '120', '', '', '1181991', '1152748', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(112, 1, 2, 1, 8, 2, '10', '5', '125', '', '', '1181992', '1152749', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(113, 1, 2, 1, 8, 2, '11', '6', '120', '', '', '1181993', '1152750', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(114, 1, 2, 1, 8, 2, '12', '6', '125', '', '', '1181994', '1152751', '5250', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(115, 1, 8, 1, 20, 3, '1', '1', '60', '', '', '1183418', '1152805', '3000', 'U_4.jpg', '/English/Main_Application/units_Photo/U_4.jpg', 'U_5.jpg', '/English/Main_Application/units_Photo/U_5.jpg', 'U_6.jpg', '/English/Main_Application/units_Photo/U_6.jpg', 'U_7.jpg', '/English/Main_Application/units_Photo/U_7.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_4.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_5.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_6.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/U_7.jpg', '0'),
(116, 1, 8, 1, 20, 3, '2', '2', '60', '', '', '1183418', '1152805', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(117, 1, 8, 1, 20, 1, '3', '3', '60', '', '', '1183418', '1152805', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(118, 1, 5, 2, 22, 1, '1', '1', '15', '', '', '103724', '', '1000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(119, 1, 8, 1, 22, 1, '2', '1', '95', '', '', '90580', '64118', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(120, 1, 8, 1, 22, 1, '3', '1', '95', '', '', '90579', '64118', '3000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(121, 1, 5, 6, 22, 1, '4', '1', '110', '', '', '7948', '64118', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(122, 1, 5, 2, 23, 1, '1', '1', '40', '', '', '1183414', '1146795', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0');
INSERT INTO `units` (`Unit_ID`, `unit_condition_Unit_Condition_Id`, `unit_detail_Unit_Detail_Id`, `unit_type_Unit_Type_Id`, `building_Building_Id`, `furniture_case_Furniture_case_Id`, `Unit_Number`, `Floor_Number`, `Unit_Space`, `current_situation`, `Oreedo_Number`, `Electricityt_Number`, `Water_Number`, `virtual_Value`, `Image_One`, `Image_One_Path`, `Image_Two`, `Image_Two_Path`, `Image_Three`, `Image_Three_Path`, `Image_Four`, `Image_Four_Path`, `Active`, `Image_One_Path_Website`, `Image_Two_Path_Website`, `Image_Three_Path_Website`, `Image_Four_Path_Website`, `Half`) VALUES
(123, 1, 5, 2, 23, 1, '2', '1', '38', '', '', '1183415', '1146796', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0'),
(124, 1, 5, 2, 23, 1, '3', '1', '38', '', '', '1183416', '1146797', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 1, 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', 'https://amlak2.wisdom.qa/English/Main_Application/units_Photo/empty_Image.jpg', '0'),
(125, 1, 6, 1, 25, 2, '1', '1', '40', '', '', '1219305', '1116069', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(126, 1, 6, 1, 25, 2, '2', '1', '40', '', '', '1219306', '1116070', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(127, 1, 6, 1, 25, 2, '3', '1', '40', '', '', '1219307', '1116071', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(128, 1, 6, 1, 25, 2, '4', '1', '40', '', '', '1219308', '1116072', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(129, 1, 6, 1, 25, 2, '5', '1', '40', '', '', '1219309', '1116073', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(130, 1, 6, 1, 25, 2, '6', '1', '40', '', '', '1219310', '1116074', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(131, 1, 6, 1, 25, 2, '7', '1', '40', '', '', '1219311', '1116075', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(132, 1, 6, 1, 25, 2, '8', '1', '40', '', '', '1219312', '1116076', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(133, 1, 6, 1, 25, 2, '9', '1', '40', '', '', '1219313', '1116077', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(134, 1, 2, 1, 26, 4, '1', '1', '95', '', '', '1160690', '1099848', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(135, 1, 2, 1, 26, 4, '2', '1', '105', '', '', '1160691', '1099849', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(136, 1, 2, 1, 26, 4, '3', '2', '95', '', '', '1160692', '1099850', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(137, 1, 2, 1, 26, 4, '4', '2', '105', '', '', '1160693', '1099851', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(138, 1, 2, 1, 26, 4, '5', '3', '95', '', '', '1160694', '1099852', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(139, 1, 2, 1, 26, 4, '6', '3', '105', '', '', '1160695', '1099853', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(140, 1, 2, 1, 26, 4, '7', '4', '95', '', '', '1160696', '1099854', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(141, 1, 2, 1, 26, 4, '8', '4', '105', '', '', '1160697', '1099855', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(142, 1, 2, 1, 26, 4, '9', '5', '95', '', '', '1160698', '1099856', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(143, 1, 2, 1, 26, 4, '10', '5', '105', '', '', '1160699', '1099857', '4800', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(144, 1, 8, 1, 27, 1, '1', '1', '50', '', '', '183296', '152797', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(145, 1, 8, 1, 27, 1, '2', '1', '50', '', '', '183297', '152799', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(146, 1, 8, 1, 27, 1, '3', '2', '50', '', '', '183298', '152800', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(147, 1, 8, 1, 27, 1, '4', '2', '50', '', '', '183299', '152801', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(148, 1, 8, 1, 27, 1, '5', '3', '50', '', '', '183300', '152802', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(149, 1, 8, 1, 27, 1, '6', '3', '50', '', '', '183301', '152803', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(150, 1, 4, 1, 29, 4, '1', '1', '95', '', '', '1026715', '940651', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(151, 1, 4, 1, 29, 2, '2', '1', '85', '', '', '1026716', '940652', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(152, 1, 4, 1, 29, 4, '3', '1', '95', '', '', '1026717', '940653', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(153, 1, 4, 1, 29, 4, '4', '1', '85', '', '', '1026718', '940654', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(154, 1, 4, 1, 29, 4, '5', '1', '95', '', '', '1026719', '940655', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(155, 1, 4, 1, 29, 4, '6', '1', '85', '', '', '1026720', '940656', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(156, 1, 4, 1, 29, 4, '7', '1', '95', '', '', '1026721', '940657', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(157, 1, 4, 1, 29, 4, '8', '1', '85', '', '', '1026722', '940658', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(158, 1, 4, 1, 29, 4, '9', '1', '95', '', '', '1026723', '940659', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(159, 1, 4, 1, 29, 4, '10', '1', '85', '', '', '1026724', '940660', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(160, 1, 4, 1, 29, 4, '11', '1', '95', '', '', '1026725', '940661', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(161, 1, 4, 1, 29, 4, '12', '1', '85', '', '', '1026726', '940662', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(162, 1, 4, 1, 29, 4, '13', '1', '95', '', '', '1026727', '940663', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(163, 1, 4, 3, 29, 1, '14', '1', '85', 'استخدام مالك', '', '1026727', '940663', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(164, 1, 3, 5, 29, 4, '15', '1', '', '', '', '', '', '1000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(165, 1, 3, 5, 8, 0, '16', '1', '', '', '', '', '', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(166, 1, 5, 8, 8, 0, '17', '1', '', 'السطح العلوي', '', '', '', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(167, 1, 12, 1, 30, 1, '1', '1', '100', '', '', '1323058', '1245258', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(168, 1, 6, 1, 30, 1, '2', '1', '60', '', '', '1323059', '1245259', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(169, 1, 4, 1, 30, 1, '3', '1', '100', '', '', '1323060', '1245260', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(170, 1, 4, 1, 30, 1, '4', '1', '100', '', '', '1323061', '1245261', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(171, 1, 6, 1, 30, 1, '5', '1', '60', '', '', '1323062', '1245262', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(172, 1, 4, 1, 30, 1, '6', '1', '100', '', '', '1323063', '1245263', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(173, 1, 4, 1, 30, 1, '7', '1', '100', '', '', '1323064', '1245264', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(174, 1, 6, 1, 30, 1, '8', '1', '60', '', '', '1323065', '1245265', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(175, 1, 4, 1, 30, 1, '9', '1', '100', '', '', '1323066', '1245266', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(176, 1, 4, 1, 30, 1, '10', '1', '100', '', '', '1323067', '1245267', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(177, 1, 6, 1, 30, 1, '11', '1', '60', '', '', '1323068', '1245268', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(178, 1, 4, 1, 30, 1, '12', '1', '100', '', '', '1323069', '1245269', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(179, 1, 4, 1, 30, 1, '13', '1', '100', '', '', '1323070', '1245270', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(180, 1, 6, 1, 30, 1, '14', '1', '60', '', '', '1323071', '1245271', '3500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(181, 1, 4, 1, 30, 1, '15', '1', '100', '', '', '1323072', '1245272', '4500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(182, 1, 2, 1, 30, 1, '16', '1', '130', '', '', '1323073', '1245273', '5700', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(183, 1, 2, 1, 30, 1, '17', '1', '130', '', '', '1323074', '1245274', '5700', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(184, 1, 3, 8, 8, 3, '18', '1', '5454', 'غرفة سطح ', '', '', '', '9999', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(185, 1, 5, 4, 31, 4, '1', '1', '', '', '', '1218993', '1159998', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(186, 1, 5, 4, 31, 4, '2', '1', '', '', '', '1218994', '1160000', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(187, 1, 5, 2, 31, 1, '3', '1', '', '', '', '', '', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(188, 1, 4, 4, 32, 3, '1', '1', '', '', '', '85999', '59387', '3500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(189, 1, 5, 4, 33, 4, '1', '1', '', 'فيلا يمنى', '', '164915', '125816', '13000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(190, 1, 5, 4, 33, 4, '2', '1', '', 'فيلا وسطى ', '', '164915', '125816', '13000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(191, 1, 5, 4, 34, 4, '45', '1', '', 'فيلا شرقية ', '', '1052468', '962922', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(192, 1, 5, 4, 34, 4, '47', '1', '', 'فيلا غربية ', '', '1052469', '', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(193, 1, 6, 1, 35, 2, '1', '2', '60', '', '', '1355145', '1286330', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(194, 1, 4, 1, 35, 2, '2', '2', '84', '', '', '1355146', '1286331', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(195, 1, 4, 1, 35, 2, '3', '2', '', '', '', '1355147', '1286332', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(196, 1, 4, 1, 35, 2, '4', '2', '', '', '', '1355148', '1286333', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(197, 1, 6, 1, 35, 2, '5', '2', '60', '', '', '1355149', '1286334', '4000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(198, 1, 4, 1, 35, 2, '6', '2', '84', '', '', '1355150', '1286335', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(199, 1, 4, 1, 35, 2, '7', '2', '', '', '', '1355151', '1286336', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(200, 1, 4, 1, 35, 2, '8', '2', '', '', '', '1355152', '1286337', '5500', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(201, 1, 7, 2, 35, 1, '1', '1', '54', '', '', '1355139', '1286324', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(202, 1, 7, 2, 35, 1, '2', '1', '48', '', '', '1355140', '1286325', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(203, 1, 7, 2, 35, 1, '3', '1', '48', '', '', '1355141', '1286326', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(204, 1, 7, 2, 35, 1, '4', '1', '58', '', '', '1355142', '1286327', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(205, 1, 7, 2, 35, 1, '5', '1', '58', '', '', '1355143', '1286328', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(206, 1, 7, 2, 35, 1, '6', '1', '58', 'مؤجر ', '', '1355144', '1286329', '12000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(207, 1, 3, 8, 8, 4, '7', '1', '', 'استخدام شركة  ', '', '', '', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(208, 1, 5, 6, 36, 3, '1', '1', '750', '', '', '24063', '', '13000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(209, 1, 5, 6, 37, 4, '1', '1', '', '', '', '46176', '78202', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(210, 1, 5, 6, 37, 4, '2', '1', '', '', '', '', '', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(211, 1, 5, 6, 37, 4, '3', '1', '', '', '', '', '', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(212, 1, 5, 6, 38, 4, '3', '1', '', '', '', '55958', '33568', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(215, 1, 5, 4, 40, 4, '1', '1', '', '', '', '1055459', '966396', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(216, 1, 5, 4, 41, 1, '86', '1', '450', '', '', '1060966', '970330', '15000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(217, 1, 5, 4, 42, 4, '1', '1', '1060', '', '', '119612', '1073819', '25000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(219, 1, 5, 11, 8, 0, '1', '1', '', '', '', '128624', '104618', '0', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(220, 1, 5, 4, 45, 4, '1', '1', '', '', '', '178907', '137757', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(226, 1, 5, 4, 47, 1, '1', '1', '1200', '', '', '1044652', '959164', '10000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(227, 1, 5, 12, 48, 1, '1', '1', '', 'Vacant land ', '', '', '', '2000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(228, 1, 5, 4, 49, 1, '1', '1', '310', ' ', '', '1057331', '966696', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(229, 1, 5, 4, 49, 1, '2', '1', '310', ' ', '', '1057331', '966696', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(230, 1, 5, 4, 49, 1, '3', '1', '310', ' ', '', '1057331', '966696', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(231, 1, 10, 4, 50, 4, '1', '1', '', '', '', '1361895', '1291269', '7000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(232, 1, 5, 3, 51, 1, '4603', '46', '15', '', '', '1056105', '9977132', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(233, 1, 5, 3, 51, 1, '4604', '46', '15', '', '', '1056105', '9977132', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(234, 1, 5, 3, 51, 1, '4605', '46', '15', '', '', '1056106', '997134', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(235, 1, 9, 1, 52, 2, '1', '1', '150', '', '', '1361055', '1290733', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(236, 1, 9, 1, 52, 2, '2', '1', '150', '', '', '1361056', '1290734', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(237, 1, 9, 1, 52, 2, '3', '2', '150', '', '', '1361057', '1290735', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(238, 1, 9, 1, 52, 2, '4', '2', '150', '', '', '1361058', '1290736', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(239, 1, 9, 1, 52, 2, '5', '3', '150', '', '', '1361059', '1290737', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(241, 1, 9, 1, 52, 2, '6', '3', '150', '', '', '1361060', '1290738', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(242, 1, 9, 1, 52, 2, '7', '4', '150', '', '', '1361061', '1290739', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(243, 1, 9, 1, 52, 2, '8', '4', '150', '', '', '1361062', '1290740', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(244, 1, 9, 1, 52, 2, '9', '5', '150', '', '', '1361063', '1290741', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(245, 1, 9, 1, 52, 2, '10', '5', '150', '', '', '1361064', '1290742', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(246, 1, 9, 1, 52, 2, '11', '6', '150', '', '', '1361065', '1290743', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(247, 1, 9, 1, 52, 2, '12', '6', '150', '', '', '1361066', '1290744', '5000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(248, 1, 5, 8, 39, 1, '3', '2', '50', 'السطح العلوي ', '', '', '', '20000', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 'empty_Image.jpg', '/English/Main_Application/units_Photo/empty_Image.jpg', 0, '', '', '', '', '0'),
(252, 1, 5, 4, 54, 1, '1', '1', '', '', '', '1184490', '1151756', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(257, 1, 5, 4, 39, 1, '35', '1', '377', '', '', '1007565	', '908027', '10000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(258, 1, 5, 4, 39, 1, '33', '1', '377', '', '', '1007564', '908026', '10000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, '', '', '', '', '0'),
(260, 1, 2, 1, 8, 4, '1', '1', '', '', '', '١٠٨٦٩٧', '١٠٠٠٣٩٩', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(261, 1, 8, 1, 8, 4, '1', '1', '', '', '', '125148', '91966', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(262, 1, 8, 1, 8, 1, '3', '1', '', '', '', '125149', '91967', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(263, 1, 8, 1, 8, 1, '5', '1', '', '', '', '125151', '91969', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(264, 1, 8, 1, 8, 1, '6', '1', '', '', '', '125152', '91970', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(265, 1, 2, 1, 8, 4, '2', '1', '', '', '', '١٠٨٩٦٩٨', '١٠٠٠٤٠٠', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(266, 1, 2, 1, 8, 4, '26', '7', '', '', '', '1089723', '1000425', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(267, 1, 2, 1, 8, 4, '27', '7', '', '', '', '1089723', 'مشمول في 25', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(268, 1, 2, 1, 8, 4, '10', '3', '', '', '', '1089706', '1000408', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(269, 1, 2, 1, 8, 4, '14', '4', '', '', '', '1089711', '1000413', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1');
INSERT INTO `units` (`Unit_ID`, `unit_condition_Unit_Condition_Id`, `unit_detail_Unit_Detail_Id`, `unit_type_Unit_Type_Id`, `building_Building_Id`, `furniture_case_Furniture_case_Id`, `Unit_Number`, `Floor_Number`, `Unit_Space`, `current_situation`, `Oreedo_Number`, `Electricityt_Number`, `Water_Number`, `virtual_Value`, `Image_One`, `Image_One_Path`, `Image_Two`, `Image_Two_Path`, `Image_Three`, `Image_Three_Path`, `Image_Four`, `Image_Four_Path`, `Active`, `Image_One_Path_Website`, `Image_Two_Path_Website`, `Image_Three_Path_Website`, `Image_Four_Path_Website`, `Half`) VALUES
(270, 1, 2, 1, 8, 4, '17', '5', '', '', '', '1089714', '1000416', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(271, 1, 2, 1, 8, 4, '18', '1', '', '', '', '1089715', '1000417', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(272, 1, 2, 1, 8, 4, '19', '5', '', '', '', '1089715', '1000417', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(273, 1, 2, 1, 8, 4, '23', '6', '', '', '', '1089720', '1000422', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(274, 1, 2, 1, 8, 4, '25', '7', '', '', '', '1089722', '1000424', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(275, 1, 2, 1, 8, 4, '28', '7', '', '', '', '1089722', 'مشمول في 26', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(276, 1, 5, 4, 8, 4, '1', '1', '', '', '', '1218993', '1159998', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(277, 1, 5, 4, 8, 4, '2', '1', '', '', '', '1218994', '1160000', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(278, 1, 8, 1, 8, 1, '2', '1', '', '', '', '125149', '91965', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(279, 1, 8, 1, 8, 1, '3', '1', '', '', '', '125149', '91967', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(280, 1, 8, 1, 8, 1, '5', '1', '', '', '', '125151', '91969', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(281, 1, 2, 1, 8, 4, '2', '1', '', '', '', '١٠٨٩٦٩٨', '١٠٠٠٤٠٠', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(282, 1, 2, 1, 8, 4, '26', '7', '', '', '', '1089723', '1000425', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(283, 1, 2, 1, 8, 4, '27', '7', '', '', '', '1089723', 'مشمول في 25', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(284, 1, 8, 1, 8, 3, '1', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(285, 1, 8, 1, 8, 3, '2', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(286, 1, 8, 1, 8, 1, '3', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(287, 1, 8, 1, 8, 3, '1', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(288, 1, 8, 1, 8, 3, '2', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(289, 1, 8, 1, 8, 1, '3', '1', '', '', '', '1183418', '1152805', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(290, 1, 4, 1, 8, 4, '1', '1', '', '', '', '1026715', '940651', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(291, 1, 4, 1, 8, 2, '2', '1', '', '', '', '1026716', '940652', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(292, 1, 4, 1, 8, 4, '3', '1', '', '', '', '1026717', '940653', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(293, 1, 4, 1, 8, 4, '4', '1', '', '', '', '1026718', '940654', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(294, 1, 4, 1, 8, 4, '5', '1', '', '', '', '1026719', '940655', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(295, 1, 4, 1, 8, 4, '6', '1', '', '', '', '1026720', '940656', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(296, 1, 4, 1, 8, 4, '7', '1', '', '', '', '1026721', '940657', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(297, 1, 4, 1, 8, 4, '8', '1', '', '', '', '1026722', '940658', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(298, 1, 4, 1, 8, 4, '9', '1', '', '', '', '1026723', '940659', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(299, 1, 4, 1, 8, 4, '10', '1', '', '', '', '1026724', '940660', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(300, 1, 4, 1, 8, 4, '11', '1', '', '', '', '1026725', '940661', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(301, 1, 7, 2, 8, 1, '49', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(302, 1, 7, 2, 8, 1, '50', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(303, 1, 7, 2, 8, 1, '51', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(304, 1, 7, 2, 8, 1, '52', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(305, 1, 7, 2, 8, 1, '53', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(306, 1, 7, 2, 8, 1, '54', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(307, 1, 7, 2, 8, 1, '55', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(308, 1, 7, 2, 8, 1, '56', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(309, 1, 7, 2, 8, 1, '57', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(310, 1, 7, 2, 8, 1, '58', '1', '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(311, 1, 5, 5, 8, 1, '13', '0', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(312, 1, 5, 5, 8, 4, '13', '0', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(313, 1, 4, 1, 8, 4, '1', '1', '', 'رقم المبنى 80', '', '1251073', '1191369', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(314, 1, 4, 1, 8, 4, '2', '1', '', 'رقم المبنى 80', '', '1251074', '1191370', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(315, 1, 4, 1, 8, 1, '3', '1', '', 'رقم المبنى 80', '', '1251075', '1191371', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(316, 1, 4, 1, 8, 4, '1', '1', '', 'رقم المبنى 80', '', '1251073', '1191369', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(317, 1, 4, 1, 8, 4, '2', '1', '', 'رقم المبنى 80', '', '1251074', '1191370', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(318, 1, 4, 1, 8, 1, '3', '1', '', 'رقم المبنى 80', '', '1251075', '1191371', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(319, 1, 4, 1, 8, 4, '1', '1', '', 'رقم المبنى 80', '', '1251073', '1191369', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(320, 1, 4, 1, 8, 4, '2', '1', '', 'رقم المبنى 80', '', '1251074', '1191370', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(321, 1, 4, 1, 8, 1, '3', '1', '', 'رقم المبنى 80', '', '1251075', '1191371', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(322, 1, 10, 4, 76, 4, '1', '1', '0', 'مؤجر ', '', '1145485', '1078480', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(323, 1, 3, 4, 32, 4, '2', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(324, 1, 3, 4, 32, 4, '3', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(325, 1, 3, 4, 32, 4, '4', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(326, 1, 3, 4, 32, 4, '5', '2', '', '', '', '', '', '2000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(327, 1, 13, 8, 32, 4, '6', '2', '', '', '', '', '', '1500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(328, 1, 2, 1, 8, 4, '7', '5', '', '', '', '1089703', '1000405', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(329, 1, 2, 1, 8, 4, '16', '4', '', '', '', '1089713', '1000415', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(332, 1, 10, 4, 79, 3, '1', '1', '', 'متابعة ', '', '', '', '13000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, NULL),
(333, 1, 10, 4, 80, 3, '1', '1', '', '', '', '', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, NULL),
(334, 1, 10, 4, 81, 3, '1', '1', '', '', '', '', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, NULL),
(335, 1, 5, 4, 8, 4, '35', '1', '', '', '', '1007565	', '908027', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(336, 1, 5, 4, 8, 4, '33', '1', '', '', '', '1007564', '908026', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(337, 1, 5, 4, 8, 4, '35', '1', '', '', '', '1007565	', '908027', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(338, 1, 5, 4, 8, 4, '33', '1', '', '', '', '1007564', '908026', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(339, 1, 5, 6, 8, 4, '1', '1', '', '', '', '46176', '78202', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(340, 1, 5, 6, 8, 4, '2', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(341, 1, 5, 6, 8, 4, '3', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(342, 1, 5, 6, 8, 4, '1', '1', '', '', '', '46176', '78202', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(343, 1, 5, 6, 8, 4, '2', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(344, 1, 5, 6, 8, 4, '3', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(345, 1, 5, 4, 8, 4, '1', '1', '', '', '', '1218993', '1159998', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(346, 1, 5, 4, 8, 4, '2', '1', '', '', '', '1218994', '1160000', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(347, 1, 6, 1, 8, 2, '1', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(348, 1, 4, 1, 8, 2, '2', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(349, 1, 4, 1, 8, 2, '3', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(350, 1, 4, 1, 8, 2, '4', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(351, 1, 6, 1, 8, 2, '5', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(352, 1, 4, 1, 8, 2, '6', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(353, 1, 4, 1, 8, 2, '7', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(354, 1, 4, 1, 8, 2, '8', '2', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(363, 1, 9, 1, 8, 2, '1', '1', '150', '', '', '1361055', '1290733', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(364, 1, 9, 1, 8, 2, '2', '1', '150', '', '', '1361056', '1290734', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(365, 1, 9, 1, 8, 2, '3', '2', '150', '', '', '1361057', '1290735', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(366, 1, 9, 1, 8, 2, '4', '2', '150', '', '', '1361058', '1290736', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(367, 1, 9, 1, 8, 2, '5', '3', '150', '', '', '1361059', '1290737', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(368, 1, 9, 1, 8, 2, '6', '3', '150', '', '', '1361060', '1290738', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(369, 1, 9, 1, 8, 2, '7', '4', '150', '', '', '1361061', '1290739', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(370, 1, 9, 1, 8, 2, '8', '4', '150', '', '', '1361062', '1290740', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(371, 1, 9, 1, 8, 2, '9', '5', '150', '', '', '1361063', '1290741', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(372, 1, 9, 1, 8, 2, '10', '5', '150', '', '', '1361064', '1290742', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(373, 1, 9, 1, 8, 2, '11', '6', '150', '', '', '1361065', '1290743', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(374, 1, 9, 1, 8, 2, '12', '6', '150', '', '', '1361066', '1290744', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(375, 1, 2, 1, 8, 4, '1', '1', '', '', '', '1160690', '1099848', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(376, 1, 2, 1, 8, 4, '2', '1', '', '', '', '1160691', '1099849', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(377, 1, 2, 1, 8, 4, '3', '2', '', '', '', '1160692', '1099850', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(378, 1, 2, 1, 8, 4, '4', '2', '', '', '', '1160693', '1099851', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(379, 1, 2, 1, 8, 4, '5', '3', '', '', '', '1160694', '1099852', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(380, 1, 2, 1, 8, 4, '6', '3', '', '', '', '1160695', '1099853', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(381, 1, 2, 1, 8, 4, '7', '4', '', '', '', '1160696', '1099854', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(382, 1, 2, 1, 8, 4, '8', '4', '', '', '', '1160697', '1099855', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(383, 1, 2, 1, 8, 4, '9', '5', '', '', '', '1160698', '1099856', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(384, 1, 2, 1, 8, 4, '10', '5', '', '', '', '1160699', '1099857', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(385, 1, 2, 1, 8, 4, '1', '1', '', '', '', '1160690', '1099848', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(386, 1, 2, 1, 8, 4, '2', '1', '', '', '', '1160691', '1099849', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(387, 1, 2, 1, 8, 4, '3', '2', '', '', '', '1160692', '1099850', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(388, 1, 2, 1, 8, 4, '4', '2', '', '', '', '1160693', '1099851', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(389, 1, 2, 1, 8, 4, '5', '3', '', '', '', '1160694', '1099852', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(390, 1, 2, 1, 8, 4, '6', '3', '', '', '', '1160695', '1099853', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(391, 1, 2, 1, 8, 4, '7', '4', '', '', '', '1160696', '1099854', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(392, 1, 2, 1, 8, 4, '8', '4', '', '', '', '1160697', '1099855', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(393, 1, 2, 1, 8, 4, '9', '5', '', '', '', '1160698', '1099856', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(394, 1, 2, 1, 8, 4, '10', '5', '', '', '', '1160699', '1099857', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(395, 1, 5, 2, 8, 1, '3', '1', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(444, 1, 5, 4, 54, 4, '2', '1', '', '', '', '1184492', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(445, 1, 5, 4, 54, 4, '3', '1', '', '', '', ' 1184494', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(446, 1, 5, 4, 54, 4, '4', '1', '', '', '', '1184496', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(447, 1, 5, 4, 54, 4, '5', '1', '', '', '', '1184498', '', '15000', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(449, 1, 5, 4, 8, 1, '1', '1', '', '', '', '1184490', '1151756', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(450, 1, 5, 4, 8, 4, '2', '1', '', '', '', '1184492', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(451, 1, 5, 4, 8, 4, '3', '1', '', '', '', ' 1184494', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(452, 1, 5, 4, 8, 4, '4', '1', '', '', '', '1184496', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(453, 1, 5, 4, 8, 4, '5', '1', '', '', '', '1184498', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(454, 1, 5, 4, 8, 4, '1', '1', '560', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(455, 1, 5, 4, 8, 4, '1', '1', '', '', '', '', '', '0', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(456, 1, 5, 4, 8, 4, '1', '1', '', '', '', '', '', '', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', NULL, NULL, NULL, NULL, NULL, '0'),
(460, 1, 4, 1, 8, 4, '1', '1', '95', '', '', '1026715', '940651', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(461, 1, 4, 1, 8, 2, '2', '1', '85', '', '', '1026716', '940652', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(462, 1, 4, 1, 8, 4, '3', '1', '95', '', '', '1026717', '940653', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(463, 1, 4, 1, 8, 4, '4', '1', '85', '', '', '1026718', '940654', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(464, 1, 4, 1, 8, 4, '5', '1', '95', '', '', '1026719', '940655', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(465, 1, 4, 1, 8, 4, '6', '1', '85', '', '', '1026720', '940656', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(466, 1, 4, 1, 8, 4, '7', '1', '95', '', '', '1026721', '940657', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(467, 1, 4, 1, 8, 4, '8', '1', '85', '', '', '1026722', '940658', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(468, 1, 4, 1, 8, 4, '9', '1', '95', '', '', '1026723', '940659', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(469, 1, 4, 1, 8, 4, '10', '1', '85', '', '', '1026724', '940660', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(470, 1, 4, 1, 8, 4, '11', '1', '95', '', '', '1026725', '940661', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(471, 1, 3, 1, 104, 1, '010104', '3', '200', 'New', '1234', '5678', '8743', '2500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, NULL, NULL, NULL, NULL, '0'),
(472, 1, 6, 1, 106, 2, '3', '1', '40', '', '', '1219307', '1116071', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(473, 1, 6, 1, 106, 2, '4', '1', '40', '', '', '1219308', '1116072', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(474, 1, 6, 1, 106, 2, '5', '1', '40', '', '', '1219309', '1116073', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(475, 1, 6, 1, 106, 2, '6', '1', '40', '', '', '1219310', '1116074', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '1'),
(476, 1, 4, 1, 82, 1, '0123', '1', '200', 'New', '111111', '222222', '33333', '3500', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 'No File', 0, NULL, NULL, NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `unit_condition`
--

CREATE TABLE `unit_condition` (
  `Unit_Condition_Id` int(11) NOT NULL,
  `Unit_English_Condition` varchar(200) NOT NULL,
  `Unit_Arabic_Condition` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit_condition`
--

INSERT INTO `unit_condition` (`Unit_Condition_Id`, `Unit_English_Condition`, `Unit_Arabic_Condition`) VALUES
(1, 'Rented', 'مؤجر'),
(2, 'Unoccupied', 'شاغر'),
(3, 'Under Construction or Maintenence ', 'تحت الانشاء أو الصيانة'),
(4, 'Rented Under Debate', 'موجر نزاع'),
(5, 'Company use', 'استخدام شركة ');

-- --------------------------------------------------------

--
-- Table structure for table `unit_detail`
--

CREATE TABLE `unit_detail` (
  `Unit_Detail_Id` int(11) NOT NULL,
  `Unit_English_Detail` varchar(200) NOT NULL,
  `Unit_Arabic_Detail` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit_detail`
--

INSERT INTO `unit_detail` (`Unit_Detail_Id`, `Unit_English_Detail`, `Unit_Arabic_Detail`) VALUES
(2, '3+ 1+ 3', '3 غرف + 1 صالة + 3 حمامات'),
(3, '1+0+1', '1 غرفة + 0 +  حمام 1'),
(4, '2+ 1+ 2', '2 غرفتين + 1 صالة + 2 حمامين'),
(5, 'No details', 'لا تفاصيل'),
(6, '1+ 1+ 1', '1 غرفة + 1 صالة + حمام 1'),
(7, 'Store 4x10', 'محل أربعة في عشرة'),
(8, '2+1+1', '2 غرفتين + 1 صالة + حمام 1'),
(9, '4+1+3', '4 غرف + 1 صالة + 3 حمامات'),
(10, '5+2+5', '5 غرف +  صالتين + 5 حمامات'),
(11, '3+1+1', '3غرف+1صالة +1حمام '),
(12, '3+1+2', '2غرفتين+1صالة +3 ثلاثة حمامات'),
(13, '1 Room + 1 Kitchen + 1 Bathroom', '1 غرفة + 1 مطبخ + حمام 1');

-- --------------------------------------------------------

--
-- Table structure for table `unit_type`
--

CREATE TABLE `unit_type` (
  `Unit_Type_Id` int(11) NOT NULL,
  `Unit_English_Type` varchar(200) NOT NULL,
  `Unit_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit_type`
--

INSERT INTO `unit_type` (`Unit_Type_Id`, `Unit_English_Type`, `Unit_Arabic_Type`) VALUES
(1, 'apartment', 'شقة'),
(2, 'store', 'محل'),
(3, 'Office', 'مكتب'),
(4, 'Villa', 'فيلا'),
(5, 'Guard room', 'غرفة حارس'),
(6, 'Public house', 'بيت شعبي'),
(8, 'Roof Room', 'غرفة سطح'),
(9, 'Depo', 'مخزن'),
(10, 'Hotel Apartments', 'شقق فندقية'),
(11, 'Garage', 'كراج'),
(12, 'Vacant land', 'أرض فضاء');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_ID` int(11) NOT NULL,
  `Emploee_Id` varchar(45) DEFAULT NULL,
  `Users_Name` varchar(200) NOT NULL,
  `Users_Ar_First_Name` varchar(200) NOT NULL,
  `Users_Ar_Last_Name` varchar(200) NOT NULL,
  `Users_password` varchar(200) NOT NULL,
  `Photo` varchar(200) NOT NULL,
  `Photo_Path` varchar(200) NOT NULL,
  `Role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_ID`, `Emploee_Id`, `Users_Name`, `Users_Ar_First_Name`, `Users_Ar_Last_Name`, `Users_password`, `Photo`, `Photo_Path`, `Role`) VALUES
(5, NULL, 'Ahmad', 'أحمد', 'محمود', 'bfcX++36cvYV3gXb8nuJdw==', '', '', '1'),
(7, NULL, 'Munzer', 'منذر', 'المنارة', 'mY6ptIKTfFCuyr6U/Kj6mA==', '', '', '1'),
(8, '2', 'Saeb', 'صائب', 'مصطفى', 'ol0eHZ+9SQh2naIzhSpODQ==', 'Saeb.jpg', '/English/Master_Panal/Employee_Photo/Saeb.jpeg', '1'),
(9, '4', 'Saadettin', 'سعد الدين', 'صباح', 'N5NDzg+L8LM3mkohjUSH0w==', 'Saaed.jpg', '/English/Master_Panal/Employee_Photo/saad.jpeg', '2'),
(10, NULL, 'Yazeed', 'يزيد', 'المنارة', '3D2bXH05KEINXIi/PbkarQ==', '', '', '3');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_typ`
--

CREATE TABLE `vendor_typ` (
  `Vendor_Type_Id` int(11) NOT NULL,
  `Vendor_English_Type` varchar(200) NOT NULL,
  `Vendor_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_typ`
--

INSERT INTO `vendor_typ` (`Vendor_Type_Id`, `Vendor_English_Type`, `Vendor_Arabic_Type`) VALUES
(1, 'Unknown', 'غير معروف');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_type`
--

CREATE TABLE `vendor_type` (
  `Vendor_Type_Id` int(11) NOT NULL,
  `Vendor_English_Type` varchar(200) NOT NULL,
  `Vendor_Arabic_Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_servic_info`
--

CREATE TABLE `website_servic_info` (
  `Id` int(11) NOT NULL,
  `Arabic_Titel` varchar(200) NOT NULL,
  `English_Titel` varchar(200) NOT NULL,
  `Arabic_Description` longtext NOT NULL,
  `English_Description` longtext NOT NULL,
  `Servic_Image_Name` longtext NOT NULL,
  `Servic_Image_Path` longtext NOT NULL,
  `Servic_Image_Path_WebSite` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website_servic_info`
--

INSERT INTO `website_servic_info` (`Id`, `Arabic_Titel`, `English_Titel`, `Arabic_Description`, `English_Description`, `Servic_Image_Name`, `Servic_Image_Path`, `Servic_Image_Path_WebSite`) VALUES
(9, 'إدارة العقارات	', 'Real Estate Management	', 'إدارة الممتلكات أو الممتلكات هي الإدارة والإشراف على تشغيل العقارات الممتلكات الشخصية أو المعدات أو غيرها من الأمور المتعلقة بالممتلكات الخاصة بشخص أو كيان آخر تدار من قبل موظف إدارة الممتلكات مقابل المال أو نسبة ربح يتم الاتفاق عليها	', 'Property or property management is the management and supervision of the operation of real estate personal property equipment or other property matters of a person or another entity It is managed by the property management employee in exchange for money or a profit percentage to be agreed	', 'about.jpg', '/English/Master_Panal/Service_Image/about.jpg', '/English/Master_Panal/Service_Image/about.jpg'),
(10, 'التطوير العقاري	', 'Real Estate Development	', 'نوع من الأعمال متعددة الأوجه تتضمن أنشطة تبدأ من نطاق إصلاح وتجديد المباني القائمة أو تأجيرها	', 'A type of multi-faceted business that includes activities starting from the scope of repairing and renovating existing buildings or leasing them	', 'image_1.jpg', '/English/Master_Panal/Service_Image/image_1.jpg', '/English/Master_Panal/Service_Image/image_1.jpg'),
(11, 'التثمين والوساطة العقارية	', 'Valuation And Real Estate Brokerage	', 'عقد أو اتفاق للتوسط بين شخصين طبيعيين أو اعتباريين أو أكثر لإبرام عقد أو إجراء أي تصرف في العقارات بالشروط التي يقبلها الشخص المعني	', 'A contract or agreement to mediate between two or more natural or legal persons to conclude a contract or conduct any disposal of real estate on the terms accepted by the person concerned	', 'image_6.jpg', '/English/Master_Panal/Service_Image/image_6.jpg', '/English/Master_Panal/Service_Image/image_6.jpg'),
(12, 'مقاولات البناء والصيانة	', 'Building And Maintenance Contracting	', 'تسعى الشركة إلى تحقيق نهضة هندسية شاملة في جميع مجالات عملها من أجل النهوض بمصالح الوطن والريادة تسعى الشركة لكسب ثقة أكبر عدد ممكن من العملاء وتلتزم بإرضائهم من خلال الالتزام بالدقة معايير الجودة والسلامة واستخدام أحدث التقنيات وفرق العمل المهنية لتنفيذ جميع المشاريع	', 'The company seeks to achieve a comprehensive engineering renaissance in all areas of its work in order to advance the interests of the country and leadership. The company seeks to gain the confidence of the largest possible number of customers and is committed to satisfying them through adherence to accuracy. quality and safety standards, and the use of the latest technologies and professional work teams to implement all projects.	', 'services-3.jpg', '/English/Master_Panal/Service_Image/services-3.jpg', '/English/Master_Panal/Service_Image/services-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `websit_info`
--

CREATE TABLE `websit_info` (
  `WebSit_Info_Id` int(11) NOT NULL,
  `Who_Are_We_Ar` longtext,
  `Who_Are_We_En` longtext,
  `Adress_Ar` longtext,
  `Adress_En` longtext,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Facebook` varchar(50) DEFAULT NULL,
  `Whatssapp` varchar(50) DEFAULT NULL,
  `Email_From` varchar(200) DEFAULT NULL,
  `Email_To` varchar(200) DEFAULT NULL,
  `Email_STMP` varchar(200) DEFAULT NULL,
  `Email_Port` varchar(200) DEFAULT NULL,
  `Email_Password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `websit_info`
--

INSERT INTO `websit_info` (`WebSit_Info_Id`, `Who_Are_We_Ar`, `Who_Are_We_En`, `Adress_Ar`, `Adress_En`, `Phone`, `Email`, `Facebook`, `Whatssapp`, `Email_From`, `Email_To`, `Email_STMP`, `Email_Port`, `Email_Password`) VALUES
(1, 'شركة المنارة للعقارات (ذ.م.م) هي الشركة الرائدة والمرخصة في دولة قطر لتقديم خدمات الخبرة والإستشارات العقارية وتثمين العقارات بأنواعها وخدمات الوساطة العقارية وخدمات إدارة الممتلكات والعقارات والمجمعات و المباني السكنية والإدارية والتجارية .\r\n تأسست شركة المنارة للعقارات في عام 2007 ، وهي تتمتع اليوم بمركز متقدم في سوق التثمين العقاري والخبرة والإستشارات العقارية في قطر سواء من حيث حجم الأعمال أو مكانتها كمرجعية ذات إعتمادية وموثوقية تأسيساً على عملها المهني العالي المستوى في مجال التثمين والخبرة والإستشارات العقارية.\r\n تتمتع شركة المنارة للعقارات بموقع متقدم ضمن القائمة المتميزة للخبراء والمثمنين العقاريين المعتمدين في قطر ، وتحظى بترخيص من وزارة التجارة والصناعة ووزارة العدل والمجلس الأعلى للقضاء ، كما تحظى الشركة بإعتماد من عدد من البنوك القطرية ومجموعة من الشركات المساهمة العامة المدرجة في بورصة قطر قضلاً عن عدد من الشركات الرائدة في مجال التمويل والإستثمار العقاري في السوق القطري.\r\n يتمتع فريق عمل الشركة بخبرات ومعرفة معمَّقة في تثمين العقارات والخدمات والإستشارات العقارية والوساطة وإدارة الممتلكات بكافة أنواعها ، تراكمت على مدى 13عاماً، شهد خلالها سوق العقار القطري فترات إزدهار غير مسبوقة (2000 – 2008) وفترات تراجع بفعل أزمة الرهن العقاري العالمي في نهاية عام 2008، ثم فترات تذبذب، وأخيراً فترات إستقرار كما هو الحال في الوقت الحاضر. لدى الشركة سجل ممتاز في التعاون مع شركات خبرة وتثمين دولية تعمل في السوق القطري.\r\n نحرص أشد الحرص على مساندة قرارات عملائنا الإستثمارية و الإئتمانية بتقديم رأي مهني ومحايد ومستقل عن القيمة التقديرية العادلة للعقارات التي يطلب عملاؤنا منا تثمينها، مع مراعاة أن يكون تثميننا منسجماً ومتوافقاً مع الوضع القائم في سوق العقار والوضع الإقتصادي في دولة قطر في تاريخ التثمين.\r\n نعمل على أن نقدم لعملائنا المشورة والنصح مراعين في ذلك الأسس والممارسات السليمة المتعارف عليها في مهنة التثمين العقاري في قطر ومعايير التثمين الدولية الصادرة من مجـــــلس معـــايير التقــــييم الدولــية (International Valuation Standards Council).\r\n نسعى لتقديم مستوىً عالٍ من الأداء يتوافق مع المستوى العالي من المعرفة و الخبرة العملية المعمَّقة لدى فريق عملنا، ونأخد دائماً بعين الإعتبار العوامل المختلفة التي تؤثر على نتائج عملنا كمثمنين عقاريين كالإختلافات في حالة ومزايا كل عقار نقوم بتثمينه مقارنة بالعقارات المشابهة التي تم إبرام صفقات شراء وبيع بشأنها أثناء تنفيد عملية التثمين أو قبل ذلك بفترات زمنية متقاربة.\r\n خلال فترة عملنا من عام 2007 وحتى هذا التاريخ أنجزنا فيها مجموعة تثمينات كثيرة شملت كل أنواع العقارات وبأثمان تقديرية بلغ أدناها 1,5 مليون ريال لعقار مثمن وتجاوزت تثمينات عديدة أجريناها مبالغ تراوحت بين 200 مليون ريال وأكثر.', 'Al Manara Real Estate Company (W.L.S.) is the leading and licensed company in the State of Qatar to provide expert services, real estate consultancy, real estate valuation of all kinds, real estate brokerage services, property management services, real estate, complexes, and residential, administrative and commercial buildings. Al-Manara Real Estate Company was established in 2007, and today it enjoys an advanced position in the real estate valuation market, experience and real estate consultancy in Qatar, whether in terms of business volume or its position as a reliable and reliable reference based on its high-level professional work in the field of valuation, experience and real estate consultancy. Al Manara Real Estate Company enjoys an advanced position within the distinguished list of accredited real estate experts and appraisers in Qatar. It is licensed by the Ministry of Commerce and Industry, the Ministry of Justice and the Supreme Judicial Council. The company also enjoys accreditation from a number of Qatari banks and a group of public shareholding companies listed on the Qatar Stock Exchange as well as a number of Leading real estate finance and investment companies in the Qatari market. The company\'s team has extensive experience and knowledge in real estate valuation, services, real estate consulting, brokerage and property management of all kinds, accumulated over a period of 13 years, during which the Qatari real estate market witnessed periods of unprecedented prosperity (2000-2008) and periods of decline due to the global mortgage crisis at the end of 2008. Then periods of fluctuation, and finally periods of stability,', 'الدوحة / الخليج الغربي / برج الدوحة ', 'Doha / West Bay / Doha Tower', '50300588', 'Admin@almanara.com', 'FaceBook_FaceBook', '50300588', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_Id` int(11) NOT NULL,
  `zone_number` varchar(200) NOT NULL,
  `zone_English_name` varchar(200) NOT NULL,
  `zone_arabic_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_Id`, `zone_number`, `zone_English_name`, `zone_arabic_name`) VALUES
(1, '1', 'Al Jasra', 'الجسرة'),
(2, '2', 'Al Bidda', 'البدع'),
(3, '3', 'Mushaireb', 'مشيرب'),
(4, '4', 'Musheireb', 'مشيرب'),
(5, '5', 'Barahat Al Jufairi ', 'براحة الجفيري'),
(6, '5', 'AlNajada', 'النجادة'),
(7, '5', 'Fereej Al Asmakh', 'فريج الأصمخ'),
(8, '6', 'Old Al Ghanim', 'الغانم العتيق'),
(9, '7', 'Souq Waqif', 'سوق واقف'),
(10, '12', 'Al Bidda', 'البدع'),
(11, '12', 'Rumaila', 'رميلة'),
(12, '12', 'Wadi Al Sail', 'وادي السيل'),
(13, '13', 'Mushaireb', 'مشيرب'),
(14, '14', 'Fereej Abdel Aziz', 'فريج عبد العزيز'),
(15, '15', 'Doha Al Jadeeda', 'الدوحة الجديدة'),
(16, '16', 'Old Al Ghanim', 'الغانم العتيق'),
(17, '17', 'Al Ruffaa', 'الرفاع'),
(18, '17', 'Al Hitmi', 'الهتمي'),
(19, '18', 'Slata', 'اسلطة'),
(20, '18', 'Al Mirqab', 'المرقاب'),
(21, '19', 'Doha Port', 'ميناء الدوحة'),
(22, '20', 'Wadi Al Sail', 'وادي السيل'),
(23, '21', 'Al Rumaila', 'الرميلة'),
(24, '22', 'Bin Mahmoud', 'بن محمود'),
(25, '23', 'Bin Mahmoud', 'بن محمود'),
(26, '24', 'Rawdat Al Khail', 'روضة الخيل'),
(27, '24', 'Al Muntazah', 'المنتزه'),
(28, '25', 'Al Mansoura', 'المنصورة'),
(29, '25', 'Bin Dirhem', 'بن درهم'),
(30, '26', 'Najma', 'نجمة'),
(31, '27', 'Umm Ghuwailina', 'إم غويلينة'),
(32, '28', 'Al Khulaifat', 'الخليفات'),
(33, '28', 'Ras Bu Abboud', 'راس أبو عبود'),
(34, '29', 'Ras Bu Abboud', 'راس أبو عبود'),
(35, '30', 'Duhail', 'دحيل'),
(36, '31', 'Umm Lekhba', 'إم الخبا'),
(37, '32', 'Madinat Khalifa North', 'مدينة خليفة الشمالية'),
(38, '32', 'Dahl Al Hamam', 'دحل الحمام'),
(39, '33', 'Al Markhiya', 'المرخية'),
(40, '34', '  Madinat Khalifa South ', 'مدينة خليفة الجنوبية'),
(41, '35', 'Kulaib', 'كليب'),
(42, '36', 'Al Messila', 'المسيلة'),
(43, '37', 'New Al Hitmi', 'الهتمي الجديد'),
(44, '37', 'Bin Omran', 'بن عمران'),
(45, '37', 'Hamad Medical City', 'مدينة حمد الطبية'),
(46, '38', 'Al Sadd', 'السد'),
(47, '39', 'Al Nasr', 'النصر'),
(48, '39', 'Al Sadd', 'السد'),
(49, '39', 'Al Mirqab Al Jadeed', 'المرقاب الجديد'),
(50, '40', 'New Slata', 'سلاطة الجديدة'),
(51, '41', 'Nuaija', 'نويجا'),
(52, '42', 'Al Hilal', 'الهلال'),
(53, '43', 'Al Mansoura', 'المنصورة'),
(54, '43', 'Nuaija-Fereej Al Ali', 'نويجا فريج العلي'),
(55, '44', 'Al Ali', 'العلي'),
(56, '45', 'Old Airport', 'المطار القديم'),
(57, '46', 'Al Thumama', 'الثمامة'),
(58, '47', 'Al Thumama', 'الثمامة'),
(59, '48', 'Doha International Airport', 'مطار الدوحة الدولي'),
(60, '49', 'Hamad International Airport', 'مطار حمد الدولي'),
(61, '49', 'Banana Island', 'جزيرة بنانا'),
(62, '49', 'Ras Bu Fontas', 'راس بو فنطاس'),
(63, '50', 'Al Thumama', 'الثمامة'),
(64, '51', 'Al Rayyan Bani Hajer', 'الريان بني هاجر'),
(65, '51', 'Al Seej', 'السيج'),
(66, '51', 'Al Themaid', 'الثمايد'),
(67, '51', 'Gharaffat Al Rayan', 'غرافة الريان'),
(68, '79', 'Al Ruweys', 'الرويس'),
(69, '70', 'Al Kheesa', 'الخيسة'),
(70, '91', 'Al Wukair', 'الوكير'),
(71, '51', 'Izghawa', 'ازغوى'),
(72, '56', 'Ain Khaled', 'عين خالد'),
(73, '57', 'Industrial Zone', 'المنطقة الصناعية'),
(74, '60', 'Al Dafna', 'الدفنة'),
(76, '66', 'Legtaifiya', 'لقطيفية'),
(77, '51', 'Al Gharrafa', 'الغرافة ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arcive_building`
--
ALTER TABLE `arcive_building`
  ADD PRIMARY KEY (`Building_Id`),
  ADD UNIQUE KEY `Building_Id_UNIQUE` (`Building_Id`),
  ADD KEY `fk_building_building_condition1_idx` (`building_condition_Building_Condition_Id`),
  ADD KEY `fk_building_building_type1_idx` (`building_type_Building_Type_Id`),
  ADD KEY `fk_building_owner_ship1_idx` (`owner_ship_Owner_Ship_Id`);

--
-- Indexes for table `arcive_building_contract`
--
ALTER TABLE `arcive_building_contract`
  ADD PRIMARY KEY (`Contract_Id`),
  ADD UNIQUE KEY `Contract_Id_UNIQUE` (`Contract_Id`),
  ADD KEY `fk_building_contract_users1_idx` (`users_user_ID`),
  ADD KEY `fk_building_contract_tenants1_idx` (`tenants_Tenants_ID`),
  ADD KEY `fk_building_contract_contract_template1_idx` (`contract_template_Contract_template_Id`),
  ADD KEY `fk_building_contract_payment_type1_idx` (`payment_type_payment_type_Id`),
  ADD KEY `fk_building_contract_contract_type1_idx` (`contract_type_Contract_Type_Id`),
  ADD KEY `fk_building_contract_building1_idx` (`building_Building_Id`),
  ADD KEY `fk_building_contract_reason_for_rent1_idx` (`reason_for_rent_Reason_For_Rent_Id`);

--
-- Indexes for table `arcive_contract`
--
ALTER TABLE `arcive_contract`
  ADD PRIMARY KEY (`Contract_Id`),
  ADD UNIQUE KEY `Contract_Id_UNIQUE` (`Contract_Id`),
  ADD KEY `fk_contract_contract_type1_idx` (`contract_type_Contract_Type_Id`),
  ADD KEY `fk_contract_contract_template1_idx` (`contract_template_Contract_template_Id`),
  ADD KEY `fk_contract_tenants1_idx` (`tenants_Tenants_ID`),
  ADD KEY `fk_contract_payment_type1_idx` (`payment_type_payment_type_Id`),
  ADD KEY `fk_contract_users1_idx` (`users_user_ID`),
  ADD KEY `fk_contract_units1_idx` (`units_Unit_ID`),
  ADD KEY `fk_contract_reason_for_rent1_idx` (`reason_for_rent_Reason_For_Rent_Id`);

--
-- Indexes for table `arcive_ownership`
--
ALTER TABLE `arcive_ownership`
  ADD PRIMARY KEY (`Owner_Ship_Id`),
  ADD UNIQUE KEY `Owner_Ship_Id_UNIQUE` (`Owner_Ship_Id`),
  ADD KEY `fk_owner_ship_zone1_idx` (`zone_zone_Id`),
  ADD KEY `fk_owner_ship_owner1_idx` (`owner_Owner_Id`);

--
-- Indexes for table `arcive_units`
--
ALTER TABLE `arcive_units`
  ADD PRIMARY KEY (`Unit_ID`),
  ADD UNIQUE KEY `Unit_ID_UNIQUE` (`Unit_ID`),
  ADD KEY `fk_units_unit_condition1_idx` (`unit_condition_Unit_Condition_Id`),
  ADD KEY `fk_units_unit_detail1_idx` (`unit_detail_Unit_Detail_Id`),
  ADD KEY `fk_units_unit_type1_idx` (`unit_type_Unit_Type_Id`),
  ADD KEY `fk_units_building1_idx` (`building_Building_Id`),
  ADD KEY `fk_units_furniture_case1_idx` (`furniture_case_Furniture_case_Id`);

--
-- Indexes for table `aseet_warranty`
--
ALTER TABLE `aseet_warranty`
  ADD PRIMARY KEY (`Aseet_warranty_Id`),
  ADD UNIQUE KEY `Aseet_warranty_Id_UNIQUE` (`Aseet_warranty_Id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`Assets_Id`),
  ADD UNIQUE KEY `Assets_Id_UNIQUE` (`Assets_Id`),
  ADD KEY `fk_assets_asset_condition1_idx` (`asset_condition_Asset_Condition_Id`),
  ADD KEY `fk_assets_asset_location1_idx` (`asset_location_Asset_Location_Id`),
  ADD KEY `fk_assets_vendor_type1_idx` (`vendor_type_Vendor_Type_Id`),
  ADD KEY `fk_assets_maintenance_categoty1_idx` (`maintenance_categoty_Categoty_Id`);

--
-- Indexes for table `asset_condition`
--
ALTER TABLE `asset_condition`
  ADD PRIMARY KEY (`Asset_Condition_Id`),
  ADD UNIQUE KEY `Asset_Type_Id_UNIQUE` (`Asset_Condition_Id`);

--
-- Indexes for table `asset_location`
--
ALTER TABLE `asset_location`
  ADD PRIMARY KEY (`Asset_Location_Id`),
  ADD UNIQUE KEY `Asset_Condition_Id_UNIQUE` (`Asset_Location_Id`);

--
-- Indexes for table `asset_type`
--
ALTER TABLE `asset_type`
  ADD PRIMARY KEY (`Asset_Type_Id`),
  ADD UNIQUE KEY `Vendor_Type_Id_UNIQUE` (`Asset_Type_Id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`Bank_Id`),
  ADD UNIQUE KEY `Bank_Id_UNIQUE` (`Bank_Id`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`Building_Id`),
  ADD UNIQUE KEY `Building_Id_UNIQUE` (`Building_Id`),
  ADD KEY `fk_building_building_condition1_idx` (`building_condition_Building_Condition_Id`),
  ADD KEY `fk_building_building_type1_idx` (`building_type_Building_Type_Id`),
  ADD KEY `fk_building_owner_ship1_idx` (`owner_ship_Owner_Ship_Id`);

--
-- Indexes for table `building_cash_amount`
--
ALTER TABLE `building_cash_amount`
  ADD PRIMARY KEY (`Cash_Amount_ID`);

--
-- Indexes for table `building_cheques`
--
ALTER TABLE `building_cheques`
  ADD PRIMARY KEY (`Cheques_Id`),
  ADD UNIQUE KEY `Cheques_Id_UNIQUE` (`Cheques_Id`),
  ADD KEY `fk_building_cheques_tenants1_idx` (`tenants_Tenants_ID`),
  ADD KEY `fk_building_cheques_cheque_type1_idx` (`cheque_type_Cheque_Type_id`),
  ADD KEY `fk_building_cheques_bank1_idx` (`bank_Bank_Id`),
  ADD KEY `fk_building_cheques_building_contract1_idx` (`building_contract_Contract_Id`);

--
-- Indexes for table `building_condition`
--
ALTER TABLE `building_condition`
  ADD PRIMARY KEY (`Building_Condition_Id`),
  ADD UNIQUE KEY `Building_Condition_Id_UNIQUE` (`Building_Condition_Id`);

--
-- Indexes for table `building_contract`
--
ALTER TABLE `building_contract`
  ADD PRIMARY KEY (`Contract_Id`),
  ADD UNIQUE KEY `Contract_Id_UNIQUE` (`Contract_Id`),
  ADD KEY `fk_building_contract_users1_idx` (`users_user_ID`),
  ADD KEY `fk_building_contract_tenants1_idx` (`tenants_Tenants_ID`),
  ADD KEY `fk_building_contract_contract_template1_idx` (`contract_template_Contract_template_Id`),
  ADD KEY `fk_building_contract_payment_type1_idx` (`payment_type_payment_type_Id`),
  ADD KEY `fk_building_contract_contract_type1_idx` (`contract_type_Contract_Type_Id`),
  ADD KEY `fk_building_contract_building1_idx` (`building_Building_Id`),
  ADD KEY `fk_building_contract_reason_for_rent1_idx` (`reason_for_rent_Reason_For_Rent_Id`);

--
-- Indexes for table `building_transformation_table`
--
ALTER TABLE `building_transformation_table`
  ADD PRIMARY KEY (`transformation_Table_ID`);

--
-- Indexes for table `building_type`
--
ALTER TABLE `building_type`
  ADD PRIMARY KEY (`Building_Type_Id`),
  ADD UNIQUE KEY `Building_Type_Id_UNIQUE` (`Building_Type_Id`);

--
-- Indexes for table `cash_amount`
--
ALTER TABLE `cash_amount`
  ADD PRIMARY KEY (`Cash_Amount_ID`);

--
-- Indexes for table `cheques`
--
ALTER TABLE `cheques`
  ADD PRIMARY KEY (`Cheques_Id`),
  ADD UNIQUE KEY `Cheques_Id_UNIQUE` (`Cheques_Id`),
  ADD KEY `fk_cheques_tenants1_idx` (`tenants_Tenants_ID`),
  ADD KEY `fk_cheques_cheque_type1_idx` (`cheque_type_Cheque_Type_id`),
  ADD KEY `fk_cheques_bank1_idx` (`bank_Bank_Id`),
  ADD KEY `fk_cheques_contract1_idx` (`contract_Contract_Id`);

--
-- Indexes for table `cheque_type`
--
ALTER TABLE `cheque_type`
  ADD PRIMARY KEY (`Cheque_Type_id`),
  ADD UNIQUE KEY `Cheque_Type_id_UNIQUE` (`Cheque_Type_id`);

--
-- Indexes for table `collection_table`
--
ALTER TABLE `collection_table`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Id_UNIQUE` (`Id`);

--
-- Indexes for table `company_info`
--
ALTER TABLE `company_info`
  ADD PRIMARY KEY (`Company_Id`),
  ADD UNIQUE KEY `Company_Id_UNIQUE` (`Company_Id`);

--
-- Indexes for table `company_representative`
--
ALTER TABLE `company_representative`
  ADD PRIMARY KEY (`Company_representative_Id`),
  ADD UNIQUE KEY `Company_representative_Id_UNIQUE` (`Company_representative_Id`),
  ADD KEY `fk_company_representative_nationality1_idx` (`nationality_nationality_ID`),
  ADD KEY `fk_company_representative_tenants1_idx` (`tenants_Tenants_ID`);

--
-- Indexes for table `complaint_report_request`
--
ALTER TABLE `complaint_report_request`
  ADD PRIMARY KEY (`Complaint_Report_Request_Id`),
  ADD UNIQUE KEY `Complaint_Report_Request_Id_UNIQUE` (`Complaint_Report_Request_Id`);

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`Contract_Id`),
  ADD UNIQUE KEY `Contract_Id_UNIQUE` (`Contract_Id`),
  ADD KEY `fk_contract_contract_type1_idx` (`contract_type_Contract_Type_Id`),
  ADD KEY `fk_contract_contract_template1_idx` (`contract_template_Contract_template_Id`),
  ADD KEY `fk_contract_tenants1_idx` (`tenants_Tenants_ID`),
  ADD KEY `fk_contract_payment_type1_idx` (`payment_type_payment_type_Id`),
  ADD KEY `fk_contract_users1_idx` (`users_user_ID`),
  ADD KEY `fk_contract_units1_idx` (`units_Unit_ID`),
  ADD KEY `fk_contract_reason_for_rent1_idx` (`reason_for_rent_Reason_For_Rent_Id`);

--
-- Indexes for table `contractor`
--
ALTER TABLE `contractor`
  ADD PRIMARY KEY (`Contractor_ID`),
  ADD UNIQUE KEY `Contractor_ID_UNIQUE` (`Contractor_ID`);

--
-- Indexes for table `contract_template`
--
ALTER TABLE `contract_template`
  ADD PRIMARY KEY (`Contract_template_Id`),
  ADD UNIQUE KEY `Contract_template_Id_UNIQUE` (`Contract_template_Id`);

--
-- Indexes for table `contract_type`
--
ALTER TABLE `contract_type`
  ADD PRIMARY KEY (`Contract_Type_Id`),
  ADD UNIQUE KEY `Contract_Type_Id_UNIQUE` (`Contract_Type_Id`);

--
-- Indexes for table `delete_archive`
--
ALTER TABLE `delete_archive`
  ADD PRIMARY KEY (`Delete_Archive_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_Id`),
  ADD UNIQUE KEY `Department_Id_UNIQUE` (`Department_Id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_Id`),
  ADD UNIQUE KEY `Employee_Id_UNIQUE` (`Employee_Id`),
  ADD KEY `fk_employee_department1_idx` (`department_Department_Id`),
  ADD KEY `fk_employee_employee_level1_idx` (`employee_level_Employee_Level_Id`);

--
-- Indexes for table `employee_level`
--
ALTER TABLE `employee_level`
  ADD PRIMARY KEY (`Employee_Level_Id`),
  ADD UNIQUE KEY `Employee_Level_Id_UNIQUE` (`Employee_Level_Id`);

--
-- Indexes for table `furniture_case`
--
ALTER TABLE `furniture_case`
  ADD PRIMARY KEY (`Furniture_case_Id`),
  ADD UNIQUE KEY `Furniture_case_Id_UNIQUE` (`Furniture_case_Id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`Inventory_Id`),
  ADD UNIQUE KEY `Inventory_Id_UNIQUE` (`Inventory_Id`),
  ADD KEY `fk_inventory_employee1_idx` (`employee_Employee_Id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `languages_contract`
--
ALTER TABLE `languages_contract`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `languages_expensess`
--
ALTER TABLE `languages_expensess`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `languages_maintenance`
--
ALTER TABLE `languages_maintenance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `languages_master`
--
ALTER TABLE `languages_master`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `languages_task`
--
ALTER TABLE `languages_task`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `languages_tenant`
--
ALTER TABLE `languages_tenant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `listing_type`
--
ALTER TABLE `listing_type`
  ADD PRIMARY KEY (`Listing_Type_Id`),
  ADD UNIQUE KEY `Asset_Type_Id_UNIQUE` (`Listing_Type_Id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`LogId`),
  ADD UNIQUE KEY `LogId_UNIQUE` (`LogId`);

--
-- Indexes for table `maintenance_categoty`
--
ALTER TABLE `maintenance_categoty`
  ADD PRIMARY KEY (`Categoty_Id`),
  ADD UNIQUE KEY `Categoty_Id_UNIQUE` (`Categoty_Id`);

--
-- Indexes for table `maintenance_request`
--
ALTER TABLE `maintenance_request`
  ADD PRIMARY KEY (`Maintenance_Request_ID`),
  ADD UNIQUE KEY `Maintenance_ID_UNIQUE` (`Maintenance_Request_ID`),
  ADD KEY `fk_maintenance_assets1_idx` (`assets_Assets_Id`),
  ADD KEY `fk_maintenance_request_complaint_report_request1_idx` (`complaint_report_request_Complaint_Report_Request_Id`),
  ADD KEY `fk_maintenance_request_maintenance_categoty1_idx` (`maintenance_categoty_Categoty_Id`);

--
-- Indexes for table `maintenance_type`
--
ALTER TABLE `maintenance_type`
  ADD PRIMARY KEY (`Maintenance_Type_Id`),
  ADD UNIQUE KEY `Maintenance_Type_Id_UNIQUE` (`Maintenance_Type_Id`);

--
-- Indexes for table `maintenece_templete`
--
ALTER TABLE `maintenece_templete`
  ADD PRIMARY KEY (`Maintenece_Templete_Id`);

--
-- Indexes for table `main_type_evaluation`
--
ALTER TABLE `main_type_evaluation`
  ADD PRIMARY KEY (`Main_Type_Evaluation_Id`);

--
-- Indexes for table `management_expensess`
--
ALTER TABLE `management_expensess`
  ADD PRIMARY KEY (`Management_Expensess_Id`);

--
-- Indexes for table `mortgaged_wonership`
--
ALTER TABLE `mortgaged_wonership`
  ADD PRIMARY KEY (`Mortgaged_Wonership_Id`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`nationality_ID`),
  ADD UNIQUE KEY `nationality_ID_UNIQUE` (`nationality_ID`);

--
-- Indexes for table `notification_type`
--
ALTER TABLE `notification_type`
  ADD PRIMARY KEY (`Notification_Id`),
  ADD UNIQUE KEY `Notification_Id_UNIQUE` (`Notification_Id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`Owner_Id`),
  ADD UNIQUE KEY `Owner_Id_UNIQUE` (`Owner_Id`);

--
-- Indexes for table `ownership_statment`
--
ALTER TABLE `ownership_statment`
  ADD PRIMARY KEY (`Statment_Id`);

--
-- Indexes for table `ownership_status`
--
ALTER TABLE `ownership_status`
  ADD PRIMARY KEY (`ownership_status_id`),
  ADD UNIQUE KEY `ownership_status_id_UNIQUE` (`ownership_status_id`);

--
-- Indexes for table `owner_ship`
--
ALTER TABLE `owner_ship`
  ADD PRIMARY KEY (`Owner_Ship_Id`),
  ADD UNIQUE KEY `Owner_Ship_Id_UNIQUE` (`Owner_Ship_Id`),
  ADD KEY `fk_owner_ship_zone1_idx` (`zone_zone_Id`),
  ADD KEY `fk_owner_ship_owner1_idx` (`owner_Owner_Id`);

--
-- Indexes for table `payment_frequency`
--
ALTER TABLE `payment_frequency`
  ADD PRIMARY KEY (`Payment_Frequency_Id`),
  ADD UNIQUE KEY `Payment_Frequency_Id_UNIQUE` (`Payment_Frequency_Id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`payment_type_Id`),
  ADD UNIQUE KEY `payment_type_Id_UNIQUE` (`payment_type_Id`);

--
-- Indexes for table `periodec_maintenance_new`
--
ALTER TABLE `periodec_maintenance_new`
  ADD PRIMARY KEY (`Periodec_Maintenance_ID`);

--
-- Indexes for table `periodic_maintenence`
--
ALTER TABLE `periodic_maintenence`
  ADD PRIMARY KEY (`Periodic_Maintenence_ID`),
  ADD UNIQUE KEY `Periodic_Maintenence_ID_UNIQUE` (`Periodic_Maintenence_ID`);

--
-- Indexes for table `pickup_delivery`
--
ALTER TABLE `pickup_delivery`
  ADD PRIMARY KEY (`Pickup_Delivery_Id`);

--
-- Indexes for table `real_estate_investment`
--
ALTER TABLE `real_estate_investment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `reason_for_rent`
--
ALTER TABLE `reason_for_rent`
  ADD PRIMARY KEY (`Reason_For_Rent_Id`),
  ADD UNIQUE KEY `Reason_For_Rent_Id_UNIQUE` (`Reason_For_Rent_Id`);

--
-- Indexes for table `relateddocuments`
--
ALTER TABLE `relateddocuments`
  ADD PRIMARY KEY (`DocId`),
  ADD UNIQUE KEY `DocId_UNIQUE` (`DocId`);

--
-- Indexes for table `requst_source`
--
ALTER TABLE `requst_source`
  ADD PRIMARY KEY (`Requst_Source_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `sub_type_evaluation`
--
ALTER TABLE `sub_type_evaluation`
  ADD PRIMARY KEY (`Sub_Type_Evaluation_Id`);

--
-- Indexes for table `task_management`
--
ALTER TABLE `task_management`
  ADD PRIMARY KEY (`Task_Management_ID`);

--
-- Indexes for table `task_part`
--
ALTER TABLE `task_part`
  ADD PRIMARY KEY (`Task_Part_Id`);

--
-- Indexes for table `task_type`
--
ALTER TABLE `task_type`
  ADD PRIMARY KEY (`Task_Type_Id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`Tenants_ID`),
  ADD UNIQUE KEY `Tenants_ID_UNIQUE` (`Tenants_ID`),
  ADD KEY `fk_tenants_tenant_type1_idx` (`tenant_type_Tenant_Type_Id`),
  ADD KEY `fk_tenants_nationality1_idx` (`nationality_nationality_ID`);

--
-- Indexes for table `tenant_accounts`
--
ALTER TABLE `tenant_accounts`
  ADD PRIMARY KEY (`Tenant_Accounts_Id`);

--
-- Indexes for table `tenant_evaluation`
--
ALTER TABLE `tenant_evaluation`
  ADD PRIMARY KEY (`Tenant_Evaluation_Id`);

--
-- Indexes for table `tenant_notification`
--
ALTER TABLE `tenant_notification`
  ADD PRIMARY KEY (`Tenant_Notification_Id`);

--
-- Indexes for table `tenant_sending`
--
ALTER TABLE `tenant_sending`
  ADD PRIMARY KEY (`Tenant_Sending_Id`);

--
-- Indexes for table `tenant_type`
--
ALTER TABLE `tenant_type`
  ADD PRIMARY KEY (`Tenant_Type_Id`),
  ADD UNIQUE KEY `Tenant_Type_Id_UNIQUE` (`Tenant_Type_Id`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`Transaction_Type_Id`),
  ADD UNIQUE KEY `Transaction_Type_Id_UNIQUE` (`Transaction_Type_Id`);

--
-- Indexes for table `transformation_bank`
--
ALTER TABLE `transformation_bank`
  ADD PRIMARY KEY (`transformation_Bank_ID`);

--
-- Indexes for table `transformation_table`
--
ALTER TABLE `transformation_table`
  ADD PRIMARY KEY (`transformation_Table_ID`);

--
-- Indexes for table `under_contract`
--
ALTER TABLE `under_contract`
  ADD PRIMARY KEY (`Under_Contract_Id`),
  ADD UNIQUE KEY `Contract_Type_Id_UNIQUE` (`Under_Contract_Id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`Unit_ID`),
  ADD UNIQUE KEY `Unit_ID_UNIQUE` (`Unit_ID`),
  ADD KEY `fk_units_unit_condition1_idx` (`unit_condition_Unit_Condition_Id`),
  ADD KEY `fk_units_unit_detail1_idx` (`unit_detail_Unit_Detail_Id`),
  ADD KEY `fk_units_unit_type1_idx` (`unit_type_Unit_Type_Id`),
  ADD KEY `fk_units_building1_idx` (`building_Building_Id`),
  ADD KEY `fk_units_furniture_case1_idx` (`furniture_case_Furniture_case_Id`);

--
-- Indexes for table `unit_condition`
--
ALTER TABLE `unit_condition`
  ADD PRIMARY KEY (`Unit_Condition_Id`),
  ADD UNIQUE KEY `Unit_Condition_Id_UNIQUE` (`Unit_Condition_Id`);

--
-- Indexes for table `unit_detail`
--
ALTER TABLE `unit_detail`
  ADD PRIMARY KEY (`Unit_Detail_Id`),
  ADD UNIQUE KEY `Unit_Detail_Id_UNIQUE` (`Unit_Detail_Id`);

--
-- Indexes for table `unit_type`
--
ALTER TABLE `unit_type`
  ADD PRIMARY KEY (`Unit_Type_Id`),
  ADD UNIQUE KEY `Unit_Type_Id_UNIQUE` (`Unit_Type_Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_ID`),
  ADD UNIQUE KEY `user_ID_UNIQUE` (`user_ID`);

--
-- Indexes for table `vendor_typ`
--
ALTER TABLE `vendor_typ`
  ADD PRIMARY KEY (`Vendor_Type_Id`),
  ADD UNIQUE KEY `Vendor_Type_Id_UNIQUE` (`Vendor_Type_Id`);

--
-- Indexes for table `vendor_type`
--
ALTER TABLE `vendor_type`
  ADD PRIMARY KEY (`Vendor_Type_Id`),
  ADD UNIQUE KEY `Vendor_Type_Id_UNIQUE` (`Vendor_Type_Id`);

--
-- Indexes for table `website_servic_info`
--
ALTER TABLE `website_servic_info`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `websit_info`
--
ALTER TABLE `websit_info`
  ADD PRIMARY KEY (`WebSit_Info_Id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_Id`),
  ADD UNIQUE KEY `zone_Id_UNIQUE` (`zone_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arcive_building`
--
ALTER TABLE `arcive_building`
  MODIFY `Building_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `arcive_building_contract`
--
ALTER TABLE `arcive_building_contract`
  MODIFY `Contract_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `arcive_contract`
--
ALTER TABLE `arcive_contract`
  MODIFY `Contract_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `arcive_ownership`
--
ALTER TABLE `arcive_ownership`
  MODIFY `Owner_Ship_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `arcive_units`
--
ALTER TABLE `arcive_units`
  MODIFY `Unit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=473;

--
-- AUTO_INCREMENT for table `aseet_warranty`
--
ALTER TABLE `aseet_warranty`
  MODIFY `Aseet_warranty_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `Assets_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `asset_condition`
--
ALTER TABLE `asset_condition`
  MODIFY `Asset_Condition_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `asset_location`
--
ALTER TABLE `asset_location`
  MODIFY `Asset_Location_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `asset_type`
--
ALTER TABLE `asset_type`
  MODIFY `Asset_Type_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `Bank_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `Building_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `building_cash_amount`
--
ALTER TABLE `building_cash_amount`
  MODIFY `Cash_Amount_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `building_cheques`
--
ALTER TABLE `building_cheques`
  MODIFY `Cheques_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT for table `building_condition`
--
ALTER TABLE `building_condition`
  MODIFY `Building_Condition_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `building_contract`
--
ALTER TABLE `building_contract`
  MODIFY `Contract_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `building_transformation_table`
--
ALTER TABLE `building_transformation_table`
  MODIFY `transformation_Table_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `building_type`
--
ALTER TABLE `building_type`
  MODIFY `Building_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cash_amount`
--
ALTER TABLE `cash_amount`
  MODIFY `Cash_Amount_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT for table `cheques`
--
ALTER TABLE `cheques`
  MODIFY `Cheques_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=719;

--
-- AUTO_INCREMENT for table `cheque_type`
--
ALTER TABLE `cheque_type`
  MODIFY `Cheque_Type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `collection_table`
--
ALTER TABLE `collection_table`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1082;

--
-- AUTO_INCREMENT for table `company_info`
--
ALTER TABLE `company_info`
  MODIFY `Company_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_representative`
--
ALTER TABLE `company_representative`
  MODIFY `Company_representative_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `complaint_report_request`
--
ALTER TABLE `complaint_report_request`
  MODIFY `Complaint_Report_Request_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `Contract_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `contractor`
--
ALTER TABLE `contractor`
  MODIFY `Contractor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contract_template`
--
ALTER TABLE `contract_template`
  MODIFY `Contract_template_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `Contract_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delete_archive`
--
ALTER TABLE `delete_archive`
  MODIFY `Delete_Archive_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Department_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_level`
--
ALTER TABLE `employee_level`
  MODIFY `Employee_Level_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `furniture_case`
--
ALTER TABLE `furniture_case`
  MODIFY `Furniture_case_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `Inventory_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `languages_contract`
--
ALTER TABLE `languages_contract`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `languages_expensess`
--
ALTER TABLE `languages_expensess`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `languages_maintenance`
--
ALTER TABLE `languages_maintenance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `languages_master`
--
ALTER TABLE `languages_master`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `languages_task`
--
ALTER TABLE `languages_task`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `languages_tenant`
--
ALTER TABLE `languages_tenant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `listing_type`
--
ALTER TABLE `listing_type`
  MODIFY `Listing_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `LogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_categoty`
--
ALTER TABLE `maintenance_categoty`
  MODIFY `Categoty_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `maintenance_request`
--
ALTER TABLE `maintenance_request`
  MODIFY `Maintenance_Request_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `maintenance_type`
--
ALTER TABLE `maintenance_type`
  MODIFY `Maintenance_Type_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenece_templete`
--
ALTER TABLE `maintenece_templete`
  MODIFY `Maintenece_Templete_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `main_type_evaluation`
--
ALTER TABLE `main_type_evaluation`
  MODIFY `Main_Type_Evaluation_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `management_expensess`
--
ALTER TABLE `management_expensess`
  MODIFY `Management_Expensess_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `mortgaged_wonership`
--
ALTER TABLE `mortgaged_wonership`
  MODIFY `Mortgaged_Wonership_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `nationality_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `notification_type`
--
ALTER TABLE `notification_type`
  MODIFY `Notification_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `Owner_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ownership_statment`
--
ALTER TABLE `ownership_statment`
  MODIFY `Statment_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ownership_status`
--
ALTER TABLE `ownership_status`
  MODIFY `ownership_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `owner_ship`
--
ALTER TABLE `owner_ship`
  MODIFY `Owner_Ship_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `payment_frequency`
--
ALTER TABLE `payment_frequency`
  MODIFY `Payment_Frequency_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `payment_type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `periodec_maintenance_new`
--
ALTER TABLE `periodec_maintenance_new`
  MODIFY `Periodec_Maintenance_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `periodic_maintenence`
--
ALTER TABLE `periodic_maintenence`
  MODIFY `Periodic_Maintenence_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pickup_delivery`
--
ALTER TABLE `pickup_delivery`
  MODIFY `Pickup_Delivery_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `real_estate_investment`
--
ALTER TABLE `real_estate_investment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reason_for_rent`
--
ALTER TABLE `reason_for_rent`
  MODIFY `Reason_For_Rent_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `relateddocuments`
--
ALTER TABLE `relateddocuments`
  MODIFY `DocId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requst_source`
--
ALTER TABLE `requst_source`
  MODIFY `Requst_Source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Role_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_type_evaluation`
--
ALTER TABLE `sub_type_evaluation`
  MODIFY `Sub_Type_Evaluation_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `task_management`
--
ALTER TABLE `task_management`
  MODIFY `Task_Management_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `task_part`
--
ALTER TABLE `task_part`
  MODIFY `Task_Part_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_type`
--
ALTER TABLE `task_type`
  MODIFY `Task_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `Tenants_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `tenant_accounts`
--
ALTER TABLE `tenant_accounts`
  MODIFY `Tenant_Accounts_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenant_evaluation`
--
ALTER TABLE `tenant_evaluation`
  MODIFY `Tenant_Evaluation_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tenant_notification`
--
ALTER TABLE `tenant_notification`
  MODIFY `Tenant_Notification_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenant_sending`
--
ALTER TABLE `tenant_sending`
  MODIFY `Tenant_Sending_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tenant_type`
--
ALTER TABLE `tenant_type`
  MODIFY `Tenant_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_type`
--
ALTER TABLE `transaction_type`
  MODIFY `Transaction_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transformation_bank`
--
ALTER TABLE `transformation_bank`
  MODIFY `transformation_Bank_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transformation_table`
--
ALTER TABLE `transformation_table`
  MODIFY `transformation_Table_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `under_contract`
--
ALTER TABLE `under_contract`
  MODIFY `Under_Contract_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `Unit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- AUTO_INCREMENT for table `unit_condition`
--
ALTER TABLE `unit_condition`
  MODIFY `Unit_Condition_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `unit_detail`
--
ALTER TABLE `unit_detail`
  MODIFY `Unit_Detail_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `unit_type`
--
ALTER TABLE `unit_type`
  MODIFY `Unit_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vendor_typ`
--
ALTER TABLE `vendor_typ`
  MODIFY `Vendor_Type_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_type`
--
ALTER TABLE `vendor_type`
  MODIFY `Vendor_Type_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website_servic_info`
--
ALTER TABLE `website_servic_info`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `websit_info`
--
ALTER TABLE `websit_info`
  MODIFY `WebSit_Info_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zone_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_assets_asset_condition1` FOREIGN KEY (`asset_condition_Asset_Condition_Id`) REFERENCES `asset_condition` (`Asset_Condition_Id`),
  ADD CONSTRAINT `fk_assets_asset_location1` FOREIGN KEY (`asset_location_Asset_Location_Id`) REFERENCES `asset_location` (`Asset_Location_Id`),
  ADD CONSTRAINT `fk_assets_maintenance_categoty1` FOREIGN KEY (`maintenance_categoty_Categoty_Id`) REFERENCES `maintenance_categoty` (`Categoty_Id`),
  ADD CONSTRAINT `fk_assets_vendor_type1` FOREIGN KEY (`vendor_type_Vendor_Type_Id`) REFERENCES `vendor_typ` (`Vendor_Type_Id`);

--
-- Constraints for table `building`
--
ALTER TABLE `building`
  ADD CONSTRAINT `fk_building_building_condition1` FOREIGN KEY (`building_condition_Building_Condition_Id`) REFERENCES `building_condition` (`Building_Condition_Id`),
  ADD CONSTRAINT `fk_building_building_type1` FOREIGN KEY (`building_type_Building_Type_Id`) REFERENCES `building_type` (`Building_Type_Id`),
  ADD CONSTRAINT `fk_building_owner_ship1` FOREIGN KEY (`owner_ship_Owner_Ship_Id`) REFERENCES `owner_ship` (`Owner_Ship_Id`);

--
-- Constraints for table `building_cheques`
--
ALTER TABLE `building_cheques`
  ADD CONSTRAINT `fk_building_cheques_bank1` FOREIGN KEY (`bank_Bank_Id`) REFERENCES `bank` (`Bank_Id`),
  ADD CONSTRAINT `fk_building_cheques_building_contract1` FOREIGN KEY (`building_contract_Contract_Id`) REFERENCES `building_contract` (`Contract_Id`),
  ADD CONSTRAINT `fk_building_cheques_cheque_type1` FOREIGN KEY (`cheque_type_Cheque_Type_id`) REFERENCES `cheque_type` (`Cheque_Type_id`),
  ADD CONSTRAINT `fk_building_cheques_tenants1` FOREIGN KEY (`tenants_Tenants_ID`) REFERENCES `tenants` (`Tenants_ID`);

--
-- Constraints for table `building_contract`
--
ALTER TABLE `building_contract`
  ADD CONSTRAINT `fk_building_contract_building1` FOREIGN KEY (`building_Building_Id`) REFERENCES `building` (`Building_Id`),
  ADD CONSTRAINT `fk_building_contract_contract_template1` FOREIGN KEY (`contract_template_Contract_template_Id`) REFERENCES `contract_template` (`Contract_template_Id`),
  ADD CONSTRAINT `fk_building_contract_contract_type1` FOREIGN KEY (`contract_type_Contract_Type_Id`) REFERENCES `contract_type` (`Contract_Type_Id`),
  ADD CONSTRAINT `fk_building_contract_payment_type1` FOREIGN KEY (`payment_type_payment_type_Id`) REFERENCES `payment_type` (`payment_type_Id`),
  ADD CONSTRAINT `fk_building_contract_reason_for_rent1` FOREIGN KEY (`reason_for_rent_Reason_For_Rent_Id`) REFERENCES `reason_for_rent` (`Reason_For_Rent_Id`),
  ADD CONSTRAINT `fk_building_contract_tenants1` FOREIGN KEY (`tenants_Tenants_ID`) REFERENCES `tenants` (`Tenants_ID`),
  ADD CONSTRAINT `fk_building_contract_users1` FOREIGN KEY (`users_user_ID`) REFERENCES `users` (`user_ID`);

--
-- Constraints for table `cheques`
--
ALTER TABLE `cheques`
  ADD CONSTRAINT `fk_cheques_bank1` FOREIGN KEY (`bank_Bank_Id`) REFERENCES `bank` (`Bank_Id`),
  ADD CONSTRAINT `fk_cheques_cheque_type1` FOREIGN KEY (`cheque_type_Cheque_Type_id`) REFERENCES `cheque_type` (`Cheque_Type_id`),
  ADD CONSTRAINT `fk_cheques_contract1` FOREIGN KEY (`contract_Contract_Id`) REFERENCES `contract` (`Contract_Id`),
  ADD CONSTRAINT `fk_cheques_tenants1` FOREIGN KEY (`tenants_Tenants_ID`) REFERENCES `tenants` (`Tenants_ID`);

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `fk_contract_contract_template1` FOREIGN KEY (`contract_template_Contract_template_Id`) REFERENCES `contract_template` (`Contract_template_Id`),
  ADD CONSTRAINT `fk_contract_contract_type1` FOREIGN KEY (`contract_type_Contract_Type_Id`) REFERENCES `contract_type` (`Contract_Type_Id`),
  ADD CONSTRAINT `fk_contract_payment_type1` FOREIGN KEY (`payment_type_payment_type_Id`) REFERENCES `payment_type` (`payment_type_Id`),
  ADD CONSTRAINT `fk_contract_reason_for_rent1` FOREIGN KEY (`reason_for_rent_Reason_For_Rent_Id`) REFERENCES `reason_for_rent` (`Reason_For_Rent_Id`),
  ADD CONSTRAINT `fk_contract_tenants1` FOREIGN KEY (`tenants_Tenants_ID`) REFERENCES `tenants` (`Tenants_ID`),
  ADD CONSTRAINT `fk_contract_units1` FOREIGN KEY (`units_Unit_ID`) REFERENCES `units` (`Unit_ID`),
  ADD CONSTRAINT `fk_contract_users1` FOREIGN KEY (`users_user_ID`) REFERENCES `users` (`user_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

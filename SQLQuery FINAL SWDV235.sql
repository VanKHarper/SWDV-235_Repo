-- Drops Disk_DB and re-creates it --
USE master
GO
DROP DATABASE if exists Disk_DB
GO
CREATE DATABASE Disk_DB
GO
USE Disk_DB
GO

-- Creates initial tables --
create TABLE artist_type
	(
		artist_type_id int not null primary key identity,		
		artist_type_desc varchar(100) not null
	)
go


create TABLE disk_type
	(
		disk_type_id int not null primary key identity,		
		disk_type_desc varchar(100) not null
	)
go

create TABLE disk_genre
	(
		disk_genre_id int not null primary key identity,		
		disk_genre_desc varchar(100) not null
	)
go


create TABLE disk_status
	(
		disk_status_id int not null primary key identity,		
		disk_status_desc varchar(100) not null
	)
go

create TABLE borrower
	(
		borrower_id int not null identity primary key,
		FirstName varchar(100) not null,
		LastName varchar(100) not null,
		phone_num varchar(50)
	)
go

create TABLE artist
	(
		artist_id int not null primary key identity,
		Artist_Type varchar(100) not null ,
		Artist_FName varchar(100) not null,
		Artist_LName varchar(100) null
	)
go

create TABLE compact_disk
	(
		disk_id int not null identity primary key,
		Disk_Status varchar(100) not null ,
		Disk_Genre varchar(100)  not null ,
		Disk_Type varchar(100) not null ,
		disk_name varchar(100) not null,
		release_date date not null
	)
go

create TABLE disk_has_artist
	(
		disk_artist_id int not null foreign key references artist(artist_id),		
		disk_id int not null foreign key references compact_disk(disk_id),
		primary key (disk_artist_id, disk_id)
	)
go

create TABLE disk_has_borrower
	(
		disk_borrower_id int not null foreign key references borrower(borrower_id),		
		disk_id int not null foreign key references compact_disk(disk_id),
		borrowed_date date not null,	
		expected_date date null,
		returned_date date null,	
		times_borrowed int null,
		primary key (borrowed_date, disk_borrower_id, disk_id)	
	)
go

-- Inserts data in the tables --
INSERT into [dbo].[artist_type]
([artist_type_desc])
	VALUES
		('Solo')
		,('Group')		
GO

INSERT into [dbo].[disk_type]
([disk_type_desc])
	VALUES
		('CD')
		,('Vinyl')
		,('8Track')
		,('DVD')		
GO

INSERT into [dbo].[disk_genre]
([disk_genre_desc])
	VALUES
		('Rap')
		,('Rock')
		,('Jazz')
		,('Country')
		,('Metal')
		,('Polka')		
GO

INSERT into [dbo].[disk_status]
([disk_status_desc])
	VALUES
		('In-Stock')
		,('Out-of-Stock')
		,('On-Hold')
		,('Unkown')		
GO

INSERT into [dbo].[borrower]
([FirstName], [LastName],[phone_num])
	VALUES
		 ('Jon', 'Jones', '111-555-2324')
		,('Frank', 'Renalds', '222-555-2345')
		,('Dee', 'Renalds', '333-555-4567')
		,('Denis', 'Renalds', '444-555-1267')				
		,('Charlie', 'Kelly', '555-555-5698')				
		,('Ronald', 'MacDonald', '666-555-8894')
		,('Frank', 'Black', '777-555-9090')
		,('Earnist', 'Edwards', '888-555-1223')
		,('Ryan', 'Raynold', '999-555-3453')
		,('Gwen', 'Greenspan', '010-555-3213')
		,('Thomas', 'Turnuckle', '011-555-2345')
		,('Aaron', 'Anderson', '012-555-1235')
		,('Ben', 'Backerson', '013-555-3487')
		,('Caren', 'Crankerson', '014-555-4169')
		,('Dean', 'Del-Real', '015-555-0825')
		,('Edward', 'Everson', '016-555-4391')
		,('Ned', 'Newly', '0171-555-0345')
		,('Mark', 'Mahkerson', '018-555-8741')
		,('Penny', 'Pengren', '019-555-9134')
		,('Logan', 'Looper', '020-555-0165')
			    			
GO



INSERT into [dbo].[artist]
([Artist_Type], [Artist_FName], [Artist_LName])
	VALUES
		 ('Group', 'Marky Mark and the Funky Bunch', NULL)
		,('Group', 'Metalica', NULL)
		,('Solo', 'Jack', 'Johnson')
		,('Solo', 'Taylor', 'Swift')				
		,('Group', 'D-12', NULL)				
		,('Group', 'MacLemore and Ryan Lewis', NULL)
		,('Solo', 'Skrillex', NULL)
		,('Solo', 'Frank', 'Ocean')
		,('Solo', 'Oliver', 'Trees')
		,('Solo', 'Tim', 'McGraw')
		,('Solo', 'Miley', 'Cyrus')
		,('Group', '21 Pilots', NULL)
		,('Solo', 'Hank', 'Williams')
		,('Solo', 'Bob', 'Dylan')
		,('Solo', 'Travis', 'Scott')
		,('Solo', 'Jan', 'Lewan')
		,('Solo', 'Hank', 'Willimas Jr')
		,('Group', 'The Pixies', NULL)
		,('Solo', 'Moby', NULL)
		,('Solo', 'MF Doom', NULL)				
GO

INSERT into [dbo].[compact_disk]
([Disk_Status], [Disk_Genre], [Disk_Type], [disk_name], [release_date])
	VALUES
		 ('On-Hold', 'Rap', 'Vinyl', 'Funky Style', '04/02/1992')
		,('In-Stock', 'Rock', 'Vinyl', 'Enter The Sandman', '01/30/1980')
		,('Out-of-Stock', 'Alt-Rock', 'CD', 'Jack Jonhsons Greatist Hits', '03/01/2014')
		,('In-Stock', 'Pop', 'CD', 'Shake it Off', '01/01/2016')				
		,('Status-Unknown', 'Rap', 'CD', 'Detriot Dayz', '05/09/2002')				
		,('Out-of-Stock', 'Rap', 'Vinyl', 'The Heist', '03/15/2013')
		,('Status-Unknown', 'Pop', 'CD', 'Spring Breakers', '04/04/2014')
		,('Out-of-Stock', 'Rap', 'CD', 'Ocean Music', '12/24/2015')
		,('On-Hold', 'Country', 'CD', 'Hurt', '2/20/2019')
		,('In-Stock', 'Country', 'Casset-Tape', 'Tim Mcgraw: Greatist Hits', '09/21/2003')
		,('Out-of-Stock', 'Pop', 'CD', 'Cant Stop, Wont Stop', '12/31/2017')
		,('In-Stock', 'Rap', 'CD', 'Stressed Out', '10/17/2016')
		,('In-Stock', 'Country', 'Vinyl', 'Hank Williams: Greatist Hits', '04/01/1969')
		,('In-Stock', 'Alt-Rock', 'CD', 'Bob Dylans Hits Volume 1', '11/20/1999')
		,('In-Stock', 'Rap', 'CD', 'Tavis Scott Style', '01/30/2018')
		,('In-Stock', 'Pop', 'Casset-Tape', 'Polka Time!', '07/15/1978')
		,('In-Stock', 'Country', 'CD', 'Outlaw Country', '03/01/2010')
		,('In-Stock', 'Rock', 'CD', 'Waves of Mutalation', '12/24/2009')
		,('On-Hold', 'Pop', 'CD', 'Moby', '12/20/2012')
		,('In-Stock', 'Rap', 'CD', 'Doom vs. Danger Mouse', '07/06/2011')	
			
GO





INSERT into [dbo].[disk_has_artist]
([disk_artist_id], [disk_id])
	VALUES
		 (1, 1)
		,(2, 2)
		,(3, 3)
		,(4, 4)				
		,(5, 20)				
		,(6, 6)
		,(7, 7)
		,(8, 8)
		,(9, 9)
		,(10, 10)
		,(11, 11)
		,(12, 12)
		,(13, 13)
		,(14, 14)
		,(15, 15)
		,(16, 16)
		,(17, 18)
		,(18, 18)
		,(20, 19)
		,(20, 20)				
GO


INSERT into [dbo].[disk_has_borrower]
([disk_borrower_id], [disk_id], [borrowed_date], [expected_date], [returned_date], [times_borrowed] )
	VALUES
		 (1, 1, '3/4/2019', '3/18/2019', NULL, 1)
		,(1, 2, '3/4/2019', '3/25/2019', '3/8/2019', 2)
		,(3, 3, '3/5/2019', '3/26/2019', NULL, 1)
		,(3, 4, '3/5/2019', '3/19/2019', '3/6/2019', 1)				
		,(5, 5, '3/5/2019', '3/22/2019', '3/9/2019', 5)				
		,(6, 6, '3/5/2019', '3/19/2019', NULL, 4)
		,(7, 7, '3/6/2019', '3/20/2019', NULL, 1)
		,(8, 8, '3/6/2019', '3/20/2019', NULL, 6)
		,(9, 9, '3/6/2019', '3/20/2019', NULL, 1)
		,(10, 10, '3/6/2019', '3/20/2019', NULL, 1)
		,(11, 11, '3/6/2019', '3/20/2019', NULL, 4)
		,(12, 12, '3/6/2019', '3/27/2019', NULL, 1)
		,(13, 13, '3/6/2019', '3/27/2019', '3/7/2019', 4)
		,(14, 14, '3/6/2019', '3/20/2019', NULL, 1)
		,(15, 15, '3/7/2019', '3/28/2019', NULL, 4)
		,(17, 16, '3/7/2019', '3/21/2019', '3/8/2019', 3)
		,(17, 17, '3/7/2019', '3/21/2019', NULL, 5)
		,(18, 18, '3/7/2019', '3/28/2019', NULL, 1)
		,(19, 19, '3/8/2019', '3/22/2019', '3/9/2019', 1)
		,(20, 20, '3/8/2019', '3/22/2019', NULL, 3)			
GO





--==	 VIEWS and PROCEDURES	  ==--
USE Disk_DB
GO

-- Updates Disk_Status in compact_disk --
DROP PROCEDURE IF EXISTS INS_DiskStatusChanger
GO

CREATE PROCEDURE INS_DiskStatusChanger		
	@disk_status varchar(100),
	@disk_id2 int
		AS
			BEGIN TRY
				UPDATE [dbo].[compact_disk]
					SET [Disk_Status] = @disk_status											
					Where disk_id = @disk_id2
			END TRY
		BEGIN CATCH
			PRINT 'An error occured'
			PRINT 'Message: ' + CONVERT(varchar(200), Error_Message())
		END Catch
GO


-- Updates Borrower_ID in Disk_Has_Borrower --
DROP PROCEDURE IF EXISTS INS_DiskBorrowerIDChanger	
GO

CREATE PROCEDURE INS_DiskBorrowerIDChanger	
	@Disk_Borrower_ID2 int,
	@Disk_Borrower_ID3 int
	
		AS
			BEGIN TRY
				UPDATE [dbo].[disk_has_borrower]
					SET [disk_borrower_id] = @Disk_Borrower_ID2											
					Where @Disk_Borrower_ID3 = disk_id
			END TRY
		BEGIN CATCH
			PRINT 'An error occured'
			PRINT 'Message: ' + CONVERT(varchar(200), Error_Message())
		END Catch
GO


-- Inserts into Disk_Has_Borrower --
DROP PROCEDURE IF EXISTS INS_Disk_Has_Borrower
GO

CREATE PROCEDURE INS_Disk_Has_Borrower
	@Disk_Borrower_ID int,
	@Disk_ID int,	
	@Borrowed_Date DateTime,
	@Expected_Date DateTime
AS

BEGIN TRY
	INSERT INTO [dbo].[disk_has_borrower]
		([Disk_Borrower_ID]
		,[Disk_ID]		
		,[Borrowed_Date]
		,[Expected_Date])
	VALUES
		(@Disk_Borrower_ID
		,@Disk_ID	
		,@Borrowed_Date
		,@Expected_Date)
END TRY

	BEGIN CATCH
		PRINT 'An error occured.'
		PRINT 'Message: ' + CONVERT(varchar, ERROR_MESSAGE())
	END CATCH
GO


---- Drops and re-Creates the DEL_DiskHasBorrower Procedure --
DROP PROCEDURE IF EXISTS DEL_DiskHasBorrower
GO

-- Deletes a Old Disk from the disk_has_boorrower Table --
CREATE PROCEDURE DEL_DiskHasBorrower	
	@DEL_disk_id int	
		AS
			BEGIN TRY
				DELETE [dbo].[disk_has_borrower]			
				WHERE disk_id = @DEL_disk_id
			END TRY
		BEGIN CATCH
			PRINT 'An error occured'
			PRINT 'Message: ' + CONVERT(varchar(200), Error_Message())
		END Catch
GO


-- View to combine FirstName and LastName  --
DROP VIEW IF EXISTS BorrowerNames_View
GO

CREATE VIEW BorrowerNames_View  AS
	SELECT *, CONCAT(FIRSTNAME, ' ', LASTNAME) 'BorrowerNames'
	FROM borrower;
GO


-- View for In-Stock books --
DROP VIEW IF EXISTS InStock_View
GO

CREATE VIEW InStock_View
AS
	SELECT disk_name, disk_id, disk_status
	FROM  compact_disk
	WHERE disk_status = 'In-Stock'
GO


-- View for Checked Out books --
DROP VIEW IF EXISTS CheckOutReport_View
GO

CREATE VIEW CheckOutReport_View
AS
	SELECT  BorrowerNames, disk_name, borrowed_date, expected_date, returned_date, disk_status, disk_has_borrower.disk_id, disk_borrower_id
	FROM  disk_has_borrower, compact_disk, BorrowerNames_View 	
	WHERE disk_status != 'In-Stock'
	AND compact_disk.disk_id = disk_has_borrower.disk_id AND borrower_id = disk_borrower_id 
GO


-- Switches to Using Master --
USE master
GO

-- Login Info --
if SUSER_ID('diskUsermm') is not null
	drop login diskUsermm
go
create login diskUsermm with password = 'pa$$w0rd',
	default_database = Disk_DB
go
	use Disk_DB
go
if USER_ID('diskUsermm') is not null
	drop user diskUsermm
go
	create user diskUsermm
go
	alter role db_datareader add member diskUsermm
go


----	 OLD Select commands for DEBUGGING	 ----

---- Selects the borrowed disks that have null values --
--SELECT disk_borrower_id, disk_id, borrowed_date FROM disk_has_borrower
--	WHERE returned_date is NULL
--GO

--SELECT * FROM disk_has_borrower
--GO

--SELECT * FROM CheckOutReport_View
--GO

--SELECT * FROM BorrowerNames_View
--GO

--Select * FROM compact_disk
--GO

--Select * FROM disk_has_borrower
--GO
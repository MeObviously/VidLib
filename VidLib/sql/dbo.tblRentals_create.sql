CREATE TABLE [dbo].[tblRentals]
(
	[Rental_Id] INT IDENTITY(0,1) NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[Phone] VARCHAR(12) NOT NULL,
	[Email] VARCHAR(50) NOT NULL,
	[Rental_Date] DATE NOT NULL,
	[Rental_Days] INTEGER NOT NULL,
	[Return_Date] DATE NOT NULL,
	[Title] VARCHAR(50) NOT NULL,
	[Genre] VARCHAR(20) NOT NULL,

    PRIMARY KEY CLUSTERED ([Rental_Id])
)

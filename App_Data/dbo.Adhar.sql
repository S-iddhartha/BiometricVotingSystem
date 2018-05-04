CREATE TABLE [dbo].[Adhar]
(
	[Adhar Id] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL, 
    [Father's Name] VARCHAR(50) NULL, 
    [Husband's Name] VARCHAR(50) NULL, 
    [Address] VARCHAR(100) NOT NULL, 
    [District] VARCHAR(50) NOT NULL, 
    [State] VARCHAR(50) NOT NULL, 
    [Pin Code] INT NOT NULL, 
    [Mobile No] INT NOT NULL, 
    [Retina's Image] IMAGE NOT NULL
)

CREATE TABLE [dbo].[tblVideos] (
    [Video_Id]    INT IDENTITY (0, 1) NOT NULL,
    [Video_Title] VARCHAR (50) NOT NULL,
    [Video_Genre] VARCHAR (20) NOT NULL,
    [Year]        INT          NOT NULL,
    [Director]    VARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([Video_Id] ASC)
);

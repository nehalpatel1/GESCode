/****** Object:  Table [dbo].[Industry]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Industry](
	[IndustryID] [int] IDENTITY(1,1) NOT NULL,
	[IndustryName] [nvarchar](50) NOT NULL,
	[IndustryDescription] [nvarchar](100) NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Industry] PRIMARY KEY CLUSTERED 
(
	[IndustryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enquiries]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enquiries](
	[EnquiryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateInserted] [datetime] NOT NULL,
	[Comments] [varchar](500) NULL,
	[MachineID] [int] NOT NULL,
 CONSTRAINT [PK_Enquiries] PRIMARY KEY CLUSTERED 
(
	[EnquiryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MachineType]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineType](
	[MachineTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MachineTypeName] [nvarchar](50) NOT NULL,
	[MachineTypeDescription] [nvarchar](100) NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_MachineType] PRIMARY KEY CLUSTERED 
(
	[MachineTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
	[ManufacturerDescription] [nvarchar](100) NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[MachineTypeID] [int] NULL,
	[ManufacturerID] [int] NOT NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[ModelDescription] [nvarchar](100) NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DisplayName] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
	[TelephoneNo] [nvarchar](20) NULL,
	[CellNo] [nvarchar](20) NULL,
	[FaxNo] [nvarchar](20) NULL,
	[AddrStreet1] [nvarchar](100) NULL,
	[AddrStreet2] [nvarchar](100) NULL,
	[AddrSuburb] [nvarchar](50) NULL,
	[AddrCity] [nvarchar](50) NULL,
	[AddrProvince] [nvarchar](50) NULL,
	[AddrCode] [nvarchar](10) NULL,
	[AddrCountry] [nvarchar](50) NULL,
	[RoleID] [int] NOT NULL,
	[Email] [nchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineTypeIndustry]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineTypeIndustry](
	[MachineTypeIndustryID] [int] IDENTITY(1,1) NOT NULL,
	[MachineTypeID] [int] NOT NULL,
	[IndustryID] [int] NOT NULL,
 CONSTRAINT [PK_MachineTypeIndustry] PRIMARY KEY CLUSTERED 
(
	[MachineTypeIndustryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machine](
	[MachineID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[MachineTypeIndustryID] [int] NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[MachineDescription] [nvarchar](100) NULL,
	[MachineGrade] [nvarchar](10) NOT NULL,
	[SerialNo] [nvarchar](50) NULL,
	[Year] [nvarchar](4) NULL,
	[Milage] [nvarchar](10) NULL,
	[Location] [nvarchar](50) NULL,
	[ContactUserID] [int] NULL,
	[CostPrice] [money] NULL,
	[SellPrice] [money] NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Machine] PRIMARY KEY CLUSTERED 
(
	[MachineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 02/19/2011 18:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Photo](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[MachineID] [int] NOT NULL,
	[PhotoName] [nvarchar](50) NULL,
	[PhotoDescription] [nvarchar](100) NULL,
	[PhotoUrl] [nvarchar](1000) NULL,
	[Status] [nvarchar](10) NOT NULL,
	[ShowThumbnail] [char](1) NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vUsedMachineList]    Script Date: 02/19/2011 18:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsedMachineList]
AS
SELECT        dbo.Machine.MachineID, dbo.Manufacturer.ManufacturerName as MachineName, dbo.Machine.MachineGrade, dbo.Machine.SerialNo, dbo.Machine.Year, dbo.Machine.Milage, 
                         dbo.Machine.Location, dbo.Machine.SellPrice, dbo.Machine.Status, dbo.MachineType.MachineTypeName, dbo.Industry.IndustryName, dbo.Model.ModelName, 
                         dbo.Manufacturer.ManufacturerName, dbo.Photo.PhotoUrl, dbo.Machine.MachineDescription
FROM            dbo.Machine INNER JOIN
                         dbo.MachineTypeIndustry ON dbo.Machine.MachineTypeIndustryID = dbo.MachineTypeIndustry.MachineTypeIndustryID INNER JOIN
                         dbo.MachineType ON dbo.MachineTypeIndustry.MachineTypeID = dbo.MachineType.MachineTypeID INNER JOIN
                         dbo.Industry ON dbo.MachineTypeIndustry.IndustryID = dbo.Industry.IndustryID INNER JOIN
                         dbo.Model ON dbo.Machine.ModelID = dbo.Model.ModelID AND dbo.MachineType.MachineTypeID = dbo.Model.MachineTypeID INNER JOIN
                         dbo.Manufacturer ON dbo.Model.ManufacturerID = dbo.Manufacturer.ManufacturerID INNER JOIN
                         dbo.Photo ON dbo.Machine.MachineID = dbo.Photo.MachineID
WHERE        (dbo.Photo.ShowThumbnail = 'Y')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[11] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Model"
            Begin Extent = 
               Top = 120
               Left = 780
               Bottom = 292
               Right = 963
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Manufacturer"
            Begin Extent = 
               Top = 6
               Left = 1033
               Bottom = 143
               Right = 1254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Photo"
            Begin Extent = 
               Top = 164
               Left = 317
               Bottom = 314
               Right = 498
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Industry"
            Begin Extent = 
               Top = 6
               Left = 550
               Bottom = 135
               Right = 742
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MachineType"
            Begin Extent = 
               Top = 6
               Left = 291
               Bottom = 135
               Right = 512
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MachineTypeIndustry"
            Begin Extent = 
               Top = 6
               Left = 780
               Bottom = 118
               Right = 995
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Machine"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 314
               Right = 253
            End
            Disp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsedMachineList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'layFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsedMachineList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsedMachineList'
GO
/****** Object:  Default [DF_Enquiries_DateInserted]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Enquiries] ADD  CONSTRAINT [DF_Enquiries_DateInserted]  DEFAULT (getdate()) FOR [DateInserted]
GO
/****** Object:  Default [DF_Photo_ShowThumbnail]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF_Photo_ShowThumbnail]  DEFAULT ('N') FOR [ShowThumbnail]
GO
/****** Object:  ForeignKey [FK_MachineTypeID2]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_MachineTypeID2] FOREIGN KEY([MachineTypeID])
REFERENCES [dbo].[MachineType] ([MachineTypeID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_MachineTypeID2]
GO
/****** Object:  ForeignKey [FK_Model_ManufacturerID]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_ManufacturerID] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_ManufacturerID]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  ForeignKey [FK_IndustryID]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[MachineTypeIndustry]  WITH CHECK ADD  CONSTRAINT [FK_IndustryID] FOREIGN KEY([IndustryID])
REFERENCES [dbo].[Industry] ([IndustryID])
GO
ALTER TABLE [dbo].[MachineTypeIndustry] CHECK CONSTRAINT [FK_IndustryID]
GO
/****** Object:  ForeignKey [FK_MachineTypeID1]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[MachineTypeIndustry]  WITH CHECK ADD  CONSTRAINT [FK_MachineTypeID1] FOREIGN KEY([MachineTypeID])
REFERENCES [dbo].[MachineType] ([MachineTypeID])
GO
ALTER TABLE [dbo].[MachineTypeIndustry] CHECK CONSTRAINT [FK_MachineTypeID1]
GO
/****** Object:  ForeignKey [FK_MachineTypeIndustryID]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_MachineTypeIndustryID] FOREIGN KEY([MachineTypeIndustryID])
REFERENCES [dbo].[MachineTypeIndustry] ([MachineTypeIndustryID])
GO
ALTER TABLE [dbo].[Machine] CHECK CONSTRAINT [FK_MachineTypeIndustryID]
GO
/****** Object:  ForeignKey [FK_ModelID]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_ModelID] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ModelID])
GO
ALTER TABLE [dbo].[Machine] CHECK CONSTRAINT [FK_ModelID]
GO
/****** Object:  ForeignKey [FK_MachineID]    Script Date: 02/19/2011 18:59:20 ******/
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_MachineID] FOREIGN KEY([MachineID])
REFERENCES [dbo].[Machine] ([MachineID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_MachineID]
GO
/**
TRUNCATE TABLE [dbo].[Industry] 
TRUNCATE TABLE [dbo].[MachineType]
TRUNCATE TABLE [dbo].[Roles] 
TRUNCATE TABLE [dbo].[Manufacturer]
TRUNCATE TABLE [dbo].[Users]
TRUNCATE TABLE [dbo].[MachineTypeIndustry]
TRUNCATE TABLE [dbo].[Model] 
TRUNCATE TABLE [dbo].[Machine]
TRUNCATE TABLE [dbo].[Photo] 
**/

SET IDENTITY_INSERT [dbo].[Industry] ON
INSERT [dbo].[Industry] ([IndustryID], [IndustryName], [IndustryDescription], [Status]) VALUES (1, N'Contruction', N'Contruction', N'Active')

INSERT [dbo].[MachineType] ([MachineTypeName], [MachineTypeDescription], [Status]) VALUES (N'Backhoe Loader', N'Backhoe Loader', N'Active')
INSERT [dbo].[MachineType] ([MachineTypeName], [MachineTypeDescription], [Status]) VALUES (N'Excavator', N'Excavator', N'Active')
INSERT [dbo].[MachineType] ([MachineTypeName], [MachineTypeDescription], [Status]) VALUES (N'Skidsteer', N'Skidsteer', N'Active')
INSERT [dbo].[MachineType] ([MachineTypeName], [MachineTypeDescription], [Status]) VALUES (N'Tipper Truck', N'Tipper Truck', N'Active')
INSERT [dbo].[MachineType] ([MachineTypeName], [MachineTypeDescription], [Status]) VALUES (N'Tractor', N'Tractor', N'Active')
INSERT [dbo].[MachineType] ([MachineTypeName], [MachineTypeDescription], [Status]) VALUES (N'Road Roller', N'Road Roller', N'Active')

INSERT [dbo].[Roles] ([RoleID],[RoleName]) VALUES (1,N'Visitor')

INSERT [dbo].[Manufacturer] ( [ManufacturerName], [ManufacturerDescription], [Status]) VALUES ( N'CAT', N'Catepillar', N'Active')
INSERT [dbo].[Manufacturer] ( [ManufacturerName], [ManufacturerDescription], [Status]) VALUES ( N'CASE', N'CASE', N'Active')
INSERT [dbo].[Manufacturer] ( [ManufacturerName], [ManufacturerDescription], [Status]) VALUES ( N'Izuzu', N'Izuzu', N'Active')
INSERT [dbo].[Manufacturer] ( [ManufacturerName], [ManufacturerDescription], [Status]) VALUES ( N'Racoon', N'Racoon', N'Active')
INSERT [dbo].[Manufacturer] ( [ManufacturerName], [ManufacturerDescription], [Status]) VALUES ( N'Mercedes', N'Mercedes', N'Active')
INSERT [dbo].[Manufacturer] ([ManufacturerName], [ManufacturerDescription], [Status]) VALUES  ( N'Bomag', N'Bomag', N'Active')

INSERT [dbo].[Users] ([UserName], [Password], [FirstName], [LastName], [DisplayName], [CompanyName], [Designation], [TelephoneNo], [CellNo], [FaxNo], [AddrStreet1], [AddrStreet2], [AddrSuburb], [AddrCity], [AddrProvince], [AddrCode], [AddrCountry], [RoleID], [Email]) VALUES (N'Visitor', N'123456', N'Graham', N'Reeves', NULL, NULL, NULL, NULL, N'0828703205', NULL, NULL, NULL, NULL, N'East London', NULL, NULL, NULL, 1, N'reeves.graham@gmail.com')

INSERT [dbo].[MachineTypeIndustry] ([MachineTypeID], [IndustryID]) VALUES (1, 1)
INSERT [dbo].[MachineTypeIndustry] ([MachineTypeID], [IndustryID]) VALUES (2, 1)
INSERT [dbo].[MachineTypeIndustry] ([MachineTypeID], [IndustryID]) VALUES (3, 1)
INSERT [dbo].[MachineTypeIndustry] ([MachineTypeID], [IndustryID]) VALUES (4, 1)
INSERT [dbo].[MachineTypeIndustry] ([MachineTypeID], [IndustryID]) VALUES (5, 1)
INSERT [dbo].[MachineTypeIndustry] ([MachineTypeID], [IndustryID]) VALUES (6, 1)

INSERT INTO [dbo].[Model] ([MachineTypeID],[ManufacturerID],[ModelName],[ModelDescription],[Status]) VALUES (6,6,'BW 120 AD', NULL, 'Active')
INSERT INTO [dbo].[Model] ([MachineTypeID],[ManufacturerID],[ModelName],[ModelDescription],[Status]) VALUES (4,5,'Actros 3348', NULL, 'Active')


INSERT [dbo].[Machine] ([ModelID], [MachineTypeIndustryID], [MachineName], [MachineDescription], [MachineGrade], [SerialNo], [Year], [Milage], [Location], [ContactUserID], [CostPrice], [SellPrice], [Status]) 
VALUES					(1, 6, '', N'Condition: Very good, in daily operational use', N'Very Good', N'1018800246', N'2007', N'+-1200hrs', N'Port Elizabeth', NULL, NULL, 110000.0000, N'Active')
INSERT [dbo].[Machine] ([ModelID], [MachineTypeIndustryID], [MachineName], [MachineDescription], [MachineGrade], [SerialNo], [Year], [Milage], [Location], [ContactUserID], [CostPrice], [SellPrice], [Status]) 
VALUES					(2, 4, '', N'New engine at 650000km. All new tyres. 30 cube side tipper.', N'Unknown', N'Unknown', N'2003', N'659060km', N'Unknown', NULL, NULL, 360000.0000, N'Active')

SELECT * FROM [Machine]

--Bomag
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag1.jpg', N'Active', N'Y')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag2.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag3.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag4.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag5.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag6.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag7.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(5, N'Test Image', N'Test Image', N'UsedPics/Bomag8.jpg', N'Active', N'N')

--Merc Tipper
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(4, N'Test Image', N'Test Image', N'UsedPics/TipperTruck1.jpg', N'Active', N'Y')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(4, N'Test Image', N'Test Image', N'UsedPics/TipperTruck2.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(4, N'Test Image', N'Test Image', N'UsedPics/TipperTruck3.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(4, N'Test Image', N'Test Image', N'UsedPics/TipperTruck4.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(4, N'Test Image', N'Test Image', N'UsedPics/TipperTruck5.jpg', N'Active', N'N')
INSERT [dbo].[Photo] ([MachineID], [PhotoName], [PhotoDescription], [PhotoUrl], [Status], [ShowThumbnail]) 
VALUES				(4, N'Test Image', N'Test Image', N'UsedPics/TipperTruck6.jpg', N'Active', N'N')



SELECT * FROM dbo.vUsedMachineList


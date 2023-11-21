USE [OnlineSolutionsDevVMM]
GO

/****** Object:  Table [dbo].[iRental_CarsForSale]    Script Date: 11/21/2023 4:55:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[iRental_CarsForSale](
	[ChassisNo] [nvarchar](50) NOT NULL,
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[RecCode] [varchar](20) NULL,
	[CarFor] [varchar](10) NULL,
	[CarNumber] [nvarchar](10) NULL,
	[BrandId] [int] NULL,
	[ModelId] [int] NULL,
	[YearId] [int] NULL,
	[ColorId] [int] NULL,
	[TypeId] [int] NULL,
	[CarType] [char](1) NULL,
	[CurrentMileage] [int] NULL,
	[CarLocationId] [int] NULL,
	[CarStatusId] [int] NULL,
	[CurrentCondition] [nvarchar](1000) NULL,
	[$OwnerOrgId] [int] NULL,
	[$OwnerUnitId] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK__iRental___D3BC70D52DBCB4E6] PRIMARY KEY CLUSTERED 
(
	[ChassisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_CarsForSale] ADD  CONSTRAINT [DF_iRental_CarsForSale_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_CarsForSale] ADD  CONSTRAINT [DF_iRental_CarsForSale_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO




CREATE TABLE [dbo].[iRental_SalesCarPrice](
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[BrandId] [bigint] NOT NULL,
	[ModelId] [bigint] NOT NULL,
	[YearId] [bigint] NOT NULL,
	[Price] [decimal](9, 3) NOT NULL,
	[AdditionalAmount] [decimal](9, 3) NULL,
	[Discount] [decimal](9, 3) NULL,
	[Comments] [nvarchar](1000) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NOT NULL,
	[$DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_iRental_SalesCarPrice] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC,
	[ModelId] ASC,
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice_AdditionalAmount]  DEFAULT ((0)) FOR [AdditionalAmount]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice_Discount]  DEFAULT ((0)) FOR [Discount]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO




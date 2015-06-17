USE [DEV_ONL_DB]
GO
/****** Object:  Table [dbo].[lastpaid]    Script Date: 4/7/2015 12:53:07 PM ******/
DROP TABLE [dbo].[lastpaid]
GO
/****** Object:  Table [dbo].[lastpaid]    Script Date: 4/7/2015 12:53:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lastpaid](
	[Case_idno] [numeric](6, 0) NOT NULL,
	[LastPaid_amnt] [decimal](10, 2) NULL,
	[LastPayment_date] [date] NULL
) ON [PRIMARY]

GO

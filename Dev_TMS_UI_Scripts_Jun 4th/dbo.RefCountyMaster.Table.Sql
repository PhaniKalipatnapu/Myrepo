USE [DEV_TMS_UI]
GO
/****** Object:  Table [dbo].[RefCountyMaster]    Script Date: 6/4/2015 10:46:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RefCountyMaster](
	[StateFips_CODE] [char](2) NOT NULL,
	[State_CODE] [char](2) NOT NULL,
	[County_CODE] [char](3) NOT NULL,
	[County_NAMEE] [varchar](50) NOT NULL,
	[BeginValidity_DATEE] [datetime] NOT NULL,
	[TransactionEventSeq_NUMBB] [numeric](19, 0) NOT NULL,
	[Update_DTTMM] [datetime2](7) NOT NULL,
	[WorkerUpdate_IDD] [varchar](8) NOT NULL,
 CONSTRAINT [PK_STATE_CNTY] PRIMARY KEY CLUSTERED 
(
	[StateFips_CODE] ASC,
	[County_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numerical FIPS Code for state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'StateFips_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Two digit  state code for USA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'State_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'County Code with each state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'County_CODE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Describe the county name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'County_NAME'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Validaity of Record begin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'BeginValidity_DATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Event Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'TransactionEventSeq_NUMB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Time on which record created' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'Update_DTTM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Created by worker' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RefCountyMaster', @level2type=N'COLUMN',@level2name=N'WorkerUpdate_ID'
GO

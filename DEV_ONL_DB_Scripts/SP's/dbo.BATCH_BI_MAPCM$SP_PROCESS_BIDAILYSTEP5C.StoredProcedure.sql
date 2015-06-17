/****** Object:  StoredProcedure [dbo].[BATCH_BI_MAPCM$SP_PROCESS_BIDAILYSTEP5C]    Script Date: 4/10/2015 3:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
--------------------------------------------------------------------------------------------------------------------
Procedure Name	:	BATCH_BI_MAPCM$SP_PROCESS_BIDAILYSTEP5C
Programmer Name	:	IMP Team.
Description		:	This process loads the data from staging tables into BI tables, mainly BiCase_T1 table.
Frequency		:	'DAILY'
Developed On	:	4/27/2012
Called By		:	NONE
Called On		:	
--------------------------------------------------------------------------------------------------------------------
Modified By		:	
Modified On		:	
Version No		:	1.0
--------------------------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[BATCH_BI_MAPCM$SP_PROCESS_BIDAILYSTEP5C]
AS
 BEGIN
  SET NOCOUNT ON;

  DECLARE @Li_RowCount_QNTY          INT = 0,
          @Lc_Space_TEXT             CHAR(1) = ' ',
          @Lc_StatusAbnormalend_CODE CHAR(1) = 'A',
          @Lc_StatusSuccess_CODE     CHAR(1) = 'S',
          @Lc_StatusFailed_CODE      CHAR(1) = 'F',
          @Lc_BatchRunUser_TEXT      CHAR(5) = 'BATCH',
          @Lc_JobStep5c_IDNO         CHAR(7) = 'DEB1420',
          @Lc_Successful_TEXT        CHAR(10) = 'SUCCESSFUL',
          @Lc_Process_NAME           CHAR(14) = 'BATCH_BI_MAPCM',
          @Ls_Step5cRoutine1_TEXT    VARCHAR(50) = 'BATCH_BI_MAPCM$SP_PROCESS_BITABLES5C',
          @Ls_Procedure_NAME         VARCHAR(50) = 'SP_PROCESS_BIDAILYSTEP5C';
  DECLARE @Ln_Zero_NUMB                   NUMERIC(1) = 0,
          @Ln_NextProcess_NUMB            NUMERIC(1) = 0,
          @Ln_CommitFreqParm_QNTY         NUMERIC(5),
          @Ln_ExceptionThresholdParm_QNTY NUMERIC(5),
          @Ln_TotalRecordCount_NUMB		  NUMERIC(6) = 0,        
          @Ln_RecordCount_NUMB		      NUMERIC(6),  
          @Ln_Error_NUMB                  NUMERIC(11),
          @Ln_ErrorLine_NUMB              NUMERIC(11),
          @Lc_Msg_CODE                    CHAR(1),
          @Ls_Sql_TEXT                    VARCHAR(100),
          @Ls_RestartKey_TEXT             VARCHAR(200),
          @Ls_Sqldata_TEXT                VARCHAR(1000),
          @Ls_ErrorMessage_TEXT           VARCHAR(4000),
          @Ls_DescriptionError_TEXT       VARCHAR(4000),
          @Ld_Run_DATE                    DATE,
          @Ld_LastRun_DATE                DATE,
          @Ld_Start_DATE                  DATETIME2;

  BEGIN TRY
   SET @Ld_Start_DATE = dbo.BATCH_COMMON_SCALAR$SF_SYS_DATE_TIME();
   SET @Ls_Sql_TEXT = 'BATCH_COMMON$SP_GET_BATCH_DETAILS';
   SET @Ls_Sqldata_TEXT = 'Job_ID = ' + ISNULL(@Lc_JobStep5c_IDNO, '');

   EXECUTE BATCH_COMMON$SP_GET_BATCH_DETAILS
    @Ac_Job_ID                  = @Lc_JobStep5c_IDNO,
    @Ad_Run_DATE                = @Ld_Run_DATE OUTPUT,
    @Ad_LastRun_DATE            = @Ld_LastRun_DATE OUTPUT,
    @An_CommitFreq_QNTY         = @Ln_CommitFreqParm_QNTY OUTPUT,
    @An_ExceptionThreshold_QNTY = @Ln_ExceptionThresholdParm_QNTY OUTPUT,
    @Ac_Msg_CODE                = @Lc_Msg_CODE OUTPUT,
    @As_DescriptionError_TEXT   = @Ls_DescriptionError_TEXT OUTPUT;

   IF @Lc_Msg_CODE = @Lc_StatusFailed_CODE
    BEGIN
     SET @Ls_DescriptionError_TEXT = 'PARM DATE CHECK';

     RAISERROR(50001,16,1);
    END

   SET @Ls_Sql_TEXT = 'RUN DATE AND LAST RUN DATE VALIDATION';
   SET @Ls_Sqldata_TEXT = 'LAST RUN DATE = ' + CAST(@Ld_LastRun_DATE AS VARCHAR) + ', RUN DATE = ' + CAST(@Ld_Run_DATE AS VARCHAR);

   IF DATEADD(DAY, 1, @Ld_LastRun_DATE) > @Ld_Run_DATE
    BEGIN
     SET @Ls_DescriptionError_TEXT = 'PARM DATE PROBLEM';

     RAISERROR(50001,16,1);
    END

   SET @Ls_Sql_TEXT = 'CHECK RESTART KEY EXISTS';
   SET @Ls_Sqldata_TEXT = 'Job_ID = ' + ISNULL(@Lc_JobStep5c_IDNO, '');

   SELECT @Ls_RestartKey_TEXT = a.RestartKey_TEXT
     FROM RSTL_Y1 a
    WHERE a.Job_ID = @Lc_JobStep5c_IDNO
      AND a.Run_DATE = @Ld_Run_DATE;

   SET @Li_RowCount_QNTY = @@ROWCOUNT;

   IF(@Li_RowCount_QNTY = 0)
    BEGIN
     SET @Ln_NextProcess_NUMB = 1;
    END

   BEGIN TRANSACTION STEP5C;

   IF (@Ln_NextProcess_NUMB = 1
        OR @Ls_RestartKey_TEXT = @Ls_Step5cRoutine1_TEXT)
    BEGIN
     SET @Ln_RecordCount_NUMB = 0;
     SET @Lc_Msg_CODE = @Lc_StatusSuccess_CODE;
     SET @Ls_Sql_TEXT = 'BATCH_BI_MAPCM$SP_PROCESS_BITABLES5C';
     SET @Ls_Sqldata_TEXT = 'Job_ID = ' + ISNULL(@Lc_JobStep5c_IDNO, '');

     EXECUTE BATCH_BI_MAPCM$SP_PROCESS_BITABLES5C
      @Ln_RecordCount_NUMB OUTPUT, 
      @Lc_Msg_CODE OUTPUT,
      @Ls_DescriptionError_TEXT OUTPUT;

     IF (@Lc_Msg_CODE = @Lc_StatusFailed_CODE)
      BEGIN
       SET @Ls_DescriptionError_TEXT = ISNULL(@Ls_Step5cRoutine1_TEXT, '') + ' ' + ISNULL(@Ls_DescriptionError_TEXT, '');
       SET @Ln_NextProcess_NUMB = 0;

       RAISERROR(50001,16,1);
      END
     
     SET @Ln_TotalRecordCount_NUMB = @Ln_TotalRecordCount_NUMB + @Ln_RecordCount_NUMB;
    END

   COMMIT TRANSACTION STEP5C;

   BEGIN TRANSACTION STEP5C;

   SET @Ls_Sql_TEXT = 'UPDATE BSTL_LOG';
   SET @Ls_Sqldata_TEXT = 'Run_DATE = ' + CAST(@Ld_Run_DATE AS VARCHAR) + ', Start_DATE = ' + CAST(@Ld_Start_DATE AS VARCHAR) + ', Job_ID = ' + @Lc_JobStep5c_IDNO + ', Process_NAME = ' + @Lc_Process_NAME + ', Procedure_NAME = ' + @Ls_Procedure_NAME + ', CursorLoc_TEXT = ' + @Lc_Space_TEXT + ', ExecLocation_TEXT = ' + @Lc_Successful_TEXT + ', ExecLocation_TEXT = ' + @Lc_Successful_TEXT + ', DescriptionError_TEXT = ' + @Lc_Space_TEXT + ', Status_CODE = ' + @Lc_StatusSuccess_CODE + ', Worker_ID = ' + @Lc_BatchRunUser_TEXT;

   EXECUTE BATCH_COMMON$SP_BSTL_LOG
    @Ad_Run_DATE                  = @Ld_Run_DATE,
    @Ad_Start_DATE                = @Ld_Start_DATE,
    @Ac_Job_ID                    = @Lc_JobStep5c_IDNO,
    @As_Process_NAME              = @Lc_Process_NAME,
    @As_Procedure_NAME            = @Ls_Procedure_NAME,
    @As_CursorLocation_TEXT       = @Lc_Space_TEXT,
    @As_ExecLocation_TEXT         = @Lc_Successful_TEXT,
    @As_ListKey_TEXT              = @Lc_Successful_TEXT,
    @As_DescriptionError_TEXT     = @Lc_Space_TEXT,
    @Ac_Status_CODE               = @Lc_StatusSuccess_CODE,
    @Ac_Worker_ID                 = @Lc_BatchRunUser_TEXT,
    @An_ProcessedRecordCount_QNTY = @Ln_TotalRecordCount_NUMB;

   SET @Ls_Sql_TEXT = 'DELETE FROM RSTL_Y1';
   SET @Ls_Sqldata_TEXT = 'Job_ID = ' + ISNULL(@Lc_JobStep5c_IDNO, '') + ', Run_DATE = ' + CAST(@Ld_Run_DATE AS VARCHAR);

   DELETE RSTL_Y1
    WHERE Job_ID = @Lc_JobStep5c_IDNO
      AND Run_DATE = @Ld_Run_DATE;

   SET @Ls_Sql_TEXT = 'UPDATE PARM_Y1';
   SET @Ls_Sqldata_TEXT = 'Job_ID = ' + ISNULL(@Lc_JobStep5c_IDNO, '') + ', Run_DATE = ' + CAST(@Ld_Run_DATE AS VARCHAR);

   EXECUTE BATCH_COMMON$SP_UPDATE_PARM_DATE
    @Ac_Job_ID                = @Lc_JobStep5c_IDNO,
    @AD_Run_DATE              = @Ld_Run_DATE,
    @Ac_Msg_CODE              = @Lc_Msg_CODE OUTPUT,
    @As_DescriptionError_TEXT = @Ls_DescriptionError_TEXT OUTPUT;

   IF @Lc_Msg_CODE = @Lc_StatusFailed_CODE
    BEGIN
     RAISERROR(50001,16,1);
    END

   COMMIT TRANSACTION STEP5C;
  END TRY

  BEGIN CATCH
   IF @@TRANCOUNT > 0
    BEGIN
     ROLLBACK TRANSACTION STEP5C;
    END

   SET @Ln_Error_NUMB = ERROR_NUMBER ();
   SET @Ln_ErrorLine_NUMB = ERROR_LINE ();
   SET @Ls_ErrorMessage_TEXT = @Ls_DescriptionError_TEXT;

   IF @Ln_Error_NUMB <> 50001
    BEGIN
     SET @Ls_ErrorMessage_TEXT = SUBSTRING (ERROR_MESSAGE (), 1, 200);
    END

   EXECUTE BATCH_COMMON$SP_GET_ERROR_DESCRIPTION
    @As_Procedure_NAME        = @Ls_Procedure_NAME,
    @As_ErrorMessage_TEXT     = @Ls_ErrorMessage_TEXT,
    @As_Sql_TEXT              = @Ls_Sql_TEXT,
    @As_Sqldata_TEXT          = @Ls_Sqldata_TEXT,
    @An_Error_NUMB            = @Ln_Error_NUMB,
    @An_ErrorLine_NUMB        = @Ln_ErrorLine_NUMB,
    @As_DescriptionError_TEXT = @Ls_DescriptionError_TEXT OUTPUT;

   EXECUTE BATCH_COMMON$SP_BSTL_LOG
    @Ad_Run_DATE                  = @Ld_Run_DATE,
    @Ad_Start_DATE                = @Ld_Start_DATE,
    @Ac_Job_ID                    = @Lc_JobStep5c_IDNO,
    @As_Process_NAME              = @Lc_Process_NAME,
    @As_Procedure_NAME            = @Ls_Procedure_NAME,
    @As_CursorLocation_TEXT       = @Lc_Space_TEXT,
    @As_ExecLocation_TEXT         = @Ls_Sql_TEXT,
    @As_ListKey_TEXT              = @Ls_Sqldata_TEXT,
    @As_DescriptionError_TEXT     = @Ls_ErrorMessage_TEXT,
    @Ac_Status_CODE               = @Lc_StatusAbnormalend_CODE,
    @Ac_Worker_ID                 = @Lc_BatchRunUser_TEXT,
    @An_ProcessedRecordCount_QNTY = @Ln_Zero_NUMB;

   RAISERROR(@Ls_DescriptionError_TEXT,16,1);
  END CATCH
 END 

GO

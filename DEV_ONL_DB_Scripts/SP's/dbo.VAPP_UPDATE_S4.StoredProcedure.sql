/****** Object:  StoredProcedure [dbo].[VAPP_UPDATE_S4]    Script Date: 4/10/2015 3:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VAPP_UPDATE_S4](
 @Ac_ChildBirthCertificate_ID		CHAR(7),
 @Ac_TypeDocument_CODE				CHAR(3),
 @Ac_Declaration_INDC				CHAR(1),
 @Ac_GeneticTest_INDC				CHAR(1),
 @Ac_NoPresumedFather_CODE			CHAR(1),
 @Ac_VapPresumedFather_CODE			CHAR(1),
 @Ac_DopAttached_CODE				CHAR(1),  
 @Ad_MotherSignature_DATE			DATE,
 @Ad_FatherSignature_DATE			DATE,
 @Ac_DataRecordStatus_CODE			CHAR(1),
 @As_Note_TEXT						VARCHAR(4000),
 @Ac_SignedOnWorker_ID				CHAR(30),
 @An_TransactionEventSeq_NUMB		NUMERIC(19)
 )
AS
 /*    
 *      PROCEDURE NAME    : VAPP_UPDATE_S4    
  *     DESCRIPTION       : Update vap information for the given birth certificate and document type.
  *     DEVELOPED BY      : IMP Team    
  *     DEVELOPED ON      : 20-SEP-2011    
  *     MODIFIED BY       :     
  *     MODIFIED ON       :     
  *     VERSION NO        : 1    
 */
 BEGIN
 
  	DECLARE	@Ld_Current_DTTM DATETIME2 = DBO.BATCH_COMMON_SCALAR$SF_SYS_DATE_TIME();
	DECLARE @Ld_Current_DATE DATE = @Ld_Current_DTTM;

	UPDATE VAPP_Y1
    SET Declaration_INDC = @Ac_Declaration_INDC,
         GeneticTest_INDC = @Ac_GeneticTest_INDC,
         NoPresumedFather_CODE = @Ac_NoPresumedFather_CODE,
         VapPresumedFather_CODE = @Ac_VapPresumedFather_CODE,
		 DopAttached_CODE = @Ac_DopAttached_CODE,  
         MotherSignature_DATE = @Ad_MotherSignature_DATE,
         FatherSignature_DATE = @Ad_FatherSignature_DATE,
         DataRecordStatus_CODE = @Ac_DataRecordStatus_CODE,
         Note_TEXT = @As_Note_TEXT,
		 BeginValidity_DATE = @Ld_Current_DATE,
         WorkerUpdate_ID = @Ac_SignedOnWorker_ID,
         TransactionEventSeq_NUMB = @An_TransactionEventSeq_NUMB,
         Update_DTTM = @Ld_Current_DTTM   
	OUTPUT Deleted.ChildBirthCertificate_ID,
			 Deleted.TypeDocument_CODE,
			 Deleted.ChildMemberMci_IDNO,
			 Deleted.ChildLast_NAME,
			 Deleted.ChildFirst_NAME,
			 Deleted.ChildBirth_DATE,
			 Deleted.ChildMemberSsn_NUMB,
			 Deleted.ChildBirthState_CODE,
			 Deleted.ChildBirthCity_INDC,
			 Deleted.ChildBirthCounty_INDC,
			 Deleted.PlaceOfAck_CODE,
			 Deleted.PlaceOfAck_NAME,
			 Deleted.Declaration_INDC,
			 Deleted.GeneticTest_INDC,
			 Deleted.NoPresumedFather_CODE,
			 Deleted.VapPresumedFather_CODE,
			 Deleted.DopPresumedFather_CODE,
			 Deleted.VapAttached_CODE,
			 Deleted.DopAttached_CODE,
			 Deleted.MotherSignature_DATE,
			 Deleted.FatherSignature_DATE,
			 Deleted.Match_DATE,
			 Deleted.DataRecordStatus_CODE,
			 Deleted.ImageLink_INDC,
			 Deleted.FatherMemberMci_IDNO,
			 Deleted.FatherLast_NAME,
			 Deleted.FatherFirst_NAME,
			 Deleted.FatherBirth_DATE,
			 Deleted.FatherMemberSsn_NUMB,
			 Deleted.FatherAddrExist_INDC,
			 Deleted.MotherMemberMci_IDNO,
			 Deleted.MotherLast_NAME,
			 Deleted.MotherFirst_NAME,
			 Deleted.MotherBirth_DATE,
			 Deleted.MotherMemberSsn_NUMB,
			 Deleted.MotherAddrExist_INDC,
			 Deleted.Note_TEXT,
			 Deleted.BeginValidity_DATE,
			 @Ld_Current_DATE AS EndValidity_DATE,
			 Deleted.WorkerUpdate_ID,
			 Deleted.TransactionEventSeq_NUMB,
			 Deleted.Update_DTTM,
			 Deleted.MatchPoint_QNTY
	INTO HVAPP_Y1      
	WHERE ChildBirthCertificate_ID = @Ac_ChildBirthCertificate_ID
		AND TypeDocument_CODE = @Ac_TypeDocument_CODE;

  DECLARE @Ln_RowsAffected_NUMB NUMERIC(10);

  SELECT @Ln_RowsAffected_NUMB AS RowsAffected_NUMB;

 END; -- End Of VAPP_UPDATE_S4  


GO

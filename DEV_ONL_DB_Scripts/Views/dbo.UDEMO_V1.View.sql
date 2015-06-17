/****** Object:  View [dbo].[UDEMO_V1]    Script Date: 4/10/2015 3:12:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
      
CREATE VIEW [dbo].[UDEMO_V1] (      
         MemberMci_IDNO,       
      Individual_IDNO,       
      Last_NAME,       
      First_NAME,       
      Middle_NAME,       
      Suffix_NAME,       
      Title_NAME,       
      FullDisplay_NAME,       
      MemberSex_CODE ,       
      MemberSsn_NUMB ,       
      Birth_DATE,       
      Emancipation_DATE,       
      LastMarriage_DATE,       
      LastDivorce_DATE,       
      BirthCity_NAME,       
      BirthState_CODE,       
      BirthCountry_CODE,       
      DescriptionHeight_TEXT,       
      DescriptionWeightLbs_TEXT,       
      Race_CODE,         
      ColorHair_CODE,       
      ColorEyes_CODE,       
      Language_CODE,       
      TypeProblem_CODE,       
      Deceased_DATE,      
      CerDeathNo_TEXT,    
      LicenseDriverNo_TEXT,       
      AlienRegistn_ID,       
      WorkPermitNo_TEXT ,       
      BeginPermit_DATE,       
      EndPermit_DATE,       
      HomePhone_NUMB,       
      WorkPhone_NUMB,       
      CellPhone_NUMB,       
      Fax_NUMB,       
      Contact_EML,       
      Spouse_NAME,       
      Graduation_DATE,       
      EducationLevel_CODE,       
      Restricted_INDC,       
      Military_ID,       
      MilitaryBranch_CODE,       
      MilitaryStatus_CODE,       
      MilitaryBenefitStatus_CODE,       
      SecondFamily_INDC,       
      MeansTestedInc_INDC,       
      SsIncome_INDC,       
      VeteranComps_INDC,       
      Disable_INDC,       
      Assistance_CODE,       
      DescriptionIdentifyingMarks_TEXT,       
      Divorce_INDC,       
      BeginValidity_DATE,       
      EndValidity_DATE,       
      WorkerUpdate_ID,       
      TransactionEventSeq_NUMB ,       
      Update_DTTM,       
      TypeOccupation_CODE,       
      CountyBirth_IDNO,       
      MotherMaiden_NAME,       
      FileLastDivorce_ID 
)      
AS       
         
  SELECT       
      MemberDemographics_T1.MemberMci_IDNO,       
      MemberDemographics_T1.Individual_IDNO,       
      MemberDemographics_T1.Last_NAME,       
      MemberDemographics_T1.First_NAME,       
      MemberDemographics_T1.Middle_NAME,       
      MemberDemographics_T1.Suffix_NAME,       
      MemberDemographics_T1.Title_NAME,       
      MemberDemographics_T1.FullDisplay_NAME,       
      MemberDemographics_T1.MemberSex_CODE,       
      MemberDemographics_T1.MemberSsn_NUMB,       
      MemberDemographics_T1.Birth_DATE,       
      MemberDemographics_T1.Emancipation_DATE,       
      MemberDemographics_T1.LastMarriage_DATE,       
      MemberDemographics_T1.LastDivorce_DATE,       
      MemberDemographics_T1.BirthCity_NAME,       
      MemberDemographics_T1.BirthState_CODE,       
      MemberDemographics_T1.BirthCountry_CODE,       
      MemberDemographics_T1.DescriptionHeight_TEXT,       
      MemberDemographics_T1.DescriptionWeightLbs_TEXT, 
      MemberDemographics_T1.Race_CODE,            
      MemberDemographics_T1.ColorHair_CODE,       
      MemberDemographics_T1.ColorEyes_CODE,       
      MemberDemographics_T1.Language_CODE,       
      MemberDemographics_T1.TypeProblem_CODE,       
      MemberDemographics_T1.Deceased_DATE,       
      MemberDemographics_T1.CerDeathNo_TEXT,       
      MemberDemographics_T1.LicenseDriverNo_TEXT,       
      MemberDemographics_T1.AlienRegistn_ID,       
      MemberDemographics_T1.WorkPermitNo_TEXT,       
      MemberDemographics_T1.BeginPermit_DATE,       
      MemberDemographics_T1.EndPermit_DATE,       
      MemberDemographics_T1.HomePhone_NUMB,       
      MemberDemographics_T1.WorkPhone_NUMB,       
      MemberDemographics_T1.CellPhone_NUMB,       
      MemberDemographics_T1.Fax_NUMB,       
      MemberDemographics_T1.Contact_EML,            
      MemberDemographics_T1.Spouse_NAME,       
      MemberDemographics_T1.Graduation_DATE,       
      MemberDemographics_T1.EducationLevel_CODE,        
      MemberDemographics_T1.Restricted_INDC,           
      MemberDemographics_T1.Military_ID,       
      MemberDemographics_T1.MilitaryBranch_CODE,       
      MemberDemographics_T1.MilitaryStatus_CODE,       
      MemberDemographics_T1.MilitaryBenefitStatus_CODE,      
      MemberDemographics_T1.SecondFamily_INDC,       
      MemberDemographics_T1.MeansTestedInc_INDC,       
      MemberDemographics_T1.SsIncome_INDC,       
      MemberDemographics_T1.VeteranComps_INDC,       
      MemberDemographics_T1.Disable_INDC,             
      MemberDemographics_T1.Assistance_CODE,       
      MemberDemographics_T1.DescriptionIdentifyingMarks_TEXT,     
      MemberDemographics_T1.Divorce_INDC,       
       MemberDemographics_T1.BeginValidity_DATE,       
      '31-DEC-9999' AS EndValidity_DATE,       
      MemberDemographics_T1.WorkerUpdate_ID,       
      MemberDemographics_T1.TransactionEventSeq_NUMB,       
      MemberDemographics_T1.Update_DTTM,       
      MemberDemographics_T1.TypeOccupation_CODE,              
      MemberDemographics_T1.CountyBirth_IDNO ,       
      MemberDemographics_T1.MotherMaiden_NAME,       
      MemberDemographics_T1.FileLastDivorce_ID      
   FROM dbo.MemberDemographics_T1      
    UNION ALL      
   SELECT       
      MemberDemographicsHist_T1.MemberMci_IDNO,       
      MemberDemographicsHist_T1.Individual_IDNO,       
      MemberDemographicsHist_T1.Last_NAME,       
      MemberDemographicsHist_T1.First_NAME,       
      MemberDemographicsHist_T1.Middle_NAME,       
      MemberDemographicsHist_T1.Suffix_NAME,       
      MemberDemographicsHist_T1.Title_NAME,       
      MemberDemographicsHist_T1.FullDisplay_NAME,       
      MemberDemographicsHist_T1.MemberSex_CODE ,       
      MemberDemographicsHist_T1.MemberSsn_NUMB ,       
      MemberDemographicsHist_T1.Birth_DATE,       
      MemberDemographicsHist_T1.Emancipation_DATE,       
      MemberDemographicsHist_T1.LastMarriage_DATE,       
      MemberDemographicsHist_T1.LastDivorce_DATE,       
      MemberDemographicsHist_T1.BirthCity_NAME,       
      MemberDemographicsHist_T1.BirthState_CODE,       
      MemberDemographicsHist_T1.BirthCountry_CODE,       
      MemberDemographicsHist_T1.DescriptionHeight_TEXT,       
      MemberDemographicsHist_T1.DescriptionWeightLbs_TEXT,       
      MemberDemographicsHist_T1.Race_CODE,          
      MemberDemographicsHist_T1.ColorHair_CODE,       
      MemberDemographicsHist_T1.ColorEyes_CODE,       
      MemberDemographicsHist_T1.Language_CODE,       
      MemberDemographicsHist_T1.TypeProblem_CODE,       
      MemberDemographicsHist_T1.Deceased_DATE,      
      MemberDemographicsHist_T1.CerDeathNo_TEXT,    
      MemberDemographicsHist_T1.LicenseDriverNo_TEXT,       
      MemberDemographicsHist_T1.AlienRegistn_ID,       
      MemberDemographicsHist_T1.WorkPermitNo_TEXT ,       
      MemberDemographicsHist_T1.BeginPermit_DATE,       
      MemberDemographicsHist_T1.EndPermit_DATE,       
      MemberDemographicsHist_T1.HomePhone_NUMB,       
      MemberDemographicsHist_T1.WorkPhone_NUMB,       
      MemberDemographicsHist_T1.CellPhone_NUMB,       
      MemberDemographicsHist_T1.Fax_NUMB,       
      MemberDemographicsHist_T1.Contact_EML,       
      MemberDemographicsHist_T1.Spouse_NAME,       
      MemberDemographicsHist_T1.Graduation_DATE,       
      MemberDemographicsHist_T1.EducationLevel_CODE,       
      MemberDemographicsHist_T1.Restricted_INDC,       
      MemberDemographicsHist_T1.Military_ID,       
      MemberDemographicsHist_T1.MilitaryBranch_CODE,       
      MemberDemographicsHist_T1.MilitaryStatus_CODE,       
      MemberDemographicsHist_T1.MilitaryBenefitStatus_CODE,       
      MemberDemographicsHist_T1.SecondFamily_INDC,       
      MemberDemographicsHist_T1.MeansTestedInc_INDC,       
      MemberDemographicsHist_T1.SsIncome_INDC,       
      MemberDemographicsHist_T1.VeteranComps_INDC,       
      MemberDemographicsHist_T1.Disable_INDC,       
      MemberDemographicsHist_T1.Assistance_CODE,       
      MemberDemographicsHist_T1.DescriptionIdentifyingMarks_TEXT,       
      MemberDemographicsHist_T1.Divorce_INDC,       
      MemberDemographicsHist_T1.BeginValidity_DATE,       
      MemberDemographicsHist_T1.EndValidity_DATE,       
      MemberDemographicsHist_T1.WorkerUpdate_ID,       
      MemberDemographicsHist_T1.TransactionEventSeq_NUMB ,       
      MemberDemographicsHist_T1.Update_DTTM,       
      MemberDemographicsHist_T1.TypeOccupation_CODE,       
      MemberDemographicsHist_T1.CountyBirth_IDNO,       
      MemberDemographicsHist_T1.MotherMaiden_NAME,       
      MemberDemographicsHist_T1.FileLastDivorce_ID      
   FROM dbo.MemberDemographicsHist_T1      
GO

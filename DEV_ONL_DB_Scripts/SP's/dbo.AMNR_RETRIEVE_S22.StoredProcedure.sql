/****** Object:  StoredProcedure [dbo].[AMNR_RETRIEVE_S22]    Script Date: 4/10/2015 3:15:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AMNR_RETRIEVE_S22] (
 @Ac_ActivityMinor_CODE       CHAR(5),
 @As_DescriptionActivity_TEXT VARCHAR(75) OUTPUT
 )
AS
 /*                                                                                                       
  *     PROCEDURE NAME    : AMNR_RETRIEVE_S22                                                              
  *     DESCRIPTION       : Retrieve Description for a Minor Activity Code and Activity Type is not Empty.
  *     DEVELOPED BY      : IMP Team                                                                    
  *     DEVELOPED ON      : 23-AUG-2011                                                                   
  *     MODIFIED BY       :                                                                               
  *     MODIFIED ON       :                                                                               
  *     VERSION NO        : 1                                                                             
 */
 BEGIN
  SET @As_DescriptionActivity_TEXT = NULL;

  DECLARE @Lc_Space_TEXT CHAR(1) = ' ',
          @Ld_High_DATE  DATE = '12/31/9999';

  SELECT @As_DescriptionActivity_TEXT = A.DescriptionActivity_TEXT
    FROM AMNR_Y1 A
   WHERE A.ActivityMinor_CODE = @Ac_ActivityMinor_CODE
     AND A.TypeActivity_CODE != @Lc_Space_TEXT
     AND A.EndValidity_DATE = @Ld_High_DATE;
 END; --END OF AMNR_RETRIEVE_S22                                                                                                    


GO

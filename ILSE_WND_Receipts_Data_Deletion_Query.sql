SET NOCOUNT ON;

--Added by Pinakee to Check the adding of things

DECLARE @ReceiptsToBeRetainedForDays INT = 365 * 2
	,@MaxDateToRetainReceipts DATETIME
	,@BatchSize INT = 5000
	,@RowCnt INT;

SET @MaxDateToRetainReceipts = DATEADD(DAY, @ReceiptsToBeRetainedForDays * - 1, GETUTCDATE());

SELECT @MaxDateToRetainReceipts;

IF NOT EXISTS (
		SELECT 1
		FROM INFORMATION_SCHEMA.TABLES T
		WHERE T.TABLE_NAME = 'tmpReceipts'
		)
BEGIN
	CREATE TABLE tmpReceipts (
		SLNo INT IDENTITY(1, 1)
		,ReceiptID VARCHAR(100)
		,AddedOn DATETIME DEFAULT GETUTCDATE()
		,DeletionStatus BIT DEFAULT 0
		);
END



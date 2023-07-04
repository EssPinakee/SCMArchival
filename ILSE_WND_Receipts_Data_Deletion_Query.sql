SET NOCOUNT ON;

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

IF NOT EXISTS (
		SELECT 1
		FROM INFORMATION_SCHEMA.TABLES T
		WHERE T.TABLE_NAME = 'DeletionLogs'
		)
BEGIN
	CREATE TABLE DeletionLogs (
		SLNo INT IDENTITY(1, 1)
		,TableName VARCHAR(100)
		,Remarks VARCHAR(2000)
		,AddedOn DATETIME DEFAULT GETUTCDATE()
		);
END

--INSERT INTO tmpReceipts (ReceiptID)
--SELECT R.IDReceipt
--FROM Receipts R WITH (NOLOCK)
--WHERE R.ReceiptEditDateTime < @MaxDateToRetainReceipts;

INSERT INTO tmpReceipts (ReceiptID)
VALUES ('0000077055')
	,('0000077471')
	,('0000078581')
	,('0000078582')
	,('0000082237');

DROP TABLE IF EXISTS ##tmpReceipts;

	CREATE TABLE ##tmpReceipts (
		SLNo INT IDENTITY(1, 1)
		,ReceiptID VARCHAR(100)
		);

DROP TABLE IF EXISTS ##tmpBillingQuantities;

	CREATE TABLE ##tmpBillingQuantities (
		SLNo INT IDENTITY(1, 1)
		,BillingQuantityID VARCHAR(100)
		);

DROP TABLE IF EXISTS ##tmpTransports;

	CREATE TABLE ##tmpTransports (
		SLNo INT IDENTITY(1, 1)
		,TransportID UNIQUEIDENTIFIER
		,TransportStopID UNIQUEIDENTIFIER
		,TransportDetailID UNIQUEIDENTIFIER
		,ReceiptID VARCHAR(100)
		,OrderID VARCHAR(100)
		);

DROP TABLE IF EXISTS ##tmpOrders;

	CREATE TABLE ##tmpOrders (
		SLNo INT IDENTITY(1, 1)
		,OrderID VARCHAR(100)
		);

WHILE EXISTS (
		SELECT 1
		FROM tmpReceipts
		WHERE DeletionStatus = 0
		)
BEGIN
	INSERT INTO DeletionLogs (
		TableName
		,Remarks
		)
	VALUES (
		NULL
		,'Deletion Started.'
		);

	TRUNCATE TABLE ##tmpReceipts;

	TRUNCATE TABLE ##tmpBillingQuantities;

	TRUNCATE TABLE ##tmpTransports;

	TRUNCATE TABLE ##tmpOrders;

	INSERT INTO ##tmpReceipts (ReceiptID)
	SELECT TOP (@BatchSize) ReceiptID
	FROM tmpReceipts
	WHERE DeletionStatus = 0;
	;

	INSERT INTO ##tmpBillingQuantities (BillingQuantityID)
	SELECT B.IDBillingQuantity
	FROM ##tmpReceipts R WITH (NOLOCK)
	INNER JOIN BillingQuantities B WITH (NOLOCK) ON R.ReceiptID = B.ReceiptID;

	INSERT INTO ##tmpTransports (
		TransportID
		,TransportStopID
		,TransportDetailID
		,ReceiptID
		,OrderID
		)
	SELECT T.IDTransport
		,TS.IDTransportStop
		,TD.IDTransportDetail
		,TD.ReceiptID
		,TS.OrderID
	FROM Transports T WITH (NOLOCK)
	INNER JOIN TransportStops TS WITH (NOLOCK) ON T.IDTransport = TS.TransportID
	INNER JOIN TransportDetails TD WITH (NOLOCK) ON TD.TransportStopID = TS.IDTransportStop
	INNER JOIN Receipts R WITH (NOLOCK) ON TD.ReceiptID = R.IDReceipt
	INNER JOIN ##tmpReceipts tr ON R.IDReceipt = tr.ReceiptID;

	INSERT INTO ##tmpOrders (OrderID)
	SELECT R.IDOrder
	FROM Orders R WITH (NOLOCK)
	INNER JOIN ##tmpTransports T ON R.TransportIDReceipt = T.TransportID;

	--BillingCosts					: FK__BillingCo__Billi__522F1F86
	----00BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingCosts BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingCosts'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingRevenues					: FK_BillingRevenues_BillingQuantities
	----01BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingRevenues BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingRevenues'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--ManualBillingQuantities			: FK_ManualBillingQuantities_BillingQuantities
	----02BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM ManualBillingQuantities BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'ManualBillingQuantities'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--QuotationOptionDetails			: FK_QuotationOptionDetails_BillingQuantities
	----03BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM QuotationOptionDetails BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'QuotationOptionDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingQuantities				: FK_BillingQuantities_Receipts
	----04ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Receipts (IDReceipt)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingQuantities BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingQuantities'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingReceiptCharges			: FK_BillingReceiptCharges_BillingReceipts
	----05ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingReceipts (ReceiptID)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingReceiptCharges BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingReceiptCharges'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingReceipts					: FK_BillingReceipts_Receipts
	----06ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Receipts (IDReceipt)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingReceiptCharges BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingReceipts'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--LinkLotsLocationsStorageUnits	: FK_LinkLotsLocationsStorageUnits_Receipts
	----07ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Receipts (IDReceipt)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM LinkLotsLocationsStorageUnits BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'LinkLotsLocationsStorageUnits'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--AdjustmentDetails						: FK_AdjustmentDetails_ReceiptDetails
	----08ReceiptID, ReceiptDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptDetails (ReceiptID, ReceiptDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM AdjustmentDetails BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'AdjustmentDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	----LinkLotsLocationsStorageUnits			: FK_LinkLotsLocationsStorageUnits_ReceiptDetails
	------09ReceiptID, ReceiptDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptDetails (ReceiptID, ReceiptDetailLineNumber)
	--OrderReceiptSerialNumbers				: FK_OrderReceiptSerialNumbers_OrderParties
	----10ReceiptID, ReceiptDetailLineNumber, ReceiptPartySubPartyNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptParties (ReceiptID, ReceiptDetailLineNumber, ReceiptPartySubPartyNumber)
	----11OrderID, OrderDetailLineNumber, OrderPartySubPartyNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.OrderParties (OrderID, OrderDetailLineNumber, OrderPartySubPartyNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM OrderReceiptSerialNumbers BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'OrderReceiptSerialNumbers'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--OrderParties							: FK_OrderParties_ReceiptDetails
	----12ReceiptID, ReceiptDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptDetails (ReceiptID, ReceiptDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM OrderParties BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'OrderParties'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--ReceiptCaseDetails						: FK_ReceiptCaseDetails_ReceiptDetails
	----13ReceiptID, ReceiptDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptDetails (ReceiptID, ReceiptDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM ReceiptCaseDetails BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'ReceiptCaseDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--ReceiptContainerExchanges				: FK_ReceiptContainerExchanges_ReceiptDetails
	----14ReceiptID, ReceiptDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptDetails (ReceiptID, ReceiptDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM ReceiptContainerExchanges BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'ReceiptContainerExchanges'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--OrderReceiptSerialNumbers				: FK_OrderReceiptSerialNumbers_ReceiptParties
	----15ReceiptID, ReceiptDetailLineNumber, ReceiptPartySubPartyNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptParties (ReceiptID, ReceiptDetailLineNumber, ReceiptPartySubPartyNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM OrderReceiptSerialNumbers BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'OrderReceiptSerialNumbers'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--ReceiptParties							: FK_ReceiptParties_ReceiptDetails
	----16ReceiptID, ReceiptDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptDetails (ReceiptID, ReceiptDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM ReceiptParties BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'ReceiptParties'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--StockTransactions						: FK_StockTransactions_ReceiptDetails
	----17ReceiptID, ReceiptDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.ReceiptDetails (ReceiptID, ReceiptDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM StockTransactions BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'StockTransactions'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--ReceiptDetails							: FK_ReceiptDetails_Receipts
	----18ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Receipts (IDReceipt)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM ReceiptDetails BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'ReceiptDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportLogs							: FK_TransportLogs_TransportDetails
	----19TransportDetailID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportDetails (IDTransportDetail)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportLogs BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportLogs'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportDetails						: FK_TransportDetails_Receipts
	----20TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportDetails BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	----21ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Receipts (IDReceipt)
	--DynamicShippingReferences				: FK_DynamicShippingReferences_InternalCSSpecifications
	----22InternalCSSpecificationID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.InternalCSSpecifications (IDInternalCSSpecification)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM DynamicShippingReferences BC
		INNER JOIN InternalCSSpecifications ICS WITH (NOLOCK) ON ICS.IDInternalCSSpecification = BC.InternalCSSpecificationID
		INNER JOIN ##tmpTransports tBQ ON ICS.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'DynamicShippingReferences'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--InternalCSSpecifications				: FK_InternalCSSpecifications_TransportStops
	----23TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM InternalCSSpecifications BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'InternalCSSpecifications'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--InternalCSSpecifications				: FK_InternalCSSpecifications_TransportStops1
	----24TransportStopIDSecondLeg REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM InternalCSSpecifications BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopIDSecondLeg = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'InternalCSSpecifications'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportDetails						: FK_TransportDetails_TransportStops
	----25TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	----26ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Receipts (IDReceipt)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportDetails BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportLogs							: FK_TransportLogs_TransportDocuments
	----27TransportDocumentID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportDocuments (IDTransportDocument)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportLogs BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportLogs'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportDocuments						: FK_TransportDocuments_TransportStops
	----28TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportDocuments BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportDocuments'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--LinkTransportFilesTransportFileTypes	: FK_LinkTransportFilesTransportFileTypes_TransportFiles
	----29TransportFileID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportFiles (IDTransportFile)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM LinkTransportFilesTransportFileTypes BC
		INNER JOIN TransportFiles TF WITH (NOLOCK) ON BC.TransportFileID = TF.IDTransportFile
		INNER JOIN ##tmpTransports tBQ ON TF.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'LinkTransportFilesTransportFileTypes'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportFiles						: FK_TransportFiles_TransportStops
	----30TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportFiles BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportFiles'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportLogs							: FK_TransportLogs_TransportStops
	----31TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportLogs BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportLogs'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingTransportCharges					: FK_BillingTransportCharges_BillingTransports
	----32TransportID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingTransports (TransportID)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingTransportCharges BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingTransportCharges'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingTransports						: FK__BillingTr__Trans__729BEF18
	----33TransportID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Transports (IDTransport)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingTransports BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingTransports'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--InternalCSSpecifications				: FK_InternalCSSpecifications_Transports
	----34TransportID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Transports (IDTransport)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM InternalCSSpecifications BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'InternalCSSpecifications'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--InternalCSSpecifications				: FK_InternalCSSpecifications_Transports1
	----35TransportIDSecondLeg REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Transports (IDTransport)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM InternalCSSpecifications BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportIDSecondLeg = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'InternalCSSpecifications'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingOrderCharges						: FK_BillingOrderCharges_BillingOrders
	----36OrderID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingOrders (OrderID)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingOrderCharges BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingOrderCharges'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingOrders							: FK_BillingOrders_Orders
	----37OrderID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Orders (IDOrder)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingOrders BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingOrders'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingCosts							: FK__BillingCo__Billi__522F1F86
	----38BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingCosts BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingCosts'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingRevenues							: FK_BillingRevenues_BillingQuantities
	----39BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingRevenues BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingRevenues'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--ManualBillingQuantities					: FK_ManualBillingQuantities_BillingQuantities
	----40BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM ManualBillingQuantities BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'ManualBillingQuantities'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--QuotationOptionDetails					: FK_QuotationOptionDetails_BillingQuantities
	----41BillingQuantityID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.BillingQuantities (IDBillingQuantity)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM QuotationOptionDetails BC
		INNER JOIN ##tmpBillingQuantities tBQ ON BC.BillingQuantityID = tbQ.BillingQuantityID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'QuotationOptionDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--BillingQuantities						: FK_BillingQuantities_Orders
	----42OrderID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Orders (IDOrder)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM BillingQuantities BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'BillingQuantities'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--LoadOrderDetails						: FK_LoadOrderDetails_Orders
	----43OrderID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Orders (IDOrder)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM LoadOrderDetails BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'LoadOrderDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--OrderContainerExchanges					: FK_OrderContainerExchanges_OrderDetails
	----44OrderID, OrderDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.OrderDetails (OrderID, OrderDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM OrderContainerExchanges BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'OrderContainerExchanges'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--OrderReceiptSerialNumbers				: FK_OrderReceiptSerialNumbers_OrderParties
	----45OrderID, OrderDetailLineNumber, OrderPartySubPartyNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.OrderParties (OrderID, OrderDetailLineNumber, OrderPartySubPartyNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM OrderReceiptSerialNumbers BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'OrderReceiptSerialNumbers'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--OrderParties							: FK_OrderParties_OrderDetails
	----46OrderID, OrderDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.OrderDetails (OrderID, OrderDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM OrderParties BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'OrderParties'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--PickDetails								: FK_PickDetails_OrderDetails
	----47OrderID, OrderDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.OrderDetails (OrderID, OrderDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM PickDetails BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'PickDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--StockTransactions						: FK_StockTransactions_OrderDetails
	----48OrderID, OrderDetailLineNumber REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.OrderDetails (OrderID, OrderDetailLineNumber)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM StockTransactions BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'StockTransactions'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--OrderDetails							: FK_OrderDetails_Orders
	----49OrderID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Orders (IDOrder)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM OrderDetails BC
		INNER JOIN ##tmpOrders tBQ ON BC.OrderID = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'OrderDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportLogs							: FK_TransportLogs_TransportDetails
	----50TransportDetailID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportDetails (IDTransportDetail)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportLogs BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportLogs'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportDetails						: FK_TransportDetails_Orders
	----51OrderID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Orders (IDOrder)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportDetails BC
		INNER JOIN ##tmpTransports tBQ ON BC.IDTransportDetail = tbQ.TransportDetailID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportDetails'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportStops							: FK_TransportStops_Orders
	----52OrderID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Orders (IDOrder)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportStops BC
		INNER JOIN ##tmpTransports tBQ ON BC.IDTransportStop = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportStops'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--Orders									: FK_Orders_ReceiptTransports
	----53TransportIDReceipt REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Transports (IDTransport)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM Orders BC
		INNER JOIN ##tmpOrders tBQ ON BC.IDOrder = tbQ.OrderID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'Orders'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportLevelFiles						: FK__Transport__Trans__24885067
	----54TransportID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Transports (IDTransport)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportLevelFiles BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportLevelFiles'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportLogs							: FK_TransportLogs_Transports
	----55TransportID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Transports (IDTransport)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportLogs BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportLogs'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportStops							: FK_TransportStops_Transports
	----56TransportID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Transports (IDTransport)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportStops BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportID = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportStops'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--Transports							: FK_Transports_FirstStop
	----57TransportStopIDFirst REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	--Transports							: FK_Transports_LastStop
	----58TransportStopIDLast REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM Transports BC
		INNER JOIN ##tmpTransports tBQ ON BC.IDTransport = tbQ.TransportID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'Transports'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportStopFinancials				: FK__Transport__Trans__3A779186
	----59TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportStopFinancials BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportStopFinancials'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportStopPallets					: FK__Transport__Trans__3B6BB5BF
	----60TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportStopPallets BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportStopPallets'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportStopPallets					: FK__Transport__Trans__3C5FD9F8
	----61TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportStopPallets BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportStopPallets'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportStopPallets					: FK__Transport__Trans__3D53FE31
	----62TransportStopID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.TransportStops (IDTransportStop)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportStopPallets BC
		INNER JOIN ##tmpTransports tBQ ON BC.TransportStopID = tbQ.TransportStopID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportStopPallets'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--TransportStops							: FK_TransportStops_Receipts
	----63ReceiptID REFERENCES AZURE_ILSE_WBK_NONPROD.dbo.Receipts (IDReceipt)
	WHILE 1 = 1
	BEGIN
		DELETE TOP (@BatchSize) BC
		FROM TransportStops BC
		INNER JOIN ##tmpReceipts tBQ ON BC.ReceiptID = tbQ.ReceiptID;

		SET @RowCnt = @@ROWCOUNT;

		IF @RowCnt = 0
			BREAK;

		INSERT INTO DeletionLogs (
			TableName
			,Remarks
			)
		VALUES (
			'TransportStops'
			,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
			);
	END

	--Receipts
	DELETE BC
	FROM Receipts BC
	INNER JOIN ##tmpReceipts tBQ ON BC.IDReceipt = tbQ.ReceiptID;

	SET @RowCnt = @@ROWCOUNT;

	INSERT INTO DeletionLogs (
		TableName
		,Remarks
		)
	VALUES (
		'Receipts'
		,'Deleted ' + LTRIM(STR(@RowCnt)) + ' rows.'
		);

	INSERT INTO DeletionLogs (
		TableName
		,Remarks
		)
	VALUES (
		NULL
		,'---------------------------------------------------------------------------------------------------------------------------------'
		);

	UPDATE R
	SET R.DeletionStatus = 1
	FROM ##tmpReceipts tr
	INNER JOIN tmpReceipts R ON R.ReceiptID = tr.ReceiptID;
END

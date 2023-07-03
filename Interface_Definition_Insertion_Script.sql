--select top 10 * from InterfaceTableDefinitions with (nolock) where InterfaceTableDefinitionCode='ArchivalWBK'
--select  * from InterfaceTableDefinitionFields with (nolock) where InterfaceTableDefinitionCode='ArchivalWBK'
--select * from InterfaceItems with (nolock) where InterfaceTableDefinitionCode='DeletionWBK'



SET NOCOUNT ON;
-----------------------------------------------------------------------------------------------------------------------
--InterfaceTableDefinitions
-----------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitions WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitions (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionName]
		,[InterfaceTableDefinitionDescription]
		,[InterfaceTableDefinitionArchive]
		,[InterfaceTableDefinitionArchiveAllowedStorageString]
		,[InterfaceTableDefinitionAddDateTime]
		,[InterfaceTableDefinitionAddUserCode]
		,[InterfaceTableDefinitionEditDateTime]
		,[InterfaceTableDefinitionEditUserCode]
		,[InterfaceTableDefinitionDataEntryDefinitionID]
		)
	VALUES (
		'ArchivalWBK'
		,'Archival WBK'
		,'Archival WBK'
		,0
		,NULL
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		,NULL
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitions WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitions (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionName]
		,[InterfaceTableDefinitionDescription]
		,[InterfaceTableDefinitionArchive]
		,[InterfaceTableDefinitionArchiveAllowedStorageString]
		,[InterfaceTableDefinitionAddDateTime]
		,[InterfaceTableDefinitionAddUserCode]
		,[InterfaceTableDefinitionEditDateTime]
		,[InterfaceTableDefinitionEditUserCode]
		,[InterfaceTableDefinitionDataEntryDefinitionID]
		)
	VALUES (
		'DeletionWBK'
		,'Deletion WBK'
		,'Deletion WBK'
		,0
		,NULL
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		,NULL
		);
END;


-----------------------------------------------------------------------------------------------------------------------
--InterfaceTableDefinitionFields
-----------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'BLHeadersArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER01'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER01'
		,'BLHeadersArchiveAfterDays'
		,'BLHeadersArchiveAfterDays'
		,NULL
		,1
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'CSHeadersArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER02'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER02'
		,'CSHeadersArchiveAfterDays'
		,'CSHeadersArchiveAfterDays'
		,NULL
		,2
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'FCRHeadersArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER03'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER03'
		,'FCRHeadersArchiveAfterDays'
		,'FCRHeadersArchiveAfterDays'
		,NULL
		,3
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'HBLHeadersArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER04'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER04'
		,'HBLHeadersArchiveAfterDays'
		,'HBLHeadersArchiveAfterDays'
		,NULL
		,4
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'POHeadersArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER05'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER05'
		,'POHeadersArchiveAfterDays'
		,'POHeadersArchiveAfterDays'
		,NULL
		,5
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'SOHeadersArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER06'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER06'
		,'SOHeadersArchiveAfterDays'
		,'SOHeadersArchiveAfterDays'
		,NULL
		,6
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'BillingArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER07'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER07'
		,'BillingArchiveAfterDays'
		,'BillingArchiveAfterDays'
		,NULL
		,7
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'CustomsClearanceDocumentArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER08'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER08'
		,'CustomsClearanceDocumentArchiveAfterDays'
		,'CustomsClearanceDocumentArchiveAfterDays'
		,NULL
		,8
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'InterfaceDocumentArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER09'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER09'
		,'InterfaceDocumentArchiveAfterDays'
		,'InterfaceDocumentArchiveAfterDays'
		,NULL
		,9
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'MileStoneUpdateArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER10'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'NUMBER10'
		,'MileStoneUpdateArchiveAfterDays'
		,'MileStoneUpdateArchiveAfterDays'
		,NULL
		,10
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'OrderArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String01'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String01'
		,'OrderArchiveAfterDays'
		,'OrderArchiveAfterDays'
		,NULL
		,11
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'ProductArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String02'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String02'
		,'ProductArchiveAfterDays'
		,'ProductArchiveAfterDays'
		,NULL
		,12
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'ReceiptArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String03'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String03'
		,'ReceiptArchiveAfterDays'
		,'ReceiptArchiveAfterDays'
		,NULL
		,13
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'ReceiptsAfterProductOrderArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String04'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String04'
		,'ReceiptsAfterProductOrderArchiveAfterDays'
		,'ReceiptsAfterProductOrderArchiveAfterDays'
		,NULL
		,14
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'ShippingDataArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String05'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String05'
		,'ShippingDataArchiveAfterDays'
		,'ShippingDataArchiveAfterDays'
		,NULL
		,15
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'StockTransactionArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String06'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String06'
		,'StockTransactionArchiveAfterDays'
		,'StockTransactionArchiveAfterDays'
		,NULL
		,16
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'TaskArchiveAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String07'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String07'
		,'TaskArchiveAfterDays'
		,'TaskArchiveAfterDays'
		,NULL
		,17
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryArchivalStatuses'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String08'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String08'
		,'DataEntryArchivalStatuses'
		,'DataEntryArchivalStatuses'
		,NULL
		,18
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'ReceiptTypesForArchival'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String09'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String09'
		,'ReceiptTypesForArchival'
		,'ReceiptTypesForArchival'
		,NULL
		,19
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'InterfaceDocumentTypesForArchival'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String10'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'String10'
		,'InterfaceDocumentTypesForArchival'
		,'InterfaceDocumentTypesForArchival'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceTableDefinitionFieldCode = 'TablesListForArchival'
			AND InterfaceTableDefinitionFieldDatabaseField = 'StringLong01'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'ArchivalWBK'
		,'StringLong01'
		,'TablesListForArchival'
		,'TablesListForArchival'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'FCRHeadersDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER01'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER01'
		,'FCRHeadersDeleteAfterDays'
		,'FCRHeadersDeleteAfterDays'
		,NULL
		,1
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'BLHeadersDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER02'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER02'
		,'BLHeadersDeleteAfterDays'
		,'BLHeadersDeleteAfterDays'
		,NULL
		,2
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'CSHeadersDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER03'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER03'
		,'CSHeadersDeleteAfterDays'
		,'CSHeadersDeleteAfterDays'
		,NULL
		,3
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'HBLHeadersDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER04'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER04'
		,'HBLHeadersDeleteAfterDays'
		,'HBLHeadersDeleteAfterDays'
		,NULL
		,4
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'LogDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER05'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER05'
		,'LogDeleteAfterDays'
		,'LogDeleteAfterDays'
		,NULL
		,5
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'POHeadersDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER06'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER06'
		,'POHeadersDeleteAfterDays'
		,'POHeadersDeleteAfterDays'
		,NULL
		,6
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'SOHeadersDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER07'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER07'
		,'SOHeadersDeleteAfterDays'
		,'SOHeadersDeleteAfterDays'
		,NULL
		,7
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntriesDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER08'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER08'
		,'DataEntriesDeleteAfterDays'
		,'DataEntriesDeleteAfterDays'
		,NULL
		,8
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DelayedActionDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER09'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER09'
		,'DelayedActionDeleteAfterDays'
		,'DelayedActionDeleteAfterDays'
		,NULL
		,9
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'EmailDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'NUMBER10'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'NUMBER10'
		,'EmailDeleteAfterDays'
		,'EmailDeleteAfterDays'
		,NULL
		,10
		,'Int64'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'ModificationLogDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String01'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String01'
		,'ModificationLogDeleteAfterDays'
		,'ModificationLogDeleteAfterDays'
		,NULL
		,11
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'RemoveLogsAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String02'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String02'
		,'RemoveLogsAfterDays'
		,'RemoveLogsAfterDays'
		,NULL
		,12
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'ReportEmailLogsDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String03'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String03'
		,'ReportEmailLogsDeleteAfterDays'
		,'ReportEmailLogsDeleteAfterDays'
		,NULL
		,13
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryStatuses'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String04'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String04'
		,'DataEntryStatuses'
		,'DataEntryStatuses'
		,NULL
		,14
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DelayedActionDeleteStatus'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String05'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String05'
		,'DelayedActionDeleteStatus'
		,'DelayedActionDeleteStatus'
		,NULL
		,15
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'EmailDeletionStatuses'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String06'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String06'
		,'EmailDeletionStatuses'
		,'EmailDeletionStatuses'
		,NULL
		,16
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntriesDeletionStatuses'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String07'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String07'
		,'DataEntriesDeletionStatuses'
		,'DataEntriesDeletionStatuses'
		,NULL
		,17
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryDefinitionDeletionDataEntryType'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String08'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String08'
		,'DataEntryDefinitionDeletionDataEntryType'
		,'DataEntryDefinitionDeletionDataEntryType'
		,NULL
		,18
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'InterfaceTableDefinitionCode'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String09'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String09'
		,'InterfaceTableDefinitionCode'
		,'InterfaceTableDefinitionCode'
		,NULL
		,19
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryDefinitionDataEntryType'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String10'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String10'
		,'DataEntryDefinitionDataEntryType'
		,'DataEntryDefinitionDataEntryType'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryStatusInterfacedDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String11'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String11'
		,'DataEntryStatusInterfacedDeleteAfterDays'
		,'DataEntryStatusInterfacedDeleteAfterDays'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryStatusFinishedDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String12'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String12'
		,'DataEntryStatusFinishedDeleteAfterDays'
		,'DataEntryStatusFinishedDeleteAfterDays'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryStatusCancelledDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String13'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String13'
		,'DataEntryStatusCancelledDeleteAfterDays'
		,'DataEntryStatusCancelledDeleteAfterDays'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryStatusNotImportedDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String14'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String14'
		,'DataEntryStatusNotImportedDeleteAfterDays'
		,'DataEntryStatusNotImportedDeleteAfterDays'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryStatusErrorDeleteAfterDays'
			AND InterfaceTableDefinitionFieldDatabaseField = 'String15'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'String15'
		,'DataEntryStatusErrorDeleteAfterDays'
		,'DataEntryStatusErrorDeleteAfterDays'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceTableDefinitionFields I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceTableDefinitionFieldCode = 'DataEntryDefinitionDataEntryTypeForDeletion'
			AND InterfaceTableDefinitionFieldDatabaseField = 'StringLong01'
		)
BEGIN
	INSERT INTO InterfaceTableDefinitionFields (
		[InterfaceTableDefinitionCode]
		,[InterfaceTableDefinitionFieldDatabaseField]
		,[InterfaceTableDefinitionFieldCode]
		,[InterfaceTableDefinitionFieldName]
		,[InterfaceTableDefinitionFieldDescription]
		,[InterfaceTableDefinitionFieldPosition]
		,[InterfaceTableDefinitionFieldDataType]
		,[InterfaceTableDefinitionFieldPartOfKey]
		,[InterfaceTableDefinitionFieldShowCriteria]
		,[InterfaceTableDefinitionFieldEditable]
		,[InterfaceTableDefinitionFieldMandatory]
		,[InterfaceTableDefinitionFieldNumberOfLines]
		,[InterfaceTableDefinitionFieldRegularExpression]
		,[InterfaceTableDefinitionFieldRegularExpressionErrorMessage]
		,[InterfaceTableDefinitionFieldAddDateTime]
		,[InterfaceTableDefinitionFieldAddUserCode]
		,[InterfaceTableDefinitionFieldEditDateTime]
		,[InterfaceTableDefinitionFieldEditUserCode]
		,[InterfaceTableDefinitionFieldIsListDisplayField]
		)
	VALUES (
		'DeletionWBK'
		,'StringLong01'
		,'DataEntryDefinitionDataEntryTypeForDeletion'
		,'DataEntryDefinitionDataEntryTypeForDeletion'
		,NULL
		,20
		,'String'
		,0
		,1
		,1
		,1
		,0
		,NULL
		,NULL
		,GETUTCDATE()
		,System_USER
		,GETUTCDATE()
		,System_USER
		,1
		);
END

-----------------------------------------------------------------------------------------------------------------------
--InterfaceItems
-----------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER01 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER01
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER02 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER02
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER03 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER03
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER04 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER04
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER05 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER05
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER06 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER06
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER07 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER07
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER08 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER08
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER09 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER09
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemNUMBER10 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER10
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString01 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString01
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString02 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString02
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString03 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString03
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString04 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString04
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString05 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString05
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString06 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString06
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString07 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString07
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString08 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString08
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'Interfaced, Finished, Cancelled, NotImported'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString09 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString09
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'1, 5'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemString10 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString10
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'SANYOU DESADV, 214, Order, NIKE ILM, NIKE SDI GRN, Transport, Receipt, Nike Weighing'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'ArchivalWBK'
			AND InterfaceItemStringLong01 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemStringLong01
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'ArchivalWBK'
		,'AlternativeProductCodes, BillingCosts, BillingQuantities, BillingRevenues, BillsOfMaterial, CargoReleaseLogs, CargoReleaseOrders, ChargeCategories, ChargeGroups, Charges, Companies, CompanyRateCharges, CompanyRateChargeTransportMatrixReferences, CompanyRates, Countries, Currencies, CustomClearanceDocuments, CustomRegimes, CustomsClearanceLogs, CustomsClearanceOrderDetails, CustomsClearanceOrderFiles, CustomsClearanceOrders, CustomsClearanceOrderSubDetails, CustomsTypes, CycleCountDetails, DataEntryDefinitions, DocumentManagementLogs, DocumentOrderDetails, DocumentOrders, InsuranceTypes, InterfaceDocuments, InterfaceItems, InterfaceTableDefinitions, IssueDetails, IssueFiles, IssueLogs, Issues, Languages, LinkLotsLocationsStorageUnits, LoadOrderDetails, Loads, LoadStatuses, LoadStops, Locations, LotAttributes, Lots, ManualShipmentDetails, ManualShipmentLogs, ManualShipments, ManualShipmentSubDetails, OrderDetails, OrderHandlingTypes, Orders, OrderStatuses, OrderTypes, Packs, PalletTypes, PickDetails, Products, ReceiptCaseDetails, ReceiptDetails, ReceiptParties, Receipts, ReceiptStatuses, ReceiptTypes, ScoreCardCategories, ShipmentDetails, ShipmentFiles, ShipmentLogs, ShipmentOptions, Shipments, StockTransactions, SubCharges, TaskCategories, Tasks, TransportDetails, TransportFiles, TransportLevelFiles, TransportLogs, Transports, TransportStatuses, TransportStops, UserCompanies, ValueAddedServiceDetails, ValueAddedServiceLogs, ValueAddedServices, WarehouseLogs, WarehouseOrderDetails, WarehouseOrders, WrappingTypes'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER01 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER01
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'365'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER02 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER02
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'365'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER03 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER03
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'365'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER04 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER04
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'365'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER05 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER05
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER06 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER06
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'365'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER07 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER07
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'365'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER08 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER08
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER09 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER09
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemNUMBER10 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemNUMBER10
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString01 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString01
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString02 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString02
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString03 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString03
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'60'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString04 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString04
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,''
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString05 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString05
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'Cancelled, Finished, Error'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString06 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString06
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,''
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString07 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString07
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'Interfaced, Finished, Cancelled, NotImported'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString08 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString08
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'StandardReceipt, RefusalReceipt, CrossDockReceipt'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString09 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString09
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'ValueAddedService, Issue, WarehouseOrder, CustomsClearanceOrder, DocumentOrder, CargoReleaseOrder, ManualShipment, Shipment, Transport'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString10 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString10
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'StandardReceipt, RefusalReceipt, CrossDockReceipt'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString11 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString11
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'90'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString12 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString12
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'90'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString13 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString13
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'90'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString14 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString14
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'90'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemString15 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemString15
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'90'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;

IF NOT EXISTS (
		SELECT 1
		FROM InterfaceItems I WITH (NOLOCK)
		WHERE InterfaceTableDefinitionCode = 'DeletionWBK'
			AND InterfaceItemStringLong01 IS NOT NULL
		)
BEGIN
	INSERT INTO InterfaceItems (
		IDInterfaceItem
		,InterfaceTableDefinitionCode
		,InterfaceItemStringLong01
		,InterfaceItemAddDateTime
		,InterfaceItemAddUserCode
		,InterfaceItemEditDateTime
		,InterfaceItemEditUserCode
		)
	VALUES (
		NEWID()
		,'DeletionWBK'
		,'StandardReceipt, RefusalReceipt, CrossDockReceipt, StandardOrder, CrossDockOrder, HeldInventory, AlternativeProduct, Product, Company, Pack, OrderContainerExchange, ReceiptContainerExchange, Billing, Transfer, BillsOfMaterial, UpcomingReceipt'
		,GETUTCDATE()
		,SYSTEM_USER
		,GETUTCDATE()
		,SYSTEM_USER
		);
END;


SELECT 
	TOP 1000 * 
FROM 
	Lead
INNER JOIN 
	vl_Opportunity_Stage S ON lead.StageID = S.StageID
INNER JOIN  
	vl_Opportunity_StageType_lk STD ON S.StageTypeID = STD.StageTypeID
WHERE 
	Lead.firmid = 1 order by dtCreateDate DESC





SELECT 
	TOP 100 
	Lead.iLeadID AS leadId,
	Lead.vchProjectName AS OpportunityName,
	Lead.dtCreateDate AS CreateDate,
	Lead.dtCloseDate AS CloseDate,
	S.StageName AS Stage,
	S.StageTypeID AS StageTypeId,
	STD.StageTypeName AS StageType,
	CASE WHEN STD.StageTypeName = 'Closed/Won' THEN '1' ELSE '0' END AS WAS_WON,
	CASE WHEN STD.StageTypeName = 'Closed/Lost' THEN '1' ELSE '0' END AS WAS_LOST,
	Lead.CFirmID AS ClientCompany,
	cf.Company AS ClientCompanyName,
	LEAD.dtRFPDate AS FirstDemoDate,
	Lead.dtPresentationDate AS PresentationDate,
	LEAD.iCost AS HourlyRateForImplementationCost,
	Lead.iFee AS EstimatedContractValue,
	Lead.iFirmFee AS CalculatedContractValue,
	Lead.GrossRevenueSTD AS CalculatedImplementationCost,
	Lead.GrossMarginDollarsSTD AS CalculatedTrainingCost,
	Lead.workHoursEngineer AS ImplementationHours,
	Lead.workHoursConstruction AS TrainingHours,
	Lead.workHoursDesign AS DaysOnSite,
	Lead.LeadShortText2 AS FDCHoursLimit,
	Lead.LeadMoney5 AS ReadOnlyCostLicenseCost,
	Lead.LeadMoney3 AS FullLicenseCost,
	Lead.LeadMoney1 AS CRMLicenseCost,
	Lead.LeadMoney2 AS FDCDeliveryCost,
	Lead.LeadNumber2 AS FullLicenseCount,
	Lead.LeadMoney4 AS EnterpriseFee,
	Lead.LeadNumber3 AS ReadOnlyLicenseCount,
	Lead.LeadNumber1 AS CRMLicenseCount,
	pt.prospectTypeName AS ForeCastCategory,
	Lead.iSubmittalTypeID AS SubmitalTypeId,
	st.SubmittalTypeName AS SubmitalType,
	Lead.vchNextAction AS NextAction,
	Lead.txNote AS Notes,
	dbo.Concat(UL.UserID, ',') AS UserIDs,
	UL.SalesCredit AS SalesCredit,
	dbo.Concat(u.FirstName + ' ' + u.LastName, ',') AS Staff,
	--u.FirstName,
	--u.LastName,
	--sr.StaffRoleName AS StaffRole,
	--srt.StaffRoleTypeName AS StaffRoleType,
	dbo.Concat(o.OfficeName, ',') AS Integration,
	ss.StudioName AS FirmType,
	dbo.Concat(pa.PracticeAreaName,',') AS CurrentlyUsingCompetitor,
	dbo.Concat(div.DivisionName,',') AS MainCosentialUsage,
	cat.ProjectCategoryName AS PrimaryCategories,
	scat.SecondaryCategoryName AS FDCConnection,
	pct.ContractTypeName AS FirmSize,
	Lead.chproposalsub AS ReferenceUsed,
	LEAD.LeadNumber1 AS CRMLicenseCost
	
--	vchProjectName, dtStartDate, dtCloseDate, 
--	iFee AS 'Estimated Contract Value',
--	iFirmFee AS 'Calculated Contract Value',  
--	iProbability, iProjectProbability, FactoredCostSTD, 
--	dtCreateDate, dtRFPDate, dtPresentationDate, 
--	iMarketBudget, 
--	iMarketActual, 
--	ActiveInd, BusinessCheck, 
--	vchCity, iStateId, vchPostalCode, iCountryId, 
--	LEAD.StageID, stageName, S.StageTypeID, StageTypeName, Lead.DeleteRecord
FROM 
	Lead
INNER JOIN 
	vl_Opportunity_Stage S ON lead.StageID = S.StageID
INNER JOIN  
	vl_Opportunity_StageType_lk STD ON S.StageTypeID = STD.StageTypeID
LEFT OUTER JOIN
    contactFirms cf ON Lead.CFirmID = cf.CFirmId
LEFT OUTER JOIN
    grid_contact_leadProspectTypes lpt ON LEAD.iLeadID = lpt.ileadID 
LEFT OUTER JOIN
    vl_Opportunity_prospectTypes pt ON pt.prospectTypeID = lpt.prospectTypeID
LEFT OUTER JOIN
    vl_Opportunity_SubmittalType st ON Lead.iSubmittalTypeID = st.SubmittalTypeID
LEFT OUTER JOIN
    Grid_Contact_UserLead UL ON Lead.iLeadID = UL.iLeadID
LEFT OUTER JOIN
    users u ON UL.UserID = u.UserId
LEFT OUTER JOIN
    vl_Project_StaffRole sr ON UL.StaffRoleID = sr.StaffRoleID   
LEFT OUTER JOIN
    vl_Project_StaffRoleType_lk srt ON sr.StaffRoleTypeID = srt.StaffRoleTypeID
LEFT OUTER JOIN
    Grid_Contact_LeadOffices lo ON LEAD.iLeadID = lo.iLeadID
LEFT OUTER JOIN
    Offices o ON lo.OfficeID = o.OfficeID
LEFT OUTER JOIN
    Grid_Contact_LeadStudios ls ON LEAD.iLeadID = ls.iLeadID
LEFT OUTER JOIN
    Shared_Studios ss ON ls.StudioID = ss.StudioId
LEFT OUTER JOIN
    Grid_Contact_LeadPracticeAreas lpa ON lead.iLeadID = lpa.iLeadID
LEFT OUTER JOIN
    Shared_PracticeAreas pa ON lpa.PracticeAreaID = pa.PracticeAreaId
LEFT OUTER JOIN
    Grid_Contact_LeadDivisions ld ON Lead.iLeadID = ld.iLeadID
LEFT OUTER JOIN
    Shared_Divisions div ON ld.DivisionID = div.DivisionID     
LEFT OUTER JOIN
    Contact_grid_LeadPrimaryCategory lpc ON Lead.iLeadId = lpc.LeadID
LEFT OUTER JOIN
    ProjectCategories cat ON lpc.PrimaryCategoryID = cat.ProjectCategoryID    
LEFT OUTER JOIN
    Contact_grid_LeadSecondaryCategory lsc ON Lead.iLeadID = lsc.LeadID
LEFT OUTER JOIN
    SecondaryCategories scat ON lsc.SecondaryCategoryID = scat.SecondaryCategoryID    
LEFT OUTER JOIN
    Grid_Contact_LeadContractType lct ON Lead.iLeadID = lct.iLeadID
LEFT OUTER JOIN
   vl_Project_ContractTypes pct ON lct.ContractTypeID = pct.ContractTypeID
     
WHERE 
	Lead.firmid = 1 
--AND
   --Lead.dtCreateDate > '12/01/2015'
AND
   S.StageTypeID IN (1,5)
--AND
	--Lead.iLeadID = 975429
GROUP BY 
	Lead.iLeadID, 
	Lead.vchProjectName, 
	Lead.cfirmId,
	cf.Company,
	LEAD.dtRFPDate,
	Lead.dtPresentationDate,
	Lead.dtCloseDate,
	S.StageName,
	S.StageTypeID,
	STD.StageTypeName,
	Lead.iCost,
	Lead.iFee,
	Lead.iFirmFee,
	Lead.GrossRevenueSTD,
	Lead.GrossMarginDollarsSTD,
	Lead.workHoursEngineer,
	Lead.workHoursConstruction,
	Lead.workHoursDesign,
	Lead.LeadShortText2,
	Lead.LeadMoney5,
	Lead.LeadMoney3,
	Lead.LeadMoney1,
	Lead.LeadMoney2,
	Lead.LeadNumber2,
	Lead.LeadMoney4,
	Lead.LeadNumber3,
	Lead.LeadNumber1,
	pt.prospectTypeName,
	Lead.iSubmittalTypeID,
	st.SubmittalTypeName,
	Lead.vchNextAction,
	Lead.txNote,
	UL.SalesCredit,
	--o.OfficeName,
	ss.StudioName,
	--pa.PracticeAreaName,
	--div.DivisionName,
	cat.ProjectCategoryName,
	scat.SecondaryCategoryName,
	pct.ContractTypeName,
	Lead.chproposalsub,
	LEAD.LeadNumber1,
	LEAD.dtCreateDate
order by dtCreateDate DESC


SELECT TOP 10 
	Lead.vchProjectName,
	dbo.Concat(UL.UserID, ',') as users
from 
	Lead
LEFT OUTER JOIN
    Grid_Contact_UserLead UL ON Lead.iLeadID = UL.iLeadID
LEFT OUTER JOIN
    users u ON UL.UserID = u.UserId
WHERE 
	Lead.firmid = 1 
AND
	Lead.iLeadID = 982936--981348
GROUP BY
	Lead.iLeadID, Lead.vchProjectName
	
	
	
select * from vl_Opportunity_StageType_lk
	

select top 10 * from ProjectCategories
select top 10 * from Contact_grid_LeadPrimaryCategory



ELECT A.ContractTypeName, B.iLeadID
																FROM vl_Project_ContractTypes A WITH(NOLOCK),
																	Grid_Contact_LeadContractType


SELECT a.DivisionName, a.DivisionID
													FROM Shared_Divisions a WITH(NOLOCK),
														Grid_Contact_LeadDivisions



SELECT a.PracticeAreaName, a.PracticeAreaID
												FROM Shared_PracticeAreas a WITH(NOLOCK),
													Grid_Contact_LeadPracticeAreas



SELECT a.StudioName, a.StudioID
													FROM Shared_Studios a WITH(NOLOCK),
														Grid_Contact_LeadStudios








SELECT
																A.UserId,
																A.FirstName,
	                                                            A.MI,
																A.LastName,
															    A.OffPhone,
																A.OffEmail,
																B.OppStaffTeamID,
																B.PercentInvolved,
																B.Description,
																C.StaffRoleName,
															    D.StaffRoleTypeName
															FROM Grid_Contact_UserLead B WITH(NOLOCK)
																LEFT OUTER JOIN vl_Project_StaffRole C WITH(NOLOCK)
																INNER JOIN vl_Project_StaffRoleType_lk D WITH(NOLOCK)
																	ON C.StaffRoleTypeID = D.StaffRoleTypeID
																	ON B.StaffRoleID = C.StaffRoleID
																LEFT OUTER JOIN Users A WITH(NOLOCK)
																	ON B.UserID = A.UserId
															WHERE (B.iLeadID = #variables.leadID#)
																and (A.FirmID = #Variables.Firmid#)
																AND (A.DeleteInd = 0 OR A.DeleteInd IS NULL)
																AND (C.DeleteRecord IN (0,1) OR C.DeleteRecord IS NULL)
															ORDER BY D.StaffRoleTypeID, C.StaffRoleName, A.LastName




select top 10 * from Grid_Contact_UserLead
select top 10 * from vl_Project_StaffRole
SELECT TOP 10 * FROM vl_Project_StaffRoleType_lk
select top 10 * from users
select top 10 * from vl_Opportunity_Stage

	SELECT 	*
	FROM Grid_Contact_Lead_Form_Req_Field WITH(NOLOCK)
	WHERE  firmID = 1
	
SELECT SubmittalTypeID, SubmittalTypeName
													  FROM vl_Opportunity_SubmittalType
													 WHERE DeleteRecord = 0
													   AND firmID = #variables.firmID#
	                                                 ORDER BY SubmittalTypeName

SELECT TOP 10 * FROM vl_Opportunity_SubmittalType
WHERE firmId = 1

SELECT TOP 1 dtCreateDate, * FROM LEAD order by iLeadID

SELECT COUNT(*) as 'Count', firmId 
FROM 
	Lead 
Group By 
	firmId
ORDER BY 'Count' DESC
WHERE lead.firmId = 1



select top 10 * from Lead where ActiveInd = 0 and firmId = 1

select top 10 * from vl_Opportunity_Stage
select top 10 * from vl_Opportunity_StageType_lk
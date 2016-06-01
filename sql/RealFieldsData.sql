

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
	TOP 10000 
	vchProjectName AS OpportunityName,
	Lead.CFirmID AS ClientCompany,
	cf.Company AS ClientCompanyName,
	LEAD.dtRFPDate AS FirstDemoDate,
	Lead.dtPresentationDate AS PresentationDate,
	Lead.dtCloseDate AS CloseDate,
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
	UL.UserID AS UserID,
	UL.SalesCredit AS SalesCredit,
	u.FirstName,
	u.LastName,
	sr.StaffRoleName AS StaffRole,
	srt.StaffRoleTypeName AS StaffRoleType,
	o.OfficeName AS Integration,
	ss.StudioName AS FirmType,
	pa.PracticeAreaName AS CurrentlyUsingCompetitor,
	div.DivisionName AS MainCosentialUsage,
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
  --  Lead.dtCreateDate > '12/31/2015'
--AND
	--Lead.iLeadID = 981348
order by dtCreateDate DESC


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
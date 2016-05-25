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
	TOP 1000 
	iLeadId, vchProjectName, dtStartDate, dtCloseDate, iCost, iSize, iFee, iFirmFee, iFirmFeeOrig, iProbability, iProjectProbability, GrossRevenueSTD, GrossMarginDollarsSTD, FactoredCostSTD, 
	iFactoredFee, dtProposalDate, dtRFPDate, dtQualsDate,dtPresentationDate, iMarketBudget, 
	iMarketActual, PrincipalInChargeId, MarketingContactId, BusinessDeveloperId, ReferredByID,
	OpportunityStatusId, ActiveInd, BusinessCheck, vchCity, iStateId, vchPostalCode, iCountryId, LEAD.StageID, iProjectRoleId, iSubmittalTypeId, dtCreateDate, stageName, S.StageTypeID, StageTypeName
FROM 
	Lead
INNER JOIN 
	vl_Opportunity_Stage S ON lead.StageID = S.StageID
INNER JOIN  
	vl_Opportunity_StageType_lk STD ON S.StageTypeID = STD.StageTypeID
WHERE 
	Lead.firmid = 1 order by dtCreateDate DESC


SELECT 
	TOP 1000 
	vchProjectName, dtStartDate, dtCloseDate, 
	iFee, iProbability, iProjectProbability, FactoredCostSTD, 
	dtCreateDate, dtRFPDate, dtPresentationDate, 
	iMarketBudget, 
	iMarketActual, 
	ActiveInd, BusinessCheck, 
	vchCity, iStateId, vchPostalCode, iCountryId, 
	LEAD.StageID, stageName, S.StageTypeID, StageTypeName, Lead.DeleteRecord
FROM 
	Lead
INNER JOIN 
	vl_Opportunity_Stage S ON lead.StageID = S.StageID
INNER JOIN  
	vl_Opportunity_StageType_lk STD ON S.StageTypeID = STD.StageTypeID
WHERE 
	Lead.firmid = 1 order by dtCreateDate DESC


# Firm size value list for firm 1
SELECT A.ContractTypeName, B.iLeadID FROM vl_Project_ContractTypes A, Grid_Contact_LeadContractType B WHERE A.ContractTypeID = B.ContractTypeID AND B.iLeadID = 859547 ORDER BY A.ContractTypeOrder, A.ContractTypeName 
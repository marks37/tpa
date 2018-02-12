using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsVisibility
/// </summary>
public class clsVisibility
{
    private string branchId;


    public string BranchId
    {
        get { return branchId; }
        set { branchId = value; }
    }

    private string branchName;

    public string BranchName
    {
        get { return branchName; }
        set { branchName = value; }
    }

    private string id;


    public string Id
    {
        get { return id; }
        set { id = value; }
    }
    private string itemCode;

    public string ItemCode
    {
        get { return itemCode; }
        set { itemCode = value; }
    }

    private string category;


    public string Category
    {
        get { return category; }
        set { category = value; }
    }

    private string brand;

    public string Brand
    {
        get { return brand; }
        set { brand = value; }
    }
    private string description;

    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    private string display_type;


    public string Display_type
    {
        get { return display_type; }
        set { display_type = value; }
    }
    private string qty;


    public string Qty
    {
        get { return qty; }
        set { qty = value; }
    }

    private List<clsVisibilityStandard> standard;

    public List<clsVisibilityStandard> Standard
    {
        get { return standard; }
        set { standard = value; }
    }


	public clsVisibility()
	{
		//
		// TODO: Add constructor logic here
		//
	}

}

public class clsVisibilityStandard
{
    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }
    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private string description;

    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    private string visibilityId;

    public string VisibilityId
    {
        get { return visibilityId; }
        set { visibilityId = value; }
    }

    private Boolean hit;

    public Boolean Hit
    {
        get { return hit; }
        set { hit = value; }
    }
    private Boolean miss;

    public Boolean Miss
    {
        get { return miss; }
        set { miss = value; }
    }

    private string remarks;

    public string Remarks
    {
        get { return remarks; }
        set { remarks = value; }
    }

    public clsVisibilityStandard()
    {

    }
}

public class clsVisibilitySurvey
{
    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }

    private string visibilityId;

    public string VisibilityId
    {
        get { return visibilityId; }
        set { visibilityId = value; }
    }

    private string itemCode;

    public string ItemCode
    {
        get { return itemCode; }
        set { itemCode = value; }
    }

    private string category;


    public string Category
    {
        get { return category; }
        set { category = value; }
    }

    private string brand;

    public string Brand
    {
        get { return brand; }
        set { brand = value; }
    }
    private string description;

    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    private string display_type;


    public string Display_type
    {
        get { return display_type; }
        set { display_type = value; }
    }
    private string qty;


    public string Qty
    {
        get { return qty; }
        set { qty = value; }
    }

    private string workplanId;

    public string WorkplanId
    {
        get { return workplanId; }
        set { workplanId = value; }
    }

    private List<clsVisibilityResponse> response;

    public List<clsVisibilityResponse> Response
    {
        get { return response; }
        set { response = value; }
    }

    private int response_count;

    public int Response_count
    {
        get { return response_count; }
        set { response_count = value; }
    }

    private string dateCreated;

    public string DateCreated
    {
        get { return dateCreated; }
        set { dateCreated = value; }
    }

    public clsVisibilitySurvey()
    {

    }

}

public class clsVisibilityResponse
{
    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }
    private string standard;

    public string Standard
    {
        get { return standard; }
        set { standard = value; }
    }

    private string name;


    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    private string code;


    public string Code
    {
        get { return code; }
        set { code = value; }
    }

    private string surveyId;

    public string SurveyId
    {
        get { return surveyId; }
        set { surveyId = value; }
    }
    private string remarks;

    public string Remarks
    {
        get { return remarks; }
        set { remarks = value; }
    }
    private string picture;

    public string Picture
    {
        get { return picture; }
        set { picture = value; }
    }
    private Boolean hit;

    public Boolean Hit
    {
        get { return hit; }
        set { hit = value; }
    }
    private Boolean miss;

    public Boolean Miss
    {
        get { return miss; }
        set { miss = value; }
    }

    private string missCategory;

    public string MissCategory
    {
        get { return missCategory; }
        set { missCategory = value; }
    }

    private string dateCreated;

    public string DateCreated
    {
        get { return dateCreated; }
        set { dateCreated = value; }
    }

    private string createdBy;

    public string CreatedBy
    {
        get { return createdBy; }
        set { createdBy = value; }
    }
    private string dateModified;

    public string DateModified
    {
        get { return dateModified; }
        set { dateModified = value; }
    }
    private string modifiedBy;

    public string ModifiedBy
    {
        get { return modifiedBy; }
        set { modifiedBy = value; }
    }

    private List<clsVisibilityPicture> pictureList;

    public List<clsVisibilityPicture> PictureList
    {
        get { return pictureList; }
        set { pictureList = value; }
    }

    public clsVisibilityResponse()
    {

    }
}

public class clsVisibilityPicture
{
    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }
    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private string dateCreated;

    public string DateCreated
    {
        get { return dateCreated; }
        set { dateCreated = value; }
    }
    private string dateModified;

    public string DateModified
    {
        get { return dateModified; }
        set { dateModified = value; }
    }
    private string isDeleted;

    public string IsDeleted
    {
        get { return isDeleted; }
        set { isDeleted = value; }
    }
    private string userid;

    public string Userid
    {
        get { return userid; }
        set { userid = value; }
    }
    private string remarks;

    public string Remarks
    {
        get { return remarks; }
        set { remarks = value; }
    }
    private string brands;

    public string Brands
    {
        get { return brands; }
        set { brands = value; }
    }
    private string responseId;

    public string ResponseId
    {
        get { return responseId; }
        set { responseId = value; }
    }

    private string filePath;

    public string FilePath
    {
        get { return filePath; }
        set { filePath = value; }
    }

    private string fileName;

    public string FileName
    {
        get { return fileName; }
        set { fileName = value; }
    }

    private string dateCaptured;

    public string DateCaptured
    {
        get { return dateCaptured; }
        set { dateCaptured = value; }
    }

    private string dateCaptured2;

    public string DateCaptured2
    {
        get { return dateCaptured2; }
        set { dateCaptured2 = value; }
    }

    private string shelfId;

    public string ShelfId
    {
        get { return shelfId; }
        set { shelfId = value; }
    }

    private string thumbnailName;

    public string ThumbnailName
    {
        get { return thumbnailName; }
        set { thumbnailName = value; }
    }
    private string thumbnailSize;

    public string ThumbnailSize
    {
        get { return thumbnailSize; }
        set { thumbnailSize = value; }
    }

    public clsVisibilityPicture()
    {

    }
}

public class clsVisibilityShelfBrand
{
    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }

    private string shelfBrandCode;
    
    public string ShelfBrandCode
    {
        get { return shelfBrandCode; }
        set { shelfBrandCode = value; }
    }

    private string description;
    
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
}
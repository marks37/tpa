using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsWorkplan
/// </summary>
public class clsWorkplan
{
    private string id;
    
    public string Id
    {
        get { return id; }
        set { id = value; }
    }

    private string callDate;
    
    public string CallDate
    {
        get { return callDate; }
        set { callDate = value; }
    }

    private string accountCode;

    public string AccountCode
    {
        get { return accountCode; }
        set { accountCode = value; }
    }

    private clsBranch assignedBranch;

    public clsBranch AssignedBranch
    {
        get { return assignedBranch; }
        set { assignedBranch = value; }
    }

    private string branchId;
    public string BranchId
    {
        get { return branchId; }
        set { branchId = value; }
    }

    private string branchCode;

    public string BranchCode
    {
        get { return branchCode; }
        set { branchCode = value; }
    }
    
    private string branchName;

    public string BranchName
    {
        get { return branchName; }
        set { branchName = value; }
    }

    private string accountGroup;

    public string AccountGroup
    {
        get { return accountGroup; }
        set { accountGroup = value; }
    }

    private string channel;

    public string Channel
    {
        get { return channel; }
        set { channel = value; }
    }
    
    private string isDeleted;
    public string IsDeleted
    {
        get { return isDeleted; }
        set { isDeleted = value; }
    }

    private clsUser assignedUser;

    public clsUser AssignedUser
    {
        get { return assignedUser; }
        set { assignedUser = value; }
    }

    private string userId;
    public string UserId
    {
        get { return userId; }
        set { userId = value; }
    }

    private string status;
    public string Status
    {
        get { return status; }
        set { status = value; }
    }

    private string dateCreated;

    public string DateCreated
    {
        get { return dateCreated; }
        set { dateCreated = value; }
    }

    private string cds;

    public string Cds
    {
        get { return cds; }
        set { cds = value; }
    }

    private string coordinator;

    public string Coordinator
    {
        get { return coordinator; }
        set { coordinator = value; }
    }

    private string deadline;

    public string Deadline
    {
        get { return deadline; }
        set { deadline = value; }
    }
    private string addedBy;

    public string AddedBy
    {
        get { return addedBy; }
        set { addedBy = value; }
    }
    private string reference;

    public string Reference
    {
        get { return reference; }
        set { reference = value; }
    }

    private string viewedAt;

    public string ViewedAt
    {
        get { return viewedAt; }
        set { viewedAt = value; }
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

    private clsBranch branch;

    public clsBranch Branch
    {
        get { return branch; }
        set { branch = value; }
    }

	public clsWorkplan()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
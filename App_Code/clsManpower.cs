using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsManpower
/// </summary>
public class clsManpower
{
    private string id;

    public string Id
    {
        get { return id; }
        set { id = value; }
    }

    private string userId;

    public string UserId
    {
        get { return userId; }
        set { userId = value; }
    }

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

    private string status;
    
    public string Status
    {
        get { return status; }
        set { status = value; }
    }


    private string isDeleted;

    public string IsDeleted
    {
        get { return isDeleted; }
        set { isDeleted = value; }
    }


    private clsBranch assignedBranch;

    public clsBranch AssignedBranch
    {
        get { return assignedBranch; }
        set { assignedBranch = value; }
    }
    private clsUser assignedUser;

    public clsUser AssignedUser
    {
        get { return assignedUser; }
        set { assignedUser = value; }
    }

	public clsManpower()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
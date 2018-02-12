using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsBranch
/// </summary>
public class clsBranch
{
    private string branchCode;

    public string BranchCode
    {
        get { return branchCode; }
        set { branchCode = value; }
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

    private string branchAddress;

    public string BranchAddress
    {
        get { return branchAddress; }
        set { branchAddress = value; }
    }

    private string channel;

    public string Channel
    {
        get { return channel; }
        set { channel = value; }
    }

    private string team;

    public string Team
    {
        get { return team; }
        set { team = value; }
    }

    private string account_group_1;

    public string Account_group_1
    {
        get { return account_group_1; }
        set { account_group_1 = value; }
    }
    private string account_group_2;

    public string Account_group_2
    {
        get { return account_group_2; }
        set { account_group_2 = value; }
    }

	public clsBranch()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
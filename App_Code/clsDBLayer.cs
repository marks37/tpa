using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

/// <summary>
/// Summary description for clsDBLayer
/// </summary>
public class clsDBLayer
{
   private string gConnString;

    public clsDBLayer(string strConn)
    {
        gConnString = strConn;
    }

	public clsDBLayer()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //New Method
    public clsUser getUserAccountById(string user_id)
    {
        clsUser user = new clsUser();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT [id]
        ,[username]
        ,[password]
        ,[fullname]
        ,[firstname]
        ,[middle]
        ,[lastname]
        ,[type]
        ,[area]
        ,[is_active]
        ,[email]
        ,[team_leader]
        FROM [DB_A1321A_visibsandbox].[dbo].[Ref_User]
        WHERE [id] = @user_id";

        myCommand.Parameters.Add("@user_id", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@user_id"].Value = user_id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.MiddleName = (myReader["middle"] == null) ? string.Empty : myReader["middle"].ToString();
                user.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return user;
    }

    //New Method
    public List<clsUser> getAssignedUsers(string user_id)
    {
        List<clsUser> assignedUsers = new List<clsUser>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"    DECLARE @Id int = @user_id
    ;WITH cte AS 
     (
      SELECT 
	  a.[id]
      ,a.[username]
      ,a.[password]
      ,a.[fullname]
      ,a.[firstname]
      ,a.[middle]
      ,a.[lastname]
      ,a.[type]
      ,a.[area]
      ,a.[is_active]
      ,a.[email]
      ,a.[agency]
      ,a.[team_leader]
      FROM ref_user a
      WHERE Id = @Id
      UNION ALL
      SELECT a.[id]
      ,a.[username]
      ,a.[password]
      ,a.[fullname]
      ,a.[firstname]
      ,a.[middle]
      ,a.[lastname]
      ,a.[type]
      ,a.[area]
      ,a.[is_active]
      ,a.[email]
      ,a.[agency]
      ,a.[team_leader]
      FROM ref_user a JOIN cte c ON a.team_leader = c.id
      )
      SELECT *
      FROM cte
	  WHERE ID != @Id";

        myCommand.Parameters.Add("@user_id", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@user_id"].Value = user_id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsUser user = new clsUser();
                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.MiddleName = (myReader["middle"] == null) ? string.Empty : myReader["middle"].ToString();
                user.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                user.Teamleader = (myReader["team_leader"] == null) ? string.Empty : myReader["team_leader"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
                assignedUsers.Add(user);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return assignedUsers;
    }

    public DataTable getAssignedUsers2(string user_id)
    {
        //List<clsUser> assignedUsers = new List<clsUser>();

        DataTable dt = null;

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"    DECLARE @Id int = @user_id
    ;WITH cte AS 
     (
      SELECT 
	  a.[id]
      ,a.[username]
      ,a.[password]
      ,a.[fullname]
      ,a.[firstname]
      ,a.[middle]
      ,a.[lastname]
      ,a.[type]
      ,a.[area]
      ,a.[is_active]
      ,a.[email]
      ,a.[agency]
      ,a.[team_leader]
      FROM ref_user a
      WHERE Id = @Id
      UNION ALL
      SELECT a.[id]
      ,a.[username]
      ,a.[password]
      ,a.[fullname]
      ,a.[firstname]
      ,a.[middle]
      ,a.[lastname]
      ,a.[type]
      ,a.[area]
      ,a.[is_active]
      ,a.[email]
      ,a.[agency]
      ,a.[team_leader]
      FROM ref_user a JOIN cte c ON a.team_leader = c.id
      )
      SELECT *
      FROM cte
	  WHERE ID != @Id";

        myCommand.Parameters.Add("@user_id", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@user_id"].Value = user_id;

        SqlDataAdapter adapter = new SqlDataAdapter(myCommand);


        try
        {
            myConnection.Open();
            dt = new DataTable();
            adapter.Fill(dt);
            myConnection.Close();


        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return dt;
    }

    public DataTable getAssignedUsers3(string user_id)
    {
        DataTable dt = null;
        
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"    DECLARE @Id int = @user_id
    ;WITH cte AS 
     (
      SELECT 
	  a.[id]
      ,a.[username]
      ,a.[password]
      ,a.[fullname]
      ,a.[firstname]
      ,a.[middle]
      ,a.[lastname]
      ,a.[type]
      ,a.[area]
      ,a.[is_active]
      ,a.[email]
      ,a.[agency]
      ,a.[team_leader]
      FROM ref_user a
      WHERE Id = @Id
      UNION ALL
      SELECT a.[id]
      ,a.[username]
      ,a.[password]
      ,a.[fullname]
      ,a.[firstname]
      ,a.[middle]
      ,a.[lastname]
      ,a.[type]
      ,a.[area]
      ,a.[is_active]
      ,a.[email]
      ,a.[agency]
      ,a.[team_leader]
      FROM ref_user a JOIN cte c ON a.team_leader = c.id
      )
      SELECT *
      FROM cte
	  WHERE ID != @Id";

        myCommand.Parameters.Add("@user_id", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@user_id"].Value = user_id;

        try
        {
            myConnection.Open();
            dt = new DataTable();
            dt.Load(myCommand.ExecuteReader());
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return dt;
    }

    //No diff
    public void changePassword(string password, string user_id)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"UPDATE [dbo].[ref_user] 
            SET
             [password] = @password
            WHERE id = @id";

        myCommand.Parameters.Add("@password", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@id", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@password"].Value = password;
        myCommand.Parameters["@id"].Value = user_id;

        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
    }

    //No diff    
    public DateTime GetCurrentTime()
    {
        DateTime serverTime = DateTime.Now;
        DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "Singapore Standard Time");
        return _localTime;
    }

    //public DateTime FirstDayOfQuarter(DateTime DateIn)
    //{
    //    int intQuarterNum = (DateIn.Month - 1) / 3 + 1;
    //    return new DateTime(DateIn.Year, 3 * intQuarterNum - 2, 1);
    //}

    //public System.DateTime LastDayOfQuarter(System.DateTime DateIn)
    //{
    //    int intQuarterNum = (DateIn.Month - 1) / 3 + 1;
    //    return new DateSerial(DateIn.Year, 3 * intQuarterNum + 1, 0);
    //}

    //No diff    
    public void addNewActivityLog(clsActivityLog log)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"INSERT INTO [dbo].[Data_User_Activity_Log]
           ([username]
           ,[pageUrl]
           ,[activity]
           ,[dateCreated])
     VALUES
           (@username
           ,@pageUrl
           ,@activity
           ,@dateCreated)";

        myCommand.Parameters.Add("@username", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@pageUrl", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@activity", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateCreated", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@username"].Value = log.Username;
        myCommand.Parameters["@pageUrl"].Value = log.PageUrl;
        myCommand.Parameters["@activity"].Value = log.Activity;
        myCommand.Parameters["@dateCreated"].Value = log.DateCreated;

        try
        {

            myConnection.Open();
            myCommand.ExecuteNonQuery();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

    }

    //Modified
    public clsUser validateUser(string username, string password)
    {
        clsUser user = new clsUser();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT TOP 1000 [id]
        ,[username]
        ,[password]
        ,[fullname]
        ,[firstname]
        ,[middle]
        ,[lastname]
        ,[type]
        ,[area]
        ,[is_active]
        ,[email]
        ,[team_leader]
        FROM [DB_A1321A_visibsandbox].[dbo].[Ref_User]
        WHERE [username] = @username AND [password] = @password";

        myCommand.Parameters.Add("@username", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@username"].Value = username;
        myCommand.Parameters.Add("@password", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@password"].Value = password;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.MiddleName = (myReader["middle"] == null) ? string.Empty : myReader["middle"].ToString();
                user.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                user.Teamleader = (myReader["team_leader"] == null) ? string.Empty : myReader["team_leader"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return user;
    }

    //No diff
    public clsUser getUserAccountByUsername(string username)
    {
        clsUser user = new clsUser();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT [id]
        ,[username]
        ,[password]
        ,[fullname]
        ,[firstname]
        ,[middle]
        ,[lastname]
        ,[type]
        ,[area]
        ,[is_active]
        ,[email]
        FROM [DB_A1321A_visibsandbox].[dbo].[Ref_User]
        WHERE [username] = @username";

        myCommand.Parameters.Add("@username", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@username"].Value = username;
        
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.MiddleName = (myReader["middle"] == null) ? string.Empty : myReader["middle"].ToString();
                user.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return user;
    }

    //No diff
    public List<clsWorkplan> getAllWorkplans()
    {
        List<clsWorkplan> workplans = new List<clsWorkplan>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("/****** Script for SelectTopNRows command from SSMS  ******/" +
        "SELECT TOP 1000 workplan.[id] " +
        ",[call_date] " +
        ",workplan.[branch_id] " +
        ",branch.[branch_name] " +
        ",branch.[account_group_1] " +
        ",branch.[channel] " +
        ",[is_deleted] " +
        ",[user_id] " +
        ",[firstname] " +
        ",[lastname] " +
        ",[status] " +
        ",[cds] " +
        ",[date_created] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan " +
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id " +
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_User] as users on workplan.user_id = users.id " +
        "WHERE [status] LIKE 'Submitted' ORDER BY workplan.[id] DESC");

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsWorkplan workplan = new clsWorkplan();
                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                workplan.AccountGroup = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                workplan.Channel = (myReader["channel"] == null) ? string.Empty : myReader["channel"].ToString();
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.UserId = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.Cds = (myReader["cds"] == null) ? string.Empty : myReader["cds"].ToString();
                workplan.Coordinator = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                workplan.Coordinator += " ";
                workplan.Coordinator += (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                workplans.Add(workplan);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplans;
    }

    //No diff
    public List<clsWorkplan> getWorkplansTLViewByUserId(string userId)
    {
        List<clsWorkplan> workplans = new List<clsWorkplan>();
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT workplan.[id]
      ,[call_date]
      ,workplan.[branch_id]
      ,branch.[branch_name]
      ,branch.[branch_code]
	  ,branch.[account_group_1]
      ,workplan.[is_deleted]
      ,workplan.[user_id]
      ,[firstname]
      ,[lastname]
      ,workplan.[status]
      ,[date_created]
      ,[date_submitted]
      ,[deadline]
      ,[added_by]
      ,[reference]
      ,[viewed_at]
FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan
INNER JOIN 
(SELECT * FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Manpower] WHERE user_id = @userId)
 as manpower ON workplan.branch_id = manpower.branch_id
LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id
LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_User] as users on workplan.user_id = users.id 
ORDER BY date_created desc";

//        @"SELECT workplan.[id]
//      ,[call_date]
//      ,workplan.[branch_id]
//      ,branch.[branch_name]
//      ,branch.[branch_code]
//	  ,branch.[account_group_1]
//      ,workplan.[is_deleted]
//      ,workplan.[user_id]
//      ,[firstname]
//      ,[lastname]
//      ,workplan.[status]
//      ,[date_created]
//      ,[date_submitted]
//      ,[deadline]
//      ,[added_by]
//      ,[reference]
//      ,[viewed_at]
//  FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan
//  LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Manpower] as manpower ON workplan.branch_id = manpower.branch_id
//  LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id
//  LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_User] as users on workplan.user_id = users.id 
//  WHERE manpower.user_id = @userId AND workplan.added_by = @userId AND reference like 'workplan'
//  ORDER BY workplan.id desc";

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsWorkplan workplan = new clsWorkplan();
                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.AssignedBranch = getBranchById(workplan.BranchId);
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.AssignedUser = getUserById(workplan.UserId);
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                workplan.Deadline = (myReader["deadline"] == null) ? string.Empty : myReader["deadline"].ToString();
                workplan.AddedBy = (myReader["added_by"] == null) ? string.Empty : myReader["added_by"].ToString();
                workplan.Reference = (myReader["reference"] == null) ? string.Empty : myReader["reference"].ToString();
                workplan.ViewedAt = (myReader["viewed_at"] == null) ? string.Empty : myReader["viewed_at"].ToString();
                workplans.Add(workplan);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplans;
    }

    //New Method
    public List<clsWorkplan> findMatchesWorkplan(clsWorkplan wkplan, DateTime minDate, DateTime maxDate)
    {
        List<clsWorkplan> workplans = new List<clsWorkplan>();
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT workplan.[id]
      ,[call_date]
      ,workplan.[branch_id]
      ,branch.[branch_name]
      ,branch.[branch_code]
	  ,branch.[account_group_1]
      ,workplan.[is_deleted]
      ,workplan.[user_id]
      ,[firstname]
      ,[lastname]
      ,workplan.[status]
      ,[date_created]
      ,[date_submitted]
      ,[deadline]
      ,[added_by]
      ,[reference]
      ,[viewed_at]
FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan
LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id
LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_User] as users on workplan.user_id = users.id
WHERE user_id = @userId AND branch_id = @branchId AND ([call_date] BETWEEN @minDate AND @maxDate)
ORDER BY date_created desc";

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = wkplan.UserId;
        myCommand.Parameters.Add("@branchId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@branchId"].Value = wkplan.BranchId;
        myCommand.Parameters.Add("@minDate", System.Data.SqlDbType.DateTime);
        myCommand.Parameters["@minDate"].Value = minDate;
        myCommand.Parameters.Add("@maxDate", System.Data.SqlDbType.DateTime);
        myCommand.Parameters["@maxDate"].Value = maxDate;


        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsWorkplan workplan = new clsWorkplan();
                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.AssignedBranch = getBranchById(workplan.BranchId);
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.AssignedUser = getUserById(workplan.UserId);
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                workplan.Deadline = (myReader["deadline"] == null) ? string.Empty : myReader["deadline"].ToString();
                workplan.AddedBy = (myReader["added_by"] == null) ? string.Empty : myReader["added_by"].ToString();
                workplan.Reference = (myReader["reference"] == null) ? string.Empty : myReader["reference"].ToString();
                workplan.ViewedAt = (myReader["viewed_at"] == null) ? string.Empty : myReader["viewed_at"].ToString();
                workplans.Add(workplan);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplans;
    }

    // No diff
    public List<clsWorkplan> getWorkplansTLVisibilityByUserId(string userId)
    {
        List<clsWorkplan> workplans = new List<clsWorkplan>();
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT workplan.[id]
      ,[call_date]
      ,workplan.[branch_id]
      ,branch.[branch_name]
      ,branch.[branch_code]
	  ,branch.[account_group_1]
      ,workplan.[is_deleted]
      ,workplan.[user_id]
      ,[firstname]
      ,[lastname]
      ,workplan.[status]
      ,[date_created]
      ,[date_submitted]
      ,[deadline]
      ,[added_by]
      ,[reference]
      ,[viewed_at]
  FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan
  INNER JOIN 
(SELECT * FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Manpower] WHERE user_id = @userId)
 as manpower ON workplan.branch_id = manpower.branch_id
  LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id
  LEFT JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_User] as users on workplan.user_id = users.id 
  WHERE reference like 'workplan'
  AND (workplan.[status] LIKE 'For Approval' OR workplan.[status] LIKE 'Submitted')
  ORDER BY workplan.id desc";

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsWorkplan workplan = new clsWorkplan();
                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.AssignedBranch = getBranchById(workplan.BranchId);
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.AssignedUser = getUserById(workplan.UserId);
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                workplan.Deadline = (myReader["deadline"] == null) ? string.Empty : myReader["deadline"].ToString();
                workplan.AddedBy = (myReader["added_by"] == null) ? string.Empty : myReader["added_by"].ToString();
                workplan.Reference = (myReader["reference"] == null) ? string.Empty : myReader["reference"].ToString();
                workplan.ViewedAt = (myReader["viewed_at"] == null) ? string.Empty : myReader["viewed_at"].ToString();
                workplans.Add(workplan);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplans;
    }

    //No diff
    public List<clsWorkplan> getWorkplansByUserId(string userId)
    {
        List<clsWorkplan> workplans = new List<clsWorkplan>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("/****** Script for SelectTopNRows command from SSMS  ******/"+
        "SELECT TOP 1000 workplan.[id] "+
        ",[call_date] "+
        ",workplan.[branch_id] "+
        ",branch.[branch_name] " +
        ",branch.[branch_code] " +
	    ",branch.[account_group_1] "+
        ",[is_deleted] "+
        ",[user_id] "+
        ",[status] "+
        ",[date_created] " +
        ",[date_submitted] " +
        ",[deadline] " +
        ",[added_by] " +
        ",[reference] " +
        ",[viewed_at] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan "+
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id "+
        "WHERE user_id = @userId ORDER BY workplan.[id] DESC");

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsWorkplan workplan = new clsWorkplan();
                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                workplan.AccountGroup = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.Deadline = (myReader["deadline"] == null) ? string.Empty : myReader["deadline"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                workplan.AddedBy = (myReader["added_by"] == null) ? string.Empty : myReader["added_by"].ToString();
                workplan.Reference = (myReader["reference"] == null) ? string.Empty : myReader["reference"].ToString();
                workplan.ViewedAt = (myReader["viewed_at"] == null) ? string.Empty : myReader["viewed_at"].ToString();
                workplans.Add(workplan);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplans;
    }

    //No diff
    public clsWorkplan getWorkplan(string workplanId)
    {

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("/****** Script for SelectTopNRows command from SSMS  ******/" +
        "SELECT workplan.[id] " +
        ",[call_date] " +
        ",workplan.[branch_id] " +
        ",branch.[branch_name] " +
        ",branch.[account_group_1] " +
        ",branch.[branch_code] " +
        ",deadline"+
        ",[is_deleted] " +
        ",[user_id] " +
        ",[status] " +
        ",[date_created] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan " +
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id " +
        "WHERE workplan.[id] = @id ");

        myCommand.Parameters.Add("@id", System.Data.SqlDbType.Int);
        myCommand.Parameters["@id"].Value = workplanId;

        clsWorkplan workplan = new clsWorkplan();
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                DateTime callDate = DateTime.Parse(myReader["call_date"].ToString());
                workplan.CallDate = callDate.ToString("yyyy-MM-dd");
                //workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                workplan.AccountCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                workplan.Deadline = (myReader["deadline"] == null) ? string.Empty : myReader["deadline"].ToString();
                workplan.AccountGroup = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplan;
    }

    //New method
    public clsWorkplan getCreatedWorkplan(string workplanId, string userId)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("/****** Script for SelectTopNRows command from SSMS  ******/" +
        "SELECT workplan.[id] " +
        ",[call_date] " +
        ",workplan.[branch_id] " +
        ",branch.[branch_name] " +
        ",branch.[account_group_1] " +
        ",branch.[branch_code] " +
        ",deadline" +
        ",[is_deleted] " +
        ",[user_id] " +
        ",[status] " +
        ",[date_created] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan " +
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id " +
        "WHERE workplan.[id] = @id AND workplan.[added_by] = @userId");

        myCommand.Parameters.Add("@id", System.Data.SqlDbType.Int);
        myCommand.Parameters["@id"].Value = workplanId;
        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;

        clsWorkplan workplan = new clsWorkplan();
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                DateTime callDate = DateTime.Parse(myReader["call_date"].ToString());
                workplan.CallDate = callDate.ToString("yyyy-MM-dd");
                //workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                workplan.AccountCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                workplan.Deadline = (myReader["deadline"] == null) ? string.Empty : myReader["deadline"].ToString();
                workplan.AccountGroup = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return workplan;
    }

    //No diff
    public clsWorkplan viewWorkplan(string workplanId)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = (@"UPDATE [dbo].[Data_Workplan]
        SET [viewed_at] = @viewedAt
        WHERE id = @id
        SELECT workplan.[id] " +
        ",[call_date] " +
        ",workplan.[branch_id] " +
        ",branch.[branch_name] " +
        ",branch.[account_group_1] " +
        ",branch.[branch_code] " +
        ",[is_deleted] " +
        ",[user_id] " +
        ",[status] " +
        ",[date_created] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] as workplan " +
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on workplan.branch_id = branch.id " +
        "WHERE workplan.[id] = @id ");

        myCommand.Parameters.Add("@id", System.Data.SqlDbType.Int);
        myCommand.Parameters.Add("@viewedAt", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters["@id"].Value = workplanId;
        myCommand.Parameters["@viewedAt"].Value = GetCurrentTime().ToString();

        clsWorkplan workplan = new clsWorkplan();
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                workplan.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                workplan.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                DateTime callDate = DateTime.Parse(myReader["call_date"].ToString());
                workplan.CallDate = callDate.ToString("yyyy-MM-dd");
                //workplan.CallDate = (myReader["call_date"] == null) ? string.Empty : myReader["call_date"].ToString();
                workplan.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                workplan.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                workplan.AccountCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                workplan.AccountGroup = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                workplan.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                workplan.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                workplan.UserId = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                workplan.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplan;
    }

    //No diff
    public string addWorkplan(clsWorkplan workplan)
    {

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("INSERT INTO [dbo].[Data_Workplan] "+
                   "([call_date] "+
                   ",[branch_id] "+
                   ",[user_id] "+
                   ",[status] " +
                   ",[deadline] " +
                   ",[added_by] " +
                   ",[reference] " +
                   ",[date_created]) "+
             "VALUES "+
                   "(@callDate"+
                   ",@branchId " +
                   ",@userId " +
                   ",@status " +
                   ",@deadline " +
                   ",@added_by " +
                   ",@reference " +
                   ",@dateCreated) " +
        "SELECT MAX([id]) as id FROM [DB_A1321A_visibsandbox].[dbo].[Data_Workplan] "+
        "WHERE [user_id] = @userId");

        myCommand.Parameters.Add("@callDate", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@branchId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@status", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@deadline", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@added_by", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@reference", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateCreated", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@callDate"].Value = workplan.CallDate;
        myCommand.Parameters["@branchId"].Value = workplan.BranchId;
        myCommand.Parameters["@userId"].Value = workplan.UserId;
        myCommand.Parameters["@status"].Value = workplan.Status;
        myCommand.Parameters["@deadline"].Value = (object)workplan.Deadline ?? DBNull.Value;
        myCommand.Parameters["@added_by"].Value = workplan.AddedBy;
        myCommand.Parameters["@reference"].Value = workplan.Reference;
        myCommand.Parameters["@dateCreated"].Value = workplan.DateCreated;

        string workplanId = "";
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                workplanId = myReader["id"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return workplanId;
    }

    //No diff
    public void editWorkplan(clsWorkplan workplan)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"UPDATE [dbo].[Data_Workplan] 
            SET
             [call_date] = @callDate
            ,[branch_id] = @branchId
            ,[user_id] = @userId
            ,[deadline] = @deadline
            ,[date_modified] = @dateModified
            ,[modified_by] = @modifiedBy
            WHERE id = @id";

        myCommand.Parameters.Add("@callDate", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@branchId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@deadline", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateModified", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@modifiedBy", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@id", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@callDate"].Value = workplan.CallDate;
        myCommand.Parameters["@branchId"].Value = workplan.BranchId;
        myCommand.Parameters["@userId"].Value = workplan.UserId;
        myCommand.Parameters["@deadline"].Value = workplan.Deadline;
        myCommand.Parameters["@dateModified"].Value = workplan.DateModified;
        myCommand.Parameters["@modifiedBy"].Value = workplan.ModifiedBy;
        myCommand.Parameters["@id"].Value = workplan.Id;

        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();
        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
    }

    //No diff
    public string addVisibilitySurvey(clsVisibilitySurvey survey){
        string surveyId = "";

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("INSERT INTO [dbo].[Data_Visibility_Survey] " +
                   "([visibility_id] "+
                   ",[workplan_id] " +
                   ",[date_created]) " +
                   "VALUES " +
                   "(@visibilityId " +
                   ",@workplanId " +
                   ",@dateCreated) " +
        "SELECT MAX([id]) as id FROM [dbo].[Data_Visibility_Survey] " +
        "WHERE [workplan_id] = @workplanId");

        myCommand.Parameters.Add("@visibilityId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@workplanId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateCreated", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@visibilityId"].Value = survey.VisibilityId;
        myCommand.Parameters["@workplanId"].Value = survey.WorkplanId;
        myCommand.Parameters["@dateCreated"].Value = survey.DateCreated;

        

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                surveyId = myReader["id"].ToString();
                foreach (clsVisibilityResponse response in survey.Response)
                {
                    response.SurveyId = surveyId;
                    addVisibilityResponse(response);
                }


            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return surveyId;
    }

    //No diff
    public string addVisibilityResponse(clsVisibilityResponse response)
    {
        string responseId = "";

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("INSERT INTO [dbo].[Data_Visibility_Response] " +
                   "([standard] "+
                   ",[visibility_survey_id] "+
                   ",[remarks] "+
                   ",[hit] "+
                   ",[miss] "+
                   ",[date_created]) "+
                   "VALUES " +
                   "(@standard " +
                   ",@visibility_survey_id " +
                   ",@remarks " +
                   ",@hit " +
                   ",@miss " +
                   ",@dateCreated) " +
        "SELECT MAX([id]) as id FROM [dbo].[Data_Visibility_Response] " +
        "WHERE [visibility_survey_id] = @visibility_survey_id ");

        myCommand.Parameters.Add("@standard", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@visibility_survey_id", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@remarks", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@hit", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@miss", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateCreated", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@standard"].Value = response.Standard;
        myCommand.Parameters["@visibility_survey_id"].Value = response.SurveyId;
        myCommand.Parameters["@remarks"].Value = response.Remarks;
        myCommand.Parameters["@hit"].Value = response.Hit;
        myCommand.Parameters["@miss"].Value = response.Miss;
        myCommand.Parameters["@dateCreated"].Value = response.DateCreated;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                responseId = myReader["id"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return responseId;
    }

    //No diff
    public List<clsVisibilitySurvey> getVisibilitySurveysByWorkplanId(string workplanId)
    {
        List<clsVisibilitySurvey> surveyList = new List<clsVisibilitySurvey>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT survey.[id]
        ,[visibility_id]
	    ,[item_code]
        ,[category]
        ,[brand]
        ,[description]
        ,[display_type]
        ,[qty]
        ,[workplan_id]
        ,survey.[date_created]
        FROM [DB_A1321A_visibsandbox].[dbo].[Data_Visibility_Survey] as survey
        JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Program] as visibility 
        ON survey.visibility_id = visibility.id
        WHERE [workplan_id] = @workplanId";

        myCommand.Parameters.Add("@workplanId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@workplanId"].Value = workplanId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsVisibilitySurvey survey = new clsVisibilitySurvey();
                string surveyId = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                survey.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                survey.VisibilityId = (myReader["visibility_id"] == null) ? string.Empty : myReader["visibility_id"].ToString();
                survey.ItemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                survey.Category = (myReader["category"] == null) ? string.Empty : myReader["category"].ToString();
                survey.Brand = (myReader["brand"] == null) ? string.Empty : myReader["brand"].ToString();
                survey.Description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                survey.Display_type = (myReader["display_type"] == null) ? string.Empty : myReader["display_type"].ToString();
                survey.Qty = (myReader["qty"] == null) ? string.Empty : myReader["qty"].ToString();
                survey.WorkplanId = (myReader["workplan_id"] == null) ? string.Empty : myReader["workplan_id"].ToString();
                survey.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                survey.Response = getVisibilityResponseBySurveyId(surveyId);
                survey.Response_count = survey.Response.Count();
                surveyList.Add(survey);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return surveyList;
    }

    //No diff
    public List<clsVisibilityResponse> getVisibilityResponseBySurveyId(string surveyId)
    {
        List<clsVisibilityResponse> responseList = new List<clsVisibilityResponse>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT response.[id]
        ,[standard]
        ,[name]
        ,[code] 
        ,[value]
        ,[visibility_survey_id] 
        ,[remarks]
        ,[picture]
        ,[hit] 
        ,[miss]
        ,[miss_category]
        ,response.[date_created]
        FROM [DB_A1321A_visibsandbox].[dbo].[Data_Visibility_Response] as response
        JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Standard] as measure
        ON measure.id = response.standard
        WHERE [visibility_survey_id] = @surveyId
        ORDER BY NAME ASC";

        myCommand.Parameters.Add("@surveyId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@surveyId"].Value = surveyId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsVisibilityResponse response = new clsVisibilityResponse();
                response.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                response.Standard = (myReader["standard"] == null) ? string.Empty : myReader["standard"].ToString();
                response.Name = (myReader["name"] == null) ? string.Empty : myReader["name"].ToString();
                response.Code = (myReader["code"] == null) ? string.Empty : myReader["code"].ToString();
                response.SurveyId = (myReader["visibility_survey_id"] == null) ? string.Empty : myReader["visibility_survey_id"].ToString();
                response.Remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                response.Hit = (bool)myReader["hit"];
                response.Miss = (bool)myReader["miss"];
                response.MissCategory = (myReader["miss_category"] == null) ? string.Empty : myReader["miss_category"].ToString();
                response.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                responseList.Add(response);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }


        return responseList;
    }

    //No diff
    public List<clsVisibility> getVisibilityProgramsByBranchId(string branchId)
    {
        List<clsVisibility> visibilityList = new List<clsVisibility>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 assignedBranches.[branch_id], branch_name " +
        ",visibility.[id] "+
	    ",visibility.[item_code] "+
	    ",visibility.[category] "+
	    ",visibility.[brand] "+
	    ",visibility.[description] "+
	    ",visibility.[display_type] "+
	    ",visibility.[qty] "+
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Branch] as assignedBranches "+
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branches ON assignedBranches.branch_id = branches.id "+
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Program] as  visibility ON assignedBranches.visibility_id  = visibility.id "+
        "WHERE assignedBranches.[branch_id] = @branchId");

        myCommand.Parameters.Add("@branchId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@branchId"].Value = branchId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                
                clsVisibility visibility = new clsVisibility();
                string visibilityId = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                visibility.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                visibility.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                visibility.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                visibility.ItemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                visibility.Category = (myReader["category"] == null) ? string.Empty : myReader["category"].ToString();
                visibility.Brand = (myReader["brand"] == null) ? string.Empty : myReader["brand"].ToString();
                visibility.Description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                visibility.Display_type = (myReader["display_type"] == null) ? string.Empty : myReader["display_type"].ToString();
                visibility.Qty = (myReader["qty"] == null) ? string.Empty : myReader["qty"].ToString();
                visibility.Standard = getVisibilityStandardByVisibilityId(visibilityId);
                visibilityList.Add(visibility);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return visibilityList;
    }

    //No diff
    public List<clsVisibilityStandard> getVisibilityStandardByVisibilityId(string visibilityId)
    {
        List<clsVisibilityStandard> standardList = new List<clsVisibilityStandard>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] "+
        ",[name] "+
        ",[description] "+
        ",[visibility_id] "+
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Standard] "+
        "WHERE [visibility_id] = @visibilityId");

        myCommand.Parameters.Add("@visibilityId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@visibilityId"].Value = visibilityId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsVisibilityStandard standard = new clsVisibilityStandard();

                standard.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                standard.Name = (myReader["name"] == null) ? string.Empty : myReader["name"].ToString();
                standard.Description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                standard.VisibilityId = (myReader["visibility_id"] == null) ? string.Empty : myReader["visibility_id"].ToString();
                standardList.Add(standard);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return standardList;
    }

    //No diff
    public List<clsManpower> getAssignedBranches(string userId)
    {
        List<clsManpower> assignedBranches = new List<clsManpower>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT manpower.[id] "+
        ",[user_id] "+
        ",manpower.[branch_id] "+
        ",(convert(nvarchar,[branch_code]) +' '+ [account_group_1] +' '+[branch_name]) as branch_name " +
        ",[status] "+
        ",[is_deleted] "+
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Manpower] as manpower "+
        "join [DB_A1321A_visibsandbox].[dbo].[Ref_Branch] as branch on manpower.branch_id = branch.id " +
        "WHERE user_id = @userId ");

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsManpower manpower = new clsManpower();
                manpower.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                manpower.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                manpower.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                manpower.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                manpower.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                manpower.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                assignedBranches.Add(manpower);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return assignedBranches;
    }

    //New method
    public List<clsBranch> getAssignedBranchesByUserId(string userId)
    {
        List<clsBranch> assignedBranches = new List<clsBranch>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"  SELECT B.id as branch_id, B.account_group_1, B.branch_code, B.branch_name, B.branch_address
  FROM [Ref_Manpower] A
  LEFT JOIN [Ref_Branch] B ON A.[branch_id] = B.[id]
  INNER JOIN (SELECT DISTINCT branch_id FROM [Ref_Visibility_branch]) C ON B.id = C.branch_id
  WHERE A.[user_id] = @userId ORDER BY B.account_group_1, B.id";

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsBranch branch = new clsBranch();
                branch.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                branch.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                branch.BranchCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                branch.BranchAddress = (myReader["branch_address"] == null) ? string.Empty : myReader["branch_address"].ToString();
                branch.Account_group_1 = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                assignedBranches.Add(branch);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return assignedBranches;
    }

    //No diff
    public List<clsManpower> getAssignedBranchesTLViewByUserId(string userId, clsManpower filter)
    {
        List<clsManpower> assignedBranches = new List<clsManpower>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT * FROM
  (SELECT
	M.[id]
    ,M.[user_id]
    ,M.[branch_id]
    ,M.[status]
    ,M.[is_deleted]
  FROM
  (SELECT [id]
      ,[user_id]
      ,[branch_id]
      ,[status]
      ,[is_deleted]
  FROM [dbo].[Ref_Manpower]
  WHERE user_id = @userId) TL
  LEFT JOIN [Ref_Manpower] M ON (M.branch_id = TL.branch_id)
  LEFT JOIN [Ref_User] U ON (U.id = M.user_id)
  RIGHT JOIN (SELECT DISTINCT branch_id FROM [Ref_Visibility_Branch]) R ON (R.branch_id = TL.branch_id)
  WHERE type LIKE '%Coordinator%' OR type LIKE '%Promo Rep%' AND M.user_id != @userId) SRC";

//        myCommand.CommandText = @"SELECT coordinator.[id]
//      ,coordinator.[user_id]
//      ,coordinator.[branch_id]
//      ,coordinator.[status]
//      ,coordinator.[is_deleted]
//  FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Manpower] as coordinator
//  RIGHT JOIN (SELECT [id]
//      ,[user_id]
//      ,[branch_id]
//      ,[status]
//      ,[is_deleted]
//  FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Manpower]
//  WHERE user_id = @userId) as team_leader ON team_leader.branch_id = coordinator.branch_id
//  WHERE coordinator.user_id != @userId";

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@userId"].Value = userId;
        if (filter != null)
        {
            myCommand.CommandText += @" WHERE ";
            if (filter.BranchId != null)
            {
                myCommand.CommandText += @" [branch_id] = @branch";
                myCommand.Parameters.Add("@branch", System.Data.SqlDbType.Int);
                myCommand.Parameters["@branch"].Value = filter.BranchId;    
            }
            if (filter.UserId != null)
            {
                myCommand.CommandText += @" AND [user_id] = @coor";
                myCommand.Parameters.Add("@coor", System.Data.SqlDbType.Int);
                myCommand.Parameters["@coor"].Value = filter.UserId;   
            }
        }

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsManpower manpower = new clsManpower();
                manpower.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                manpower.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                manpower.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                manpower.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                manpower.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                manpower.AssignedBranch = getBranchById(manpower.BranchId);
                manpower.AssignedUser = getUserById(manpower.UserId);
                assignedBranches.Add(manpower);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return assignedBranches;
    }

    //No diff
    public clsManpower getManpowerById(string id)
    {
        clsManpower manpower = new clsManpower();
        
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT TOP 1000 [id]
      ,[user_id]
      ,[branch_id]
      ,[status]
      ,[is_deleted]
      FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Manpower]
      WHERE id = @id";

        myCommand.Parameters.Add("@id", System.Data.SqlDbType.Int);
        myCommand.Parameters["@id"].Value = id;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                manpower.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                manpower.UserId = (myReader["user_id"] == null) ? string.Empty : myReader["user_id"].ToString();
                manpower.BranchId = (myReader["branch_id"] == null) ? string.Empty : myReader["branch_id"].ToString();
                manpower.Status = (myReader["status"] == null) ? string.Empty : myReader["status"].ToString();
                manpower.IsDeleted = (myReader["is_deleted"] == null) ? string.Empty : myReader["is_deleted"].ToString();
                manpower.AssignedBranch = getBranchById(manpower.BranchId);
                manpower.AssignedUser = getUserById(manpower.UserId);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return manpower;
    }

    //No diff
    public void updateVisibilityResponseById(clsVisibilityResponse response)
    {
     
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"UPDATE [dbo].[Data_Visibility_Response]
        SET [remarks] = @remarks
        ,[hit] = @hit
        ,[miss] = @miss
        ,[miss_category] = @missCategory
        ,[date_modified] = @dateModified
        ,[modified_by] = @modifiedBy
        WHERE [id] = @responseId";

        myCommand.Parameters.AddWithValue("@remarks", (object) response.Remarks ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@hit", (object) response.Hit ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@miss", (object) response.Miss ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@missCategory", (object) response.MissCategory ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@responseId", (object)response.Id ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@dateModified", (object) response.DateModified ?? DBNull.Value);
        myCommand.Parameters.AddWithValue("@modifiedBy", (object) response.ModifiedBy ?? DBNull.Value);

        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
    }

    //No diff
    public void updateVisibilitySurveyById(clsVisibilitySurvey survey)
    {
        foreach (clsVisibilityResponse response in survey.Response)
        {
            updateVisibilityResponseById(response);
        }
    }
    
    //No diff
    public void changeWorkplanStatus(clsWorkplan workplan){
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"UPDATE[dbo].[Data_Workplan]
        SET [status] = @status
        WHERE [id] = @workplanId";

        myCommand.Parameters.Add("@status", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@workplanId", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@status"].Value = workplan.Status;
        myCommand.Parameters["@workplanId"].Value = workplan.Id;

        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
    }

    //No diff
    public List<clsVisibility> getVisibilityPrograms()
    {
        List<clsVisibility> visibilityList = new List<clsVisibility>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] "+
        ",[item_code] "+
        ",[category] "+
        ",[brand] "+
        ",[description] "+
        ",[display_type] "+
        ",[qty] "+
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Program]");

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                clsVisibility visibility = new clsVisibility();
                string visibilityId = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                visibility.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                visibility.ItemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                visibility.Category = (myReader["category"] == null) ? string.Empty : myReader["category"].ToString();
                visibility.Brand = (myReader["brand"] == null) ? string.Empty : myReader["brand"].ToString();
                visibility.Description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                visibility.Display_type = (myReader["display_type"] == null) ? string.Empty : myReader["display_type"].ToString();
                visibility.Qty = (myReader["qty"] == null) ? string.Empty : myReader["qty"].ToString();
                visibility.Standard = getVisibilityStandardByVisibilityId(visibilityId);
                visibilityList.Add(visibility);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return visibilityList;
    }

    //No diff
    public List<clsVisibilityPicture> getPicturesByResponseId(string responseId)
    {
        List<clsVisibilityPicture> visibPictures = new List<clsVisibilityPicture>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] "+
        ",[name] "+
        ",[date_created] "+
        ",[date_modified] " +
        ",[date_captured] " +
        ",[date_captured2] " +
        ",[is_deleted] "+
        ",[user_id] "+
        ",[remarks] "+
        ",[brands] "+
        ",[response_id] "+
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Visibility_Picture] "+
        "WHERE [response_id] = @responseId");

        myCommand.Parameters.Add("@responseId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@responseId"].Value = responseId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsVisibilityPicture picture = new clsVisibilityPicture();

                picture.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                picture.Name = (myReader["name"] == null) ? string.Empty : myReader["name"].ToString();
                picture.ResponseId = (myReader["response_id"] == null) ? string.Empty : myReader["response_id"].ToString();
                picture.DateCaptured = (myReader["date_captured"] == null) ? string.Empty : myReader["date_captured"].ToString();
                picture.DateCaptured2 = (myReader["date_captured2"] == null) ? string.Empty : myReader["date_captured2"].ToString();
                visibPictures.Add(picture);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return visibPictures;
    }

    //No diff
    public List<clsVisibilityPicture> getVisibilityPicturesByResponseId(string responseId)
    {
        List<clsVisibilityPicture> pictureList = new List<clsVisibilityPicture>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] " +
        ",[name] " +
        ",[date_created] "+
        ",[date_modified] " +
        ",[date_captured] " +
        ",[date_captured2] " +
        ",[is_deleted] "+
        ",[user_id] "+
        ",[remarks] "+
        ",[brands] "+
        ",[response_id] "+
        ",[file_name] " +
        ",[file_path] " +
        ",[shelf_id] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Visibility_Picture] "+
        "WHERE [response_id] = @responseId ORDER BY [id] DESC");

        myCommand.Parameters.Add("@responseId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@responseId"].Value = responseId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsVisibilityPicture picture = new clsVisibilityPicture();

                picture.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                picture.Name = (myReader["name"] == null) ? string.Empty : myReader["name"].ToString();
                picture.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                picture.DateModified = (myReader["date_modified"] == null) ? string.Empty : myReader["date_modified"].ToString();
                picture.DateCaptured = (myReader["date_captured"] == null) ? string.Empty : myReader["date_captured"].ToString();
                picture.DateCaptured2 = (myReader["date_captured2"] == null) ? string.Empty : myReader["date_captured"].ToString();
                picture.Remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                picture.Brands = (myReader["brands"] == null) ? string.Empty : myReader["brands"].ToString();
                picture.ResponseId = (myReader["response_id"] == null) ? string.Empty : myReader["response_id"].ToString();
                picture.FileName = (myReader["file_name"] == null) ? string.Empty : myReader["file_name"].ToString();
                picture.FilePath = (myReader["file_path"] == null) ? string.Empty : myReader["file_path"].ToString();
                picture.ShelfId = (myReader["shelf_id"] == null) ? string.Empty : myReader["shelf_id"].ToString();
                pictureList.Add(picture);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return pictureList;
    }

    //No diff
    public clsVisibilityPicture getVisibilityPictureById(string picId)
    {
        clsVisibilityPicture picture = new clsVisibilityPicture();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] " +
        ",[name] " +
        ",[date_created] " +
        ",[date_modified] " +
        ",[date_captured] " +
        ",[date_captured2] " +
        ",[is_deleted] " +
        ",[user_id] " +
        ",[remarks] " +
        ",[brands] " +
        ",[response_id] " +
        ",[file_name] " +
        ",[file_path] " +
        ",[shelf_id] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Visibility_Picture] " +
        "WHERE [id] = @picId ORDER BY [id] DESC");

        myCommand.Parameters.Add("@picId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@picId"].Value = picId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                picture.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                picture.Name = (myReader["name"] == null) ? string.Empty : myReader["name"].ToString();
                picture.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                picture.DateModified = (myReader["date_modified"] == null) ? string.Empty : myReader["date_modified"].ToString();
                picture.DateCaptured = (myReader["date_captured"] == null) ? string.Empty : myReader["date_captured"].ToString();
                picture.DateCaptured = (myReader["date_captured2"] == null) ? string.Empty : myReader["date_captured2"].ToString();
                picture.Remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                picture.Brands = (myReader["brands"] == null) ? string.Empty : myReader["brands"].ToString();
                picture.ResponseId = (myReader["response_id"] == null) ? string.Empty : myReader["response_id"].ToString();
                picture.FileName = (myReader["file_name"] == null) ? string.Empty : myReader["file_name"].ToString();
                picture.FilePath = (myReader["file_path"] == null) ? string.Empty : myReader["file_path"].ToString();
                picture.ShelfId = (myReader["shelf_id"] == null) ? string.Empty : myReader["shelf_id"].ToString();

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return picture;
    }

    //No diff
    public void addVisibilityPicturesByResponseId(clsVisibilityPicture picture)
    {
        //string surveyId = "";

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("INSERT INTO [dbo].[Data_Visibility_Picture] " +
                   "([response_id] " +
                   ",[user_id] " +
                   ",[name] " +
                   ",[file_name] " +
                   ",[file_path] " +
                   ",[date_captured] " +
                   ",[date_created]) " +
                   "VALUES " +
                   "(@responseId " +
                   ",@userId " +
                   ",@name " +
                   ",@file_name " +
                   ",@file_path " +
                   ",@date_captured " +
                   ",@dateCreated) ");

        myCommand.Parameters.Add("@responseId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@name", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@file_name", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@file_path", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@date_captured", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateCreated", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@responseId"].Value = picture.ResponseId;
        myCommand.Parameters["@userId"].Value = picture.Userid;
        myCommand.Parameters["@name"].Value = picture.Name;
        myCommand.Parameters["@file_name"].Value = picture.FileName;
        myCommand.Parameters["@file_path"].Value = picture.FilePath;
        myCommand.Parameters["@date_captured"].Value = picture.DateCaptured;
        myCommand.Parameters["@dateCreated"].Value = picture.DateCreated;



        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                //surveyId = myReader["id"].ToString();

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        //return surveyId;
    } 

    //No diff
    public clsVisibilitySurvey getVisibilitySurveyBySurveyId(string surveyId){
        clsVisibilitySurvey survey = new clsVisibilitySurvey();
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 survey.[id] " +
        ",[visibility_id] " +
        ",[item_code] " +
        ",[category] " +
        ",[brand] " +
        ",[description] " +
        ",[display_type] " +
        ",[qty] " +
        ",[workplan_id] " +
        ",survey.[date_created] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Data_Visibility_Survey] as survey " +
        "JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Program] as visibility " +
        "ON survey.visibility_id = visibility.id " +
        "WHERE survey.[id] = @surveyId");

        myCommand.Parameters.Add("@surveyId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@surveyId"].Value = surveyId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                string surveyId1 = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                survey.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                survey.VisibilityId = (myReader["visibility_id"] == null) ? string.Empty : myReader["visibility_id"].ToString();
                survey.ItemCode = (myReader["item_code"] == null) ? string.Empty : myReader["item_code"].ToString();
                survey.Category = (myReader["category"] == null) ? string.Empty : myReader["category"].ToString();
                survey.Brand = (myReader["brand"] == null) ? string.Empty : myReader["brand"].ToString();
                survey.Description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                survey.Display_type = (myReader["display_type"] == null) ? string.Empty : myReader["display_type"].ToString();
                survey.Qty = (myReader["qty"] == null) ? string.Empty : myReader["qty"].ToString();
                survey.WorkplanId = (myReader["workplan_id"] == null) ? string.Empty : myReader["workplan_id"].ToString();
                survey.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
                survey.Response = getVisibilityResponseBySurveyId(surveyId1);

            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return survey;
    }

    //No diff
    public clsVisibilityResponse getVisibilityResponseByResponseId(string responseId)
    {
        clsVisibilityResponse response = new clsVisibilityResponse();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT TOP 1000 response.[id]
        ,[standard] 
        ,[name] 
        ,[code]
        ,[value]
        ,[visibility_survey_id]
        ,[remarks] 
        ,[picture] 
        ,[hit]
        ,[miss]
        ,[miss_category]
        ,response.[date_created]
        FROM [DB_A1321A_visibsandbox].[dbo].[Data_Visibility_Response] as response
        JOIN [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Standard] as measure
        ON measure.id = response.standard
        WHERE response.[id] = @responseId";

        myCommand.Parameters.Add("@responseId", System.Data.SqlDbType.Int);
        myCommand.Parameters["@responseId"].Value = responseId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                response.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString(); 
                response.Standard = (myReader["standard"] == null) ? string.Empty : myReader["standard"].ToString();
                response.Name = (myReader["name"] == null) ? string.Empty : myReader["name"].ToString();
                response.Code = (myReader["code"] == null) ? string.Empty : myReader["code"].ToString();
                response.SurveyId = (myReader["visibility_survey_id"] == null) ? string.Empty : myReader["visibility_survey_id"].ToString();
                response.Remarks = (myReader["remarks"] == null) ? string.Empty : myReader["remarks"].ToString();
                response.Hit = (bool)myReader["hit"];
                response.Miss = (bool)myReader["miss"];
                response.MissCategory = (myReader["miss_category"] == null) ? string.Empty : myReader["miss_category"].ToString();
                response.DateCreated = (myReader["date_created"] == null) ? string.Empty : myReader["date_created"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return response;
    }

    //No diff
    public void removeVisibilityPictureById(string pictureId)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("DELETE FROM [dbo].[Data_Visibility_Picture] " +
        "WHERE [id] = @pictureId");

        myCommand.Parameters.Add("@pictureId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters["@pictureId"].Value = pictureId;

        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
    }

    //No diff
    public void clearTempVisibilityPicturesByResponseId(string responseId)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("DELETE FROM [dbo].[Data_Visibility_Picture] " +
        "WHERE [name] IS NULL AND [response_id] = @responseId ");

        myCommand.Parameters.Add("@responseId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters["@responseId"].Value = responseId;
        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
    }

    //No diff
    public List<clsVisibilityShelfBrand> getShelfBrandList()
    {
        List<clsVisibilityShelfBrand> shelfList = new List<clsVisibilityShelfBrand>();
        
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] "+
        ",[shelf_brand_code] "+
        ",[description] "+
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Shelf]");

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsVisibilityShelfBrand shelf = new clsVisibilityShelfBrand();
                shelf.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                shelf.ShelfBrandCode = (myReader["shelf_brand_code"] == null) ? string.Empty : myReader["shelf_brand_code"].ToString();
                shelf.Description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                shelfList.Add(shelf);
                
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return shelfList;
    }

    //No diff
    public void updateVisibilityPictureById(clsVisibilityPicture picture)
    {
        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("UPDATE [dbo].[Data_Visibility_Picture] " +
        "SET [name] = @name "+
        ",[remarks] = @remarks "+
        //",[shelf_id] = @shelfId " +
        ",[date_captured2] = @dateCaptured " +
        "WHERE [id] = @pictureId");

        myCommand.Parameters.Add("@name", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@remarks", System.Data.SqlDbType.NVarChar);
        //myCommand.Parameters.Add("@shelfId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@dateCaptured", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters.Add("@pictureId", System.Data.SqlDbType.NVarChar);

        myCommand.Parameters["@name"].Value = picture.Name;
        myCommand.Parameters["@remarks"].Value = picture.Remarks;
        //myCommand.Parameters["@shelfId"].Value = picture.ShelfId;
        myCommand.Parameters["@dateCaptured"].Value = picture.DateCaptured;
        myCommand.Parameters["@pictureId"].Value = picture.Id;

        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
    }

    //No diff
    public clsVisibilityShelfBrand getShelfBrand(string shelfId)
    {
        clsVisibilityShelfBrand shelf = new clsVisibilityShelfBrand();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] " +
        ",[shelf_brand_code] " +
        ",[description] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Visibility_Shelf] where [id] = @shelfId");

        myCommand.Parameters.Add("@shelfId", System.Data.SqlDbType.NVarChar);
        
        myCommand.Parameters["@shelfId"].Value = shelfId;
        
        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                shelf.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                shelf.ShelfBrandCode = (myReader["shelf_brand_code"] == null) ? string.Empty : myReader["shelf_brand_code"].ToString();
                shelf.Description = (myReader["description"] == null) ? string.Empty : myReader["description"].ToString();
                
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }
        return shelf;
    }

    //No diff
    public List<clsUser> getAllUsers()
    {
        List<clsUser> users = new List<clsUser>();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] "+
        ",[username] "+
        ",[password] "+
        ",[firstname] "+
        ",[lastname] "+
        ",[type] "+
        ",[area] "+
        ",[is_active] "+
        ",[email] "+
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_User]");

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                clsUser user = new clsUser();
                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
                user.Username = (myReader["area"] == null) ? string.Empty : myReader["area"].ToString();
                user.Username = (myReader["is_active"] == null) ? string.Empty : myReader["is_active"].ToString();
                user.Username = (myReader["email"] == null) ? string.Empty : myReader["email"].ToString();
                users.Add(user);
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }



        return users;
    }

    //No diff
    public clsBranch getBranchById(string branchId)
    {
        clsBranch branch = new clsBranch();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT TOP 1000 [id]
      ,[branch_code]
      ,[branch_name]
      ,[branch_address]
      ,[account_group_1]
      ,[account_group_2]
      ,[channel]
      ,[team]
      ,[sales_rep_name]
      ,[sales_rep_code]
      ,[ul_account_code]
      ,[account_code]
      ,[remarks]
      ,[team_leader]
      ,[cds]
  FROM [DB_A1321A_visibsandbox].[dbo].[Ref_Branch]
  WHERE id = @branchId";

        myCommand.Parameters.Add("@branchId", System.Data.SqlDbType.NVarChar);
        myCommand.Parameters["@branchId"].Value = branchId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                branch.BranchId = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                branch.BranchName = (myReader["branch_name"] == null) ? string.Empty : myReader["branch_name"].ToString();
                branch.BranchCode = (myReader["branch_code"] == null) ? string.Empty : myReader["branch_code"].ToString();
                branch.BranchAddress = (myReader["branch_address"] == null) ? string.Empty : myReader["branch_address"].ToString();
                branch.Account_group_1 = (myReader["account_group_1"] == null) ? string.Empty : myReader["account_group_1"].ToString();
                
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return branch;
    }

    //No diff
    public clsUser getUserById(string userId)
    {
        clsUser user = new clsUser();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = ("SELECT TOP 1000 [id] " +
        ",[username] " +
        ",[password] " +
        ",[fullname] " +
        ",[firstname] " +
        ",[middle] " +
        ",[lastname] " +
        ",[type] " +
        ",[area] " +
        ",[is_active] " +
        ",[email] " +
        "FROM [DB_A1321A_visibsandbox].[dbo].[Ref_User] " +
        "WHERE id = @userId");

        myCommand.Parameters.Add("@userId", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@userId"].Value = userId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {

                user.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                user.Username = (myReader["username"] == null) ? string.Empty : myReader["username"].ToString();
                user.Password = (myReader["password"] == null) ? string.Empty : myReader["password"].ToString();
                user.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                user.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                user.MiddleName = (myReader["middle"] == null) ? string.Empty : myReader["middle"].ToString();
                user.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
                user.Type = (myReader["type"] == null) ? string.Empty : myReader["type"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return user;
    }

    //New method
    public clsUser getAssignedUserByBranchId(string branchId)
    {
        clsUser assignedUser = new clsUser();

        SqlConnection myConnection = new SqlConnection();
        SqlCommand myCommand = new SqlCommand();

        myConnection.ConnectionString = gConnString;
        myCommand.Connection = myConnection;

        myCommand.CommandType = System.Data.CommandType.Text;
        myCommand.CommandText = @"SELECT B.id
        ,B.fullname
        ,B.firstname
        ,B.lastname
          FROM [DB_A1321A_visibsandbox]..[Ref_Manpower] A
          LEFT JOIN [DB_A1321A_visibsandbox]..[Ref_User] B
          ON A.user_id = B.id
          WHERE (B.type = 'Promo Rep' OR B.type = 'Coordinator')
          AND branch_id = @branchId";

        myCommand.Parameters.Add("@branchId", System.Data.SqlDbType.VarChar);
        myCommand.Parameters["@branchId"].Value = branchId;

        try
        {
            myConnection.Open();
            SqlDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                assignedUser.Id = (myReader["id"] == null) ? string.Empty : myReader["id"].ToString();
                assignedUser.Fullname = (myReader["fullname"] == null) ? string.Empty : myReader["fullname"].ToString();
                assignedUser.Firstname = (myReader["firstname"] == null) ? string.Empty : myReader["firstname"].ToString();
                assignedUser.Lastname = (myReader["lastname"] == null) ? string.Empty : myReader["lastname"].ToString();
            }
            myReader.Close();

        }
        catch (Exception objExp)
        {
            throw objExp;
        }
        finally
        {
            if (myConnection != null && myConnection.State != System.Data.ConnectionState.Closed)
            {
                myConnection.Close();
            }
        }

        return assignedUser;
    }


} 
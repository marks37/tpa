using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for clsFTPLayer
/// </summary>
public class clsFTPLayer
{

    public string UserName { get; set; }
    public string Password { get; set; }
    public string IpAddress { get; set; }
    public int Port { get; set; }
    public string Host { get; set; }
    

	public clsFTPLayer(string _userName, string _password, string _address, int _port, string _host)
	{
        UserName = _userName;
        Password = _password;
        IpAddress = _address;
        Port = _port;
        Host = _host;
	}

    public string getMapPath(string _path)
    {
        string mapPath = "";

        try
        {
            FtpWebRequest ftpRequest = (FtpWebRequest)FtpWebRequest.Create("ftp://"+IpAddress);
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.ToString());
        }



        return mapPath;
    }

    public bool createDirectory(string newDirectory)
    {
        try
        {
            /* Create an FTP Request */
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + newDirectory);
            /* Log in to the FTP Server with the User Name and Password Provided */
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            ftpRequest.UseBinary = true;
            ftpRequest.UsePassive = true;
            ftpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            ftpRequest.Method = WebRequestMethods.Ftp.MakeDirectory;
            /* Establish Return Communication with the FTP Server */
            FtpWebResponse ftpResponse = (FtpWebResponse)ftpRequest.GetResponse();
            Stream ftpStream = ftpResponse.GetResponseStream();


            /* Resource Cleanup */
            ftpResponse.Close();
            ftpStream.Close();

            return true;
        }
        catch (WebException ex)
        {
            FtpWebResponse response = (FtpWebResponse)ex.Response;
            if (response.StatusCode == FtpStatusCode.ActionNotTakenFileUnavailable)
            {
                response.Close();
                return true;
            }
            else
            {
                response.Close();
                return false;
            }
        }
    }

}
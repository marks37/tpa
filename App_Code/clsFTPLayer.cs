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
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + newDirectory);
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

            //if directory already exists, throw error
        }
        catch (WebException ex)
        {
            FtpWebResponse response = (FtpWebResponse)ex.Response;
            //if directory already exists, return true
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

    public bool upload(string remoteFile, string localFile)
    {
        int bufferSize = 2048;
        try
        {
            /* Create an FTP Request */
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + remoteFile);
            /* Log in to the FTP Server with the User Name and Password Provided */
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            ftpRequest.UseBinary = true;
            ftpRequest.UsePassive = true;
            ftpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            ftpRequest.Method = WebRequestMethods.Ftp.UploadFile;
            /* Establish Return Communication with the FTP Server */
            Stream ftpStream = ftpRequest.GetRequestStream();
            /* Open a File Stream to Read the File for Upload */
            FileStream localFileStream = new FileStream(localFile, FileMode.Create);
            /* Buffer for the Downloaded Data */
            byte[] byteBuffer = new byte[bufferSize];
            int bytesSent = localFileStream.Read(byteBuffer, 0, bufferSize);
            /* Upload the File by Sending the Buffered Data Until the Transfer is Complete */
            try
            {
                while (bytesSent != 0)
                {
                    ftpStream.Write(byteBuffer, 0, bytesSent);
                    bytesSent = localFileStream.Read(byteBuffer, 0, bufferSize);
                }
            }catch(Exception ex){
                Console.WriteLine(ex.ToString()); 
            }
            /* Resource Cleanup */
            localFileStream.Close();
            ftpStream.Close();
            ftpRequest = null;
            return true;
        }
        catch(WebException ex)
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

    public bool uploadImage(string image, string target)
    {
        try
        {
            /* Create an FTP Request */
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + image);
            /* Log in to the FTP Server with the User Name and Password Provided */
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            ftpRequest.UseBinary = true;
            ftpRequest.UsePassive = true;
            ftpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            ftpRequest.Method = WebRequestMethods.Ftp.UploadFile;
            /* Establish Return Communication with the FTP Server */
            Stream ftpStream = ftpRequest.GetRequestStream();
            /* Open a File Stream to Read the File for Upload */
            //FileStream localFileStream = new FileStream(localFile, FileMode.Create);

            byte[] fileDate = File.ReadAllBytes(image);
              
            return false;
        }catch(WebException ex){
            return true;
        }
    }

    public bool uploadImage(Stream image, string target)
    {
        Stream requestStream = null;
        try
        {
            /* Create an FTP Request */
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + target);
            /* Log in to the FTP Server with the User Name and Password Provided */
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            ftpRequest.UseBinary = true;
            ftpRequest.UsePassive = true;
            ftpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            ftpRequest.Method = WebRequestMethods.Ftp.UploadFile;
            ftpRequest.ContentLength = image.Length;
            
            /* Establish Return Communication with the FTP Server */
            requestStream = ftpRequest.GetRequestStream();

            //Avoid to write zero length files in destiny. 
            //If you have read the stream before for any reason (as a convertion to Bitmap to extract dimensions, for example)
            image.Seek(0, SeekOrigin.Begin);

            /* Open a File Stream to Read the File for Upload */
            //FileStream localFileStream = new FileStream(localFile, FileMode.Create);
            //byte[] fileDate = File.ReadAllBytes(image);

            image.CopyTo(requestStream);
            requestStream.Close();


            return false;
        }
        catch (WebException ex)
        {
            return true;
        }
    }

    public bool exists(string targetPath)
    {
        FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + targetPath);
        ftpRequest.Credentials = new NetworkCredential(UserName, Password);
        ftpRequest.UseBinary = true;
        ftpRequest.UsePassive = true;
        ftpRequest.KeepAlive = true;
        ftpRequest.Method = WebRequestMethods.Ftp.GetFileSize;

        try
        {
            FtpWebResponse response = (FtpWebResponse)ftpRequest.GetResponse();
        }
        catch (WebException ex)
        {
            FtpWebResponse response = (FtpWebResponse)ex.Response;
            if (response.StatusCode == FtpStatusCode.ActionNotTakenFileUnavailable)
            {
                return false;
            }
            return false;   
        }
        return true;
    }

    public Stream downloadImage(string target)
    {
        Stream image = null;
        try
        {
            /* Create an FTP Request */
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + target);
            /* Log in to the FTP Server with the User Name and Password Provided */
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            ftpRequest.UseBinary = true;
            ftpRequest.UsePassive = true;
            ftpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            ftpRequest.Method = WebRequestMethods.Ftp.DownloadFile;
            /* Establish Return Communication with the FTP Server */
            FtpWebResponse ftpResponse = (FtpWebResponse)ftpRequest.GetResponse();
            image = ftpResponse.GetResponseStream();


            /* Resource Cleanup */
            ftpResponse.Close();
            image.Close();

            return image;

            //if directory already exists, throw error
        }
        catch (WebException ex)
        {
            
        }
        return image;
    }

    public void delete(string deleteFile)
    {
        FtpWebRequest ftpRequest = null;
        FtpWebResponse ftpResponse = null;
        try
        {
            /* Create an FTP Request */
            ftpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + deleteFile);
            /* Log in to the FTP Server with the User Name and Password Provided */
            ftpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            ftpRequest.UseBinary = true;
            ftpRequest.UsePassive = true;
            ftpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            ftpRequest.Method = WebRequestMethods.Ftp.DeleteFile;
            /* Establish Return Communication with the FTP Server */
            ftpResponse = (FtpWebResponse)ftpRequest.GetResponse();
            /* Resource Cleanup */
            ftpResponse.Close();
            ftpRequest = null;
        }
        catch(Exception ex)
        {

        }
    }
}
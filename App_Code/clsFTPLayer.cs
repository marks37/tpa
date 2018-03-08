using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
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
            FtpWebRequest httpRequest = (FtpWebRequest)FtpWebRequest.Create("ftp://"+IpAddress);
            httpRequest.Credentials = new NetworkCredential(UserName, Password);

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
            /* Create an HTTP Request */
            HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + newDirectory);
            /* Log in to the HTTP Server with the User Name and Password Provided */
            httpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            httpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            httpRequest.Method = WebRequestMethods.Http.MkCol;
            /* Establish Return Communication with the FTP Server */
            HttpWebResponse httpResponse = (HttpWebResponse)httpRequest.GetResponse();
            Stream httpStream = httpResponse.GetResponseStream();


            /* Resource Cleanup */
            httpResponse.Close();
            httpStream.Close();

            return true;

            //if directory already exists, throw error
        }
        catch (WebException ex)
        {
            HttpWebResponse response = (HttpWebResponse)ex.Response;
            //if directory already exists, return true
            if (response.StatusCode == HttpStatusCode.Gone || response.StatusCode == HttpStatusCode.MethodNotAllowed)
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
            FtpWebRequest httpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + remoteFile);
            /* Log in to the FTP Server with the User Name and Password Provided */
            httpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            httpRequest.UseBinary = true;
            httpRequest.UsePassive = true;
            httpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            httpRequest.Method = WebRequestMethods.Ftp.UploadFile;
            /* Establish Return Communication with the FTP Server */
            Stream ftpStream = httpRequest.GetRequestStream();
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
            httpRequest = null;
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
            FtpWebRequest httpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + image);
            /* Log in to the FTP Server with the User Name and Password Provided */
            httpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            httpRequest.UseBinary = true;
            httpRequest.UsePassive = true;
            httpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            httpRequest.Method = WebRequestMethods.Ftp.UploadFile;
            /* Establish Return Communication with the FTP Server */
            Stream ftpStream = httpRequest.GetRequestStream();
            /* Open a File Stream to Read the File for Upload */
            //FileStream localFileStream = new FileStream(localFile, FileMode.Create);

            byte[] fileDate = File.ReadAllBytes(image);
              
            return false;
        }catch(WebException ex){
            return true;
        }
    }

    public bool uploadImage(Stream image, string filename, string actionUrl)
    {
        Stream container = new MemoryStream();
        image.Seek(0, SeekOrigin.Begin);
        image.CopyTo(container);
        try
        {
            HttpContent streamContent = new StreamContent(container);
            //HttpContent bytesContent = new ByteArrayContent(image);
            HttpContent stringContent = new StringContent(filename);

            using (var clientHandler = new HttpClientHandler())
            {
                clientHandler.Credentials = new NetworkCredential(UserName, Password);
                using (var client = new HttpClient(clientHandler))
                {
                    client.Timeout = TimeSpan.FromMinutes(30);
                    using (var formData = new MultipartFormDataContent())
                    {
                        try
                        {
                            formData.Add(streamContent, "streamContent");
                            //formData.Add(bytesContent, "bytesContent", filename);
                            formData.Add(stringContent, "stringContent");
                            var response = client.PostAsync(actionUrl, formData).Result;
                            var result = response.Content.ReadAsStringAsync().Result;
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }

                    }
                }
            }

            return false;
        }
        catch (WebException ex)
        {
            throw ex;
            return true;
        }
    }

    public bool exists(string targetPath)
    {
        HttpWebResponse response = null;

        /* Create an HTTP Request */
        HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + targetPath);
        /* Log in to the HTTP Server with the User Name and Password Provided */
        httpRequest.Credentials = new NetworkCredential(UserName, Password);
        /* Specify the Type of FTP Request */
        httpRequest.Method = "HEAD";

        try
        {
            response = (HttpWebResponse)httpRequest.GetResponse();
            return true;
        }
        catch (WebException ex)
        {
            response = (HttpWebResponse)ex.Response;
            if (response.StatusCode == HttpStatusCode.Gone || response.StatusCode == HttpStatusCode.MethodNotAllowed)
            {
                return false;
            }
            return false;   
        }
        finally
        {
            // Don't forget to close your response.
            if (response != null)
            {
                response.Close();
            }
        }
        return true;
    }

    public Stream downloadImage(string target)
    {
        Stream image = null;
        try
        {
            /* Create an FTP Request */
            FtpWebRequest httpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + target);
            /* Log in to the FTP Server with the User Name and Password Provided */
            httpRequest.Credentials = new NetworkCredential(UserName, Password);
            /* When in doubt, use these options */
            httpRequest.UseBinary = true;
            httpRequest.UsePassive = true;
            httpRequest.KeepAlive = true;
            /* Specify the Type of FTP Request */
            httpRequest.Method = WebRequestMethods.Ftp.DownloadFile;
            /* Establish Return Communication with the FTP Server */
            FtpWebResponse ftpResponse = (FtpWebResponse)httpRequest.GetResponse();
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
        HttpWebRequest httpRequest = null;
        HttpWebResponse httpResponse = null;
        try
        {
            /* Create an FTP Request */
            //httpRequest = (FtpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + deleteFile);
            ///* Log in to the FTP Server with the User Name and Password Provided */
            //httpRequest.Credentials = new NetworkCredential(UserName, Password);
            ///* When in doubt, use these options */
            //httpRequest.UseBinary = true;
            //httpRequest.UsePassive = true;
            //httpRequest.KeepAlive = true;
            ///* Specify the Type of FTP Request */
            //httpRequest.Method = WebRequestMethods.Http.
            ///* Establish Return Communication with the FTP Server */
            //ftpResponse = (FtpWebResponse)httpRequest.GetResponse();
            ///* Resource Cleanup */
            //ftpResponse.Close();
            //httpRequest = null;

            httpRequest = (HttpWebRequest)WebRequest.Create(Host + "://" + IpAddress + "/" + deleteFile);
            httpRequest.Credentials = new NetworkCredential(UserName, Password);
            httpRequest.KeepAlive = true;
            httpRequest.Method = "Delete";

            httpResponse = (HttpWebResponse)httpRequest.GetResponse();
            httpResponse.Close();
            httpRequest = null;

        }
        catch(Exception ex)
        {
            throw ex;
        }
    }

    public void delete(string url, NameValueCollection nvc)
    {

        //Console.WriteLine(string.Format("Uploading {0} to {1}", file, url));
        string boundary = "---------------------------" + DateTime.Now.Ticks.ToString("x");
        byte[] boundarybytes = System.Text.Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");

        HttpWebRequest wr = (HttpWebRequest)WebRequest.Create(url);
        wr.ContentType = "multipart/form-data; boundary=" + boundary;
        wr.Method = "POST";
        wr.KeepAlive = true;
        wr.Credentials = System.Net.CredentialCache.DefaultCredentials;
        wr.Credentials = new NetworkCredential(UserName, Password);
        wr.SendChunked = true;
        wr.AllowWriteStreamBuffering = true;
        wr.ReadWriteTimeout = 1 * 30 * 1000;
        wr.Timeout = 600000;

        Stream rs = wr.GetRequestStream();

        string formdataTemplate = "Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}";
        foreach (string key in nvc.Keys)
        {
            rs.Write(boundarybytes, 0, boundarybytes.Length);
            string formitem = string.Format(formdataTemplate, key, nvc[key]);
            byte[] formitembytes = System.Text.Encoding.UTF8.GetBytes(formitem);
            rs.Write(formitembytes, 0, formitembytes.Length);
        }
        rs.Write(boundarybytes, 0, boundarybytes.Length);

        byte[] trailer = System.Text.Encoding.ASCII.GetBytes("\r\n--" + boundary + "--\r\n");
        rs.Write(trailer, 0, trailer.Length);
        rs.Close();

        WebResponse wresp = null;
        try
        {
            wresp = wr.GetResponse();
            Stream stream2 = wresp.GetResponseStream();
            StreamReader reader2 = new StreamReader(stream2);
            Console.WriteLine(string.Format("File uploaded, server response is: {0}", reader2.ReadToEnd()));
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error uploading file", ex);
            if (wresp != null)
            {
                wresp.Close();
                wresp = null;
            }
        }
        finally
        {
            wr = null;
        }


    }


    public byte[] ReadFully(Stream input)
    {
        //byte[] buffer = new byte[16 * 1024];
        //using (MemoryStream ms = new MemoryStream())
        //{
        //    int read;
        //    while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
        //    {
        //        ms.Write(buffer, 0, read);
        //    }
        //    return ms.ToArray();
        //}

        MemoryStream ms = new MemoryStream();
        input.Seek(0, SeekOrigin.Begin);
        input.CopyTo(ms);
        return ms.ToArray();

    }

    public void HttpUploadFile(string url, byte[] file, string paramName, string contentType, NameValueCollection nvc)
    {
        Console.WriteLine(string.Format("Uploading {0} to {1}", file, url));
        string boundary = "---------------------------" + DateTime.Now.Ticks.ToString("x");
        byte[] boundarybytes = System.Text.Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");

        HttpWebRequest wr = (HttpWebRequest)WebRequest.Create(url);
        wr.ContentType = "multipart/form-data; boundary=" + boundary;
        wr.Method = "POST";
        wr.KeepAlive = true;
        wr.Credentials = System.Net.CredentialCache.DefaultCredentials;
        wr.Credentials = new NetworkCredential(UserName,Password);
        wr.SendChunked = true;
        wr.AllowWriteStreamBuffering = true;
        wr.ReadWriteTimeout = 1 * 30 * 1000;
        wr.Timeout = 600000;




        Stream rs = wr.GetRequestStream();

        string formdataTemplate = "Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}";
        foreach (string key in nvc.Keys)
        {
            rs.Write(boundarybytes, 0, boundarybytes.Length);
            string formitem = string.Format(formdataTemplate, key, nvc[key]);
            byte[] formitembytes = System.Text.Encoding.UTF8.GetBytes(formitem);
            rs.Write(formitembytes, 0, formitembytes.Length);
        }
        rs.Write(boundarybytes, 0, boundarybytes.Length);

        string headerTemplate = "Content-Disposition: form-data; name=\"{0}\"; filename=\"{1}\"\r\nContent-Type: {2}\r\n\r\n";
        string header = string.Format(headerTemplate, paramName, file, contentType);
        byte[] headerbytes = System.Text.Encoding.UTF8.GetBytes(header);
        rs.Write(headerbytes, 0, headerbytes.Length);

        //FileStream fileStream = new FileStream(file, FileMode.Open, FileAccess.Read);
        //byte[] buffer = new byte[4096];
        //int bytesRead = 0;
        //while ((bytesRead = fileStream.Read(buffer, 0, buffer.Length)) != 0)
        //{
        //    rs.Write(buffer, 0, bytesRead);
        //}
        //fileStream.Close();
        rs.Write(file, 0, file.Length);


        byte[] trailer = System.Text.Encoding.ASCII.GetBytes("\r\n--" + boundary + "--\r\n");
        rs.Write(trailer, 0, trailer.Length);
        rs.Close();

        WebResponse wresp = null;
        try
        {
            wresp = wr.GetResponse();
            Stream stream2 = wresp.GetResponseStream();
            StreamReader reader2 = new StreamReader(stream2);
            Console.WriteLine(string.Format("File uploaded, server response is: {0}", reader2.ReadToEnd()));
        }
        catch (Exception ex)
        {
            Console.WriteLine("Error uploading file", ex);
            if (wresp != null)
            {
                wresp.Close();
                wresp = null;
            }
        }
        finally
        {
            wr = null;
        }
    }
    
}



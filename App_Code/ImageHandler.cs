using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Diagnostics;
using ExifLib;
using System.IO;

/// <summary>
/// Summary description for ImageHandler
/// </summary>
public class ImageHandler
{
    public ImageHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// Method to resize, convert and save the image.
    /// </summary>
    /// <param name="image">Bitmap image.</param>
    /// <param name="maxWidth">resize width.</param>
    /// <param name="maxHeight">resize height.</param>
    /// <param name="quality">quality setting value.</param>
    /// <param name="filePath">file path.</param>      
    public void Save(Stream _image, int maxWidth, int maxHeight, int quality, string filePath)
    {
        Bitmap image = new Bitmap(_image);
        Image imgPhoto = image;
        //ExifReader reader = new ExifReader(_image);

        // Get the image's original width and height
        int originalWidth = image.Width;
        int originalHeight = image.Height;

        // To preserve the aspect ratio
        float ratioX = (float)maxWidth / (float)originalWidth;
        float ratioY = (float)maxHeight / (float)originalHeight;
        float ratio = Math.Min(ratioX, ratioY);

        // New width and height based on aspect ratio
        int newWidth = (int)(originalWidth * ratio);
        int newHeight = (int)(originalHeight * ratio);

        // Convert other formats (including CMYK) to RGB.
        Bitmap newImage = new Bitmap(newWidth, newHeight, PixelFormat.Format24bppRgb);

        // Draws the image in the specified size with quality mode set to HighQuality
        using (Graphics graphics = Graphics.FromImage(newImage))
        {
            graphics.CompositingQuality = CompositingQuality.HighQuality;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.SmoothingMode = SmoothingMode.HighQuality;
            graphics.DrawImage(image, 0, 0, newWidth, newHeight);
        }

        PropertyItem[] items = image.PropertyItems;
        System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
        // Save and transfer metadata to new image
        try
        {
            foreach (PropertyItem propertyItem in image.PropertyItems)
            {
                try
                {
                    newImage.SetPropertyItem(propertyItem);
                    if (propertyItem.Id.ToString("x").Equals("110"))
                    {
                        Debug.WriteLine("Model:  \t" + encoding.GetString(propertyItem.Value));
                    }
                    if (propertyItem.Id.ToString("x").Equals("9003"))
                    {
                        Debug.WriteLine("Taken:  \t" + encoding.GetString(propertyItem.Value));
                    }
                }
                catch { }
            }
        }
        catch { }

        // Get an ImageCodecInfo object that represents the JPEG codec.
        ImageCodecInfo imageCodecInfo = this.GetEncoderInfo(ImageFormat.Jpeg);

        // Create an Encoder object for the Quality parameter.
        Encoder encoder = Encoder.Quality;

        // Create an EncoderParameters object. 
        EncoderParameters encoderParameters = new EncoderParameters(1);

        // Save the image as a JPEG file with quality level.
        EncoderParameter encoderParameter = new EncoderParameter(encoder, quality);
        encoderParameters.Param[0] = encoderParameter;
        newImage.Save(filePath, imageCodecInfo, encoderParameters);
    }

    /// <summary>
    /// Method to get encoder infor for given image format.
    /// </summary>
    /// <param name="format">Image format</param>
    /// <returns>image codec info.</returns>
    private ImageCodecInfo GetEncoderInfo(ImageFormat format)
    {
        return ImageCodecInfo.GetImageDecoders().SingleOrDefault(c => c.FormatID == format.Guid);
    }

    public Stream compressImage(Stream _image, int maxWidth, int maxHeight, int quality)
    {
        //ExifReader reader = new ExifReader(_image);
        Bitmap image = new Bitmap(_image);

        // Get the image's original width and height
        int originalWidth = image.Width;
        int originalHeight = image.Height;

        // To preserve the aspect ratio
        float ratioX = (float)maxWidth / (float)originalWidth;
        float ratioY = (float)maxHeight / (float)originalHeight;
        float ratio = Math.Min(ratioX, ratioY);

        // New width and height based on aspect ratio
        int newWidth = (int)(originalWidth * ratio);
        int newHeight = (int)(originalHeight * ratio);

        // Convert other formats (including CMYK) to RGB.
        Bitmap newImage = new Bitmap(newWidth, newHeight, PixelFormat.Format24bppRgb);

        // Draws the image in the specified size with quality mode set to HighQuality
        using (Graphics graphics = Graphics.FromImage(newImage))
        {
            graphics.CompositingQuality = CompositingQuality.HighQuality;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.SmoothingMode = SmoothingMode.HighQuality;
            graphics.DrawImage(image, 0, 0, newWidth, newHeight);
        }

        // Save and transfer metadata to new image
        System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();        
        try
        {
            foreach (PropertyItem propertyItem in image.PropertyItems)
            {
                try
                {
                    newImage.SetPropertyItem(propertyItem);
                }
                catch { }
            }
        }
        catch { }

        // Get an ImageCodecInfo object that represents the JPEG codec.
        ImageCodecInfo imageCodecInfo = this.GetEncoderInfo(ImageFormat.Jpeg);

        // Create an Encoder object for the Quality parameter.
        Encoder encoder = Encoder.Quality;

        // Create an EncoderParameters object. 
        EncoderParameters encoderParameters = new EncoderParameters(1);

        // Save the image as a JPEG file with quality level.
        EncoderParameter encoderParameter = new EncoderParameter(encoder, quality);
        encoderParameters.Param[0] = encoderParameter;
        MemoryStream ms = new MemoryStream();
        newImage.Save(ms, imageCodecInfo, encoderParameters);
        return ms;
    }

}
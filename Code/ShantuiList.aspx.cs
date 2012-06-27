using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloGES.DAL;
using System.Net;
using System.Text;
using System.IO;

namespace HelloGES
{
    public partial class ShantuiList : System.Web.UI.Page
    {
        string userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            userName = User.Identity.Name.ToUpper();
            
            if (!IsPostBack)
            {
                string good = BuildProductMenu();

                refreshCategory();
            }
        }

        private void refreshCategory()
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    string Category = "";

                    try
                    {
                        Category = Request["Category"].ToString();
                    }
                    catch
                    {
                        Category = "";
                    }

                    var CategoryList = (from c in db.Shantuis where c.Category == Category select c).FirstOrDefault();

                    Page.Header.Title = "Shantui " + CategoryList.Category + " for sale";
                    Page.Header.Description = "Shantui " + CategoryList.Category + " for sale countrywide";
                    Page.Header.Keywords = "Shantui, " + "Shantui " + CategoryList.Category + ", " + "Shantui " + CategoryList.Category + " for sale";

                    var CategoryDetail = (from c in db.Shantuis where c.Category == Category select c);

                    gridShantuiList.DataSource = CategoryDetail;
                    gridShantuiList.DataSourceID = "";
                    gridShantuiList.DataBind();
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to retrieve machine info - " + exp.Message.ToString(), exp);
                }
            }
        }

        private string BuildProductMenu()
        {
            string returnResult = "";

            using (GESEntities db = new GESEntities())
            {
                try
                {
                    ProductMenu.Items.Clear();

                    //Char MainPic = Char.Parse("Y");

                    //Get Menu Items                    
                    //List<Shantui> tmpShantui = (from c in db.Shantuis where c.MainPicture == "Y" select c).OrderBy(x => x.MainPictureOrder).ToList();
                    var tmpShantui = (from d in db.Shantuis
                                      where d.MainPicture == "Y"
                                      select d).OrderBy(x => x.MainPictureOrder);

                    foreach (HelloGES.DAL.Shantui tmpShantuiIndex in tmpShantui)
                    {
                        try
                        {
                            MenuItem ProdItem = new MenuItem();
                            ProdItem.NavigateUrl = "ShantuiList.aspx?Category=" + tmpShantuiIndex.Category;
                            ProdItem.Text = tmpShantuiIndex.Category;

                            ProductMenu.Items.Add(ProdItem);
                        }
                        catch (Exception ex)
                        {
                            returnResult = "FALSE|" + ex.Message;
                        }
                    }
                    returnResult = "TRUE";
                }
                catch (Exception ex)
                {
                    returnResult = "FALSE|" + ex.Message;
                }

                db.Dispose();
            }

            return returnResult;
        }

        protected void gridShantuiList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string buttonPressed = e.CommandName.ToString();
            
            if (buttonPressed == "DownloadSpec")
            {
                //string SpecSheetURL = e.CommandArgument.ToString();
                //string SpecSheetFileName = SpecSheetURL;
       
                //char[] separator = new char[] { '/' };

                //string[] strSplitArr = SpecSheetFileName.Split(separator);

                //foreach (string arrStr in strSplitArr)
                //{
                //        if (arrStr.Contains(".pdf"))
                //        {
                //            SpecSheetFileName = arrStr;
                //            break;
                //        }
                //}


                string path = MapPath(e.CommandArgument.ToString());
                string name = Path.GetFileName(path);
                //string ext = Path.GetExtension(path);

                // set known types based on file extension  
                Response.AppendHeader("content-disposition","attachment; filename=" + name);
                Response.ContentType = "Application/pdf";
                Response.WriteFile(path);
                Response.End();                
                
                //HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create("http://www.globalearthmoving.co.za/" + SpecSheetURL);
                //HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
                //int bufferSize = 1;
                //Response.Clear();
                //Response.ClearHeaders();
                //Response.ClearContent();
                //Response.AppendHeader("Content-Disposition:", "attachment; filename=" + SpecSheetFileName);
                //Response.AppendHeader("Content-Length", objResponse.ContentLength.ToString());
                //Response.ContentType = "application/download";
                //byte[] byteBuffer = new byte[bufferSize + 1];
                //MemoryStream memStrm = new MemoryStream(byteBuffer, true);
                //Stream strm = objRequest.GetResponse().GetResponseStream();
                //byte[] bytes = new byte[bufferSize + 1];
                //while (strm.Read(byteBuffer, 0, byteBuffer.Length) > 0)
                //{
                //    Response.BinaryWrite(memStrm.ToArray());
                //    Response.Flush();
                //}
                //Response.Close();
                //Response.End();
                //memStrm.Close();
                //memStrm.Dispose();
                //strm.Dispose();
            }
        }
    }
}
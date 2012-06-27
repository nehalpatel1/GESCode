using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Xml;
using HelloGES.DAL;
using System.Collections.Generic;

namespace HelloGES
{
    public partial class sitemap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();
            Response.ContentType = "text/xml";
            using (XmlTextWriter writer = new XmlTextWriter(Response.OutputStream, Encoding.UTF8))
            {
                writer.WriteStartDocument();
                writer.WriteStartElement("urlset");
                writer.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/default.aspx");
                writer.WriteElementString("changefreq", "weekly");
                writer.WriteElementString("priority", "0");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/shantui");
                writer.WriteElementString("changefreq", "weekly");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                //Get all Shantui products
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        var tmpShantui = (from c in db.Shantuis where c.MainPicture == "Y" select c).OrderBy(x => x.MainPictureOrder);

                        foreach (DAL.Shantui tmpShantuiIndex in tmpShantui)
                        {
                            writer.WriteStartElement("url");
                            writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/Shantui-" + tmpShantuiIndex.Category.Replace(" ","-"));
                            writer.WriteElementString("changefreq", "weekly");
                            writer.WriteElementString("priority", "0.5");
                            writer.WriteEndElement();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("ERROR: Unable to Submit Enquiry - " + ex.Message.ToString(), ex);
                    }
                    db.Dispose();
                }

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/used-equipment");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/tlb-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/excavator-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/bulldozer-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/water-trucks-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/compactors-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/motor-grader-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/dump-truck-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/flatbed-truck-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/tipper-truck-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();
                
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/wheel-loader-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/front-end-loader-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/road-roller-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/bowser-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();
                
                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/tow-tractor-for-sale");
                writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", DateTime.Now));
                writer.WriteElementString("changefreq", "daily");
                writer.WriteElementString("priority", "0.5");
                writer.WriteEndElement();

                //loop thru all used equipment list
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        //Get all Used Equipment products
                        var tmpUsed = (from c in db.Machines select c).OrderBy(x => x.MachineID);

                        foreach (DAL.Machine tmpUsedIndex in tmpUsed)
                        {
                            writer.WriteStartElement("url");
                            writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/UsedEquipmentDetail.aspx?MachineID=" + tmpUsedIndex.MachineID);
                            writer.WriteElementString("lastmod", String.Format("{0:yyyy-MM-dd}", tmpUsedIndex.DateInserted));
                            writer.WriteElementString("changefreq", "daily");
                            writer.WriteElementString("priority", "0.5");
                            writer.WriteEndElement();
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("ERROR: Unable to Submit Enquiry - " + ex.Message.ToString(), ex);
                    }
                    db.Dispose();
                }

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/MyQuip.aspx");
                writer.WriteElementString("changefreq", "monthly");
                writer.WriteElementString("priority", "0.2");
                writer.WriteEndElement();

                writer.WriteStartElement("url");
                writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/ContactUs.aspx");
                writer.WriteElementString("changefreq", "monthly");
                writer.WriteElementString("priority", "0.2");
                writer.WriteEndElement();

                //writer.WriteStartElement("url");
                //writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/Enquire.aspx");
                //writer.WriteElementString("changefreq", "monthly");
                //writer.WriteElementString("priority", "0.2");
                //writer.WriteEndElement();

                //writer.WriteStartElement("url");
                //writer.WriteElementString("loc", "http://www.globalearthmoving.co.za/Account/Login.aspx");
                //writer.WriteElementString("changefreq", "monthly");
                //writer.WriteElementString("priority", "0.2");
                //writer.WriteEndElement();

            
                writer.WriteEndDocument();
                writer.Flush();
            }
            Response.End();
        }
    }
}
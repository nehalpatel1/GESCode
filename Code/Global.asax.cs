using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using HelloGES.DAL;

namespace HelloGES
{
    public class Global : System.Web.HttpApplication
    {
        private static int totalNumberOfUsers = 0;
        private static int currentNumberOfUsers = 0;

        void Application_Start(object sender, EventArgs e)
        {
            using (GESEntities db = new GESEntities())
            {
                var getCounters = (from c in db.Counters where c.CounterType == "UserCounter" select c.NumberOfHits).Sum();
                if (getCounters != null)
                {
                    totalNumberOfUsers = Int32.Parse(getCounters.ToString());
                }
                else
                {
                    totalNumberOfUsers = 0;
                }
            } 
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        public static int TotalNumberOfUsers
        {
            get
            {
                return totalNumberOfUsers;
            }
        }

        public static int CurrentNumberOfUsers
        {
            get
            {
                return currentNumberOfUsers;
            }
        } 

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Increase the two counters
            totalNumberOfUsers += 1;
            currentNumberOfUsers += 1;

            try
            {
                // Save the Total Number of Users to the database
                using (GESEntities db = new GESEntities())
                {
                    string execPath = Server.HtmlEncode(Request.CurrentExecutionFilePath);
                    DateTime sDate = DateTime.Now.Date;

                    var editCounters = (from c in db.Counters where c.CounterType == "UserCounter" && c.ExecutionPath == execPath && c.DateInserted == sDate select c).FirstOrDefault();
                    if (editCounters != null)
                    {
                        //Edit
                        editCounters.NumberOfHits += 1;
                        db.SaveChanges();
                    }
                    else
                    {
                        //Insert
                        Counter newCounter = new Counter();
                        newCounter.CounterType = "UserCounter";
                        newCounter.NumberOfHits = 1;
                        newCounter.ExecutionPath = Server.HtmlEncode(Request.CurrentExecutionFilePath);
                        newCounter.DateInserted = DateTime.Now.Date;
                        db.Counters.AddObject(newCounter);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception exp)
            {
                throw new Exception("ERROR: Unable to update counter - " + exp.Message.ToString(), exp);
            }
            
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
            currentNumberOfUsers -= 1;
        }

    }
}

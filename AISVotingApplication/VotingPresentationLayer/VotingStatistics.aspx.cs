using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VotingDataLayer;
using VotingEntityLayer;
using VotingExceptionLayer;
using System.IO;

namespace VotingPresentationLayer
{
    public partial class VotingStatistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!VerifyAccess())
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        private bool VerifyAccess()
        {
            bool validated = false;
            string access = "";
            
            if (Request.QueryString["Access"] != null)
                if (!String.IsNullOrEmpty(Request.QueryString["Access"]))
                    access = Request.QueryString["Access"].ToString();

            VotingData data = new VotingData();
            if(access == data.GetPassword("admin"))
            {
                validated = true;
            }
            return validated;
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void export_button_Click(object sender, EventArgs e)
        {
            try
            {
                string attachment = "attachment; filename=VotingStatistics.xls";
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                votingStatistics.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VotingDataLayer;
using VotingExceptionLayer;

namespace VotingPresentationLayer
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = null;
        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            try
            {
                VotingData votingData = new VotingData();
                string ufid = votingData.ValidateUFID(username.Text);
                if (!string.IsNullOrEmpty(ufid))
                {
                    string pwd = password.Text;
                    if (votingData.ValidateUser(ufid, pwd))
                    {
                        if (ufid.ToLower() == "admin")
                        {
                            Session["user"] = "admin";
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            Session["user"] = ufid;
                            Response.Redirect("VotingHome.aspx");
                        }
                        Error.Text = string.Empty;
                    }
                    else
                        Error.Text = "Invalid UFID or Password";
                }
                else
                    Error.Text = "Invalid UFID Format";

            }
            catch (AISException ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
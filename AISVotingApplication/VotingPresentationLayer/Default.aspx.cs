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
                string ufid = votingData.ValidateUFID(txtUsername.Text);
                if (!string.IsNullOrEmpty(ufid))
                {
                    string pwd = txtPassword.Text;
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
                            Response.Redirect("Home.aspx");
                        }
                        lblMessage.Text = string.Empty;
                    }
                    else
                    {
                        lblMessage.Text = "Invalid Credentials";
                        lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                    }
                }

            }
            catch (AISException ex)
            {
                lblMessage.Text = "Invalid Credentials";
                lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                ErrorLogs.LogErrors(ex.Message);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Invalid Credentials";
                lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        protected void requestAccess_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Access requested";
            lblMessage.CssClass = "alert alert-success center-block alert-success-class";
            ClearValues();
        }

        private void ClearValues()
        {
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtFirstname.Text = string.Empty;
            txtLastname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtRequestPassword.Text = string.Empty;
        }
    }
}
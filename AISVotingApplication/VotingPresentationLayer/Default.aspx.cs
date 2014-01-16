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
                string ufid = username.Text;
                string pwd = password.Text;
                VotingData votingData = new VotingData();

                if (votingData.ValidateUser(ufid, pwd))
                {
                    string memberType = votingData.GetMemberType(ufid);
                    if (memberType == "president" || memberType == "admin")
                    {
                        Session["user"] = "admin";
                        Response.Redirect("AddMember.aspx");
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
            catch (AISException ex)
            {
                Error.Text =  ex.Message;
            }
            catch (Exception ex)
            {
                Error.Text = ex.Message;
            }
        }
    }
}
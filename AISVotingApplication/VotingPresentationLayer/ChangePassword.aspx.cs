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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void change_button_Click(object sender, EventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                string ufid = Session["user"].ToString();

                if (CurrentPassword.Text == data.GetPassword(ufid))
                {
                    data.SetNewPassword(ufid, NewPassword.Text);
                    Error.Text = "Password changed successfully";
                }
                else
                {
                    Error.Text = "Invalid Password Entered";
                }
            }
            catch (Exception ex)
            {
                Error.Text = "Error while changing Password";
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
﻿using System;
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
                    lblMessage.Text = "Password changed successfully";
                    lblMessage.CssClass = "alert alert-success center-block alert-success-class";
                }
                else
                {
                    lblMessage.Text = "Invalid Password Entered";
                    lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error while changing Password";
                lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
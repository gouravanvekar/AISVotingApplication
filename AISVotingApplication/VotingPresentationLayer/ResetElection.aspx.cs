using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using VotingDataLayer;
using VotingEntityLayer;
using VotingExceptionLayer;

namespace VotingPresentationLayer
{
    public partial class ResetElection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clear_button_Click(object sender, EventArgs e)
        {
            try
            {
                VotingData votingData = new VotingData();
                if (votingData.ValidateUser("admin", adminPassword.Text))
                {
                    List<string> profileImages = votingData.GetCandidateProfileImages();
                    foreach (string image in profileImages)
                    {
                        File.Delete(Server.MapPath("~/images/candidates/" + image));
                    }
                    votingData.ResetElectionForNewTerm();
                    message.Text = "Reset Successful"; 
                }
                else
                    message.Text = "Invalid Password";

            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
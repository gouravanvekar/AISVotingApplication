using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VotingDataLayer;
using VotingEntityLayer;
using VotingExceptionLayer;

namespace VotingPresentationLayer
{
    public partial class AddCandidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VotingData data = new VotingData();
                term.Items.Clear();
                term.Items.Add("Fall");
                term.Items.Add("Spring");
                
                string currentTerm = data.GetCurrentTerm();
                if (currentTerm.Contains("Fall"))
                {
                    term.SelectedIndex = 0;
                }
                else
                {
                    term.SelectedIndex = 1;
                }
                year.Items.Clear();
                year.Items.Add(DateTime.Now.Year.ToString());
                year.Items.Add((DateTime.Now.Year + 1).ToString());
                year.Items.Add((DateTime.Now.Year + 2).ToString());
            }
        }

        protected void add_button_Click(object sender, EventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                if (data.GetMemberDetails(candidateUFID.Text) != null)
                {
                    VotingCandidate candidate = new VotingCandidate();
                    candidate.UFID = candidateUFID.Text;
                    candidate.Position = positions.SelectedItem.Text;
                    candidate.Term = term.SelectedItem.Text + " " + year.SelectedItem.Text;
                    if (profileUpload.HasFile)
                    {
                        profileUpload.SaveAs(Server.MapPath("~/images/" + profileUpload.FileName));
                        candidate.ProfileImage = profileUpload.FileName;
                    }

                    data.AddVotingCandidate(candidate);
                    Error.Text = "Candidate added successfully";
                    candidateUFID.Text = string.Empty;
                }
                else
                {
                    Error.Text = "This candidate with UFID " + candidateUFID.Text + " is not an AIS member";
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VotingDataLayer;
using VotingEntityLayer;
using VotingExceptionLayer;

namespace VotingPresentationLayer
{
    public partial class Vote : System.Web.UI.Page
    {
        string position = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (PositionValidated())
                {
                    LoadData();
                    CheckVotingEligibility();
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMainMessage.Text = "There was an error with your request. Please try again";
                divAlert.Attributes.Remove("class");
                divAlert.Attributes.Add("class", "alert alert-danger animate-me-inverse");
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        protected void vote_button_Click(object sender, EventArgs e)
        {
            try
            {
                Button button = (sender as Button);

                string[] args = button.CommandArgument.Split(';');

                string selectedCandidateId = args[0];
                string selectedCandidateName = args[1];

                VotingData data = new VotingData();
                string voterId = Session["user"].ToString();

                if (data.CheckAlreadyVoted(voterId, position))
                {
                    lblMainMessage.Text = "You have already voted for " + position;
                    divAlert.Attributes.Remove("class");
                    divAlert.Attributes.Add("class", "alert alert-danger animate-me-inverse");
                }
                else
                {
                    string term = data.GetCurrentTerm();
                    data.Vote(voterId, selectedCandidateId, position, term);
                    String complete = "swal({title: 'Vote Registered', text: 'You voted " + selectedCandidateName + "', type: 'success', timer: 3000, showConfirmButton: false })";
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "voted", complete, true);
                    
                    lblMainMessage.Text = "Thanks for voting!";
                    divAlert.Attributes.Remove("class");
                    divAlert.Attributes.Add("class", "alert alert-success animate-me-inverse");
                    EnableVoting(false);
                }
            }
            catch (Exception ex)
            {
                lblMainMessage.Text = "There was an error registering your vote. Please try again";
                divAlert.Attributes.Remove("class");
                divAlert.Attributes.Add("class", "alert alert-danger animate-me-inverse");
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        private void CheckVotingEligibility()
        {
            string ufid = Session["user"].ToString();
            VotingData data = new VotingData();
            bool alreadyVoted = data.CheckAlreadyVoted(ufid, position);

            if (alreadyVoted)
            {
                EnableVoting(false);
                lblMainMessage.Text = "You have already voted for " + position;
                divAlert.Attributes.Remove("class");
                divAlert.Attributes.Add("class", "alert alert-warning animate-me-inverse");
            }
            else if (data.GetPositionActivationStatus(position))
            {
                EnableVoting(true);
                lblMainMessage.Text = "Voting is now active for " + position;
                divAlert.Attributes.Remove("class");
                divAlert.Attributes.Add("class", "alert alert-info animate-me-inverse");
            }
            else
            {
                EnableVoting(false);
                lblMainMessage.Text = "Voting is currently inactive for " + position;
                divAlert.Attributes.Remove("class");
                divAlert.Attributes.Add("class", "alert alert-info animate-me-inverse");
            }
        }

        private void EnableVoting(bool status)
        {
            foreach (RepeaterItem item in rptCandidates.Items)
            {
                Button voteButton = (Button)item.FindControl("btnVote");
                voteButton.Visible = status;
            }
        }

        private void LoadData()
        {
            string dataTableName = "candidates";

            DataView candidates = HttpContext.Current.Cache[dataTableName] as DataView;
            if (candidates == null)
            {
                VotingData data = new VotingData();
                candidates = data.GetElectionCandidates();
                HttpContext.Current.Cache.Insert(dataTableName, candidates, null, DateTime.Now.AddHours(2), System.Web.Caching.Cache.NoSlidingExpiration);
            }
            candidates.RowFilter = "Position = '" + position + "'";

            if (candidates.Count > 0)
            {
                rptCandidates.DataSource = candidates;
                rptCandidates.DataBind();
                rptCandidates.Visible = true;
                divAlert.Visible = true;
                divNoCandidates.Visible = false;
            }
            else
            {
                rptCandidates.Visible = false;
                divAlert.Visible = false;
                divNoCandidates.Visible = true;                
            }
        }

        private bool PositionValidated()
        {
            bool validated = false;
            if (Request.QueryString["Position"] != null)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["Position"]))
                {
                    position = Request.QueryString["Position"].ToString();

                    if (position.Contains("Membership"))
                    {
                        position = "Membership & Treasury";
                    }

                    if (position.Contains("Media"))
                    {
                        position = "Media & Communication";
                    }

                    if (position.Contains("Alumni"))
                    {
                        position = "Alumni Relations";
                    }
                }
            }

            List<string> positions = new List<string>();
            positions.Add("President");
            positions.Add("Corporate Relations");
            positions.Add("Leadership Development");
            positions.Add("Membership & Treasury");
            positions.Add("Networking");
            positions.Add("Media & Communication");
            positions.Add("Alumni Relations");

            validated = positions.Contains(position);
            return validated;
        }
    }
}
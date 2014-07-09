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
    public partial class Voting : System.Web.UI.Page
    {
        string position = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (PositionValidated())
                {
                    CheckVotingEligibility();
                }
                else
                {
                    Response.Redirect("VotingHome.aspx");
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        private bool PositionValidated()
        {
            bool validated = false;
            if (Request.QueryString["Position"] != null)
                if (!String.IsNullOrEmpty(Request.QueryString["Position"]))
                    position = Request.QueryString["Position"].ToString();

            List<string> positions = new List<string>();
            positions.Add("President");
            positions.Add("Corporate Relations");
            positions.Add("Leadership Development");
            positions.Add("Treasury");
            positions.Add("Internal Networking");
            positions.Add("Media Distribution");

            validated = positions.Contains(position);
            return validated;
        }

        protected void vote_button_Click(object sender, EventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                string ufid = Session["user"].ToString();

                if (data.CheckAlreadyVoted(ufid, position))
                {
                    inactiveMessage.Text = "You have already voted for " + position;
                    activeVoting.Visible = false;
                    inactiveVoting.Visible = true;
                }
                else if (candidates.SelectedIndex != -1)
                {
                    string term = data.GetCurrentTerm();
                    data.Vote(ufid, candidates.SelectedValue, position, term);
                    inactiveMessage.Text = "Your vote has been registered.<br />Thanks for voting!";
                    activeVoting.Visible = false;
                    inactiveVoting.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        private void CheckVotingEligibility()
        {
            string ufid = Session["user"].ToString();
            positionHeading.Text = "Vote for " + position;
            VotingData data = new VotingData();

            if (data.CheckAlreadyVoted(ufid, position))
            {
                inactiveMessage.Text = "You have already voted for " + position;
                activeVoting.Visible = false;
                inactiveVoting.Visible = true;
            }
            else if (data.GetPositionActivationStatus(position))
            {
                activeVoting.Visible = true;
                inactiveVoting.Visible = false;
                EnableVoting();
            }
            else
            {
                inactiveMessage.Text = "Voting has not begun for " + position + ".<br />Please wait.<br />We appreciate your patience.";
                activeVoting.Visible = false;
                inactiveVoting.Visible = true;
            }
        }

        private void EnableVoting()
        {
            VotingData data = new VotingData();
            List<VotingCandidate> votingCandidates = data.GetCandidates(position);

            foreach (VotingCandidate candidate in votingCandidates)
            {
                if (string.IsNullOrEmpty(candidate.ProfileImage))
                {
                    candidate.ProfileImage = "unknown.jpg";
                }

                string imageURL = @"images/" + candidate.ProfileImage;
                string name = data.GetMemberNameByUFID(candidate.UFID);
                string profile = string.Format("<center><div  class='profile-image'><img src='{0}' alt='{1}' width='120px' height='150px' /></div><div class='profile-name'>{1}</div><center>", imageURL, name);

                ListItem item = new ListItem();
                item.Text = profile;
                item.Value = candidate.UFID;
                candidates.Items.Add(item);
            }
        }
    }
}
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
using System.Data;

namespace VotingPresentationLayer
{
    public partial class DeleteCandidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VotingData data = new VotingData();
                candidateHeading.Text = "Voting Candidates for " + data.GetCurrentTerm();
            }
        }

        protected void aisCandidates_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                string ufid = aisCandidates.DataKeys[e.RowIndex].Value.ToString();
                string profileImage = data.GetCandidatesProfileImage(ufid);
                if (!string.IsNullOrEmpty(profileImage))
                {
                    File.Delete(Server.MapPath("~/images/candidates/" + profileImage));
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        protected string GetImageUrl(string profileImage)
        {
            //if (File.Exists(Server.MapPath("~/images/candidates/" + profileImage))) can also be used
            if (!string.IsNullOrEmpty(profileImage))
            {
                return "~/images/candidates/" + profileImage;
            }
            else
            {
                return "~/images/unknown.jpg";
            }
        }

        protected void aisCandidates_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                DataView candidates = data.GetElectionCandidates();
                HttpContext.Current.Cache.Insert("candidates", candidates, null, DateTime.Now.AddHours(2), System.Web.Caching.Cache.NoSlidingExpiration);
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
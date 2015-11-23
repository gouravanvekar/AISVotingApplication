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
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rblFeedback_Mode_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblFeedback_Mode.SelectedItem.Text == "Anonymous")
            {
                lblMessage.Text = "Your feedback will be saved anonymously";
            }
            else
                lblMessage.Text = "Your name will saved with your feedback";
        }

        protected void save_feedback_Click(object sender, EventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                string ufid = Session["user"].ToString();

                MemberFeedback feedback = new MemberFeedback();
                feedback.Rating = int.Parse(rblRating.SelectedValue);
                feedback.FeedbackDescription = txtComments.Text;

                if (rblFeedback_Mode.SelectedItem.Text != "Anonymous")
                {
                    feedback.FeedbackDescription += " - " + data.GetMemberNameByUFID(ufid);
                }

                if(data.StoreFeedback(feedback))
                {
                    Error.Text = "Your feedback is submitted. Thank you.";
                }
                else
                    Error.Text = "Error while saving your feedback";
            }
            catch (Exception ex)
            {
                Error.Text = "Error while saving your feedback";
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
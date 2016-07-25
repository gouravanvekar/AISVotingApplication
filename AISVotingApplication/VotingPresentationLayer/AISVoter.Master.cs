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
    public partial class AISVoter : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["user"] == null)
                    Response.Redirect("Default.aspx");
                if (!IsPostBack)
                {
                    VotingData data = new VotingData();
                    if (Session["user"] != null)
                        UserName.Text = "<b> Welcome, " + data.GetMemberNameByUFID(Session["user"].ToString()) + "!</b>";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void save_feedback_Click(object sender, EventArgs e)
        {
            try
            {
                if (rblRating.SelectedIndex < 0)
                {
                    lblMessage.Text = "Please select a rating value";
                    lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                }
                else
                {
                    VotingData data = new VotingData();
                    string ufid = Session["user"].ToString();

                    MemberFeedback feedback = new MemberFeedback();
                    feedback.Rating = int.Parse(rblRating.SelectedValue);
                    feedback.FeedbackDescription = data.GetMemberNameByUFID(ufid) + ": " + txtComments.Text;

                    if (data.StoreFeedback(feedback))
                    {
                        lblMessage.Text = "Thanks for rating!";
                        lblMessage.CssClass = "alert alert-success center-block alert-success-class";
                    }
                    else
                    {
                        lblMessage.Text = "Error while saving your feedback";
                        lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                        txtComments.Text = string.Empty;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error while saving your feedback";
                lblMessage.CssClass = "alert alert-danger center-block alert-danger-class";
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
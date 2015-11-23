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
    public partial class BreakUpAnalysis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindGridView();
                    BindGraph();
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        protected void positions_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                BindGridView();
                BindGraph();
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        protected void btnRefresh_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                BindGridView();
                BindGraph();
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        private void BindGridView()
        {
            VotingData data = new VotingData();
            if (positions.SelectedIndex != -1)
            {
                positionResults.DataSource = data.GetVotingResults(positions.SelectedItem.Text);
                positionResults.DataBind();
            }
        }

        private void BindGraph()
        {
            VotingData data = new VotingData();
            if (positions.SelectedIndex != -1)
            {
                VotingEntityLayer.BreakUpAnalysis breakUpAnalysis = data.GetBreakUpAnalysis(positions.SelectedItem.Text);
                ChartTitle.Value = breakUpAnalysis.ChartTitle;
                ChartSubtitle.Value = breakUpAnalysis.ChartSubtitle;

                Candidate0.Text = breakUpAnalysis.CandidateNames[0];
                Candidate1.Text = breakUpAnalysis.CandidateNames[1];
                Candidate2.Text = breakUpAnalysis.CandidateNames[2];
                Candidate3.Text = breakUpAnalysis.CandidateNames[3];
                Candidate4.Text = breakUpAnalysis.CandidateNames[4];
                Candidate5.Text = breakUpAnalysis.CandidateNames[5];

                VotePercent0.Text = breakUpAnalysis.VotingPercentages[0];
                VotePercent1.Text = breakUpAnalysis.VotingPercentages[1];
                VotePercent2.Text = breakUpAnalysis.VotingPercentages[2];
                VotePercent3.Text = breakUpAnalysis.VotingPercentages[3];
                VotePercent4.Text = breakUpAnalysis.VotingPercentages[4];
                VotePercent5.Text = breakUpAnalysis.VotingPercentages[5];
            }
        }
    }
}
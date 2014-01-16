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
    public partial class VotingResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                votingStatistics.DataSource = data.GetResultStatistics();
                votingStatistics.DataBind();

                if (positions.SelectedIndex != -1)
                {
                    positionResults.DataSource = data.GetVotingResults(positions.SelectedItem.Text);
                    positionResults.DataBind();
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
                VotingData data = new VotingData();
                if (positions.SelectedIndex != -1)
                {
                    positionResults.DataSource = data.GetVotingResults(positions.SelectedItem.Text);
                    positionResults.DataBind();
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
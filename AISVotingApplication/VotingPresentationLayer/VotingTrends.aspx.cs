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
    public partial class VotingTrends : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ChartTitle.Value = "AIS Voting Trends";
                ChartSubtitle.Value = "Comparison of current and recent voting trends";

                VotingData data = new VotingData();
                string currentTerm = data.GetCurrentTerm();
                string prevTerm = data.GetPreviousTerm();

                Series1Title.Value = currentTerm;
                Series2Title.Value = prevTerm;
                Series1.Value = data.GetVotingTrends(currentTerm);
                Series2.Value = data.GetVotingTrends(prevTerm);
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
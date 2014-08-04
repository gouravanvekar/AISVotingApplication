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
    public partial class ViewMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void aisMembers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                VotingData data = new VotingData();
                string ufid = aisMembers.DataKeys[e.RowIndex].Value.ToString();
                string profileImage = data.GetCandidatesProfileImage(ufid);
                if (!string.IsNullOrEmpty(profileImage))
                {
                    File.Delete(Server.MapPath("~/images/" + profileImage));
                }
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
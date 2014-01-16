using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VotingDataLayer;

namespace VotingPresentationLayer
{
    public partial class AISMember : System.Web.UI.MasterPage
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
                        UserName.Text = "<b> Welcome " + data.GetMemberNameByUFID(Session["user"].ToString()) + "!</b>";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
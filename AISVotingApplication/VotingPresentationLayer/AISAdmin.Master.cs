using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VotingPresentationLayer
{
    public partial class AISAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["user"] == null || Session["user"].ToString() != "admin")
                    Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
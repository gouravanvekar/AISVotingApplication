﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VotingPresentationLayer
{
    public partial class FindMemberByName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void find_button_Click(object sender, EventArgs e)
        {
            aisMembers.DataBind();
            aisMembers.Visible = true;
        }
    }
}
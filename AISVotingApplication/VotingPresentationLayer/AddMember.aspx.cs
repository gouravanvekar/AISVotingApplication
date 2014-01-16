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
    public partial class AddMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_button_Click(object sender, EventArgs e)
        {
            try
            {
                VotingEntityLayer.AISMember aisMember = new VotingEntityLayer.AISMember();
                aisMember.UFID = memberUFID.Text;

                //Current (temporary) UF AIS Password Policy (Without encryption)
                aisMember.Password = memberUFID.Text.ToLower() + lastname.Text.ToLower();
                aisMember.FirstName = firstname.Text;
                aisMember.LastName = lastname.Text;
                aisMember.MemberType = "member";

                //Assumed only paid members are added in the system
                aisMember.PaidMembershipFees = "Yes";

                VotingData votingData = new VotingData();
                votingData.AddMember(aisMember);

                Error.Text = "Member added successfully";
                memberUFID.Text = string.Empty;
                firstname.Text = string.Empty;
                lastname.Text = string.Empty;
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }
    }
}
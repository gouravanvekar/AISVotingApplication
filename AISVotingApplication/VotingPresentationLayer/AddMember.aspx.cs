using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VotingDataLayer;
using VotingEntityLayer;
using VotingExceptionLayer;
using System.IO;

namespace VotingPresentationLayer
{
    public partial class AddMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                multipleMembers.Visible = false;
            }
        }

        protected void add_button_Click(object sender, EventArgs e)
        {
            try
            {
                Error.Text = "";
                VotingData votingData = new VotingData();
                string ufid = votingData.ValidateUFID(memberUFID.Text);
                bool validatedData = ValidateSingleMemberFields(ufid);

                if (validatedData)
                {
                    if (string.IsNullOrEmpty(votingData.GetMemberNameByUFID(ufid)))
                    {
                        Error.Text = "";
                        VotingEntityLayer.AISMember aisMember = new VotingEntityLayer.AISMember();
                        aisMember.UFID = memberUFID.Text;

                        aisMember.FirstName = firstname.Text;
                        aisMember.LastName = lastname.Text;

                        if (!string.IsNullOrEmpty(Password.Text))
                        {
                            aisMember.Password = Password.Text;
                        }
                        else
                        {
                            //Default password 'aismember'
                            aisMember.Password = "aismember";
                        }
                        votingData.AddMember(aisMember);

                        //If member added successfully
                        Error.Text = "Member added successfully";
                        memberUFID.Text = string.Empty;
                        firstname.Text = string.Empty;
                        lastname.Text = string.Empty;
                    }
                    else
                        Error.Text = "Member already exists";
                }

            }
            catch (Exception ex)
            {
                Error.Text = "Cannot add member at this time";
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        protected void csvButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (csvUpload.HasFile)
                {
                    int[] count = new int[2] { 0, 0 };
                    VotingData votingData = new VotingData();
                    csvUpload.SaveAs(Server.MapPath("~/Scripts/" + csvUpload.FileName));
                    List<VotingEntityLayer.AISMember> members = GetMembersFromCSVFile();

                    count = votingData.AddMultipleMembers(members);
                    File.Delete(Server.MapPath("~/Scripts/" + csvUpload.FileName));

                    string updatedRecords = string.Empty;
                    if (count[1] > 0)
                    {
                        updatedRecords = " and<br />" + count[1].ToString() + " member(s) has(ve) been updated";
                    }

                    string skippedRecords = string.Empty;
                    if (aisMembers.Rows.Count > 0)
                    {
                        skippedRecords = " and<br />" + aisMembers.Rows.Count + " member(s) has(ve) been skipped<br /><br /><b>Skipped Records:</b>";
                    }

                    uploadError.Text = count[0].ToString() + " member(s) has(ve) been added successfully" + updatedRecords + skippedRecords;
                }
                else
                    uploadError.Text = "Could not add members. Please verify the file format";
            }
            catch (Exception ex)
            {
                ErrorLogs.LogErrors(ex.Message);
            }
        }

        protected void AddMembersList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (AddMembersList.SelectedIndex == 1)
            {
                multipleMembers.Visible = true;
                singleMember.Visible = false;
            }
            else
            {
                multipleMembers.Visible = false;
                singleMember.Visible = true;
            }
        }

        List<VotingEntityLayer.AISMember> GetMembersFromCSVFile()
        {
            List<VotingEntityLayer.AISMember> members = new List<VotingEntityLayer.AISMember>();
            List<VotingEntityLayer.AISMember> skippedMembers = new List<VotingEntityLayer.AISMember>();
            VotingEntityLayer.AISMember aisMember = null;
            VotingData votingData = new VotingData();

            StreamReader records = new StreamReader(Server.MapPath("~/Scripts/" + csvUpload.FileName));
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            string currentMember;

            while (!records.EndOfStream)
            {
                currentMember = records.ReadLine();
                aisMember = new VotingEntityLayer.AISMember();

                aisMember.UFID = currentMember.Split(',')[0].Replace("-", "");
                aisMember.Password = currentMember.Split(',')[1];
                aisMember.FirstName = currentMember.Split(',')[2];
                aisMember.LastName = currentMember.Split(',')[3];
                if (votingData.ValidateMemberRecord(aisMember))
                {
                    members.Add(aisMember);
                }
                else
                {
                    skippedMembers.Add(aisMember);
                }
            }
            records.Close();
            aisMembers.DataSource = skippedMembers;
            aisMembers.DataBind();
            return members;
        }

        private bool ValidateSingleMemberFields(string ufid)
        {
            VotingData votingData = new VotingData();
            bool validatedData = true;
            if (string.IsNullOrEmpty(ufid))
            {
                validatedData = false;
                Error.Text = "Invalid Email<br />";
            }
            if (!votingData.ValidateName(firstname.Text))
            {
                validatedData = false;
                Error.Text += "Invalid Firstname<br />";
            }
            if (!votingData.ValidateName(lastname.Text))
            {
                validatedData = false;
                Error.Text += "Invalid Lastname";
            }
            return validatedData;
        }
    }
}
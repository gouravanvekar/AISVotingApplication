using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VotingEntityLayer
{
    /// <summary>
    /// Class to store AIS Member's information
    /// </summary>
    public class AISMember
    {
        public string UFID { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EMail { get; set; }
        public string Phone { get; set; }
        public string MemberType { get; set; }
        public string PaidMembershipFees { get; set; }
    }

    /// <summary>
    /// Class to store election candidate's information
    /// </summary>
    public class VotingCandidate
    {
        public string UFID { get; set; }
        public string Position { get; set; }
        public string Term { get; set; }
        public string ProfileImage { get; set; }
        public int NoOfVotes { get; set; }
    }

    /// <summary>
    /// Class to store details of the casted vote
    /// </summary>
    public class Vote
    {
        public string VoterUFID { get; set; }
        public string CandidateUFID { get; set; }
        public string Position { get; set; }
    }
}

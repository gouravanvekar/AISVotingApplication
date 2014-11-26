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

    /// <summary>
    /// Class to store details of the voting, which will help in the break-up analysis
    /// </summary>
    public class BreakUpAnalysis
    {
        public string ChartTitle { get; set; }
        public string ChartSubtitle { get; set; }
        public List<string> CandidateNames { get; set; }
        public List<string> VotingPercentages { get; set; }
        public int TotalVotes { get; set; }
    }

    public class MemberFeedback
    {
        public int Rating { get; set; }
        public string FeedbackDescription { get; set; }
    }
}
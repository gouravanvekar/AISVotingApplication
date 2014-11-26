using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using VotingEntityLayer;
using VotingExceptionLayer;
using System.Text.RegularExpressions;

namespace VotingDataLayer
{
    public class VotingData
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

        #region Member/Admin Methods

        /// <summary>
        /// Contructor to initialize SQL connection
        /// </summary>
        public VotingData()
        {
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["VotingData"].ConnectionString;
        }

        /// <summary>
        /// Method to validate user
        /// </summary>
        /// <param name="ufid">UFID</param>
        /// <param name="pwd">Password</param>
        /// <returns>Validity of the user</returns>
        public bool ValidateUser(string ufid, string pwd)
        {
            try
            {
                cmd = new SqlCommand();
                bool validate = false;
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT * FROM Login_Details WHERE UFID='{0}' AND password='{1}'", ufid, pwd);

                con.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    validate = true;
                }
                dr.Close();
                con.Close();
                return validate;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while validating user", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to get login password
        /// </summary>
        /// <param name="ufid">UFID</param>
        /// <returns>Password</returns>
        public string GetPassword(string ufid)
        {
            try
            {
                cmd = new SqlCommand();
                string pass = string.Empty;
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT Password FROM Login_Details WHERE UFID='{0}'", ufid);

                con.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    pass = dr[0].ToString();
                }

                dr.Close();
                con.Close();
                return pass;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving password", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to change password
        /// </summary>
        /// <param name="ufid">User's login ID</param>
        /// <param name="newPassword">New Password</param>
        public void SetNewPassword(string ufid, string newPassword)
        {
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                cmd.CommandText = string.Format("UPDATE Login_Details SET Password='{0}' WHERE UFID='{1}'", newPassword, ufid);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while changing the password", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to get member name by UFID
        /// </summary>
        /// <param name="ufid">UFID</param>
        /// <returns>Member Name</returns>
        public string GetMemberNameByUFID(string ufid)
        {
            try
            {
                cmd = new SqlCommand();
                string name = string.Empty;

                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT First_Name, Last_Name FROM AIS_Members WHERE UFID='{0}'", ufid);

                con.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    name = dr[0].ToString() + " " + dr[1].ToString();
                }

                dr.Close();
                con.Close();
                return name;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving member", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to get member details
        /// </summary>
        /// <param name="ufid">UFID</param>
        /// <returns>Member details</returns>
        public AISMember GetMemberDetails(string ufid)
        {
            try
            {
                cmd = new SqlCommand();
                AISMember member = new AISMember();
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT * FROM AIS_Members WHERE UFID='{0}'", ufid);

                con.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    member.UFID = ufid;
                    member.FirstName = dr[1].ToString();
                    member.LastName = dr[2].ToString();
                }
                else
                {
                    member = null;
                }

                dr.Close();
                con.Close();
                return member;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving member details", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to add new member
        /// </summary>
        /// <param name="member">New member details</param>
        public void AddMember(AISMember member)
        {
            SqlTransaction transaction = null;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;

                con.Open();
                transaction = con.BeginTransaction();
                cmd.Transaction = transaction;
                cmd.CommandText = string.Format("INSERT INTO Login_Details VALUES('{0}','{1}')", member.UFID, member.Password);
                cmd.ExecuteNonQuery();

                cmd.CommandText = string.Format("INSERT INTO AIS_Members VALUES('{0}','{1}','{2}')", member.UFID, member.FirstName, member.LastName);
                cmd.ExecuteNonQuery();
                transaction.Commit();
            }
            catch (AISException ex)
            {
                transaction.Rollback();
                throw new AISException("Error while adding member", ex);
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to add multiple members
        /// </summary>
        /// <param name="members">Details of multiple members</param>
        /// <returns>Count of records inserted</returns>
        public int[] AddMultipleMembers(List<AISMember> members)
        {
            int[] count = new int[2] { 0, 0 };
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();

                foreach (AISMember member in members)
                {
                    try
                    {
                        cmd.CommandText = string.Format("INSERT INTO Login_Details VALUES('{0}','{1}')", member.UFID, member.Password);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = string.Format("INSERT INTO AIS_Members VALUES('{0}','{1}','{2}')", member.UFID, member.FirstName, member.LastName);
                        cmd.ExecuteNonQuery();
                        count[0]++;
                    }
                    catch (Exception)
                    {
                        cmd.CommandText = string.Format("UPDATE Login_Details SET Password='{0}' WHERE UFID='{1}'", member.Password, member.UFID);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = string.Format("UPDATE AIS_Members SET First_Name='{0}', Last_Name='{1}' WHERE UFID='{2}'", member.FirstName, member.LastName, member.UFID);
                        cmd.ExecuteNonQuery();
                        count[1]++;
                    }
                }
            }
            catch (AISException ex)
            {
                throw new AISException("Error while adding members", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return count;
        }

        /// <summary>
        /// Method to reset tables in the database for the new term
        /// </summary>
        public void ResetElectionForNewTerm()
        {
            try
            {
                string currentTerm = GetCurrentTerm();
                string prevTerm = GetPreviousTerm();

                cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();

                #region Voting Trends Reset

                cmd.CommandText = string.Format("DELETE FROM Voting_Trends WHERE Term != '{0}'", prevTerm);
                cmd.ExecuteNonQuery();

                string[] positions = new string[6] { "President", "Corporate Relations", "Leadership Development", "Membership & Treasury", "Networking", "Media & Communication" };

                foreach (string position in positions)
                {
                    cmd.CommandText = string.Format("INSERT INTO Voting_Trends (Term, Position) VALUES ('{0}','{1}')", currentTerm, position);
                    cmd.ExecuteNonQuery();
                }

                #endregion

                //Deactivate voting for all positions
                cmd.CommandText = "UPDATE Voting_Activation SET Activated = 'No'";
                cmd.ExecuteNonQuery();

                //Delete all records from Feedback table
                cmd.CommandText = "TRUNCATE TABLE Feedback";
                cmd.ExecuteNonQuery();

                //Delete all records from Vote_Bank table
                cmd.CommandText = "TRUNCATE TABLE Vote_Bank";
                cmd.ExecuteNonQuery();

                //Delete all logins, members and candidates
                cmd.CommandText = "DELETE FROM Login_Details WHERE UFID != 'admin'";
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while deleting records", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to get profile image paths of the candidates
        /// </summary>
        /// <returns>Profile image paths</returns>
        public List<string> GetCandidateProfileImages()
        {
            try
            {
                cmd = new SqlCommand();
                List<string> profileImages = new List<string>();
                cmd.Connection = con;
                cmd.CommandText = "SELECT Profile_Image FROM Voting_Candidate";

                con.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    if (!string.IsNullOrEmpty(dr[0].ToString()))
                    {
                        profileImages.Add(dr[0].ToString());
                    }
                }
                con.Close();
                return profileImages;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while getting profile images", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to get profile image path of a candidate
        /// </summary>
        /// <returns>Profile image path</returns>
        public string GetCandidatesProfileImage(string ufid)
        {
            try
            {
                cmd = new SqlCommand();
                string profileImage = string.Empty;
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT Profile_Image FROM Voting_Candidate WHERE UFID='{0}'", ufid);

                con.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    if (!string.IsNullOrEmpty(dr[0].ToString()))
                    {
                        profileImage = dr[0].ToString();
                    }
                }
                con.Close();
                return profileImage;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while getting profile images", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Voting Methods

        /// <summary>
        /// Method to retrive activation status for a specific position
        /// </summary>
        /// <param name="position">Position</param>
        /// <returns>Activation Status</returns>
        public bool GetPositionActivationStatus(string position)
        {
            try
            {
                cmd = new SqlCommand();
                bool activated = false;
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT Activated FROM Voting_Activation WHERE Position='{0}'", position);

                con.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    if (dr[0].ToString().ToLower() == "yes")
                        activated = true;
                }

                dr.Close();
                con.Close();
                return activated;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving activation status", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to check if the member has already voted for a specific position
        /// </summary>
        /// <param name="ufid">UFID</param>
        /// <param name="position">Position</param>
        /// <returns>Voting Status</returns>
        public bool CheckAlreadyVoted(string ufid, string position)
        {
            try
            {
                cmd = new SqlCommand();
                bool voted = false;
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT * FROM Vote_Bank WHERE Voters_UFID='{0}' AND Position='{1}'", ufid, position);

                con.Open();
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    voted = true;
                }
                dr.Close();
                con.Close();
                return voted;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving voting status", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to register vote
        /// </summary>
        /// <param name="votersUFID">Member's UFID</param>
        /// <param name="candidatesUFID">Candidate's UFID</param>
        /// <param name="position">Voting Position</param>
        /// <param name="term">Election term</param>
        public void Vote(string votersUFID, string candidatesUFID, string position, string term)
        {
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                cmd.CommandText = string.Format("INSERT INTO Vote_Bank VALUES('{0}','{1}','{2}','{3}')", votersUFID, candidatesUFID, position, term);
                cmd.ExecuteNonQuery();

                cmd.CommandText = string.Format("UPDATE Voting_Trends SET Final_Vote_Count = Final_Vote_Count + 1 WHERE Term = '{0}' And Position = '{1}'", term, position);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while registering vote", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to add new voting candidate
        /// </summary>
        /// <param name="candidate">Candidate details</param>
        /// <returns>Candidate Validity</returns>
        public bool AddVotingCandidate(VotingCandidate candidate)
        {
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                cmd.CommandText = string.Format("INSERT INTO Voting_Candidate VALUES('{0}','{1}','{2}','{3}')", candidate.UFID, candidate.Position, candidate.Term, candidate.ProfileImage);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while adding voting candidate", ex);
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
            return true;
        }

        /// <summary>
        /// Method to store member feedback
        /// </summary>
        /// <param name="feedback">Member's feedback</param>
        /// <returns>Update status</returns>
        public bool StoreFeedback(MemberFeedback feedback)
        {
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                con.Open();
                cmd.CommandText = string.Format("INSERT INTO Feedback(Rating, Feedback) VALUES({0},'{1}')", feedback.Rating, feedback.FeedbackDescription);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while adding Feedback", ex);
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
            return true;
        }

        /// <summary>
        /// Method to retrive voting candidates
        /// </summary>
        /// <param name="position">Voting position</param>
        /// <returns>List of candidates for the specified position</returns>
        public List<VotingCandidate> GetCandidates(string position)
        {
            try
            {
                cmd = new SqlCommand();
                List<VotingCandidate> candidates = new List<VotingCandidate>();
                VotingCandidate candidate = null;

                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT * FROM Voting_Candidate WHERE Position='{0}'", position);

                con.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    candidate = new VotingCandidate();
                    candidate.UFID = dr[0].ToString();
                    candidate.Term = dr[2].ToString();
                    candidate.ProfileImage = dr[3].ToString();
                    candidate.Position = position;
                    candidates.Add(candidate);
                }

                dr.Close();
                con.Close();
                return candidates;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving candidates", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to retrive elected candidates by the logged in user
        /// </summary>
        /// <param name="position">User's UFID</param>
        /// <returns>List of elected candidates</returns>
        public DataTable GetElectedCandidates(string ufid)
        {
            DataSet ds;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT V.Position AS Position, COALESCE(A.First_Name, '') + ' ' + COALESCE(A.Last_Name, '') AS 'Elected Candidate' FROM AIS_Members A, Vote_Bank V WHERE V.Candidates_UFID = A.UFID And V.Voters_UFID='{0}'", ufid);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving elected candidates", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return ds.Tables[0];
        }

        /// <summary>
        /// Method to retrive voting result dataset
        /// </summary>
        /// <returns>Voting result dataset</returns>
        public DataTable GetResultDataSet()
        {
            DataSet ds;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = @"SELECT A.UFID VotersUFID, COALESCE(A.First_Name, '') VoterFname, COALESCE(A.Last_Name, '') VoterLname, C.UFID CandidatesUFID,  COALESCE(C.First_Name, '') CandidateFname, COALESCE(C.Last_Name, '') CandidateLname, COALESCE(Position, '') Position, COALESCE(Term, '') Term
                                    FROM Vote_Bank B
                                    JOIN AIS_Members A ON A.UFID = B.Voters_UFID
                                    JOIN AIS_Members C ON C.UFID = B.Candidates_UFID";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving result dataset", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return ds.Tables[0];
        }

        /// <summary>
        /// Method to retrive voting result statistics
        /// </summary>
        /// <returns>Voting result statistics</returns>
        public DataTable GetResultStatistics()
        {
            DataSet ds;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = @"SELECT { fn IFNULL(Position, 'Total Voters') } AS 'Positions', COUNT(DISTINCT Voters_UFID) AS 'No. of Voters' FROM Vote_Bank GROUP BY Position WITH ROLLUP";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving result statistics", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return ds.Tables[0];
        }

        /// <summary>
        /// Method to retrive voting results for the given position
        /// </summary>
        /// <param name="position">Position</param>
        /// <returns>Voting results for the given position</returns>
        public DataTable GetVotingResults(string position)
        {
            DataSet ds;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT COALESCE(A.First_Name, '') + ' ' + COALESCE(A.Last_Name, '') AS 'Candidate Name', COUNT(V.Candidates_UFID) AS Votes FROM AIS_Members A, Vote_Bank V WHERE V.Candidates_UFID = A.UFID And V.Position='{0}' GROUP BY V.Candidates_UFID, A.First_Name, A.Last_Name", position);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving voting results", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return ds.Tables[0];
        }

        /// <summary>
        /// Method to retrive final voting results
        /// </summary>
        /// <returns>Final voting results</returns>
        public DataTable GetFinalVotingResults()
        {
            DataSet ds;
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;

                cmd.CommandText = @"WITH FinalResult AS
                                    (
                                        SELECT V.Position AS Position, COALESCE(A.First_Name, '') + ' ' + COALESCE(A.Last_Name, '') AS Winner, COUNT(V.Candidates_UFID) AS Votes
                                        FROM AIS_Members A, Vote_Bank V 
                                        WHERE V.Candidates_UFID = A.UFID
                                        GROUP BY V.Position, V.Candidates_UFID, A.First_Name, A.Last_Name
                                    )
                                    SELECT FinalResult.*
                                    FROM FinalResult
                                    JOIN (
                                            SELECT Position, MAX(Votes) AS VotesReceived
                                            FROM FinalResult 
                                            GROUP BY Position
                                         ) maxvotes
                                         ON FinalResult.Position = maxvotes.Position 
                                         AND FinalResult.Votes = maxvotes.VotesReceived";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                con.Close();
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving final voting results", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            return ds.Tables[0];
        }

        /// <summary>
        /// Method to retrive voting trends
        /// </summary>
        /// <param name="position">Voting term</param>
        /// <returns>Voting statistics for that term</returns>
        public string GetVotingTrends(string term)
        {
            try
            {
                cmd = new SqlCommand();
                string trendValues = string.Empty;
                cmd.Connection = con;
                cmd.CommandText = string.Format("SELECT Final_Vote_Count FROM Voting_Trends WHERE Term='{0}'", term);

                con.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    trendValues += dr[0].ToString() + ", ";
                }

                if (trendValues.Length > 0)
                {
                    trendValues = trendValues.Substring(0, trendValues.Length - 2);
                }

                dr.Close();
                con.Close();
                return trendValues;
            }
            catch (AISException ex)
            {
                throw new AISException("Error while retriving candidates", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Method to generate Break Up Analysis
        /// </summary>
        /// <param name="position">Position</param>
        /// <returns>Break Up Analysis</returns>
        public BreakUpAnalysis GetBreakUpAnalysis(string position)
        {
            BreakUpAnalysis breakUpAnalysis = new BreakUpAnalysis();
            try
            {
                breakUpAnalysis.ChartTitle = "AIS Voting Results, " + GetCurrentTerm();
                breakUpAnalysis.ChartSubtitle = "Poll results for " + position + "<br />";

                DataTable pollResults = GetVotingResults(position);
                DataTable positionVotes = GetResultStatistics();

                breakUpAnalysis.CandidateNames = new List<string> { position, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty };
                breakUpAnalysis.VotingPercentages = new List<string> { "00.00%", "00.00%", "00.00%", "00.00%", "00.00%", "00.00%" };
                int i = 1;

                foreach (DataRow row in positionVotes.Rows)
                {
                    if (row["Positions"].ToString() == position)
                    {
                        breakUpAnalysis.TotalVotes = int.Parse(row["No. of Voters"].ToString());
                    }
                }

                if (breakUpAnalysis.TotalVotes != 0)
                {
                    foreach (DataRow row in pollResults.Rows)
                    {
                        breakUpAnalysis.CandidateNames[i] = row["Candidate Name"].ToString();
                        breakUpAnalysis.VotingPercentages[i++] = (double.Parse(row["Votes"].ToString()) / (double)breakUpAnalysis.TotalVotes * 100).ToString("00.00") + "%";
                    }
                }

            }
            catch (AISException ex)
            {
                throw new AISException("Error while generating break-up analysis", ex);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return breakUpAnalysis;
        }

        #endregion

        #region General Methods

        /// <summary>
        /// Method to return current term
        /// </summary>
        /// <returns>current term</returns>
        public string GetCurrentTerm()
        {
            string term = string.Empty;
            if (DateTime.Now.Month <= 6)
            {
                term = "Spring " + DateTime.Now.Year.ToString();
            }
            else
            {
                term = "Fall " + DateTime.Now.Year.ToString();
            }
            return term;
        }

        /// <summary>
        /// Method to return previous term
        /// </summary>
        /// <returns>Previous term</returns>
        public string GetPreviousTerm()
        {
            string prevTerm = string.Empty;
            if (DateTime.Now.Month <= 6)
            {
                prevTerm = "Fall " + (DateTime.Now.Year - 1).ToString();
            }
            else
            {
                prevTerm = "Spring " + DateTime.Now.Year.ToString();
            }
            return prevTerm;
        }

        /// <summary>
        /// Method to validate UFID
        /// </summary>
        /// <param name="ufid">UFID</param>
        /// <returns>Validated UFID</returns>
        public string ValidateUFID(string ufid)
        {
            ufid = ufid.ToLower();
            string validatedUFID = string.Empty;
            try
            {
                if (ufid.Contains("@ufl.edu") || ufid.Contains("admin"))
                {
                    var regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$|admin");
                    if (regex.Matches(ufid)[0].Value == ufid)
                    {
                        validatedUFID = ufid;
                    }
                }
            }
            catch (Exception)
            {
                return string.Empty;
            }
            return validatedUFID;
        }

        /// <summary>
        /// Method to validate Name
        /// </summary>
        /// <param name="name">Name</param>
        /// <returns>Validation status</returns>
        public bool ValidateName(string name)
        {
            bool validated = false;
            try
            {
                var regex = new Regex(@"^\p{L}+(\s+\p{L}+)*$");
                if (regex.Matches(name)[0].Value == name)
                {
                    validated = true;
                }
            }
            catch (Exception)
            {
                return false;
            }
            return validated;
        }

        /// <summary>
        /// Method to validate a record obtained from CSV
        /// </summary>
        /// <param name="member">CSV record</param>
        /// <returns>Record Validity</returns>
        public bool ValidateMemberRecord(AISMember member)
        {
            try
            {
                if (member.UFID.ToLower() == "admin")
                {
                    return false;
                }

                var regex = new Regex(@"\d{8}");
                if (regex.Matches(member.UFID)[0].Value != member.UFID)
                {
                    return false;
                }

                regex = new Regex(@"^\p{L}+(\s+\p{L}+)*$");
                if ((regex.Matches(member.FirstName)[0].Value != member.FirstName) || (regex.Matches(member.LastName)[0].Value != member.LastName))
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        #endregion
    }
}
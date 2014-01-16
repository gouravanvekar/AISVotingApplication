using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using VotingEntityLayer;
using VotingExceptionLayer;

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
                    member.EMail = dr[3].ToString();
                    member.Phone = dr[4].ToString();
                    member.MemberType = dr[5].ToString();
                    member.PaidMembershipFees = dr[6].ToString().ToLower();
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
        ///  Method to get member type (Admin, President or Member)
        /// </summary>
        /// <param name="ufid">UFID</param>
        /// <returns>Member Type</returns>
        public string GetMemberType(string ufid)
        {
            string memberType = null;
            AISMember member = GetMemberDetails(ufid);
            if (member != null)
            {
                memberType = member.MemberType;
            }
            return memberType;
        }

        /// <summary>
        /// Method to add new member
        /// </summary>
        /// <param name="member">New member details</param>
        public void AddMember(AISMember member)
        {
            SqlTransaction transaction = con.BeginTransaction();
            try
            {
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.Transaction = transaction;
                cmd.CommandText = string.Format("INSERT INTO Login_Details VALUES('{0}','{1}')", member.UFID, member.Password);

                con.Open();
                cmd.ExecuteNonQuery();

                cmd.CommandText = string.Format("INSERT INTO AIS_Members VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", member.UFID, member.FirstName, member.LastName, member.EMail, member.Phone, member.MemberType, member.PaidMembershipFees);
                cmd.ExecuteNonQuery();
                
                con.Close(); 
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
        public void AddVotingCandidate(VotingCandidate candidate)
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
                throw ex;
            }
            finally
            {
                con.Close();
            }
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

        #endregion
    }
}

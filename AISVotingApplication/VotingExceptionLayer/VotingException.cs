using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Configuration;

namespace VotingExceptionLayer
{
    public class AISException : ApplicationException
    {
        /// <summary>
        /// Default handling of the error
        /// </summary>
        public AISException()
            : base()
        {
            ErrorLogs.LogErrors("Unknown error occurred");
        }

        /// <summary>
        /// Creates an Exception object with specific Message
        /// </summary>
        /// <param name="message">The Message for the Exception</param>
        public AISException(string message)
            : base(message)
        {
            ErrorLogs.LogErrors(message);
        }

        /// <summary>
        /// Creates a Exception object with specified Message and the Inner Exception that raised this Error
        /// </summary>
        /// <param name="message">The Message of the Exception</param>
        /// <param name="innerException">The System Exception that raised this Exception</param>
        public AISException(string message, Exception innerException)
            : base(message, innerException)
        {
            ErrorLogs.LogErrors(message + "\n" + innerException.Message);
        }
    }

    /// <summary>
    /// Helper Class for Logging Errors to the Text file
    /// </summary>
    public class ErrorLogs
    {
        /// <summary>
        /// Logs the error messages
        /// </summary>
        /// <param name="message">Error message</param>
        public static void LogErrors(string message)
        {
            try
            {
                StreamWriter writer = new StreamWriter(ConfigurationManager.AppSettings["ErrorFile"], true);
                writer.WriteLine(message);
                writer.Flush();
                writer.Close();
            }
            catch (Exception)
            {
                //To avoid code break if exception occurs while logging errors
            }
        }
    }
}

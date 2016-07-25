<%@ Page Title="Home" Language="C#" MasterPageFile="~/AISVoter.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="VotingPresentationLayer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <div class="page-content">
        <div class="row">
            <div class="col-md-10 main-text">
                <h4 class="classic-title"><span>Welcome To AIS Elections</span></h4>
                <p>UFAIS Executive Board officers pledge their time and efforts towards helping their fellow members on their personal and career journeys through ISOM. </p>
                <p>Thank you for taking out your precious time for deciding the future leadership of AIS. You will cast your vote electronically using this real-time voting app which is built from scratch by our member developers at AIS Labs.</p>
                <p>Each candidate will be given the same amount of time for his/her speech, followed by a 5-minute question and answer period where you will be allowed to ask each candidate questions.
After all the candidates have spoken, the position's race poll will open where you will vote.
Once the polls close, a winner will be announced.</p>
            </div>
            <div class="col-md-2">
                <img alt="" class="img img-responsive center-block" style="width: 75%;" src="images/ufais_labs-logo.gif" />
            </div>
        </div>
        <div class="hr1" style="margin-bottom: 50px;"></div>

        <div class="row">
            <div class="col-md-8">
                <h4 class="classic-title"><span>The Positions</span></h4>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#president" class="collapsed">
                                    <i class="fa fa-angle-up control-icon"></i>
                                    <i class="fa fa-user"></i>President
                                </a>
                            </h4>
                        </div>
                        <div id="president" class="panel-collapse collapse">
                            <div class="panel-body instructions">
                                <strong class="accent-color">LEADS the organization</strong>
                                <ul>
                                    <li>Communicates the vision for the club through the events &amp; resources it plans to provide for its members
                                    </li>
                                    <li>Ensures that Vice Presidents achieve their objectives by assigning responsibilities and providing them with the resources they need to be successful
                                    </li>
                                    <li>Represents and presents the organization to companies, the ISOM department and the community
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#corporate" class="collapsed">
                                    <i class="fa fa-angle-up control-icon"></i>
                                    <i class="fa fa-briefcase"></i>VP Corporate Relations
                                </a>
                            </h4>
                        </div>
                        <div id="corporate" class="panel-collapse collapse">
                            <div class="panel-body instructions">
                                <strong class="accent-color">CONNECTS members to employment opportunities</strong>
                                <ul>
                                    <li>Communicates with corporate recruiters to schedule information sessions
                                    </li>
                                    <li>Maintains our existing company relationships and forms new ones by researching new companies and promoting the organization to their recruiters
                                    </li>
                                    <li>Organizes the corporate mixer, invites companies to attend, and accommodates their stay at the event
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#leadership" class="collapsed">
                                    <i class="fa fa-angle-up control-icon"></i>
                                    <i class="fa fa-black-tie"></i>VP Leadership Development
                                </a>
                            </h4>
                        </div>
                        <div id="leadership" class="panel-collapse collapse">
                            <div class="panel-body instructions">
                                <strong class="accent-color">PREPARES members for the job-seeking process and professional journey</strong>
                                <ul>
                                    <li>Organizes professional development events including but not limited to the Ace the Showcase interview panel, mock mixer, student intern panel, and development workshops.
                                    </li>
                                    <li>Exposes members to useful professional development resources including tailoring resumes, cover letters, talking with recruiters, and handling interviews.
                                    </li>
                                    <li>Serves as a mentor who offers his/her time and guidance (working one-on-one) to improve members' abilities with behavioral interviews, professional communication, and business etiquette.
</font>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#treasury" class="collapsed">
                                    <i class="fa fa-angle-up control-icon"></i>
                                    <i class="fa fa-money"></i>VP Treasury & Membership
                                </a>
                            </h4>
                        </div>
                        <div id="treasury" class="panel-collapse collapse">
                            <div class="panel-body instructions">
                                <strong class="accent-color">DEVELOPS lasting relationships between members to form a network they can rely on throughout their careers</strong>
                                <ul>
                                    <li>Collects semester dues from members and records event attendance;
                                    </li>
                                    <li>Prepares and constantly updates the income statement to document and track the financial status of the club;
                                    </li>
                                    <li>Improves the member experience by overseeing the ordering of event food &amp; merchandise;
                                    </li>
                                    <li>Ensures that vendors are paid on time.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#networking" class="collapsed">
                                    <i class="fa fa-angle-up control-icon"></i>
                                    <i class="fa fa-group"></i>VP Networking
                                </a>
                            </h4>
                        </div>
                        <div id="networking" class="panel-collapse collapse">
                            <div class="panel-body instructions">
                                <strong class="accent-color">MAINTAINS the financial and human capital of the organization</strong>
                                <ul>
                                    <li>Plans the Gator City Social and Lake Wauburg Social
                                    </li>
                                    <li>Organizes entertaining social events for members to interact with each other
                                    </li>
                                    <li>Creates and maintains community relationships including volunteering organizations, nearby restaurants and other vendors to support club events &amp; activities.
                                    </li>
                                    <li>Oversees our Early Computer Education Volunteering program.
                                    </li>
                                    <li>Connects and communicates with other national AIS Student Chapters.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#media" class="collapsed">
                                    <i class="fa fa-angle-up control-icon"></i>
                                    <i class="fa fa-film"></i>VP Media & Communications
                                </a>
                            </h4>
                        </div>
                        <div id="media" class="panel-collapse collapse">
                            <div class="panel-body instructions">
                                <strong class="accent-color">COMMUNICATES the activities of the organization to members, companies, and the public</strong>
                                <ul>
                                    <li>Creates engaging content including photos, graphics, articles and videos
                                    </li>
                                    <li>Posts regularly on Social Media (including Facebook events) and Website (<a href="http://www.ufais.com">ufais.com</a>)
                                    </li>
                                    <li>Manages and moderates the LinkedIn group, Wordpress site, and Facebook groups
                                    </li>
                                    <li>Informs members of relevant resources (case competitions, local events, useful tools)
                                    </li>
                                    <li>Assists the officers in proofreading all club communications, including the president's weekly emails and recruiter e-mails if they ask (and you should ask them to proofread website articles and facebook posts before submitting as well)
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#alumni" class="collapsed">
                                    <i class="fa fa-angle-up control-icon"></i>
                                    <i class="fa fa-graduation-cap"></i>VP Alumni Relations 
                                </a>
                            </h4>
                        </div>
                        <div id="alumni" class="panel-collapse collapse">
                            <div class="panel-body instructions">
                                <strong class="accent-color">BOOSTS Alumni relations</strong>
                                <ul>
                                    <li>Developing and maintaining an effective alumni relations program
                                    </li>
                                    <li>Ensuring that consistent alumni communication is occurring
                                    </li>
                                    <li>Maintaining biographical and address files on alumni and submitting all updates to the President
                                    </li>
                                    <li>Meeting regularly with our Program Director to discuss updates and all the necessary steps required to maintain effective Alumni relations
                                    </li>
                                    <li>To maintain up-to-date contact information on all chapter alumni and other alumni who live in the area
                                    </li>
                                    <li>Be a liaison between Alumni and AIS members for Mentor - Mentee Program
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 instructions">
                <h4 class="classic-title"><span>Instructions</span></h4>
                <ul>
                    <li>You will be allowed to choose one candidate for each position</li>
                    <li>You will be eligible to vote once the polls are activated and will NOT be allowed when the polls are deactivated</li>
                    <li>If you are a candidate, you are eligible to vote for the position you are running for, including (but not limited to) yourself.</li>
                    <li>The system may logout your current session due to inactivity</li>
                    <li>Your vote will not be registered if you were automatically logged out. In such cases, re-login immediately and attempt to cast your vote again</li>
                    <li>Please contact your administrator if you face any issues during the voting process</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Portfolio_ASP.WebForm1" %>

<!DOCTYPE html>

<html xmlns="plaban">
<head runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Plaban Das</title>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/home.css">   
        
    <!-- Sir, I have used this below link just only for very little works. I have documented with specific works-->  

    <!-- Sliding -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" /> 
    <!-- Text Animation -->
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script> 
    <!-- For Sliding -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <script src="./js/app.js"></script>    

    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container_feedback {
        max-width: 80%;
        margin: 50px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .container_feedback h2 {
        margin-bottom: 20px;
        color:darkblue;
    }

    .feedback {
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 3px;
        padding: 10px;
        background-color: #f9f9f9;
    }

    .feedback h3 {
        margin-top: 0;
    }

    .feedback p {
        margin-bottom: 5px;
    }

</style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="site-main-wrapper">
                <div class="responsive_branding">
                    <img src="./images/logo.png" alt="">
                </div>

                <%--                <button class="hamberger" onclick="hambergerButton_Click">
                    <img src="./images/hamberger.png" alt="">
                </button>--%>

                <asp:ImageButton ID="ImageButton1" CssClass="hamberger" ImageUrl="~/images/hamberger.png" AlternateText="No Image available" Height="50px" Width="50px" OnClick="hambergerButton_Click" runat="server"
                    Style="border: 2px solid var(--primary); border-radius: 20%; box-shadow: 0 0 5px rgba(61, 207, 211, 1);" />

                <asp:Panel ID="pnlMobileNav" runat="server" CssClass="mobile-nav">
                    <!-- Your mobile navigation content goes here -->

                    <asp:ImageButton ID="cancle_pnl" CssClass="times" ImageUrl="./images/times.png" AlternateText="No Image available" Width="25px" OnClick="hambergerButton_Click" runat="server"
                        Style="border: 2px solid var(--primary); border-radius: 20%; box-shadow: 0 0 5px rgba(61, 207, 211, 1);" />

                    <ul>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#timeline">Timeline</a></li>
                        <li><a href="#projects">Projects</a></li>
                        <li><a href="#achievement">Achievements</a></li>
                        <li><a href="#photography_id">Photography</a></li>
                        <li><a href="Login.aspx">Contact</a></li>
                    </ul> 
                </asp:Panel>
                 

                <%--                <div class="mobile-nav">
                    <button class="times">
                        <img src="./images/times.png" alt=""></button>
                    <ul>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#timeline">Timeline</a></li>
                        <li><a href="#projects">Projects</a></li>
                        <li><a href="#achievement">Achievements</a></li>
                        <li><a href="#photography_id">Photography</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>--%>

                <header>
                    <div class="container">
                        <nav id="main-nav" class="flex items-center justify-between">
                            <div class="left flex items-center">
                                <div class="branding">
                                    <img src="./images/logo.png" alt="">
                                </div>
                                <div class="left">
                                    <a href="#home">Home</a>
                                    <a href="#about">About</a>
                                    <a href="#timeline">Timeline</a>
                                    <a href="#projects">Projects</a>
                                    <a href="#achievement">Achievements</a>
                                    <a href="#photography_id">Photography</a>
<%--                                    <a href="Login.aspx">Contact</a>--%>
                                </div> 
                            </div>
                            <div class="right">
                                <%--<button id="contactButton" class="btn btn-primary">Contact</button>--%>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Contact" OnClick="contactButton_Click" />

                            </div>
                        </nav>
                        <div id="home" class="hero flex items-center justify-between">
                            <div class="left flex-1 flex justify-center">
                                <%--<img src="./images/man111.png" alt="">--%>
                                <asp:Image ID="home_image_view" runat="server" Visible="false" /> 
                            </div>
                            <div class="right flex-1">
                                <h1>Plaban Das</h1>
                                <h6>And I’m a</h6>
                                <h2><span class="typing"></span>&nbsp;</h2>
                                <p id="home_description_text" runat="server">My name is Plaban Das. Now I am reading at Khulna University of Engineering and Technology at computer science and engineering department.</p>
                                <div>
                                    <button id="downloadCvButton" class="btn btn-secondary">DOWNLOAD CV</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>

                <section id="about" class="about">
                    <div class="container flex items-center about-inner-wrap">
                        <div class="flex-1">
<%--                            <img class="about-me-img " src="./images/man2.png" alt="">--%>
                            <asp:Image ID="about_image_view" CssClass="about-me-img" runat="server" Visible="false" />

                        </div>
                        <div class="flex-1 right">
                            <h1>About <span>Me</span></h1>
                            <h3>Hello! i’m Plaban Das</h3>
                            <p id="about_des_text" runat="server">
                                Haridaskati Government Primary School was my first school where my academic journey was started. I was admitted to Kapilmuni Sahachari Vidyamandir for Secondary School Certificate Examination and I continued to Cantonment College Jashore for my intermediate college education.
                    I am proud to be part of the prestigious Khulna University of Engineering & Technology<br>
                                <br>
                                I am currently third year first term student in the Department of Computer Science and Engineering at Khulna University of Engineering & Technology, where I am actively pursuing my studies and exploring various aspects of the field.<br>
                                <br>
                            </p>
                            <div class="social">
                                <a href="#" target="_blank">
                                    <img src="./images/linkedin.png" alt="" width="40" height="40"></a>
                                <a href="#" target="_blank">
                                    <img src="./images/insta.png" alt="" width="40" height="40"></a>
                                <a href="#" target="_blank">
                                    <img src="./images/x.png" alt="" width="40" height="40"></a>
                                <a href="#" target="_blank">
                                    <img src="./images/github.png" alt="" width="40" height="40"></a>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="timeline" class="timeline">
                    <div class="container">
                        <h1 class="section-heading">Explore My
                            <br>
                            <br>
                            <br>
                            <span>Timeline</span></h1>
                        <div class="card-wrapper">
                            <div class="card">
                                <img src="./images/KUET logo.png" alt="">
                                <h2>BSc in Computer Science and Engineering</h2>
                                <p>Khulna University of Engineering & Technology, Khulna, Bangladesh</p>
                                <h3>2022-Present</h3>
                            </div>
                            <div class="card">
                                <img src="./images/ccj.png" alt="">
                                <h2>Higher Secondary Certificate Examination</h2>
                                <p>Cantonment College, Jashore</p>
                                <h3>2020</h3>
                            </div>
                            <div class="card">
                                <img src="./images/ksb.png" alt="">
                                <h2>Secondary School Certificate Examination</h2>
                                <p>Kapilmuni Sahachari Vidyamandir</p>
                                <h3>2018</h3>
                            </div>
                            <div class="card">
                                <img src="./images/ksb.png" alt="">
                                <h2>Junior School Certificate Examination</h2>
                                <p>Kapilmuni Sahachari Vidyamandir</p>
                                <h3>2015</h3>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="projects" class="projects">
                    <div class="container">
                        <p>Browse My Recent </p>
                        <h1 class="section-heading"><span>Projects</span></h1>
                        <div class="card-wrapper">
                            <div class="card">
                                <div class="img-wrapper">
                                    <img src="./images/project1.jpg" alt="">
                                </div>
                                <div class="card-content">
                                    <h1>Homezone</h1>
                                    <h1><span>2023</span></h1>
                                    <p>This app will easy our boring life by finding house in rent and at the same time this can be used for buying blank house plot. This app will also provide your favourite house in specific place with your own choice.</p>
                                    <a href="https://github.com/plabandas/HomeZone" target="_blank">Read More</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="img-wrapper">
                                    <img src="./images/project2.jpg" alt="">
                                </div>
                                <div class="card-content">
                                    <h1>PocketGuard</h1>
                                    <h1><span>2021</span></h1>
                                    <p>This app will easy our boring life by managing your income and expense and at the same time this can be used for setting your goal. This app will also provide you parental control.</p>
                                    <a href="https://github.com/plabandas/PocketGuard_Personal_Finance" target="_blank">Read More</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="img-wrapper">
                                    <img src="./images/project3.jpg" alt="">
                                </div>
                                <div class="card-content">
                                    <h1>Current Location App</h1>
                                    <h1><span>2023</span></h1>
                                    <p>The current location app is a digital tool that utilizes GPS technology to pinpoint a user's precise geographic coordinates on a map in real-time. It offers navigation guidance, nearby point-of-interest information, and location sharing features, enhancing convenience and safety for users in various activities and scenarios.</p>
                                    <a href="https://github.com/plabandas/Current_Location_App" target="_blank">Read More</a>
                                </div>
                            </div>
                            <div class="card">
                                <div class="img-wrapper">
                                    <img src="./images/project4.jpg" alt="">
                                </div>
                                <div class="card-content">
                                    <h1>NewsPortal Project</h1>
                                    <h1><span>2018</span></h1>
                                    <p>The news portal project creates an online platform for widespread news dissemination. It includes website or app development, offering articles, videos, and multimedia content on various topics. Features like user registration, content management, comments, and social media integration aim to provide comprehensive news coverage and user engagement opportunities.</p>
                                    <a href="https://github.com/plabandas/Newspapers_USA" target="_blank">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="achievement" class="achievement">
                    <div class="container">
                        <p>Find Out About My </p>

                        <h1 class="section-heading_special"><span>Achievements
                            <br>
                        </span></h1>
                        <h1 class="section-heading_special"><span>Top 8 Non-Academic Certificates Are Added<br>
                        </span></h1>
                        <h2 class="section-heading_special"><span>Slide for all Certificates</span></span> </h2>

                        <div class="slider"> 
                             
                            <% foreach (var achieve in AchievementList){ %>
                            <div class="slide">
                                <span><%= achieve.Name %></span> 
                                <img src=<%= achieve.ImageUrl %> alt=""> 
                            </div>
                            <% } %> 

                            <%--<div class="slide"> 
                                <span>Dean's Award</span>
                                <img src="./images/certificates/dean_cer.jpg" alt="">
                            </div>

                            <div class="slide">

                                <span>Creative Talent Search Competition 2013</span>
                                <img src="./images/certificates/cer_2013.jpg" alt="">
                            </div>

                            <div class="slide">

                                <span>Creative Talent Search Competition 2014</span>
                                <img src="./images/certificates/cer_2014.jpg" alt="">
                            </div>

                            <div class="slide">

                                <span>Creative Talent Search Competition 2016</span>
                                <img src="./images/certificates/cer_2016.jpg" alt="">
                            </div>

                            <div class="slide">

                                <span>Complete Android App Development Masterclass</span>
                                <img src="./images/certificates/android_cer.jpg" alt="">
                            </div>

                            <div class="slide">

                                <span>Mobile App Marketing & App Store Optimization</span>
                                <img src="./images/certificates/aso_cer.jpg" alt="">
                            </div>

                            <div class="slide">

                                <span>Freelancing From Home</span>
                                <img src="./images/certificates/freelancing_cer.jpg" alt="">
                            </div>

                            <div class="slide">
                                <span>Complete Ethical Hacking & Cyber Security Masterclass</span>
                                <img src="./images/certificates/techethical.jpg" alt="">
                            </div>--%>

                        </div>
                        <div class="slider-dots"></div>
                    </div>
                </section>

                <section class="section_gap">
                </section>

                <section id="photography_id" class="photography_id">
                    <div class="container">
                        <p>Check Out My</p>
                        <h1 class="section-heading"><span>Photography</span></h1>
                        <div class="card-wrapper">
                            <div class="card">
                                <div class="overlay">
                                    <span>River view, Bangladesh</span>
                                </div>
                                <img src="./images/photography/pho1.jpg" alt="">
                            </div>
                            <div class="card">
                                <div class="overlay">
                                    <span>Dew Point Of Paddy-2K19</span>
                                </div>
                                <img src="./images/photography/pho2.jpg" alt="">
                            </div>
                            <div class="card">
                                <div class="overlay">
                                    <span>View Of Sky - 2K17</span>
                                </div>
                                <img src="./images/photography/pho3.jpg" alt="">
                            </div>
                            <div class="card">
                                <div class="overlay">
                                    <span>Extraction Of Honey By Bees - 2k20</span>
                                </div>
                                <img src="./images/photography/pho4.jpg" alt="">
                            </div>
                            <div class="card">
                                <div class="overlay">
                                    <span>Beauty Of Insects - 2k16</span>
                                </div>
                                <img src="./images/photography/pho5.jpg" alt="">
                            </div>
                            <div class="card">
                                <div class="overlay">
                                    <span>My Favourite Flower - 2k17</span>
                                </div>
                                <img src="./images/photography/pho6.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </section>

                <section id="about" class="about">
                    <div class="container flex items-center about-inner-wrap">
                        <div class="flex-1">
<%--                            <img class="about-me-img " src="./images/msg_photo.png" alt="">--%>
                            <asp:Image ID="thanks_image_view" CssClass="about-me-img" runat="server" Visible="false" />

                        </div>
                        <div class="flex-1 right">
                            <h1>Thank you <span></span></h1>
                            <h3>For exploring my portfolio </h3>
                            <p id="thanks_des_text" runat="server">
                                Thank you for taking the time to delve into my portfolio. Each project within is a testament to my commitment, creativity, and expertise. From innovative designs to compelling narratives, each piece encapsulates my journey and aspirations.
                                <br>
                                <br>
                                I invite you to explore the diverse range of work, where every pixel and word is infused with passion and purpose. Whether you're seeking inspiration, collaboration, or simply curious, I hope my portfolio resonates with you and sparks new possibilities. Welcome to this visual and narrative journey of exploration and discovery.<br>
                                <br>
                            </p>
                        </div>
                    </div>
                </section>

                <section id="contact" class="contact contact-section">
                    <div class="container">
                        <p>hay !!</p>
                        <h1 class="section-heading">Contribute To My <p> <span><br>Research</span></p></h1>
                    </div>
                </section>
                 

                <div class="container_feedback"> 
                    <h2><span>Researches :: </span></h2>
                    <% foreach (var feedback in FeedbackList)
                        { %>
                    <div class="feedback">
                        <h3><%= feedback.Title %></h3>
                        <p><strong>Writer Name:</strong> <%= feedback.WriterName %></p>
                        <p><strong>Topic Name:</strong> <%= feedback.TopicName %></p>
                        <p><strong>Description:</strong> <%= feedback.Description %></p>
                    </div>
                    <% } %>
                </div>

                <footer>
                    <div class="copyright">
                        Developed with love by Plaban Das Copyright &copy; 2024
                    </div>
                </footer>
                <a href="#" class="go-top" data-go-top aria-label="Go To Top">
                    <img src="./images/arrow_top.png" alt="">
                </a>
            </div>
        </div>
    </form>
</body>
</html>

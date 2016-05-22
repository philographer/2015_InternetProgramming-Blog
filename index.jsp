<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
  <!doctype html>
  <html>
      <head>
        <title> 12121518 유호균  </title>
          <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript" src="js/index.js"></script> 
      </head>
      <body name="top" id="body" onload="myNoticeFunc()"> 
      		<header>
      			<hgroup>
      				<h1 id="center" style="font-size:80px"> What did I eat yesterday...?</h1>
              <p id="center" style="font-size:40px">(FoodDiary) </p>
               <% 
                      if(session.getAttribute("id") != null)
                        {
                        out.print("ID :" + session.getAttribute("id"));
                        %>
                        <div style="color:#000000" style="align:right;">
                         <a href="html\logout.jsp" Style="Color:#000000" target="_blank" > Logout </a>
                         </div>
                      <%}
                  %>
      			</hgroup>
     			 </header>
            <nav id="month" style="height:50px">
            <table class="menubox" id="center" style="margin-left: auto; margin-right: auto;">
                <tr>
                  <td class="menu" onmouseover="showSubMenu(1)" onmouseout="hideSubMenu()" style="font-size:20px">
                    Month &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" onmouseover="showSubMenu(2)" onmouseout="hideSubMenu()" style="font-size:20px">
                    Meal &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" onmouseover="showSubMenu(3)" onmouseout="hideSubMenu()" style="font-size:20px">
                    Classification &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>   
                  <td class="menu" onmouseover="showSubMenu(4)" onmouseout="hideSubMenu()" style="font-size:20px">
                    All &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" style="font-size:20px">
                    <a href="jsp\jsp_diary.jsp" target="_blank">Diary</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" style="font-size:20px">
                    <a href="jsp\jsp_visitor.jsp" target="_blank">Visitor</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" style="font-size:20px">
                    <a href="jsp\jsp_nonmember.jsp" target="_blank">Nonmember</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" style="font-size:20px">
                    <a href="html\login.jsp" target="_blank">Login</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" style="font-size:20px">
                    <a href="jsp\jsp_account.jsp" target="_blank">Join</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                  <td class="menu" style="font-size:20px">
                    <a href="jsp\jsp_recommendations_new.jsp" target="_blank">Recommendations</a> &nbsp;&nbsp;&nbsp;&nbsp;
                  </td>
                </tr>
              </table>
  <div id="submenu1" class="submenu" onmouseover="showSubMenu(1)"  onmouseout="hideSubMenu()">
  <table class="menubox">
    <tr class="submenuitemh"><td class="submenuitem"><a href="html\1405.html" target="content">14.5</a></td></tr>
    <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
     <tr class="submenuitemh"><td class="submenuitem"><a href="html\1406.html" target="content">14.6</a></td></tr>
     <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
      <tr class="submenuitemh"><td class="submenuitem"><a href="html\1407.html" target="content">14.7</a></td></tr>
      <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
       <tr class="submenuitemh"><td class="submenuitem"><a href="html\1408.html" target="content">14.8</a></td></tr>
       <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
        <tr class="submenuitemh"><td class="submenuitem"><a href="html\1409.html" target="content">14.9</a></td></tr>
         <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
         <tr class="submenuitemh"><td class="submenuitem"><a href="html\1410.html" target="content">14.10</a></td></tr>
          <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
          <tr class="submenuitemh"><td class="submenuitem"><a href="html\1411.html" target="content">14.11</a></td></tr>
           <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
           <tr class="submenuitemh"><td class="submenuitem"><a href="html\1412.html" target="content">14.12</a></td></tr>
           <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
           <tr class="submenuitemh"><td class="submenuitem"><a href="html\1501.html" target="content">15.1</a></td></tr>
           <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
           <tr class="submenuitemh"><td class="submenuitem"><a href="html\1502.html" target="content">15.2</a></td></tr>
           <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
           <tr class="submenuitemh"><td class="submenuitem"><a href="html\1503.html" target="content">15.3</a></td></tr>
           <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
           <tr class="submenuitemh"><td class="submenuitem"><a href="html\1504.html" target="content">15.4</a></td></tr>
           <tr class="submenuitemh"><td class="submenuitem"> </td></tr>
  </table>
  </div>
  <div id="submenu6" class="submenu" onmouseover="showSubMenu(4)">
  <table class="menubox">
    <tr><td class="submenuitem"><a href="html\1501.html" target="content"></a></td></tr>
     <tr><td class="submenuitem"><a href="html\1502.html" target="content"></a></td></tr>
      <tr><td class="submenuitem"><a href="html\1503.html" target="content"></a></td></tr>
       <tr><td class="submenuitem"><a href="html\1504.html" target="content"></a></td></tr>
  </table>
  </div>
<div id="submenu2" class="submenu" onmouseover="showSubMenu(2)" onmouseout="hideSubMenu()">
<table class="menubox"> 
    <tr><td class="submenuitem"><a href="html\snack.html" target="content">Snack</a></td></tr>
    <tr><td class="submenuitem"><a href="html\breakfast.html" target="content">breakfast</a></td></tr>
    <tr><td class="submenuitem"><a href="html\lunch.html" target="content">Lunch</a></td></tr>
    <tr><td class="submenuitem"><a href="html\dinner.html" target="content">Dinner</a></td></tr>
  </table>
</div>
<div id="submenu3" class="submenu" onmouseover="showSubMenu(3)" onmouseout="hideSubMenu()">
<table class="menubox">
    <tr><td class="submenuitem"><a href="html\rice.html" target="content">Rice</a></td></tr>
    <tr><td class="submenuitem"><a href="html\nuddle.html" target="content">Nuddle</a></td></tr>
    <tr><td class="submenuitem"><a href="html\drink.html" target="content">Drink</a></td></tr>
    <tr><td class="submenuitem"><a href="html\vegetable.html" target="content">Vegetable</a></td></tr>
    <tr><td class="submenuitem"><a href="html\etc.html" target="content">ETC</a></td></tr>
  </table>
</div>
<div id="submenu4" class="submenu" onmouseover="showSubMenu(4)" onmouseout="hideSubMenu()">
<table class="menubox">
    <tr><td class="submenuitem"><a href="html\all.html" target="content">All</a></td></tr>
    <tr><td class="submenuitem"><a href="#"></a></td></tr>
    <tr><td class="submenuitem"><a href="#"></a></td></tr>
  </table>
</div>
          </nav>
          <section>
          <article>
          <iframe id="main_content" name="content" align="center" height="300px" width="1063px" onload="changeHeight(this)" frameborder="0" scrolling="no"> 
          </iframe>
          </article>  
          </section>
          <section>
          <article id="center">
          베스트음식
          <a href="image/0316dinner.jpg" target="_blank">
                  <p>3/16일 저녁 서울 어딘가에서</p>
                  <img border="0" src="image/0316dinner.jpg" alt="한정식"
                  width="300" height="200">
                  <figcaption>(한정식)</figcaption>
                  </a>
          </article>
          </section>
     			<footer>
                <p align="right" id="marginright10">맛은 설명할 수 없을 때 더욱 맛있다.-이어령-</p>
     						<p align="right" id="marginright10">Copyright 1999-2015 by Yoohogyun. All Rights Reserved.</p>
     						<p align="right" id="marginright10">- last updated 15.3.28</p>
     			</footer>
          <audio controls autoplay>
            <source  src='media/spring.mp3' type='audio/mpeg' preload="auto">
            </audio>
            
           <%
             String id = (String)session.getAttribute("id");
                      if(id.equals("Administrator"))
                        {
                        %>
                        <div>
                         <a href="jsp\jsp_Administrator.jsp" Style="Color:#3366FF" target="_blank"> Administrator Page</a>
                         </div>
                      <%
                    }
                  %>
                  
            <div class="Back">
          <a href="javascript:ToBack();" > Back </a>
          </div>
          <div class="Home">
          <a href="javascript:ToHome();"> Home </a>
          </div>
          <div class="Forward">
          <a href="javascript:ToForward();" > Forward </a>
          </div>
          <div class="top">
              <a href="#top">Click to Top
              </a>
          </div>

          </body>
      </html>
            
      
      
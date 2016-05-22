<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
      <title>12121518 유호균</title>
        <meta charset="utf-8">
        <link type="text/css" href="..\css\board.css" rel="stylesheet"/>
        <script type="text/javascript" src="..\js\write.js"></script>

        
                  </head>

                   <h1 align="center" class="title">
                    Recommendations (To. WebMaster)
                     </h1>
        <hr align="left" style="width:387px;margin-right:auto;margin-left:auto">
                    <body>
                   
                      <form action="..\jsp\jsp_write_Recommendations.jsp" method="get">
                        <table >
                          <tr>
                            <td>제목</td>
                            <td><input type="text" name="r_title" id="inputTitle" style="width:97%" required placeholder="게시글의 제목을 입력해 주세요"></td>
                          </tr>
                          <tr>
                          <td> 이름 </td>
                            <td><input type="text" name="r_name" id="inputTitle" style="width:97%" required placeholder="이름을 입력해 주세요"></td>
                            </td>
                          </tr>
                          <tr>
                            <td>내용</td>
                          <td> <textarea rows="10" id="inputContent" name="r_content" cols="50" name="comment" style="background-color:#E8F7F7" placeholder="건의사항을 입력해 주세요"></textarea></td>
                          </tr>
                          <tr>
                          <td></td>
                          <td><input type="submit" value="Send" onclick="printData();" style="width: 40%;background-color:#80C6FC">
                          <input type="reset" value="Reset" style="width: 40%;background-color:#80C6FC"></td>
                          </tr>  
                         </table>

                       </form>
                       <table id="printOutTable" stype="margin-left:auto; margin-right:auto; visibility:hidden;">
                       <tr>
                       <td>
                        <div id="outputTitle"> </div>
                       <div id="outputDate"> </div>
                       <div id="outputLocation"> </div>
                       <div id="outputWhen"></div>
                       <div id="outputClassification"> </div>
                       <div id="outputContent"> </div>
                       <td>
                       </tr>
                       </table>

                       



          <footer>
              <p align="right" >Copyright 2015~now by Yoohogyun. All Rights Reserved.</p>
              <p align="right" >- last updated 15.3.27</p>
          </footer>
                            
                   </body>

                   

                   
  </html>



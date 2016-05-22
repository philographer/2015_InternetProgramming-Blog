
            function autoResize(i)
            {
                var iframeHeight=
                i.contentWindow.document.body.scrollHeight;
                i.height=iframeHeight+20;
            }

            function ResizeFrame(name)

            {

              // IFRAME 내부의 body개체의 넓이를 계산하여 IFRAME의 넓이를 설정해 준다.

              name.style.width 

                = name.scrollWidth + (name.offsetWidth - name.clientWidth);

              // IFRAME 내부의 body개체의 높이를 계산하여 IFRAME의 높이를 설정해 준다.

              name.style.height 

                = name.scrollHeight + (name.offsetHeight - name.clientHeight);


              // 만약 IFRAME의 크기 설정에 실패 하였다면 기본크기로 설정한다.

              if (name.style.height == "0px" || name.style.width == "0px")

              {

                name.style.width = "700px";     //기본 iframe 너비

                name.style.height = "1000px";    //기본 iframe 높이

              }

          }

          function changeHeight() { 

          //아이프레임 안쪽 페이지 높이를 먼저구하신후
          var the_height=document.getElementById('main_content').contentWindow.document.body.offsetHeight; 
          // 아이프레임 높이를 바꿔주시면 됩니다. 
          document.getElementById('main_content').height=the_height;

           } 


          function resizeFrame2(that) {
        that.style.height = that.contentWindow.document.body.scrollHeight + that.contentWindow.document.body.offsetHeight - that.contentWindow.document.body.clientHeight;
        }


            function myNoticeFunc(){
                
              // window.open("html/notice.html", "width= 150px, height = 150px");
            }

            function ToBack()
            {
             window.history.back();
            }

            function ToForward()
            {
              window.history.forward();
            }

            function ToHome()
            {
              window.history.go("FoodDiary.html")
            }

            function Reload()
            {
              document.location.reload();
            }

            

            function showSubMenu(menuNum)
            {
              document.getElementById("submenu1").style.visibility = "hidden";
              document.getElementById("submenu2").style.visibility = "hidden";
              document.getElementById("submenu3").style.visibility = "hidden";
              document.getElementById("submenu4").style.visibility = "hidden";

              switch (menuNum)
              {
                case 1:
                document.getElementById("submenu1").style.visibility = "visible";
                break;

                case 2:
                document.getElementById("submenu2").style.visibility = "visible";
                break;

                case 3:
                document.getElementById("submenu3").style.visibility = "visible";
                break;

                case 4:
                document.getElementById("submenu4").style.visibility = "visible";
                break;

                case 5:
                document.getElementById("submenu5").style.visibility = "visible";
                break;

                default:
              }
             }


    function hideSubMenu() //마우스 옮기면 숨기기 
    {
      document.getElementById("submenu1").style.visibility = "hidden";
      document.getElementById("submenu2").style.visibility = "hidden";
      document.getElementById("submenu3").style.visibility = "hidden";
      document.getElementById("submenu4").style.visibility = "hidden";

    }

  

		function chkValid(element){
				if(element.name == "Ids")
				{
					if(element.value == null||element.value.length < 5||element.value.length >20)
					{
						element.setCustomValidity("ID는 5자리 이상 20자리 이하로 \n입력하여 주십시오.");
						element.style.borderColor = "#ff0000";
						return;
					}
					else
					{
						element.setCustomValidity("");
						element.style.borderColor = "";
						return;
					}
					return;
				}

				if(element.name == "Pws")
				{
					if(element.value == null||element.value.length < 6||element.value.length >20)
					{
						element.setCustomValidity("Pw는 6자리 이상 20자리 이하로 \n입력하여 주십시오.");
						element.style.borderColor = "#ff0000";
						return;
					}
					else
					{
						element.setCustomValidity("");
						element.style.borderColor = "";
						return;
					}
					return;
				}


				if(element.name == "NickName")
				{
					if(element.value == null||element.value.length < 2||element.value.length >20)
					{
						element.setCustomValidity("별명은 2자리 이상 20자리 이하로 \n입력하여 주십시오.");
						element.style.borderColor = "#ff0000";
						return;
					}
					else
					{
						element.setCustomValidity("");
						element.style.borderColor = "";
						return;
					}
					return;
				}
			}


		function visible()
		{
			console.log("visible함수 실행");
			document.getElementById("outputPrintTable").style.display="";
		}

	
		function confirmSave(checkbox)
		{
		 var isRemember;
		 if(checkbox.checked)
		 {
		 isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오. 7일동안 ID가 저장됩니다.");
		  if(!isRemember)
		   checkbox.checked = false;
		 }
		}
/////////////////////////////////////////////////////////////////////////쿠키
				function setCookie(cname,cvalue,exdays) {
			    var d = new Date();
			    d.setTime(d.getTime() + (exdays*24*60*60*1000));
			    var expires = "expires=" + d.toGMTString();
			    document.cookie = cname+"="+cvalue+"; "+expires;
			}

			function getCookie(cname) {
			    var name = cname + "=";
			    var ca = document.cookie.split(';');
			    for(var i=0; i<ca.length; i++) {
			        var c = ca[i];
			        while (c.charAt(0)==' ') c = c.substring(1);
			        if (c.indexOf(name) == 0) {
			            return c.substring(name.length, c.length);
			        }
			    }
			    return "";
			}

			function checkCookie() {
			    var user=getCookie("username");
			    if (user != "") {
			        alert("Welcome again " + user);
			        document.getElementById("idInput").value = user;
			        document.getElementById("saveid").checked = true;
			        console.log("YesCookie");
			    }
			    else
			    	console.log("NoCookie");
			}

			function saveId()
			{
				if(document.getElementById("saveid").checked)
				{
				console.log("saveid() called");
				var user = document.getElementById("idInput").value;
				if (user != "" && user != null) {
				setCookie("username", user, 30);
				console.log("saveid() completed");
				}
			}
				
			}

		function CloseMe() //닫는함수
		{
			this.close();
		}



/*
		// 쿠키에 id를 저장.
    function setsave(name, value, expiredays) {
        var today = new Date();
        today.setDate(today.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires="
                + today.toGMTString() + ";";
    }
    
    // 버튼 클릭시 실행 function
    function saveId(){
    	console.log("saved");
        //if (document.getElementById("idcheck").checked) {
            saveLogin(document.getElementById("idInput").value);
        //} else {
            //saveLogin("");
        //}
    }

    // id를 받아와 쿠키에 저장할지 쿠키에서 삭제할지 결정.
    function saveLogin(id) {
        if (id != "") {
            // userid 쿠키에 id 값을 7일간 저장
            setsave("userid", id, 7);
        } else {
            // userid 쿠키 삭제
            setsave("userid", id, -1);
        }
    }
    
    // 화면 로드시 아이디
    function getLogin() {
    // userid 쿠키에서 id 값을 가져온다.
        var cook = document.cookie + ";";
        var idx = cook.indexOf("userid", 0);
        var val = "";
        if (idx != -1) {
        console.log("gg2");
            cook = cook.substring(idx, cook.length);
            begin = cook.indexOf("=", 0) + 1;
            end = cook.indexOf(";", begin);
            val = unescape(cook.substring(begin, end));
        }

        // 가져온 쿠키값이 있으면
        if (val != "") {
        	console.log("gg");
            document.getElementById("idInput").value = val;
            document.getElementById("saveid").checked = true;

        }

        
    }
    */


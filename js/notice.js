	function CloseMe() //닫는함수
		{
			this.close();
		}

		function visible()
		{
			console.log("visible함수 실행");
			document.getElementById("outputPrintTable").style.display="";
		}


		function closeWin(obj) 
		{ 
		    if (obj == "1" )    
		    {
		        setCookie("pop20100719", "done" , 1);
		        console.log("closeWin() called");
		    }
		 		}
		 
		function setCookie( name, value, expiredays )
		{
		    var todayDate = new Date();
		    todayDate.setDate( todayDate.getDate() + expiredays );
		    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}

		function checkCookie()
		{
		 //쿠키값이 있으면 element를 가려준다
		    if(getCookie("pop20100719") == "done")
		    	{   
		    		console.log("checkedCookie called checked")
		    		document.getElementById("Notice").checked = true;
		    		CloseMe();
		    }
		 //쿠키값이 없으면 element를 보여준다
		    else
		    {
		    	console.log("checkedCookie called unchecked")
		        document.getElementById("body1").style.display="";
		    }
		}

		function Reload()
		{
			document.location.reload();
		}

		function getCookie( name ) 
		{ 
		    var nameOfCookie = name + "="; 
		    var x = 0; 
		    while ( x <= document.cookie.length ) 
		    { 
		        var y = (x+nameOfCookie.length); 
		        if ( document.cookie.substring( x, y ) == nameOfCookie ) 
		        { 
		            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
		                endOfCookie = document.cookie.length;
		            return unescape( document.cookie.substring( y, endOfCookie ) ); 
		        } 
		        x = document.cookie.indexOf( " ", x ) + 1; 
		        if ( x == 0 ) 
		            break; 
		    } 
		    return ""; 
		}
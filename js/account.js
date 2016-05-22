

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

				if(element.name == "Pwc")
				{
					if(document.getElementById("pwInput").value != element.value)
					{
						element.setCustomValidity("Pw와 같은값을 입력해주세요");
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

			function validateForm(formelement)
			{
				var str = "";
				var LikeFood = "My Like Food is:";
				str += "ID:" + formelement.Ids.value + "\n";
				str += "PW:" + formelement.Pws.value + "\n";
				str += "NickName:" + formelement.NickName.value + "\n";
				str += "Address:" + formelement.Address.value + "\n";
				str += "BirthDay:" + formelement.BirthDay.value + "\n";
				str += "TelePhone:" + formelement.TelePhone.value + "\n";
					if(formelement.rice.checked)
						{
							LikeFood = LikeFood + "rice ";
						}
						
					if(formelement.nuddle.checked)
						{
							LikeFood = LikeFood + "nuddle ";
						}
						
						
					if(formelement.meat.checked)
						{
							LikeFood = LikeFood + "meat ";
							}

					if(formelement.vegetable.checked)
						{
						LikeFood = LikeFood + "vegetable ";
						}

					if(formelement.drink.checked)
						{
						LikeFood = LikeFood + "drink ";
						}
				str +=  LikeFood+"\n";
				str += 	"ChickPoint: " + formelement.ChickPoint.value +"\n";
				str += "EatOutPoint: " + formelement.EatOutPoint.value +"\n";
				str += "LikeMostFood:" + formelement.LikeMostFood.value + "\n";

				var r = confirm(str + "\n입력된 정보로 진행하시겠습니까?");
				if(r == true)
				{
					return true;
				}
				else
				{
					return false;
				}
			}

			/*
					function submitData()

					{	
						
						 console.log("제출함수실행");


						var LikeFood="LikeFood: ";

									document.getElementById("outputId").innerHTML = 
						"id: "+document.getElementById("idInput").value;
						document.getElementById("outputPw").innerHTML = 
						"pw: "+document.getElementById("pwInput").value;
						document.getElementById("outputNickname").innerHTML = 
						"nickname: "+document.getElementById("nicknameInput").value;
						document.getElementById("outputAddress").innerHTML = 
						"address: "+document.getElementById("addressInput").value;
						document.getElementById("outputBirthday").innerHTML = 
						"birthday: "+document.getElementById("birthdayInput").value;
						document.getElementById("outputLikeRice").innerHTML = 
						LikeFood;
						
						if(document.getElementById("rice").checked)
						{
							LikeFood = LikeFood + "rice ";
						}
						
						if(document.getElementById("nuddle").checked)
						{
							LikeFood = LikeFood + "nuddle ";
						}
						

						
						if(document.getElementById("meat").checked)
						{
							LikeFood = LikeFood + "meat ";
							}

						if(document.getElementById("vegetable").checked)
						{
						LikeFood = LikeFood + "vegetable ";
						}

						if(document.getElementById("drink").checked)
						{
						LikeFood = LikeFood + "drink ";
						}

						document.getElementById("outputLikeRice").innerHTML = 
						LikeFood;
						document.getElementById("outputLikechicken").innerHTML = 
						"LikeChicken: "+document.getElementById("likechickenInput").value;
						document.getElementById("outputEatout").innerHTML = 
						"eatout: "+document.getElementById("eatoutInput").value;
						document.getElementById("outputTelephone").innerHTML = 
						"Telephone: "+document.getElementById("telephoneInput").value;
						document.getElementById("outputLikemostfood").innerHTML = 
						"likemostfood: "+document.getElementById("likemostfoodInput").value;
					}
					*/
					function visible()
					{
						console.log("visible함수 실행");
						document.getElementById("outputPrintTable").style.display="";
					}

/*
					function outputPrint()
					{
						document.getElementById("outputPrintTable").style:"width: 300px";
						document.getElementById("outputPrintTable").style:"height:300px";
					}
*/

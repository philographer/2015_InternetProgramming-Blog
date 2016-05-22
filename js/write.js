
           function printData()
           {
            console.log("함수실행");
              
              document.getElementById("outputTitle").innerHTML ="Title: "+ document.getElementById("inputTitle").value;
              document.getElementById("outputDate").innerHTML ="Date: " +document.getElementById("inputDate").value;
              document.getElementById("outputLocation").innerHTML ="Location: "+ document.getElementById("inputLocation").value;
              document.getElementById("outputWhen").innerHTML = "When: " +document.getElementById("inputWhen").value 
              document.getElementById("outputClassification").innerHTML ="Classify: "+ document.getElementById("inputClassified").value;
              document.getElementById("outputContent").innerHTML = "Content: " +document.getElementById("inputContent").value;
           }

           function visibie()
           {
            document.getElementById("printOutTable").style.visibility="visible";
            
           }



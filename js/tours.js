var ActiveRecordId = 0;
var ActiveRecordTourN = "";
var ActiveRecordAffilN = "";
var RowCHosenID = 0;

function RecordChosen(id)
{
    var table = document.getElementsByClassName("Table");
    var rows = table[0].rows.length;
    
    for (var i = 1; i < rows ; i++) 
    {
        var RemoveStyleRow = document.getElementById("Row"+ table[0].rows[i].cells[0].innerHTML);

        if(RemoveStyleRow.classList.contains("TRactive"))
        {
            RemoveStyleRow.classList.remove("TRactive");
        }

        if(table[0].rows[i].cells[0].innerHTML == id)
        {
            RowCHosenID = i ;
        }
    }

    var ActiveRow = document.getElementById("Row"+id);
    ActiveRow.classList.add("TRactive");

    document.getElementById("RowSelect" + id).checked = true;

    document.getElementById("UpdateTourN").value = table[0].rows[RowCHosenID].cells[1].innerHTML;
    document.getElementById("UpdateTourN").disabled = false;
    document.getElementById("submitbtnUpdate").disabled = false;

    document.getElementById("AffiliationNamesUpdate").disabled = false;
    document.getElementById("submitbtnDel").disabled = false;

    for (var option of document.getElementById("AffiliationNamesUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[2].innerHTML)
        {
            option.selected = true;
        }
    }

    document.getElementById("DeleteTourN").value = table[0].rows[RowCHosenID].cells[1].innerHTML;
    document.getElementById("DeleteAffilN").value = table[0].rows[RowCHosenID].cells[2].innerHTML;
    
    ActiveRecordId = id;
    ActiveRecordAffilN = table[0].rows[RowCHosenID].cells[2].innerHTML;
    ActiveRecordTourN = table[0].rows[RowCHosenID].cells[1].innerHTML;
}

function InsertCheck()
{
    var TourName = document.getElementById("NewTourN").value;
    var pattern = /[a-zA-Z0-9-)]/g;
    var Correct = pattern.test(TourName);

    if(TourName == " " || TourName == null || Correct == false)
    {
        document.getElementById("TourNameError").innerHTML = "The Tour Name is invalid";
        
        return false;
    }
    else
    {
        document.getElementById("TourNameError").innerHTML = "";
        return true;
    }

}

function HasActive(Type)
{
    if(ActiveRecordId == 0)
    {
        alert("Please choose a tour to " + Type); 

        document.getElementById("UpdateTourN").disabled = true;
        document.getElementById("UpdateTourN").value = "No tour selected";
        document.getElementById("AffiliationNamesUpdate").disabled = true;
        document.getElementById("AffiliationNamesUpdate").value = "No tour selected";
        document.getElementById("submitbtnUpdate").disabled = true;

        document.getElementById("DeleteTourN").value = "No tour selected";
        document.getElementById("DeleteAffilN").value = "No tour selected";
        document.getElementById("submitbtnDel").disabled = true;
    }
}

function UpdateCheck()
{

    var TourName = document.getElementById("UpdateTourN").value;
    var pattern = /[a-zA-Z0-9-)]/g;
    var Correct = pattern.test(TourName);

    if(TourName == " " || TourName == null || Correct == false)
    {
        document.getElementById("UpdateTourNameError").innerHTML = "The Tour Name is invalid";
        return false
    }
    else
    {
       return true;
    }
}

function Update()
{
    if(UpdateCheck() == true)
    {
        var NewRecordTourN = document.getElementById("UpdateTourN").value;
        var NewRecordAffilN = document.getElementById("AffiliationNamesUpdate").value;
        NewRecordAffilN = NewRecordAffilN.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
        
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText); 
                
                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/ToursTable.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "update", 
                                        TourId: ActiveRecordId,
                                        oldTourName :ActiveRecordTourN,
                                        oldAffiliation : ActiveRecordAffilN,
                                        newTourName :NewRecordTourN,
                                        newAffiliation : NewRecordAffilN});

        requestN.send(urlParameters);
    }

}

function Delete()
{
    var requestN = new XMLHttpRequest();
    
    requestN.addEventListener("readystatechange", function(){
        if (requestN.readyState == 4 && requestN.status == 200)
        {
            var Result = JSON.parse(this.responseText);   

            alert(Result["message"]);
            location.reload();
        }
    });

    var url = '../php/ToursTable.php' ;

    requestN.open("POST", url);
    requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    var urlParameters = JSON.stringify({ type: "delete", 
                                        TourId: ActiveRecordId});

    requestN.send(urlParameters);
}

function Insert()
{
    if(InsertCheck() == true)
    {
        var NewTourN = document.getElementById("NewTourN").value;
        var NewAffilN = document.getElementById("AffiliationNamesCreate").value;
        NewAffilN = NewAffilN.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
    
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText);   

                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/ToursTable.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "insert", 
                                            newTourN: NewTourN,
                                            newAffilN: NewAffilN});

         requestN.send(urlParameters);
        
    }
}




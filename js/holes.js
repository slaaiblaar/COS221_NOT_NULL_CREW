var ActiveRecordId = 0;
var ActiveRecordHoleNum = "";
var ActiveRecordSiteName = "";
var ActiveRecordPar = 0;
var ActiveRecordLength = 0;
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

    document.getElementById("HoleNumberUpdate").disabled = false;
    document.getElementById("SiteNamesUpdate").disabled = false;
    document.getElementById("HoleParUpdate").disabled = false;
    document.getElementById("HoleLengthUpdate").disabled = false;
    document.getElementById("HoleLengthUpdate").value = table[0].rows[RowCHosenID].cells[4].innerHTML;
    document.getElementById("submitbtnUpdate").disabled = false;

    for (var option of document.getElementById("HoleNumberUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[1].innerHTML)
        {
            option.selected = true;
        }
    }

    for (var option of document.getElementById("SiteNamesUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[2].innerHTML)
        {
            option.selected = true;
        }
    }

    for (var option of document.getElementById("HoleParUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[3].innerHTML)
        {
            option.selected = true;
        }
    }

    document.getElementById("DeleteHoleNum").value = table[0].rows[RowCHosenID].cells[1].innerHTML;
    document.getElementById("DeleteSiteName").value = table[0].rows[RowCHosenID].cells[2].innerHTML;
    document.getElementById("DeletePar").value = table[0].rows[RowCHosenID].cells[3].innerHTML;
    document.getElementById("DeleteLength").value = table[0].rows[RowCHosenID].cells[4].innerHTML;
    document.getElementById("submitbtnDel").disabled = false;
    
    ActiveRecordId = id;
    ActiveRecordHoleNum = table[0].rows[RowCHosenID].cells[1].innerHTML;
    ActiveRecordSiteName = table[0].rows[RowCHosenID].cells[2].innerHTML;
    ActiveRecordPar = table[0].rows[RowCHosenID].cells[3].innerHTML;
    ActiveRecordLength =table[0].rows[RowCHosenID].cells[4].innerHTML;
}

function HasActive(Type)
{
    if(ActiveRecordId == 0)
    {
        alert("Please choose a Hole to " + Type); 

        document.getElementById("HoleNumberUpdate").disabled = true;
        document.getElementById("SiteNamesUpdate").disabled = true;
        document.getElementById("HoleParUpdate").disabled = true;
        document.getElementById("HoleLengthUpdate").disabled = true;
        document.getElementById("HoleLengthUpdate").value = "0";
        document.getElementById("submitbtnUpdate").disabled = true;
       

        document.getElementById("DeleteHoleNum").value = "No hole selected";
        document.getElementById("DeleteSiteName").value = "No hole selected";
        document.getElementById("DeletePar").value = "No hole selected";
        document.getElementById("DeleteLength").value = "No hole selected";
        document.getElementById("submitbtnDel").disabled = true;
    }
}

function InsertCheck()
{
    var Length = document.getElementById("HoleLengthCreate").value;


    if(Length == null || Length <= 0  )
    {
        document.getElementById("HoleLengthErrorCreate").innerHTML = "The Length must be more than 0m";
        return false;
    }
    else
    {
        return true;
    }

}

function Insert()
{
    if(InsertCheck() == true)
    {
        var HoleNum = document.getElementById("HoleNumberCreate").value;
        var HoleParCreate = document.getElementById("HoleParCreate").value;
        var HoleLengthCreate = document.getElementById("HoleLengthCreate").value;

        var Sites = document.getElementById("SiteNamesCreate").value;
        Sites = Sites.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
    
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText);   

                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/holeTableDisplay.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "insert", 
                                            HoleNum: HoleNum,
                                            HoleParCreate: HoleParCreate,
                                            HoleLengthCreate: HoleLengthCreate,
                                            Sites:Sites});

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

    var url = '../php/holeTableDisplay.php' ;

    requestN.open("POST", url);
    requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    var urlParameters = JSON.stringify({ type: "delete", 
                                        HoleID: ActiveRecordId});

    requestN.send(urlParameters);
}

function UpdateCheck()
{
    var Length = document.getElementById("HoleLengthUpdate").value;

    if(Length == null || Length <= 0  )
    {
        document.getElementById("HoleLengthErrorUpdate").innerHTML = "The Length must be more than 0m";
        return false;
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
        var HoleNum = document.getElementById("HoleNumberUpdate").value;
        var HoleParCreate = document.getElementById("HoleParUpdate").value;
        var HoleLengthCreate = document.getElementById("HoleLengthUpdate").value;

        var Sites = document.getElementById("SiteNamesUpdate").value;
        Sites = Sites.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
        
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText); 
                
                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/holeTableDisplay.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "update", 
                                        HoleID: ActiveRecordId,
                                        oldHoleNum:ActiveRecordHoleNum,
                                        oldSite: ActiveRecordSiteName,
                                        newHoleNum: HoleNum,
                                        newSite : Sites,
                                        newHolePar: HoleParCreate,
                                        newHoleLength : HoleLengthCreate});

        requestN.send(urlParameters);
    }

}


var ActiveRecordId = 0;
var ActiveRecordOrgN = "";
var ActiveRecordOrgT = "";
var ActiveRecordPubl = "";
var ActiveRecordMan = "";
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

    document.getElementById("UpdateOrgN").disabled = false;
    document.getElementById("UpdateOrgN").value = table[0].rows[RowCHosenID].cells[1].innerHTML;
    document.getElementById("UpdateOrgType").disabled = false;
    document.getElementById("UpdateOrgType").value = table[0].rows[RowCHosenID].cells[2].innerHTML;

    document.getElementById("PublisherNamesUpdate").disabled = false;
    document.getElementById("ManagerNamesUpdate").disabled = false;
    document.getElementById("submitbtnUpdate").disabled = false;
   

    for (var option of document.getElementById("PublisherNamesUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[3].innerHTML)
        {
            option.selected = true;
        }
    }

    for (var option of document.getElementById("ManagerNamesUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[4].innerHTML)
        {
            option.selected = true;
        }
    }

    document.getElementById("DeleteOrgN").value = table[0].rows[RowCHosenID].cells[1].innerHTML;
    document.getElementById("DeleteOrgType").value = table[0].rows[RowCHosenID].cells[2].innerHTML;
    document.getElementById("DeleteOrgP").value = table[0].rows[RowCHosenID].cells[3].innerHTML;
    document.getElementById("DeleteOrgM").value = table[0].rows[RowCHosenID].cells[4].innerHTML;
    document.getElementById("submitbtnDel").disabled = false;
    
    ActiveRecordId = id;
    ActiveRecordOrgN = table[0].rows[RowCHosenID].cells[1].innerHTML;
    ActiveRecordOrgT = table[0].rows[RowCHosenID].cells[2].innerHTML;
    ActiveRecordPubl = table[0].rows[RowCHosenID].cells[3].innerHTML;
    ActiveRecordMan = table[0].rows[RowCHosenID].cells[4].innerHTML;
}

function InsertCheck()
{
    var OrgName = document.getElementById("NewOrgN").value;
    var OrgType =  document.getElementById("NewOrgType").value;

    var pattern = /[a-zA-Z0-9-)]/g;
    var CorrectName = pattern.test(OrgName);
    var CorrectType = pattern.test(OrgType); 

    if(OrgName == " " || OrgName == null || CorrectName == false)
    {
        document.getElementById("OrgNameError").innerHTML = "The Organization Name is invalid";
    }

    if(OrgType == " " || OrgType == null || CorrectType == false)
    {
        document.getElementById("OrgTypeError").innerHTML = "The Organization Type is invalid";
    }

    if(CorrectName == true && CorrectType == true )
    {
        document.getElementById("OrgNameError").innerHTML = "";
        document.getElementById("OrgTypeError").innerHTML = "";
        return true;
    }
    else
    {
        return false;
    }

}

function HasActive(Type)
{
    if(ActiveRecordId == 0)
    {
        alert("Please choose a Organization to " + Type); 

        document.getElementById("UpdateOrgN").value = "No organization selected";
        document.getElementById("UpdateOrgN").disabled = true;
        document.getElementById("UpdateOrgType").value = "No organization selected";
        document.getElementById("UpdateOrgType").disabled = true;
        document.getElementById("PublisherNamesUpdate").disabled = true;
        document.getElementById("ManagerNamesUpdate").disabled = true;
        document.getElementById("submitbtnUpdate").disabled = true;

        document.getElementById("DeleteOrgN").value = "No organization selected";
        document.getElementById("DeleteOrgType").value = "No organization selected";
        document.getElementById("DeleteOrgP").value = "No organization selected";
        document.getElementById("DeleteOrgM").value = "No organization selected";
        document.getElementById("submitbtnDel").disabled = true;
    }
}

function UpdateCheck()
{
    var OrgName = document.getElementById("UpdateOrgN").value;
    var OrgType =  document.getElementById("UpdateOrgType").value;

    var pattern = /[a-zA-Z0-9-)]/g;
    var CorrectName = pattern.test(OrgName);
    var CorrectType = pattern.test(OrgType); 

    if(OrgName == " " || OrgName == null || CorrectName == false)
    {
        document.getElementById("OrgNameErrorUpdate").innerHTML = "The Organization Name is invalid";
    }

    if(OrgType == " " || OrgType == null || CorrectType == false)
    {
        document.getElementById("OrgTypeErrorUpdate").innerHTML = "The Organization Type is invalid";
    }

    if(CorrectName == true && CorrectType == true )
    {
        document.getElementById("OrgNameErrorUpdate").innerHTML = "";
        document.getElementById("OrgTypeErrorUpdate").innerHTML = "";
        return true;
    }
    else
    {
        return false;
    }
}

function Update()
{
    if(UpdateCheck() == true)
    {
        var newOrgName = document.getElementById("UpdateOrgN").value;
        var newOrgType = document.getElementById("UpdateOrgType").value;

        var Publisher =  document.getElementById("PublisherNamesUpdate").value;
        var PublisherArray = Publisher.split("(");
        var newPublisherEmail = PublisherArray[1].slice(0, PublisherArray[1].length - 1);

        var newManager = document.getElementById("ManagerNamesUpdate").value;
        newManager = newManager.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
        
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText); 
                
                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/OrganizationTable.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "update", 
                                        OrgId: ActiveRecordId,
                                        oldOrgName:ActiveRecordOrgN,
                                        newOrgName: newOrgName,
                                        newOrgType: newOrgType,
                                        newPublisherEmail: newPublisherEmail,
                                        newManager : newManager});

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

    var url = '../php/OrganizationTable.php' ;

    requestN.open("POST", url);
    requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    var urlParameters = JSON.stringify({ type: "delete", 
                                        OrganizationID: ActiveRecordId});

    requestN.send(urlParameters);
}

function Insert()
{
    if(InsertCheck() == true)
    {
        var NewOrganizationN = document.getElementById("NewOrgN").value;
        var NewType = document.getElementById("NewOrgType").value;

        var Publisher =  document.getElementById("PublisherNamesCreate").value;
        var PublisherArray = Publisher.split("(");
        var PublisherEmail = PublisherArray[1].slice(0, PublisherArray[1].length - 1);

        var Manager = document.getElementById("ManagerNamesCreate").value;
        Manager = Manager.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
    
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText);   

                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/OrganizationTable.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "insert", 
                                            NewOrganizationN: NewOrganizationN,
                                            NewType: NewType,
                                            PublisherEmail: PublisherEmail,
                                            Manager: Manager});

         requestN.send(urlParameters);
        
    }
}




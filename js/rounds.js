var ActiveRecordId = 0;
var ActiveRecordRoundNum = "";
var ActiveRecordEventName = "";
var ActiveRecordLeaderName = "";
var ActiveRecordState = "";
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

    document.getElementById("RoundNumberUpdate").disabled = false;
    document.getElementById("EventNamesUpdate").disabled = false;
    document.getElementById("LeaderNamesUpdate").disabled = false;
    document.getElementById("RoundStateUpdate").disabled = false;
    document.getElementById("submitbtnUpdate").disabled = false;

    document.getElementById("RoundNumberUpdate").value = table[0].rows[RowCHosenID].cells[1].innerHTML;
    

    for (var option of document.getElementById("EventNamesUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[2].innerHTML)
        {
            option.selected = true;
        }
    }

    for (var option of document.getElementById("LeaderNamesUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[3].innerHTML)
        {
            option.selected = true;
        }
    }

    for (var option of document.getElementById("RoundStateUpdate").options)
    {
        if (option.innerHTML == table[0].rows[RowCHosenID].cells[4].innerHTML)
        {
            option.selected = true;
        }
    }

    document.getElementById("DeleteRoundNum").value = table[0].rows[RowCHosenID].cells[1].innerHTML;
    document.getElementById("DeleteEventName").value =table[0].rows[RowCHosenID].cells[2].innerHTML;
    document.getElementById("DeleteLeaderName").value = table[0].rows[RowCHosenID].cells[3].innerHTML;
    document.getElementById("DeleteState").value = table[0].rows[RowCHosenID].cells[4].innerHTML;
    document.getElementById("submitbtnDel").disabled = false;
    
    ActiveRecordId = id;
    ActiveRecordRoundNum = table[0].rows[RowCHosenID].cells[1].innerHTML;
    ActiveRecordEventName = table[0].rows[RowCHosenID].cells[2].innerHTML;
    ActiveRecordLeaderName = table[0].rows[RowCHosenID].cells[3].innerHTML;
    ActiveRecordState =table[0].rows[RowCHosenID].cells[4].innerHTML;
}

function HasActive(Type)
{
    if(ActiveRecordId == 0)
    {
        alert("Please choose a Round to " + Type); 

        document.getElementById("RoundNumberUpdate").disabled = true;
        document.getElementById("EventNamesUpdate").disabled = true;
        document.getElementById("LeaderNamesUpdate").disabled = true;
        document.getElementById("RoundStateUpdate").disabled = true;
        document.getElementById("RoundNumberUpdate").value = "0";
        document.getElementById("submitbtnUpdate").disabled = true;
       

        document.getElementById("DeleteRoundNum").value = "No round selected";
        document.getElementById("DeleteEventName").value = "No round selected";
        document.getElementById("DeleteLeaderName").value = "No round selected";
        document.getElementById("DeleteState").value = "No round selected";
        document.getElementById("submitbtnDel").disabled = true;
    }
}
<<<<<<< Updated upstream
=======

function InsertCheck()
{
    var Length = document.getElementById("RoundNumberCreate").value;


    if(Length == null || Length <= 0  )
    {
        document.getElementById("RoundLengthErrorCreate").innerHTML = "The Round number must be 1 or higher";
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
        var RoundNum = document.getElementById("RoundNumberCreate").value;
        var EventName = document.getElementById("EventNamesCreate").value;
        EventName = EventName.replace(/[+]/g, " ");
        var LeaderName = document.getElementById("LeaderNamesCreate").value;
        LeaderName = LeaderName.replace(/[+]/g, " ");
        var State = document.getElementById("RoundStateCreate").value;
        State = State.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
    
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText);   

                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/roundTableDisplay.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "insert", 
                                            RoundNum: RoundNum,
                                            EventName: EventName,
                                            LeaderName: LeaderName,
                                            State:State});

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

    var url = '../php/roundTableDisplay.php' ;

    requestN.open("POST", url);
    requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    var urlParameters = JSON.stringify({ type: "delete", 
                                        RoundID: ActiveRecordId});

    requestN.send(urlParameters);
}

function UpdateCheck()
{
    var Length = document.getElementById("RoundNumberUpdate").value;

    if(Length == null || Length <= 0  )
    {
        document.getElementById("RoundNumberErrorUpdate").innerHTML = "The Round number must be 1 or higher";
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
        var RoundNum = document.getElementById("RoundNumberUpdate").value;
        var EventName = document.getElementById("EventNamesUpdate").value;
        EventName = EventName.replace(/[+]/g, " ");
        var LeaderName = document.getElementById("LeaderNamesUpdate").value;
        LeaderName = LeaderName.replace(/[+]/g, " ");
        var State = document.getElementById("RoundStateUpdate").value;
        State = State.replace(/[+]/g, " ");

        var requestN = new XMLHttpRequest();
        
        requestN.addEventListener("readystatechange", function(){
            if (requestN.readyState == 4 && requestN.status == 200)
            {
                var Result = JSON.parse(this.responseText); 
                
                alert(Result["message"]);
                location.reload();
            }
        });

        var url = '../php/roundTableDisplay.php' ;

        requestN.open("POST", url);
        requestN.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        var urlParameters = JSON.stringify({ type: "update", 
                                        RoundID: ActiveRecordId,
                                        oldRoundNum:ActiveRecordRoundNum,
                                        oldEvent: ActiveRecordEventName,
                                        newRoundNum: RoundNum,
                                        newEvent : EventName,
                                        newLeader: LeaderName,
                                        newState : State});

        requestN.send(urlParameters);
    }

}
>>>>>>> Stashed changes

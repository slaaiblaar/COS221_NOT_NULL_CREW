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

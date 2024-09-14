
function toWords(s) {
    // American Numbering System
    var th = ['', 'thousand', 'million', 'billion', 'trillion'];
    // uncomment this line for English Number System
    // var th = ['','thousand','million', 'milliard','billion'];

    var dg = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
    var tn = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
    var tw = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
    s = s.toString(); s = s.replace(/[\, ]/g, '');
    if (s != parseFloat(s)) return 'not a number'; var x = s.indexOf('.');
    if (x == -1) x = s.length; if (x > 15) return 'too big'; var n = s.split(''); var str = '';
    var sk = 0;
    for (var i = 0; i < x; i++) {
        if ((x - i) % 3 == 2) {
            if (n[i] == '1') { str += tn[Number(n[i + 1])] + ' '; i++; sk = 1; }
            else if (n[i] != 0) { str += tw[n[i] - 2] + ' '; sk = 1; }
        } else if (n[i] != 0) { str += dg[n[i]] + ' '; if ((x - i) % 3 == 0) str += 'hundred '; sk = 1; }
        if ((x - i) % 3 == 1) { if (sk) str += th[(x - i - 1) / 3] + ' '; sk = 0; }
    }
    if (x != s.length) { var y = s.length; str += 'point '; for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' '; }
    return str.replace(/\s+/g, ' ');
}
function cnvrt2Upper(str) {
    return str.toLowerCase().replace(/\b[a-z]/g, cnvrt);
    function cnvrt() {
        return arguments[0].toUpperCase();
    }
}

function getAmountInWords(v) {

    if (!v) return '';
    else {
        v = parseFloat(v);
    }
    var arr = v.fix(3).toString().split('.');
    var des = cnvrt2Upper(toWords(arr[0])) + 'KD';
    if (arr.length == 2) {
        var num = parseInt(arr[1]);
        if (num > 0) {
            des += ' and ' + cnvrt2Upper(toWords(arr[1])) + 'Fils';
        }
    }
    return des + ' Only';
}

String.prototype.convertDate = function () {
    if (!this) {
        var msg = `cannot convert invalid date string`;
        console.log(msg);
        $.showMessage(msg);
    }
    var x = this.split("/");
    day = x[0];
    mon = x[1];
    year = x[2];
    var myDate = new Date(year, mon - 1, day);
    return myDate;
}
String.prototype.cDate =function   () {
    var dttmAr = this.split(' '), dt, tm, nDate;
    dt = dttmAr[0].split('/');
    if (dttmAr.length > 1) {
        tm = dttmAr[1].split(':');
        return new Date(dt[2], dt[1] - 1, dt[0], tm[0], tm[1], tm[2]);
    }
    return new Date(dt[2], dt[1] - 1, dt[0]);
};
function dateDiff(d1, d2) {
    return (d1 - d2) / (3600000 * 24);
};

Date.prototype.getDateDiffInDays = function (EndDate) {
    var res = Math.floor(Math.abs(this - EndDate)) / (1000 * 60 * 60 * 24);
    if (!isNaN(res)) {
        return res;
    }
    return 0;
};
function ServerCallCtx(ctx,params, success,failure, actionId, actorId)
{

    //var params = { Command: 'FX_UPD_FileUpload', FileGuid: val('FileGuid', t.el), DBAction: 'GetUploadedFiles' };

    actionId = actionId || "DataAction";
    actorId = actorId || "DataHelper";
    params = params || {};
    failure = failure || function(){};

        SInfo = getForm(ctx, null, params);

    var inv = new AsyncWidgets.RAInvoker();
    inv.on('onSuccess', success);
    inv.on('onFailure', failure);
    inv.invokeRA({ params: [ "ActorId", actorId, "ActionId", actionId, "ServiceInfo", SInfo ] });

};
function ServerCall(serviceInfo, success, actionId, actorId) {

     //var params = { Command: 'FX_UPD_FileUpload', FileGuid: val('FileGuid', t.el), DBAction: 'GetUploadedFiles' };

     actionId = actionId || "DataAction";
     actorId = actorId || "DataHelper";
     if (typeof serviceInfo != "string")
     {
         SInfo = getForm(null, null, serviceInfo);
     }
     else
     {
         SInfo = serviceInfo;
     }
    var inv = new AsyncWidgets.RAInvoker();
     inv.on('onSuccess', success);
     inv.invokeRA({ params: ["ActorId", actorId, "ActionId", actionId, "ServiceInfo", SInfo] });

};
//check allowed file extension
function checkAllowedFileExtensions(allowedFileExt, fileName) {
    
    var modifyAllowedFileExt = allowedFileExt.replace("Allowed Files:", "");
    var commaOnStartFileExt = "," + modifyAllowedFileExt.trim();
    console.log(commaOnStartFileExt);


    fileName.each(function () {
        var fileName = $(this).text();
        var modFileName = fileName.split(".").pop();
        var addCommaFile = "," + modFileName.trim();
        console.log("Checking file extension: " + addCommaFile);

        if (commaOnStartFileExt.indexOf(addCommaFile) !== -1) {
            console.log("Allowed Ext");
        }
        else {
            console.log("Ext Not allowed");
            $('.file-input').val('');
            $.showMessage("File Extension Not Allowed");
           
        }
    });
};

//check dublicate file //
function checkDublicateFiles(fileName, linkFile, orignalFileName,  t) {
    
    for (var i = 0; i < fileName.length; i++) {
        var findToFile = $(fileName[i]);
        console.log("file: " + findToFile.text());
        for (var j = 0; j < linkFile.length; j++) {
            var findToLinkFile = $(linkFile[j]);
            console.log("Link Files: " + findToLinkFile.text());

            if (findToFile.text() == findToLinkFile.text()) {
                console.log("dublicate file found");
                $.showMessage(`File [${orignalFileName}] is already uploaded`);
                findToFile.remove();
                $('.file-input', t.el).val('');
               
                return;
            } else {
                console.log("not dublicate File");
            }
        }//end inner loop

    }//end forloop for search duplicate files
}

function getAmountInWordsSalesContract(v)
{

    if (!v) return '';
    else
    {
        v = parseFloat(v);
    }
    var arr = v.fix(3).toString().split('.');
    var des = cnvrt2Upper(toWords(arr[ 0 ])) + 'KD';
    if (arr.length == 2)
    {
        var num = parseInt(arr[ 1 ]);
        if (num > 0)
        {
            des += ' and ' + cnvrt2Upper(toWords(arr[ 1 ])) + 'Fils';
        }
    }
    return des + ' Only';
}


function compareDates(date1, date2) {
    // Convert the date strings to Date objects (assumes 'DD/MM/YYYY' format)


    // Convert the date strings to Date objects (assumes 'DD/MM/YYYY' format)
    // Convert the date strings to Date objects (assumes 'DD/MM/YYYY' format)
    function parseDate(dateStr) {
        const [day, month, year] = dateStr.split('/');
        return new Date(`${year}-${month}-${day}`);
    }

    const CarRecivedDateConvert = parseDate(date1);
    const CarToBeDeliverdDateConvert = parseDate(date2);

    // Check if the first date is earlier, later, or the same as the second date
    if (CarRecivedDateConvert > CarToBeDeliverdDateConvert) {
        console.log("Date 1 is later than Date 2.");
    } else if (CarRecivedDateConvert < CarToBeDeliverdDateConvert) {
        console.log("Date 1 is earlier than Date 2.");
    } else {
        console.log("Both dates are the same.");
    }

    // Calculate the difference in milliseconds
    const diffTime = Math.abs(CarRecivedDateConvert - CarToBeDeliverdDateConvert);

    // Convert difference to hours
    const diffHours = Math.floor(diffTime / (1000 * 60 * 60));
    debugger
    if (diffHours < 24) {
        console.log(`The difference is ${diffHours} hours.`);
    } else {
        // Define diffDays only when it's needed
        const diffDays = Math.floor(diffHours / 24);
        console.log(`The difference is ${diffDays} day(s).`);
    }

    // Return the final difference in hours or days
    return diffHours < 24 ? `${diffHours} hours` : `${Math.floor(diffHours / 24)} day(s)`;
}


//var sessionCheckTimeout;
//function setTimer()
//{
//    console.log('setting timer');
//    if (!!sessionCheckTimeout) {
//        console.log('clearing timer');
//        clearTimeout(sessionCheckTimeout);
//    }
//    sessionCheckTimeout = setTimeout(checkTimeout, 1210000);
//}
//function checkTimeout()
//{


//}
//$(document)
//    .keydown(setTimer)
//    .mousedown(setTimer)
//    .mousemove(setTimer);
//setTimer();


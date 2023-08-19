$(document).ready(CalculateReverseDate())


function CalculateReverseDate() {
    var coStartDate = new Date($('[argumentid="ContractStartDate"]').val());
    var conExpDate = new Date($('[argumentid="ContractExpiryDate" ]').val());

    if (!isNaN(coStartDate) && isNaN(conExpDate) && conExpDate >= coStartDate) {
        var timeDiff = Math.abs(contractExpiryDate.getTime() - contractStartDate.getTime());
        var reserveDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
        $('[argumentid="ReservationDays"]').val(reserveDays);



    } else {
        alert("Please enter valid contract start and expiry dates.");

    }


};
$('[argumentid="ContractStartDate"],[argumentid="ContractExpiryDate" ]', t.el).blur(calculateReserveDays);




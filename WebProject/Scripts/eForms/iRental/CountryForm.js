AsyncWidgets.WidgetScripts.frmEditTest_Countries = function (obj) {
    var t = obj;

   t.__firstShow = true;

    console.log("init");
    function v(aid, value)

    {
        if (value === undefined)
        {
            return $(`[argumentid="${aid}"]`, t.el).val();
        }
        
        $(`[argumentid="${aid}"]`, t.el).val(value);
        return v;
    }
    function toFlt(num)
    {
        var res = parseFloat(num);

        return isNaN(res) ? 0 : res;
    }
   
    function calculatesum() {
        //debugger;
        var num1 = parseFloat(v('Num1'));
        var num2 = parseFloat(v('Num2'));

        var totalPrice = parseFloat(v('TotalPrice'));
        var paidAmount = parseFloat(v('PaidAmount'));
        //var TotalPrice = parseFloat($('[argumentid="TotalPrice"]', t.el).val());
        //var paidAmount = parseFloat($('[argumentid="PaidAmount"]', t.el).val());
        //$('[argumentid="InstallmentsPaid"]', t.el).val(TotalPrice - paidAmount);
        ///if valid number
         

        v('Result', toFlt(num1) + toFlt(num2))('InstallmentsPaid', toFlt(totalPrice) - toFlt(paidAmount));
      
    }

     t.on('show', function ()
     {
         if (t.__firstShow) {
             $('[argumentid="Num1"], [argumentid="Num2"],[argumentid = "TotalPrice"],[argumentid = "PaidAmount"]', t.el).blur(calculatesum);

         }
         t.__firstShow = false
         console.log("on show")

      });

    t.on('onLoadedValues', function (args) {
        console.log("i,m loaded");

    //    debugger;
    //    var a = parseFloat($('[argumentid="Num1"]', t.el).val());
    //    var b = parseFloat($('[argumentid="Num2"]', t.el).val());

    ////    alert(a + b);

    //    $('[argumentid="Result"]', t.el).val(a + b);

        //$('[argumentid="Num1"]', '[argumentid="Num2"]').blur(calculatesum);


        calculatesum();


        //var TotalPrice = parseFloat($('[argumentid="TotalPrice"]', t.el).val());
        //var paidAmount = parseFloat($('[argumentid="PaidAmount"]', t.el).val());
        //$('[argumentid="InstallmentsPaid"]', t.el).val(TotalPrice - paidAmount);

        //alert(TotalPrice - paidAmount);

        

    });

   
};
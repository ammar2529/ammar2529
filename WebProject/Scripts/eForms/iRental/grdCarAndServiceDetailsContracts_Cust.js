AsyncWidgets.WidgetScripts.grdCarAndServiceDetailsContracts_Cust = function (obj)
{
    var t = obj;
 
    //t.on('rowsRendered', function ()
    //{

    //   /* var frm = AsyncWidgets.get('frmSparePartInventoryInvoice');*/
    
    //});

  
  
    t.on('rowsRendered', function ()
    {
        debugger
        $('table[itemno]', t.el).click(function ()
        {
            debugger

            var carValue = $('[colid="CarNumber"]  .ColValue', this).text();

        });
    });

};
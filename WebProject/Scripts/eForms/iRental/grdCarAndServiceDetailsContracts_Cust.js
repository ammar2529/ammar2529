AsyncWidgets.WidgetScripts.grdCarAndServiceDetailsContracts_Cust = function (obj)
{
    var t = obj;
 
    //t.on('rowsRendered', function ()
    //{

    //   /* var frm = AsyncWidgets.get('frmSparePartInventoryInvoice');*/
    
    //});

  
  
    t.on('rowsRendered', function ()
    {
        
        $('table[itemno]', t.el).click(function ()
        {
            

           /* var carValue = $('[colid="CarNumber"]  .ColValue', this).text();*/

        });


       
    });

};
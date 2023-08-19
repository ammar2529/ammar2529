<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestForm.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.TestForm" %>

<script src="../../../Scripts/eForms/iRental/TestForm.js"></script>
<table>


						<tr>
							<td class="ftitle">
								<nobr>Contract Start Date*:</nobr>
							</td>
							<td>
								<input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date CommonDisable" requirederr=' *' argumentid="ContractStartDate" />
								
							</td>

                            	<td class="ftitle">
								<nobr>Contract Expiry Date*:</nobr>
							</td>
							<td>
								<input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date DisableOnClose" requirederr=' *' argumentid="ContractExpiryDate" />
								
								
							</td>
							
						

		</tr>
   
	<tr>
		<td class="ftitle">
            <nobr>Reserve Days:*:</nobr>
          </td>
          <td>
            <input type="text" groupid="SalesContractsForm" maxlength="10" style="width: 150px;" class="text number CommonDisable" requirederr=' *' argumentid="ReservationDays" />
          </td>
   
	</tr>

</table>
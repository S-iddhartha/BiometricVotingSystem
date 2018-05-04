<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NEWUSER.aspx.cs" Inherits="NEWUSER" %>

<%@ Register assembly="Recaptcha" namespace="Recaptcha" tagprefix="recaptcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style8 {
            text-align: center;
        }
        
        .auto-style4 {
            width: 100%;
        }
        .auto-style6 {
            width: 179px;
            text-align: center;
            height: 151px;
        }
        .auto-style7 {
            width: 567px;
            height: 151px;
        }
        .auto-style9 {
            height: 151px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server" style="position: absolute; width: 1024px; height: 768px">
    <div class="auto-style8">
    
        <table align="center" cellspacing="20" class="auto-style4">
            <tr>
                <td class="auto-style6">
                    <asp:Image ID="Image1" runat="server" Height="129px" ImageUrl="~/Images/Election_Commission_of_India_Logo.png" Width="118px" />
                </td>
                <td class="auto-style7" style="font-family: Pristina; font-size: 50px; font-weight: bolder; font-style: normal;">Election Commission of India</td>
                <td class="auto-style9"></td>
            </tr>
        </table>
    
        <div class="auto-style8">
    
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="Smaller" Font-Underline="True" ForeColor="Blue" Text="NEW ADMIN USER PAGE"></asp:Label>
        <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        <br />
        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large" ForeColor="#006600">That&#39;s all Folks!!!</asp:Label>
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large" ForeColor="#006600" Text="You have successfully registered!!!"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
        <br />
            <br />
            <asp:Button ID="Back_Button" runat="server" OnClick="Back_Button_Click" Text="BACK" />
        <br />
        </div>
    
    </div>
    </form>
</body>
</html>

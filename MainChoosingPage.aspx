<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainChoosingPage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1024px;
            height: 768px;
            margin-top: 0px;
        }
        .auto-style2 {
            width: 45%;
            height: 260px;
            margin-left: 0px;
            margin-top: 148px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style6 {
            width: 179px;
            text-align: center;
        }
        .auto-style7 {
            text-align: center;
            width: 581px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <table align="center" cellspacing="20" class="auto-style4">
            <tr>
                <td class="auto-style6">
                    <asp:Image ID="Image1" runat="server" Height="129px" ImageUrl="~/Images/Election_Commission_of_India_Logo.png" Width="118px" />
                </td>
                <td class="auto-style7" style="font-family: Pristina; font-size: 50px; font-weight: bolder; font-style: normal;">Election Commission of India</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table align="center" cellspacing="20" class="auto-style2">
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Adminbutton" runat="server" OnClick="Adminbutton_Click" Text="ADMIN MODE" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="TestButton" runat="server" OnClick="TestButton_Click" Text="TEST MODE" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="UserButton" runat="server" OnClick="UserButton_Click" Text="USER MODE" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

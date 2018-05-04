<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AfterAdminPageLogin.aspx.cs" Inherits="AfterAdminPageLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

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
        .auto-style9 {
            height: 459px;
            width: 467px;
            text-align: center;
        }
        .auto-style10 {
            text-align: left;
        }
        .auto-style11 {
            height: 459px;
            text-align: center;
        }
        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            height: 459px;
            text-align: center;
            width: 239px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div class="auto-style10" style="position: absolute; width: 1024px; height: 768px">
    
        <table align="center" cellspacing="20" class="auto-style4">
            <tr>
                <td class="auto-style6">
                    <asp:Image ID="Image1" runat="server" Height="129px" ImageUrl="~/Images/Election_Commission_of_India_Logo.png" Width="118px" />
                </td>
                <td class="auto-style7" style="font-family: Pristina; font-size: 50px; font-weight: bolder; font-style: normal;">Election Commission of India</td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
        </table>
    
        <div>
    
        <br />
        <br />
        <br />
        </div>
        <table cellspacing="10" class="auto-style4">
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style9">
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="INSERT PEOPLE'S DATA" />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="CONFIGURE THIS MACHINE FOR VOTING PURPOSE" />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="VIEW RESULT" />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button4" runat="server" Text="NO. OF PEOPLE GAVE VOTE" />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button5" runat="server" Text="NO. OF PEOPLE  DIDN'T GIVE VOTE" />
                </td>
                <td class="auto-style11"></td>
            </tr>
        </table>
    
    </div>
    
    </div>
    </form>
</body>
</html>

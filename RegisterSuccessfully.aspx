<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterSuccessfully.aspx.cs" Inherits="RegisterSuccessfully" %>

<%@ Register assembly="Recaptcha" namespace="Recaptcha" tagprefix="recaptcha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style10 {
            text-align: left;
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
            text-align: center;
            width: 581px;
            height: 151px;
        }
        .auto-style17 {
            text-align: center;
            height: 151px;
        }
        .auto-style12 {
            text-align: center;
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
                <td class="auto-style17"></td>
            </tr>
        </table>
    
        <div class="auto-style12">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large" ForeColor="#009933" Text="You Have Successfully Inserted A Person's Details"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="BACK" />
        </div>
    
    </div>
    
    </div>
    </form>
</body>
</html>

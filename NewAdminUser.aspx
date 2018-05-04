<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewAdminUser.aspx.cs" Inherits="NewAdminUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
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
        .auto-style8 {
            height: 459px;
        }
        .auto-style9 {
            height: 459px;
            width: 467px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <div class="auto-style1" style="position: absolute; width: 1024px; height: 768px">
    
        <table align="center" cellspacing="20" class="auto-style4">
            <tr>
                <td class="auto-style6">
                    <asp:Image ID="Image1" runat="server" Height="129px" ImageUrl="~/Images/Election_Commission_of_India_Logo.png" Width="118px" />
                </td>
                <td class="auto-style7" style="font-family: Pristina; font-size: 50px; font-weight: bolder; font-style: normal;">Election Commission of India</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="X-Large" Font-Underline="True" ForeColor="Blue" Text="NEW ADMIN USER PAGE"></asp:Label>
        <br />
        <table cellspacing="10" class="auto-style4">
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style9">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text="ENTER YOUR ADHAR ID NO. *"></asp:Label>
                    <br />
                    <br />
                    <asp:TextBox ID="txtAdharNo" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Width="358px" AutoPostBack="True" OnTextChanged="txtAdharNo_TextChanged"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="BACK" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="NEXTButton" runat="server" OnClick="NEXTButton_Click" Text="NEXT" />
                    <br />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td class="auto-style8"></td>
            </tr>
        </table>
    
    </div>
    
    </div>
    </form>
</body>
</html>

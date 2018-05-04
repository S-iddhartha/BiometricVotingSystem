<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsertPeople'sData.aspx.cs" Inherits="InsertPeople_sData" %>

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
        }
        .auto-style7 {
            text-align: center;
            width: 581px;
        }
        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            height: 459px;
            text-align: center;
            width: 8px;
        }
        .auto-style9 {
            height: 459px;
            width: 954px;
            text-align: center;
        }
        .auto-style11 {
            height: 459px;
            text-align: center;
        }
        .auto-style15 {
            width: 100%;
            height: 513px;
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
    
        <div class="auto-style12">
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe Print" Font-Size="Large" Font-Underline="True" ForeColor="Blue" Text="INSERT PEOPLE'S DATA (ADHAR DETAILS)"></asp:Label>
        <br />
        </div>
        <table cellspacing="10" class="auto-style15">
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style9">
                    <asp:Label ID="Label2" runat="server" Text="NAME*"></asp:Label>
&nbsp;
                    <asp:TextBox ID="txtName" runat="server" Width="410px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="-----&gt;&gt; Name is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="FATHER'S NAME"></asp:Label>
&nbsp;&nbsp;
                    <asp:TextBox ID="txtFatherName" runat="server" Width="342px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="HUSBAND'S NAME"></asp:Label>
&nbsp;
                    <asp:TextBox ID="txtHusbandName" runat="server" Width="326px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="ADDRESS*"></asp:Label>
&nbsp;
                    <asp:TextBox ID="txtAddress" runat="server" Height="16px" Width="380px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress" ErrorMessage="-----&gt;&gt; Address is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="STATE*"></asp:Label>
&nbsp;
                    <asp:DropDownList ID="DropState" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropState_SelectedIndexChanged" Width="205px">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Odisha</asp:ListItem>
                        <asp:ListItem>Jharkhand</asp:ListItem>
                        <asp:ListItem>Chhattisgarh</asp:ListItem>
                        <asp:ListItem>Bihar</asp:ListItem>
                        <asp:ListItem>West Bengal</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropState" ErrorMessage="-----&gt;&gt; State is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="DISTRICT*"></asp:Label>
&nbsp;
                    <asp:DropDownList ID="DropDistrict" runat="server" Height="16px" Width="204px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDistrict" ErrorMessage="-----&gt;&gt; District is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="PIN CODE*"></asp:Label>
&nbsp;
                    <asp:TextBox ID="txtPin" runat="server" Width="198px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPin" ErrorMessage="-----&gt;&gt; Pin Code is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="MOBILE NO.*"></asp:Label>
&nbsp;
                    <asp:TextBox ID="txtMobileNo" runat="server" Width="210px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtMobileNo" ErrorMessage="-----&gt;&gt; Mobile No. is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="ADHAR CARD NO.*"></asp:Label>
&nbsp;
                    <asp:TextBox ID="txtAdharCardNo" runat="server" Width="265px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAdharCardNo" ErrorMessage="-----&gt;&gt; Adhar Card No. is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="BACK" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="SubmitButton" runat="server" Text="SUBMIT" OnClick="SubmitButton_Click" />
                </td>
                <td class="auto-style11"></td>
            </tr>
        </table>
    
    </div>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerifySuccessful.aspx.cs" Inherits="VerifySuccessful" %>

<%@ Register assembly="Recaptcha" namespace="Recaptcha" tagprefix="recaptcha" %>

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
            width: 567px;
        }
        .status{
             display: none;
             padding: 5px;
             background: #F47063;
             width: 100%;
             color: white;
             margin: 8px 0;
         }
        .status{
             display: none;
             padding: 5px;
             background: #F47063;
             width: 100%;
             color: white;
             margin: 8px 0;
         }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            width: 16%;
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="position: absolute; width: 1024px; height: 768px">
    <div class="auto-style8">
    
        <table align="center" cellspacing="20" class="auto-style4">
            <tr>
                <td class="auto-style6">
                    <asp:Image ID="Image1" runat="server" Height="129px" ImageUrl="~/Images/Election_Commission_of_India_Logo.png" Width="118px" />
                </td>
                <td class="auto-style7" style="font-family: Pristina; font-size: 50px; font-weight: bolder; font-style: normal;">Election Commission of India</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
        <div class="auto-style8">
    
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="Smaller" Font-Underline="True" ForeColor="Blue" Text="NEW ADMIN USER PAGE"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large" ForeColor="#006600"></asp:Label>
            <br />
        <br />
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Large" Text="Username"></asp:Label>
&nbsp;
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Large" Text=":"></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Font-Names="Comic Sans MS" Font-Size="Large" Width="220px" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:Label ID="lblUserid" runat="server" Font-Names="Comic Sans MS"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="----&gt;Field is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Large" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Large" Text=":"></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Font-Names="Comic Sans MS" Font-Size="Large" TextMode="Password" Width="220px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="----&gt;Field is Required" Font-Names="Comic Sans MS" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Font-Names="Comic Sans MS" ForeColor="#006600" Text="Password must be 8-10 characters long with at least one numeric,&lt;/br&gt;one upper case character and one special character."></asp:Label>
            <br />
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password is not followed with the requirements" Font-Names="Comic Sans MS" ForeColor="Red" ValidationExpression="(?=^.{8,20}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$"></asp:RegularExpressionValidator>
            <br />
            <table align="center" class="auto-style9">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                                <recaptcha:RecaptchaControl ID="recaptcha" runat="server" 
            PublicKey ="6LenUgkTAAAAAN60-uqiEJVwOaT-rvQnu2H7KhoA"
            PrivateKey ="6LenUgkTAAAAAIUk9oEDbFHVXq7q-HMtPEriYOdZ"/>

                            </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:Label ID="Label10" runat="server" Font-Names="Comic Sans MS"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Back_Button" runat="server" OnClick="Back_Button_Click" Text="BACK" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SubmitButton" runat="server" Text="SUBMIT" OnClick="SubmitButton_Click" />
        <br />
        </div>
    
    </div>
    </form>
</body>
</html>

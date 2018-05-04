<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerifyPeople'sDetails.aspx.cs" Inherits="VerifyPeople_sDetails" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
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
        .auto-style12 {
            text-align: center;
        }
        .auto-style15 {
            width: 100%;
            height: 513px;
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
        .auto-style17 {
            text-align: center;
            height: 151px;
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
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe Print" Font-Size="Large" Font-Underline="True" ForeColor="Blue" Text="VERIFY PEOPLE'S DATA (ADHAR DETAILS)"></asp:Label>
        <br />
        </div>
        <table cellspacing="10" class="auto-style15">
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style9">
                    <asp:Label ID="Label2" runat="server" Text="NAME*" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblName" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="FATHER'S NAME" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
                    &nbsp;<asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblFatherName" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="HUSBAND'S NAME" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblHusbandName" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="ADDRESS*" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblAddress" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="STATE*" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblState" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="DISTRICT*" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblDistrict" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="PIN CODE*" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblPinCode" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="MOBILE NO.*" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblMobileNo" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="ADHAR CARD NO.*" Font-Bold="True" Font-Names="Comic Sans MS"></asp:Label>
&nbsp;<asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Text=":"></asp:Label>
&nbsp;<asp:Label ID="lblAdharCardNo" runat="server" Font-Names="Comic Sans MS"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="X-Large" ForeColor="#009933" Text="Is these Details Okay?"></asp:Label>
                    <br />
                    <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="NO" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="SubmitButton" runat="server" Text="YES" OnClick="SubmitButton_Click" />
                </td>
                <td class="auto-style11"></td>
            </tr>
        </table>
    
    </div>
    
    </div>
    </form>
</body>
</html>

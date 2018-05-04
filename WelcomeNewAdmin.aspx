<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WelcomeNewAdmin.aspx.cs" Inherits="WelcomeNewAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <style>
  #container
      {
           width :720px;
           margin:0 auto;
           padding:15px;
      }
        #dragandrop
        {
            border: 2px dashed #92AAB0;
            width :720px;
            height: 100px;
            color: #92AAB0;
            text-align: center;
            vertical-align: middle;
            padding: 10px 0px 10px 10px;
            font-size:200%;
            display: table-cell;
        }
        .progressBar {
            width: 200px;
            height: 22px;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            display:inline-block;
            margin:0px 10px 5px 5px;
            vertical-align:top;
        }
 
        .progressBar div {
            height: 100%;
            color: #fff;
            text-align: center;
            line-height: 22px; /* same as #progressBar height if we want text middle aligned */
            width: 0;
            background-color: #0ba1b5;
            border-radius: 3px;
        }
        .statusbar
        {
            border-top:1px solid #A9CCD1;
            min-height:25px;
            width:700px;
            padding:10px 10px 0px 10px;
            vertical-align:top;
        }
        .statusbar:nth-child(odd){
            background:#EBEFF0;
        }
        .filename
        {
            display:inline-block;
            vertical-align:top;
            width:250px;
        }
        .filesize
        {
            display:inline-block;
            vertical-align:top;
            color:#30693D;
            width:100px;
            margin-left:10px;
            margin-right:5px;
        }
        .cancel{
            background-color:#A8352F;
            -moz-border-radius:4px;
            -webkit-border-radius:4px;
            border-radius:4px;display:inline-block;
            color:#fff;
            font-family:arial;font-size:13px;font-weight:normal;
            padding:4px 15px;
            cursor:pointer;
            vertical-align:top
        }
        .status{
             display: none;
             padding: 5px;
             background: #F47063;
             width: 100%;
             color: white;
             margin: 8px 0;
         }
            /*.modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }*/
  </style>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script>
      function sendFileToServer(formData, status) {
          var uploadURL = "FileFetchHandler.ashx"; //Upload URL
          var extraData = {}; //Extra Data.
          var jqXHR = $.ajax({
              xhr: function () {
                  var xhrobj = $.ajaxSettings.xhr();
                  if (xhrobj.upload) {
                      xhrobj.upload.addEventListener('progress', function (event) {
                          var percent = 0;
                          var position = event.loaded || event.position;
                          var total = event.total;
                          if (event.lengthComputable) {
                              percent = Math.ceil(position / total * 100);
                          }
                          //Set progress
                          status.setProgress(percent);
                      }, false);
                  }
                  return xhrobj;
              },
              url: uploadURL,
              type: "POST",
              contentType: false,
              processData: false,
              cache: false,
              data: formData,
              success: function (data, textStatus, jqXHR) {
                  status.setProgress(100);

              },
              complete: function (data, textStatus, jqXHR) {
                  $('.status').html(data.responseText).fadeIn().fadeOut(3200);

              }
          });

          status.setAbort(jqXHR);
      }

      var rowCount = 0;
      function createStatusbar(obj) {
          rowCount++;
          var row = "odd";
          if (rowCount % 2 == 0) row = "even";
          this.statusbar = $("<div class='statusbar " + row + "'></div>");
          this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
          this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
          this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
          this.abort = $("<div class='cancel'>cancel</div>").appendTo(this.statusbar);
          obj.after(this.statusbar);

          this.setFileNameSize = function (name, size) {
              var sizeStr = "";
              var sizeKB = size / 1024;
              if (parseInt(sizeKB) > 1024) {
                  var sizeMB = sizeKB / 1024;
                  sizeStr = sizeMB.toFixed(2) + " MB";
              }
              else {
                  sizeStr = sizeKB.toFixed(2) + " KB";
              }

              this.filename.html(name);
              this.size.html(sizeStr);
          }
          this.setProgress = function (progress) {
              var progressBarWidth = progress * this.progressBar.width() / 100;
              this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "%&nbsp;");
              if (parseInt(progress) >= 100) {
                  this.abort.hide();
              }
          }
          this.setAbort = function (jqxhr) {
              var sb = this.statusbar;
              this.abort.click(function () {
                  jqxhr.abort();
                  sb.hide();
              });
          }
      }
      function handleFileUpload(files, obj) {
          for (var i = 0; i < files.length; i++) {
              var fd = new FormData();
              fd.append('file', files[i]);

              var status = new createStatusbar(obj); //Using this we can set progress.
              status.setFileNameSize(files[i].name, files[i].size);
              sendFileToServer(fd, status);

          }
      }
      //var timer;
      //function ShowProgress() {
      //    /*timer = window.*/setTimeout(function () {
      //        var modal = $('<div />');
      //        modal.addClass("modal");
      //        $('body').append(modal);
      //        var loading = $(".loading");
      //        loading.show();
      //        var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
      //        var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
      //        loading.css({ top: top, left: left });
      //    }, 3200);
      //    //window.clearTimeout(timer);
      //}
      //$('form').live("submit", function () {
      //    ShowProgress();
      //});
      $(document).ready(function () {
          var obj = $("#dragandrop");
          obj.on('dragenter', function (e) {
              e.stopPropagation();
              e.preventDefault();
              $(this).css('border', '2px solid #0B85A1');

          });
          obj.on('dragover', function (e) {
              e.stopPropagation();
              e.preventDefault();
          });
          obj.on('drop', function (e) {

              $(this).css('border', '2px dotted #0B85A1');
              e.preventDefault();
              var files = e.originalEvent.dataTransfer.files;

              //We need to send dropped files to Server
              handleFileUpload(files, obj);
          });
          $(document).on('dragenter', function (e) {
              e.stopPropagation();
              e.preventDefault();
          });
          $(document).on('dragover', function (e) {
              e.stopPropagation();
              e.preventDefault();
              obj.css('border', '2px dotted #0B85A1');
          });
          $(document).on('drop', function (e) {
              e.stopPropagation();
              e.preventDefault();
              //ShowProgress();
              //setTimeout();
          });
          //$(document).off('drop', function (e)
          //{
          //    e.stopPropagation();
          //    e.preventDefault();
          //})
          var url;
          $(document).ready( function () {
              //    ShowProgress();
              //debugger;
              url = '../FileFetchHandler.ashx';

          });
      });
  </script>
    
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
        .status{
             display: none;
             padding: 5px;
             background: #F47063;
             width: 100%;
             color: white;
             margin: 8px 0;
         }
        </style>
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#container").hide();
            $("#YesButton").on("click", function () {
                $("#container").show();
            });
        });
    </script>--%>
    <script>
        function toggle_div_fun(id) {
            var divelement = document.getElementById(id);
            if (divelement.style.display == 'none')
            {
                divelement.style.display = 'block';
            }          
            else
                divelement.style.display = 'none';
        }
    </script>
    <%--<script>
        function toggle_div(loading)
        {
            var divelement = document.getElementById(loading);
            if (divelement.style.display == 'block')
                divelement.style.display = 'none';
        }
    </script>--%>
    
<%--<style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
</style>--%>
<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("modal");
            $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 200);
    }
    $('form').live("submit", function () {
        ShowProgress();
    });
</script>--%>

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
        <br />
        <br />
        <asp:Label ID="lblBefore" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large"></asp:Label>
        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large"></asp:Label>
        <asp:Label ID="lblAfter" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Button ID="NoButton" runat="server" Text="NO" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="YesButton" runat="server" Text="YES" OnClick="YesButton_Click" onclientclick="toggle_div_fun('container');"/>
    
        <br />
        <asp:Label ID="lblInstruction" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="Large"></asp:Label>
        <br />
        <%--<div class="loading" id="loading" align="center" style="display:none" runat="server">
    Loading. Please wait.<br />
    <br />
    <img src="References/ajax-loader.gif" " alt="" />
</div>--%>
       <div id="container" runat="server">
    <div class="status"></div>
        <div id="dragandrop">Drag & Drop Files Here</div>

        </div>
    
        <br />
        <br />
        <br />
        <asp:Button ID="OKButton" runat="server" OnClick="OKButton_Click1" Text="OK" />
    
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Names="Comic Sans MS" ForeColor="Red"></asp:Label>
    
    </div>
    
    </div>
    </form>
</body>
</html>

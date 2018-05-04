<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadPicture.aspx.cs" Inherits="UploadPicture" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

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
  </style>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script>
      function sendFileToServer(formData, status) {
          var uploadURL = "FileUploadHandler.ashx"; //Upload URL
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
                  $('.status').html(data.responseText).fadeIn().fadeOut(1600);

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
          });

      });
  </script>
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
        .auto-style18 {
            width: 20%;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        &nbsp;&nbsp;&nbsp;<div class="auto-style10" style="position: absolute; width: 1024px; height: 768px">
    
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
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe Print" Font-Size="Large" Font-Underline="True" ForeColor="Blue" Text="UPLOAD PEOPLE'S RETINA IMAGE (ADHAR DETAILS)"></asp:Label>
        <br />
        </div>
        <table cellspacing="10" class="auto-style15">
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style9">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="X-Large" ForeColor="#009933" Text="Okay then, Upload the Finger Print of the person &amp; click on SUBMIT"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <div id="container">
    <div class="status"></div>
        <div id="dragandrop">Drag & Drop Files Here</div>
        </div>
                    <table align="center" class="auto-style18">
                        <tr>
                            <td>
                                <recaptcha:RecaptchaControl ID="recaptcha" runat="server" 
            PublicKey ="6LenUgkTAAAAAN60-uqiEJVwOaT-rvQnu2H7KhoA"
            PrivateKey ="6LenUgkTAAAAAIUk9oEDbFHVXq7q-HMtPEriYOdZ"/>

                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="Comic Sans MS" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Button ID="BackButton" runat="server"  Text="BACK" OnClick="BackButton_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="SubmitButton" runat="server" Text="SUBMIT" OnClick="SubmitButton_Click"  />
                </td>
                <td class="auto-style11"></td>
            </tr>
        </table>
    
    </div>
    
    <div>
    
    </div>
    </form>
</body>
</html>

write a shell script executing checkup for local and remote
server's processes. Your script will be runned via the help of  crontab(1,5)
1
. You will read the
configuration  file  which  will  be  given  as  parameter  to  your  script.  An  example  for  configuration
file's format below;

#A Sample configuration file for script
ADMINMAIL=ibrahim@linux.org.tr
#Format should be;
#Hostname:Service:Command_To_Send:Expected_Result_Regexp
#local:Process_Name
local:http
www.modelyazilim.net:http:GET /:^<html.*>
196.145.236.12:443:quit:mail

For an example; for the line “www.modelyazilim.net”, your script will firstly ping the server, if ping is
successful,  connect  to  http  port  of  the  server  www.penguen.net  and  will  send  the  “GET  /”
command and it should search for regular expression “^<html.*>”. If the control is successful, no
action will be taken. If any connection error occours or the regular expression is not fetched from
the  result,  an  alert  mail  will  be  send  to  the  mail  address  ADMINMAIL  which  is  defined  in
configuration file.
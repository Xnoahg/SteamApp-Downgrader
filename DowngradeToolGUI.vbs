
' message box variable format: mb[id]
' input box variable format: ib[id]
' [id] represents the place of the message or input box in code
' ex: mb3 would be the third message box
Set wshShell = WScript.CreateObject ("WScript.shell")
dim fso: set fso = CreateObject("Scripting.FileSystemObject")
scriptDir = fso.GetAbsolutePathName(".")
internalDir = scriptDir+"\internal\"
DepotDownloader=fso.BuildPath(scriptDir, "internal\DepotDownloader.exe")
DotnetInstaller=fso.BuildPath(scriptDir, "internal\dotnet-runtime-6.0.12-win-x64.exe")
DepotDir=scriptDir+"\depots"

Function niceExit()
    eb=msgbox("Thanks for trying this utility, if you had any issues consider letting me know on github",0,"Steam App Downgrader: Goodbye")
    Quit
End Function

mb0=msgbox("this utility requires that you install the Microsoft Dotnet 6.0.12 Runtime, You will need to provide admininstrator permission to install it, if you don't install it now, or already have it installed this won't work",4,"Install Dotnet Runtime?")
if mb0 = 6 then wshShell.run(DotnetInstaller+" /norestart")
mb01 = msgbox("press OK after installing...",0,"Steam App Downgrader: Awaiting completion of dotnet install")
mb1=msgbox("This download utility can be used to make the proccess of downloading older versions of games and applications on steam easier" ,0, "Steam App Downgrader")
mb2=msgbox("Please note: you will be required to login to your steam account, and own a license for the software you wish to download. to continue press OK, otherwise press CANCEL.",1,"Steam App Downgrader: Before we start...")
if mb2 = 2 then niceExit()
mb3=msgbox("I need some info on the game or app you wish to downgrade, you can get this info from a website called SteamDB. I will open the website when you press OK.",0,"Steam App Downgrader")
wshshell.run "https://steamdb.info"
WScript.Sleep 500
mb4=msgbox("HEADS UP: this windows will likely dissapear when you click off, use the taskbar to refocus it when you're done.   Please search for the game or app you wish to downgrade, and click it, then press OK to continue",0,"Steam App Downgrader")
ib1=inputbox("At the top of the page you should see appid, next to, or below it are some numbers. Please enter those numbers:","Steam App Downgrader: Input Box")
appid = ib1
mb5=msgbox("HEADS UP: this windows will likely dissapear when you click off, use the taskbar to refocus it when you're done.   Please click on 'Depots' on the left side of the screen, then press OK.",0,"Steam App Downgrader")
mb6=msgbox("Below the text 'Depots' in the top middle of the site, there is a table, find the NUMBERS IN BLUE TEXT next to the 'NAME' of the game matching your OS, Do you need a picture showing you where the right numbers are?",4,"Steam App Downgrader")
if mb6 = 6 then 
wshshell.run "https://github.com/Xnoahg/SteamApp-Downgrader/raw/main/internal/res/winhelp1.png"
end if
ib2=inputbox("HEADS UP: this windows will likely dissapear when you click off, use the taskbar to refocus it when you're done. type the blue numbers in below, then click on those numbers on the website, finally return here, and press ok: ","Steam App Downgrader: Input Box")
depot=ib2
mb7=msgbox("This might be a bit tricky, but as far as I know you unfortunetly can't chose a version based on its number. instead you select it by its release date. please look up the release date of the version you wish to downgrade to, then press OK",0,"Steam App Downgrader")
ib3=inputbox("click manifests, What are the numbers in blue next to the release date of the version you wish to download: ","Steam App Downgrader: Input Box")
manifest=ib3
mb8=msgbox("on to the final part, press OK to login to steam, and start the download",0,"Steam App Downgrader: Almost Done!")
user=inputbox("Enter Steam Account Name, then press OK","Steam App Downgrader: Login to steam...")
passwd=inputbox("Enter Steam Account Password, then press OK","Steam App Downgrader: Login to steam...")
mb9=msgbox("Just so you know before the download begins, you will probably recieve an email asking you to approve a login to steam, you are REQUIRED to approve it or the download will not work.",0,"Steam App Downgrader: Press OK to continue")
mb10=msgbox("last thing I promise, a terminal window will appear, the terminal window is downloading the downgraded version of the game/app, if you have steam guard on your account it will ask for a code, you must enter it or the download wont work",0,"Steam App Downgrader: Press OK to continue")
DepotDownloaderCMD = DepotDownloader+" -app "+appid+" -depot "+depot+" -manifest "+manifest+" -username "+user+" -password "+passwd
'debugOut=msgbox(DepotDownloaderCMD,0,"The command used in the terminal")
wshShell.run("cmd /c "+DepotDownloaderCMD)
mb11=msgbox("when the terminal window closes press OK to open the folder where the downgraded version is stored",1,"Completed Succesfully (if you provided the correct info)")
if mb11=1 then wshShell.run("explorer.exe "+DepotDir)
mb12=msgbox("oh yeah i forgot, windows is dumb, click on the explorer window on your taskbar as it might just open in the background",0,"Steam App Downloader: Finally...")
niceExit()
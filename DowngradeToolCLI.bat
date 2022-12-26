@echo off
cd internal
set /p InstallDotnetConf="THIS REQUIRES THE MICROSOFT DOTNET RUNTIME 6.0.12, would you like to run the installer? (Y/N)"
if /i "%InstallDotnetConf%" == "Y" start "" dotnet-runtime-6.0.12-win-x64.exe /norestart
echo This download utility can be used to make the proccess of downloading older versions of games and applications on steam easier
echo Please note: you will be required to login to your steam account (within this script) and own a license for the software you wish to download
echo ---
echo Whenever you're ready to begin, press any key...
pause > nul
cls && echo First things first, ill need some info on the game or app you wish to downgrade.
echo Visit https://steamdb.info/ and search for the game or app. then click on the 'Depots' button
echo Whenever you're ready, press any key to coninue...
pause > nul
echo Okay... On to the next part.
echo At the top of the page you should see something that says appid, next to it are some numbers.
set /p appid="Please tell me what those numbers are:"
echo Thanks...
echo Whenever you're ready, press any key to coninue...
pause > nul
echo Okay... On to the next part.

echo At the top of the page, below the app id part, you should see a box below a title that says depots, in this box find the right one for your OS.
echo The box kinda looks like this (pretend like the [+] is the windows logo): 
echo ----------------------------------------------------------------"
echo | id     | name                 | max size   | OS  | Extra Info |"
echo ----------------------------------------------------------------"
echo | 4002   | GMOD Windows         | 470.65 MiB | [+] |            |"
echo ----------------------------------------------------------------"

echo (this example is garys mod)
echo (if there are multiple, makes sure to use the one with the app or games name in it)
echo (an example of this is when it shows one for 'Microsoft VC Redist', you don't want that one)
set /p depot="could you please tell me what the numbers in blue text (under id) are, that match your os: 
echo Okay now, Click on those numbers in blue text.
echo Whenever you're ready, press any key to coninue... 
pause > nul && cls && echo Okay... On to the next part.

echo On the left side of the page, below files, click on manifests...
echo Once you've dont that, press any key to coninue...
pause > nul
echo This might be a bit tricky, but as far as I know you unfortunetly can't chose a version based on its number. instead you select it by its release date.
echo Now would be a good time to google 'When was version <version number here> of <game or app name here> released'
echo Once you've gotten that, press any key to coninue..
pause > nul
set /p manifest="What are the numbers in blue next to the release date of the version you wish to download: "

echo Whenever you're ready, press any key to coninue to the final part...
pause > nul && cls && echo Okay... Almost done!"
echo What is your steam ACCOUNT name, this is differnt from your display name...
echo To find your account name; open steam, at the top left click steam, then in the dropdown menu, click settings, your account name should be at the top of the window that just appeared
set /p user="what is your steam account name? "
echo Now for this to work, ill need your steam password, if you don't trust this script thats completly understandable, but if you wish to continue, it is required.
set /p passwd="please type your steam password: "

echo If you have steam guard youll need to type the code in when the download starts 
echo You also should recieve an email asking you to approve the login

echo Press any key to start the download process...
pause > nul && cls && echo Starting Download!"
dotnet DepotDownloader.dll -app %appid% -depot %depot% -manifest %manifest% -username %user% -password %passwd%
echo Okay, if the information you provided was correct that should've worked.
echo Open the depots folder, then the folder with the appid, and finally the folder with some other numbers."
echo This folder contains the downgraded version of the game or app."
echo Press any key to exit
pause > nul && exit
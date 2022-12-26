@echo off
cd internal
echo "This download utility can be used to make the proccess of downloading older versions of games and applications on steam easier"
echo "please note: you will be required to login to your steam account and own a license for the software you wish to download"
echo "---"
echo "whenever you're ready to begin, press any key..." && pause > nul
cls && echo "first things first, ill need some info on the game or app you wish to downgrade."
echo "visit https://steamdb.info/ and search for the game or app. then click on the 'Depots' button"
echo "whenever you're ready, press any key to coninue..." && pause > nul && echo "okay... on to the next part."
echo "at the top of the page you should see something that says appid, next to it are some numbers."
set /p appid="please tell me what those numbers are:"
echo "thanks... ill take note of that"
echo "whenever you're ready, press any key to coninue..." && pause > nul && echo "okay... on to the next part."

echo "at the top of the page, below the app id part, you should see a box below a title that says depots, in this box find the right one for your OS"
echo "the box kinda looks like this (pretend like the [+] is the windows logo): "
echo "----------------------------------------------------------------"
echo "| id     | name                 | max size   | OS  | Extra Info |"
echo "----------------------------------------------------------------"
echo "| 4002   | GMOD Windows         | 470.65 MiB | [+] |            |"
echo "----------------------------------------------------------------"

echo "(this example is garrys mod)"
echo "(if there are multiple, makes sure to use the one with the games name in it)"
echo "(an example of this is when it shows one for 'Microsoft VC Redist', you don't want that one)"
set /p depot="could you please tell me what the numbers in blue text (under id) are, that match your os: "
echo "okay now, click on those numbers in blue text."
echo "whenever you're ready, press any key to coninue..." && pause > nul && cls && echo "okay... on to the next part."

echo "on the left side of the page, below files, click on manifests..."
echo "once you've dont that, press any key to coninue..." && pause > nul
echo "this might be a bit tricky, but you unfortunetly can't chose a version based on its number. instead you select it by its release date."
echo "now would be a good time to ask your privacy invading freind google 'When was version <version number here> of <game or app name here> released"
echo "once you've gotten that, press any key to coninue..." && pause > nul
set /p manifest="alright now give me the numbers in blue next to the release date of the version you wish to download: "

echo "whenever you're ready, press any key to coninue to the final part..." && pause > nul && cls && echo "okay... almost done!"
echo "ill need your steam ACCOUNT name, this is differnt from your display name..."
echo "to get this, open steam, at the top left, click steam, then in the dropdown, click settings, your account name should be at the top of the windows that just popped up"
set /p user="what is your account name? "
echo "now i need your steam password, if you don't trust me thats completly understandable, but if you wish to continue, it is required."
echo "you should recieve an email before this starts, after giving me the password, asking for a verification code, you can check the login location to make sure its yours."
echo "then youll need that to start the download." 
set /p passwd="please type your steam password: "

echo "whenever you're ready, press any key to start the download process..." && pause > nul && cls && echo "Starting Download!"
dotnet DepotDownloader.dll -app %appid% -depot %depot% -manifest %manifest% -username %user% -password %passwd%
echo "okay well that should've worked, open the depots folder, then the folder with the appid, and finally the folder with some other numbers."
echo "this folder contains the downgraded version of the game or app."
echo "press any key to exit" && pause > nul
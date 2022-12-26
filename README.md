THIS REQUIRES THE MICROSOFT DOTNET RUNTIME 6.0.12
it is located in .\internal\dotnet-runtime-6.0.12-win-x64.exe

you will be prompted to install it when you run the VBS or BAT file

Run "DowngradeToolGUI.VBS" it will guide you through the entire process, step by step, with a GUI, or run DowngradeToolCLI.bat for step by step guide inside a terminal window

if you know what you're doing/already have the values to run this, open the "internal" folder and start a command prompt there.
the syntax for the application is as follows:
dotnet DepotDownloader.dll -app <id> -depot <id> -manifest <id> -username <username> -password <password>

for full documentation on how this works read the DOCS.md file
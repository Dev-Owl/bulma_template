set WORKING_DIRECTORY=%cd%
SET mypath=%~dp0
cd %mypath%
::Remove old build
RMDIR css
RMDIR webfonts
cd src
::Update external libs
call npm install
call npm update
::Build bulma file 
call sass mystyles.scss ..\css\bulma_custom.min.css --style compressed
::Copy fontawesome
xcopy /s /Y fontawesome-all.min.css ..\css\*
::Copy webfonts
xcopy /s /Y webfonts ..\webfonts\*
cd ..
start index.html
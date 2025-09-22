@echo off
if "%1"=="" (
  echo Usage: setup_project.bat ^<new_project_name^>
  exit /b 1
)
set PROJECT_NAME=%1
echo Creating flutter project: %PROJECT_NAME%
flutter create %PROJECT_NAME%
echo Copying starter files into project...
xcopy /E /I starter_files\lib %PROJECT_NAME%\lib
if not exist %PROJECT_NAME%\assets mkdir %PROJECT_NAME%\assets
xcopy /E /I starter_files\assets %PROJECT_NAME%\assets
move /Y %PROJECT_NAME%\pubspec.yaml %PROJECT_NAME%\pubspec.yaml.bak >nul 2>&1
copy starter_files\pubspec.yaml %PROJECT_NAME%\pubspec.yaml
cd %PROJECT_NAME%
flutter pub get
echo Project ready at %cd%
echo Build with: flutter build apk --debug
pause

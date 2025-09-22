LOVE MESSAGE APP - FULL SETUP PACKAGE
------------------------------------

This package helps you create a fresh, working Flutter project (with updated Gradle)
and injects the app code + pre-generated messages into it.

Files included (inside 'starter_files'):
- lib/main.dart         (app code)
- assets/messages.json  (2,500 messages total; 500 per category)
- pubspec.yaml          (includes the assets declaration)
- setup_project.sh      (script for macOS/Linux/WSL)
- setup_project.bat     (script for Windows CMD/PowerShell)

HOW TO USE (recommended):
1) Make sure Flutter is installed and available on PATH on your machine.
   - Check: `flutter --version` in terminal/command prompt.

2) Extract this ZIP to a folder, e.g., C:\users\you\love_app_setup or ~/love_app_setup

3) Run the setup script for your OS:

   macOS / Linux / WSL:
     chmod +x setup_project.sh
     ./setup_project.sh new_love_app

   Windows (CMD/PowerShell):
     setup_project.bat new_love_app

   The script will:
   - run `flutter create <project_name>`
   - copy the starter_files contents into the new project (lib, assets, pubspec.yaml)
   - run `flutter pub get`

4) After the script completes, open the new project folder in Android Studio / VS Code
   and build a debug APK:
     flutter build apk --debug

   APK path: build/app/outputs/flutter-apk/app-debug.apk

If you prefer, you can also create a GitHub repo and push the full project to trigger a CI build
using the workflow I provided earlier. But this script ensures the local project is created with
the correct, up-to-date Gradle/Android configuration to avoid "Process completed with exit code 1".

If you want, I can also try to run a CI build for you and supply the APK, but I'll need either a
GitHub repo or permission to use a temporary CI workspace. Tell me what you prefer ❤️
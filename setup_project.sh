#!/usr/bin/env bash
set -e
if [ -z "$1" ]; then
  echo "Usage: ./setup_project.sh <new_project_name>"
  exit 1
fi
PROJECT_NAME=$1
echo "Creating flutter project: $PROJECT_NAME"
flutter create "$PROJECT_NAME"
echo "Copying starter files into project..."
cp -r starter_files/lib "$PROJECT_NAME"/lib
mkdir -p "$PROJECT_NAME"/assets
cp -r starter_files/assets/* "$PROJECT_NAME"/assets/
# Overwrite pubspec.yaml carefully: back up original then replace
mv "$PROJECT_NAME"/pubspec.yaml "$PROJECT_NAME"/pubspec.yaml.bak
cp starter_files/pubspec.yaml "$PROJECT_NAME"/pubspec.yaml
cd "$PROJECT_NAME"
flutter pub get
echo "Project ready at: $(pwd)"
echo "Build with: flutter build apk --debug"

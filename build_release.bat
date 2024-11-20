echo off
echo ========================================
echo Building release version of CustomBank...
echo ========================================

echo Cleaning...
flutter clean

echo Installing dependencies...
flutter pub get

echo Building App Bundle...
flutter build appbundle --release

echo Building APK...
flutter build apk --release

echo ========================================
echo Build complete!
echo ========================================
echo APK location: build\app\outputs\flutter-apk\app-release.apk
echo App Bundle location: build\app\outputs\bundle\release\app-release.aab
echo ========================================

pause
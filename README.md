# NextWeather

A Flutter weather application.

## UI & UX
- [Figma design project](https://www.figma.com/file/PdF4XmYoXR4f4v0cZvc7Z0/Weather-App?node-id=0%3A1)
- [Clickable prototype](https://www.figma.com/proto/PdF4XmYoXR4f4v0cZvc7Z0/Weather-App?node-id=2%3A1338&viewport=-99%2C328%2C0.45586439967155457&scaling=scale-down) 

![alt text](https://mir-cdn.behance.net/v1/rendition/project_modules/fs/f9aa7f108007931.5fb4334bef868.png)

## Flutter version

This app was developed and tested on the following flutter channel and version:
```javascript
Flutter 1.24.0-10.2.pre • channel beta • https://github.com/flutter/flutter.git
Framework • revision 022b333a08 (10 days ago) • 2020-11-18 11:35:09 -0800
Engine • revision 07c1eed46b
Tools • Dart 2.12.0 (build 2.12.0-29.10.beta)
```

## Tested devices

The apps functionality and UI were tested on the following devices:
- **Android**
    - Pixel 2 XL (Android 10)
- **iOS Simulator**
    - iPhone SE
    - iPhone 8
    - iPhone 11 Pro
- **iOS Device**
    - iPhone 8 (iOS 13.7)
- **Web**
    - Google Chrome (Version 85)

## Localizations

The apps supports the following localizations with appropriate translations:
- English
- German
- Polish

## Running the app
If you are using Visual Studio Code you can use the predefined lunch configurations. 

If you want to run the app using the terminal:
- Debug & Development
```
flutter run --flavor dev lib/main_dev.dart
```
- Release & Production
```
flutter run --release --flavor prod lib/main_prod.dart
```
    
## Running tests
Try to run the tests via your IDE (preferably Visual Studio Code). In that case just lunch `Dart: Run all tests`. 

You can run flutter driver tests using the command:
```
flutter drive --flavor dev --target=test_driver/app.dart
```

## Web version

The app supports running it on the web with some caveats:

**1. The use of the MetaWeather API is blocked by their CORS policy.** 

When we try to run the app we get:
```
:59238/#/:1 Access to XMLHttpRequest at 'https://www.metaweather.com/api/location/638242' from origin 'http://localhost:59238' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.
```
We can overcome this by running an instance of Chrome with all security settings disabled. In terminal on MacOS (sorry windows users) we type:
```
open -na Google\ Chrome --args --disable-web-security --user-data-dir=$HOME/profile-folder-name
```
It opens a new chrome window with all security settings disabled. Next, we build the debug web version with our IDE. It opens a new window (don't close it). Then we copy the localhost address of our flutter app. We try to lunch the address in the chrome instance with disabled security. The app should now work. 

**2. Of course the UI was not fully optimized for the web!** 

## Nice to have functionality
- Add the ability to select another location
- Select the location based on current user's location

## Known bugs
1. When a network error occurs while in vertical orientation the settings button is still available to click (that's good), but when we have an error while in horizontal mode, it is hidden (minor inconvenience but still seems like something that needs to be corrected)

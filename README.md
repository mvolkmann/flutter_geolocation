# flutter_geolocation

This uses the pub.dev package geolocator
https://pub.dev/packages/geolocator
to get the latitude and longitude of the user.

For Android, add these lines in `android/app/src/main/AndroidManifest.xml`
after the `application` element:

```xml
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

For iOS, you may need to add these lines
in `ios/Runner/Info.plist`:

```xml
    <key>NSLocationWhenInUseUsageDescription</key>
	<string>This app needs access to location when open.</string>
    <key>NSLocationAlwaysUsageDescription</key>
	<string>This app needs access to location when in the background.</string>
    <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
	<string>This app needs access to location when open and in the background.</string>
```

If you get a "MissingPluginException", follow these steps:

- enter `flutter clean`
- enter `flutter pub get`
- restart the app


# Running, Building, and Testing the Flutter app
```
cd [app_name] # It could be {adder, word_counter, whole_app)
flutter run # For running the app in debug mode
flutter run --release # For running the app in release mode
flutter build apk # For building release apk build
flutter install # For installing the release apk built in the previous command
flutter test [test_name] # for widget testing
```

# Running the Java backend

(Requires JDK 8 and Maven installed)

```
cd backend
mvn install
```
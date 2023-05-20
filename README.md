# FlutterFakeApiApp
FlutterFakeApiApp is simple training example of cross platform app 📱
# About
It simply loads comments from API and shows it.
The list of comments is from this request: [https://jsonplaceholder.typicode.com/comments](https://jsonplaceholder.typicode.com/comments) 

## Screenshots
![image](https://github.com/BohdanStarunskyi/FlutterFakeApiApp/assets/91286770/3ed13449-02fb-4f49-a7cf-c221e4aeb8f4)

## Built With  🛠
- [Flutter](https://flutter.dev//)  - Flutter is an open source framework by Google for building multi-platform applications.
- [Dart](https://dart.dev/)  - Dart is a client-optimized language for fast apps on any platform.
- [Retrofit](https://pub.dev/packages/retrofit)  - A type-safe HTTP client.
- [Material](https://docs.flutter.dev/ui/widgets/material) - Ready-to-use Material Design Components.

# Package Structure

```
lib    # App Code
.
├── models                  # Stores comment model.
│
├── api.dart                # Contains rest api client code
│
├── comment_service.dart    # Contains code to get comments from server
│
└── main.dart               # Main app class. Contains UI.

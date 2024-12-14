# TV Shows App

A beautiful Flutter application for browsing and discovering TV shows, developed by Mochamad Resa Qulyubi.

## Features

### 1. Authentication
- User registration and login functionality
- Secure local storage of user credentials
- Test account available for quick access

### 2. TV Shows Browsing
- Grid and list view options for show display
- Responsive layout adapting to different screen sizes
- Beautiful card-based UI with show posters
- Rating display and basic show information

### 3. Search Functionality
- Real-time search as you type
- Clear and intuitive search interface
- Quick results display

### 4. Show Details
- Detailed show information page
- Hero animations for smooth transitions
- Show summary with HTML formatting
- Genre tags and rating display
- Schedule information
- Links to official sites

### 5. UI/UX Features
- Modern Material Design 3
- Consistent blue theme throughout
- Responsive layouts for all screen sizes
- Smooth animations and transitions
- Error handling with user feedback
- Loading indicators

## Technical Details

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  http: ^0.13.6
  sqflite: ^2.2.8+4
  sqflite_common_ffi: ^2.2.5
  path: ^1.8.2
  shared_preferences: ^2.1.1
  provider: ^6.0.5
  flutter_html: ^2.2.1
```

### API Integration
- Uses TVMaze API for show data
- No API key required
- Fetches show information, images, and schedules

### Database
- SQLite database for local storage
- User authentication data
- Secure password handling

## Project Structure

```
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── movie_list_screen.dart
│   └── tv_show_detail_screen.dart
├── services/
│   └── movie_service.dart
└── helpers/
    └── database_helper.dart
```

## Getting Started

1. Clone the repository
```bash
git clone [repository-url]
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Test Account
For testing purposes, use these credentials:
- Username: test
- Password: test123

## Development Environment
- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- SQLite database

## Contributing
This project is a submission for Flutter Development. Feel free to use it as a reference or starting point for your own projects.

## Author
Mochamad Resa Qulyubi

## License
This project is for educational purposes. All rights reserved.

## Acknowledgments
- TVMaze API for providing the show data
- Flutter team for the amazing framework
- Material Design team for the design guidelines

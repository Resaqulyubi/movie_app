# TV Shows App

A beautiful Flutter application for browsing and discovering TV shows, developed by Mochamad Resa Qulyubi.

## Features

### 1. Authentication
- User registration and login functionality
- Secure local storage of user credentials using SQLite
- Platform-specific database implementation (SQLite for mobile, SQLite FFI for desktop)
- Test account available for quick access (username: "test", password: "test123")

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
  cupertino_icons: ^1.0.6
  http: ^1.2.0
  sqflite: ^2.3.0
  sqflite_common_ffi: ^2.3.0
  path: ^1.8.3
  shared_preferences: ^2.2.2
  provider: ^6.1.1
  flutter_html: ^3.0.0-beta.2
```

## Technical Specifications

- Dart SDK: ">=3.6.0 <4.0.0"
- Flutter: Latest stable version
- Minimum Android SDK: 21
- Target Android SDK: Latest stable
- iOS Deployment Target: 11.0
- Dependencies:
  - http: For API requests
  - sqflite: For mobile database
  - sqflite_common_ffi: For desktop database
  - provider: For state management
  - flutter_html: For HTML rendering
  - And more...

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── database/
│   └── sqlite_init.dart      # Database initialization
├── screens/
│   ├── login_screen.dart     # Authentication UI
│   ├── movie_list_screen.dart # Main shows list
│   └── tv_show_detail_screen.dart # Show details
├── services/
│   └── movie_service.dart    # API integration
└── helpers/
    └── database_helper.dart  # Database operations
```

### Platform Support
- Android: Native SQLite implementation
- iOS: Native SQLite implementation
- Desktop (Linux, Windows, macOS): SQLite FFI implementation

### Database Implementation
The app uses a platform-specific approach for database operations:
- Mobile platforms use the native SQLite implementation
- Desktop platforms use SQLite FFI
- Automatic platform detection and appropriate database factory selection

### API Integration
- Uses TVMaze API for show data
- No API key required
- Fetches show information, images, and schedules

### Recent Updates
- Fixed SQLite implementation for better cross-platform support
- Improved database initialization process
- Added platform-specific database factory selection
- Updated dependencies to latest stable versions
- Enhanced error handling and user feedback

## Getting Started

1. Clone the repository
```bash
git clone [your-repo-url]
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

### Test Account
You can use the following test account to try the app:
- Username: test
- Password: test123

## Development Environment
- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- Git for version control
- SQLite database tools

## Contributing
Feel free to submit issues and enhancement requests!

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Author
Mochamad Resa Qulyubi

## Acknowledgments
- TVMaze API for providing the TV shows data
- Flutter team for the amazing framework
- All contributors who helped improve this project
- Material Design team for the design guidelines

# Contact App 📱

A beautiful and modern Flutter contact management application with a sleek dark theme and intuitive user interface. This app allows users to create, manage, and organize their contacts with custom profile pictures.

## ✨ Features

- **📸 Custom Profile Pictures**: Add personal photos to your contacts using the device gallery
- **🎨 Modern Dark UI**: Elegant dark theme with cream accents for a premium look
- **📱 Responsive Grid Layout**: Contacts displayed in a clean 2-column grid format
- **➕ Easy Contact Addition**: Simple form with real-time preview
- **🗑️ Quick Deletion**: One-tap contact removal
- **📧 Contact Information**: Store name, email, and phone number for each contact
- **📊 Contact Limit**: Maximum of 6 contacts to maintain optimal performance
- **🎯 Form Validation**: Email format validation and required field checking

## 🖼️ Screenshots

The app features a beautiful dark blue theme (`#29384D`) with cream accents (`#FFF1D4`) and includes:
- Custom app bar with logo
- Empty state with illustration
- Contact cards with profile pictures
- Floating action button for adding contacts
- Bottom sheet form for contact creation

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (version 3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd contact_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Usage

### Adding a Contact
1. Tap the floating action button (+)
2. Select a profile picture from your gallery (optional)
3. Fill in the contact details:
   - Name (required)
   - Email (required, with validation)
   - Phone number (required)
4. Tap "Enter user" to save the contact

### Managing Contacts
- **View**: Contacts are displayed in a grid layout with profile pictures
- **Delete**: Tap the red "Delete" button on any contact card
- **Limit**: Maximum 6 contacts allowed (floating action button disappears when limit is reached)

## 🛠️ Technical Details

### Architecture
- **Framework**: Flutter
- **Language**: Dart
- **State Management**: StatefulWidget (setState)
- **UI**: Material Design with custom theming

### Key Dependencies
- `flutter`: Core Flutter framework
- `image_picker: ^1.0.4`: For selecting images from gallery
- `google_fonts`: For custom typography
- `flutter_native_splash: ^2.4.6`: For splash screen configuration

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── models/
│   └── contact.dart         # Contact data model
├── screens/
│   └── home_screen.dart     # Main screen with contact list
└── widgets/
    ├── add_contact_sheet.dart  # Bottom sheet for adding contacts
    └── contact_card.dart       # Individual contact display card
```

### Color Scheme
- **Primary Background**: `#29384D` (Dark Blue)
- **Accent Color**: `#FFF1D4` (Cream)
- **Secondary Text**: `#E2F4F6` (Light Blue)
- **Error Color**: `#EE403D` (Red)

## 📋 Features Breakdown

### Contact Model
```dart
class Contact {
  final String name;
  final String email;
  final String phone;
  final String imagePath;
}
```

### Form Validation
- Name: Required field
- Email: Required field with regex validation
- Phone: Required field
- Image: Optional (defaults to app logo)

### UI Components
- **AppBar**: Custom logo and dark theme
- **GridView**: 2-column layout for contacts
- **FloatingActionButton**: Conditional display based on contact count
- **BottomSheet**: Modal form for contact creation
- **ContactCard**: Individual contact display with delete functionality

## 🔧 Customization

### Adding More Contacts
To increase the contact limit, modify the condition in `home_screen.dart`:
```dart
floatingActionButton: contacts.length >= 6 ? null : FloatingActionButton(...)
```

### Changing Theme Colors
Update the color constants in the respective widget files:
- `Color(0xFF29384D)` - Primary background
- `Color(0xFFFFF1D4)` - Accent color
- `Color(0xFFE2F4F6)` - Text color

## 📱 Platform Support

- ✅ Android
- ✅ iOS


## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for typography
- Image Picker package for gallery integration

---

**Made with ❤️ using Flutter**

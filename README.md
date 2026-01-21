# MediQueue – Smart Hospital Queue Management System

## 📱 Overview

**MediQueue** is a mobile-first digital queueing system designed to modernize hospital appointment management in Tier-2/3 cities. It allows patients to join queues remotely and receive real-time updates, reducing crowding and improving hospital workflow.

## 🎯 Problem Statement

Patients in many hospitals still experience:

- Long waiting times
- Crowded waiting areas
- Inefficient patient flow management
- Lack of transparency in queue status
- Stress for both patients and staff

## ✨ Solution

MediQueue solves these issues by offering:

- **Mobile-first queueing:** Join queues remotely
- **Real-time updates:** Live Firestore sync
- **Multi-channel notifications:** App alerts + SMS
- **Minimal infrastructure:** Only tablets required for hospitals

## 🚀 Features

### **Patient Mobile App**

- Simple registration (Name, Phone, optional Email)
- QR code scanner for hospital check-in
- Join queue by department
- Live queue position tracking
- Push notifications when turn is near
- Cancel queue option

### **Hospital Admin Dashboard**

- Real-time queue overview
- **Call Next Patient** button
- Mark patients as completed/no-show
- Manage counters
- Daily queue statistics

## 🏗️ Technology Stack

| Component     | Technology                                |
| ------------- | ----------------------------------------- |
| Frontend      | Flutter                                   |
| Backend       | Firebase                                  |
| Database      | Firestore                                 |
| Auth          | Firebase Authentication                   |
| Notifications | Cloud Functions (SMS), Push Notifications |
| Hosting       | Firebase Hosting                          |
| Languages     | Dart, JavaScript                          |

## 📋 Prerequisites

- Flutter SDK (>= 3.0.0)
- Firebase Project
- Android Studio / VS Code
- Android Device/Emulator (API 26+)
- Node.js (for Cloud Functions)

## 🚀 Getting Started

### **1. Clone the Repository**

```bash
git clone https://github.com/kalviumcommunity/Mediqueue.git
cd mediqueue
```

### **2. Install Dependencies**

```bash
flutter pub get
```

### **3. Firebase Setup**

- Create Firebase project
- Add Android app
- Download `google-services.json` into `android/app/`
- Enable Phone Authentication
- Create Firestore database
- Deploy Cloud Functions

### **4. Environment Configuration**

Create a `.env` file:

```
FIREBASE_API_KEY=your_api_key
FIREBASE_AUTH_DOMAIN=your_auth_domain
FIREBASE_PROJECT_ID=your_project_id
```

### **5. Run the App**

```bash
flutter run
```

## 📱 App Flow

### **Patient Flow**

1. Register using name + phone
2. Scan hospital QR or select nearby
3. Join department queue
4. Track real-time position
5. Receive turn notifications
6. Cancel if needed

### **Hospital Flow**

- View live queue
- Call next patient
- Update patient status

## 🏗️ Project Structure

```
mediqueue/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── patient.dart
│   │   ├── queue.dart
│   │   └── hospital.dart
│   ├── screens/
│   │   ├── auth/
│   │   ├── patient/
│   │   └── admin/
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── queue_service.dart
│   │   └── notification_service.dart
│   ├── widgets/
│   └── utils/
├── functions/
│   └── index.js
└── web/
    └── admin dashboard
```

## 🔧 Firebase Configuration

### **Firestore Collections**

- `hospitals` — hospital data & counters
- `queues` — active patient queues
- `patients` — registered patients
- `notifications` — notification logs

### **Security Rules**

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Add security rules here
  }
}
```

## 📲 Build APK

```bash
flutter build apk --release
```

## 🌐 Deploy Admin Dashboard

```bash
flutter build web
firebase deploy --only hosting
```

## 👥 Team Members

- **Isaac Reji** — Product Lead & Firebase Specialist
- **Claudia Jerome** — Flutter Development Lead
- **Danushri** — UI/UX & Testing Lead

## 📅 Development Timeline

- **Week 1:** Foundation & Design
- **Week 2:** Core Development
- **Week 3:** Integration & Testing
- **Week 4:** Deployment & MVP Completion

---

# Flutter Setup Verification

## 📋 Setup Process

- ✅ **Flutter SDK installed and added to PATH**
- ✅ **Android Studio with Flutter/Dart plugins installed**
- ✅ **Pixel 6 emulator created (Android 13)**
- ✅ **First Flutter app built and running**

---

## 📸 Verification Screenshots

### **Flutter Doctor Output**

![flutter_doctor](flutter_doctor.png)  
 _All checks passing — environment ready._

### **Running Application**

![First Flutter App](flutter_app.png)  
 _Default Flutter counter app running successfully on the emulator._

---

## 📝 Reflection

The setup process was straightforward but required careful attention to system configurations.  
 The main challenges involved:

- Setting up proper **PATH environment variables**
- Accepting **Android licenses**
- Ensuring Android Studio plugins were installed correctly

Once configured, the Flutter development environment worked smoothly.  
 The **hot reload** feature especially stood out — it will significantly speed up our development for the **MediQueue hospital queue management system**.

This complete and verified setup ensures a consistent and reliable environment for the entire team to begin building and testing our Flutter application.

---

# 📁 Project Structure & Design Approach

## 📂 Purpose of Each Directory

- **lib/**  
  Contains all the Dart source code for the application.

- **screens/**  
  Holds individual UI screens, separated by user roles such as patient and admin.

- **widgets/**  
  Stores reusable UI components like buttons and cards to avoid code duplication.

- **models/**  
  Defines data models such as Patient, Queue, and Hospital, representing the app’s core data structures.

- **services/**  
  Contains business logic and Firebase-related operations like authentication, queue handling, and notifications.

- **utils/**  
  Includes constants, theme colors, and helper functions used across the app.

---

## 🧩 How This Structure Supports Modular App Design

This folder structure separates UI, business logic, and data models, making the codebase easier to understand, maintain, and scale. By isolating reusable widgets and services, new features can be added without impacting existing screens. This modular approach is especially useful for MediQueue as it will later integrate real-time Firebase updates and role-based workflows.

---

## 🏷️ Naming Conventions

- **Files & folders:**  
  `snake_case.dart` for readability and consistency.

- **Classes & widgets:**  
  `PascalCase` (e.g., `WelcomeScreen`, `PatientModel`).

- **Variables & methods:**  
  `camelCase` following Dart best practices.

- **Widgets:**  
  Named based on their responsibility (e.g., `PrimaryButton`, `AdminDashboardScreen`).

# 📱 Responsive Welcome Screen – MediQueue

## 📌 Overview

This screen demonstrates how responsive and adaptive user interfaces can be built in Flutter.  
 The **Welcome Screen** of **MediQueue** dynamically adjusts its layout, spacing, and text sizes to provide a consistent user experience across different screen sizes and orientations, including mobile phones and tablets.

---

## 🛠️ Responsiveness Implementation

Responsiveness is implemented directly in `welcome_screen.dart` using **MediaQuery** and **LayoutBuilder**.

```dart
final screenSize = MediaQuery.of(context).size;
final isTablet = screenSize.width > 600;

```

## Flutter & Dart Fundamentals in MediQueue

### StatelessWidget vs StatefulWidget

In MediQueue, StatelessWidget is used for static UI elements such as logos and labels, while StatefulWidget is used for dynamic components like live queue position and admin controls that update based on real-time data.

### Widget Tree & Reactive UI

MediQueue follows Flutter’s widget tree structure where UI is composed of nested widgets. When queue data changes in Firestore, Flutter rebuilds only the affected widgets, ensuring smooth real-time updates.

### Why Dart is Ideal for MediQueue

Dart provides strong typing, null safety, and async/await support, making it suitable for handling real-time data and maintaining application stability in MediQueue.

# 📱 Using Hot Reload, Debug Console, and Flutter DevTools Effectively

## 🧩 Project Title

Flutter Development Tools Demonstration

---

## 📖 Project Description

This project demonstrates the effective usage of **Flutter Hot Reload**, **Debug Console**, and **Flutter DevTools** to enhance development efficiency, debugging, and performance analysis.  
The demonstration was performed using an existing Flutter project from **Sprint-2**.

---

## ⚙️ Tools & Technologies Used

- Flutter SDK
- Dart
- Android Emulator / Physical Device
- VS Code / Android Studio
- Flutter DevTools

---

## 🚀 Features Demonstrated

### 1️⃣ Hot Reload

Hot Reload allows developers to instantly apply code changes to a running Flutter application without restarting it or losing its current state.

**Steps Performed:**

1. Ran the Flutter app using `flutter run`
2. Modified a widget’s text or color
3. Saved the file
4. Observed immediate UI updates using Hot Reload

**Example Code Change:**

````dart
// Before
Text('Hello, Flutter!');

// After
Text('Welcome to Hot Reload!');

# 📱 MediQueue – Patient Profile Screen

## 🧩 Project Title
Responsive Patient Profile Screen (MediQueue)

## 📖 Project Description
This project demonstrates the creation of a responsive Patient Profile screen using Flutter layout widgets such as Container, Row, Column, and MediaQuery.
The screen is part of the MediQueue application and adapts smoothly across different device sizes.

## ⚙️ Tools & Technologies Used
- Flutter
- Dart
- Material UI
- Android Emulator / Physical Device

## 🚀 Features Demonstrated

### Responsive Layout Design
The profile screen adjusts its layout based on screen width to ensure a consistent user experience on mobile and larger devices.

### Key Concepts Used
- Column for vertical layout
- Row for icon–text alignment
- Container and Card for structured UI
- MediaQuery for responsiveness

### Example Code
```dart
Row(
  children: [
    Icon(Icons.email),
    Text('claudia@email.com'),
  ],
);

# Reusable Custom Widgets – TeamName
## Overview

This Flutter project demonstrates reusable custom widgets to make UI modular, maintainable, and consistent. Instead of duplicating code, widgets like buttons and cards can be reused across multiple screens.

Problem:-

Repeated UI code causes:
Inconsistent design
Hard-to-maintain code
Slower development

Solution:-

Create custom widgets:
Stateless – e.g., CustomButton (configurable label, color, action)
Stateful – e.g., LikeButton (toggles state on tap)

Features:-

Reusable buttons, cards, and toggles
Modular UI for fast development
Easy maintenance and consistent design

Benefits:-
Consistent design across screens
Less duplicated code
Easier updates and maintenance
Faster development


# Widget Tree & Reactive UI – TeamName
##Overview

This demo showcases Flutter’s widget tree and reactive UI model. Widgets are organized hierarchically, and changes in state automatically update only the affected parts of the UI.

Key Concepts:-
Widget Tree: Hierarchical structure of UI elements, from parent containers to child widgets.
Reactive UI: Flutter efficiently rebuilds only widgets affected by state changes.
State Management: Demonstrated using setState() to trigger UI updates dynamically.

Demo:-
Interactive elements update the UI without redrawing the whole screen.
Example interactions include changing text, toggling visibility, or updating counters.
Screenshots capture both the initial state and the updated state after interaction.

Reflection:-
Using a widget tree keeps UI structured and maintainable.
Reactive updates enhance performance and ensure smooth user experiences.
Modular widget design allows code reuse and easier feature additions.

Responsive Layout
Overview
This demo shows a responsive layout in Flutter using Container, Row, and Column.
The layout adapts to different screen sizes for phones and tablets.

Key Concepts
Container: Holds widgets with padding, size, and color.
Row: Horizontal arrangement of widgets.
Column: Vertical arrangement of widgets.
MediaQuery & Expanded: Make layout responsive.

Demo
Header Section at the top.
Two-Panel Layout scales proportionally and stacks on small screens.

Reflection
Layout adapts well across devices.
Expanded and MediaQuery help maintain proportions.

Submission
Branch: responsive-layout
Commit: feat: responsive layout using Container, Row, Column

Multi-Screen Navigation & Widget Tree Demo 

Overview:-
This Flutter app demonstrates multi-screen navigation using Navigator and named routes, along with a basic understanding of widget tree, reactive UI, and responsive layouts.

Features:-
Multi-screen navigation with Navigator.pushNamed() and Navigator.pop()
Named routes defined in main.dart
Widget tree and reactive UI using setState()
Responsive layouts with Row, Column, and Expanded

Example Screens
Home Screen
ElevatedButton(
  onPressed: () => Navigator.pushNamed(context, '/second'),
  child: Text('Go to Second Screen'),
)

Second Screen
ElevatedButton(
  onPressed: () => Navigator.pop(context),
  child: Text('Back to Home'),
)

Routes in main.dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/second': (context) => SecondScreen(),
  },
)

Reflection:-
Navigator manages a stack of screens efficiently.
Named routes make navigation scalable and maintainable in larger apps.

Scrollable Views with ListView & GridView
Overview
This Flutter app demonstrates how to build scrollable user interfaces using ListView and GridView. It showcases efficient scrolling for lists and grids, suitable for feeds, galleries, and catalogs, while maintaining smooth performance and responsive layouts.

Features
Vertical and horizontal scrolling using ListView
Efficient rendering with ListView.builder
Grid layouts using GridView
Dynamic grids using GridView.builder
Combined ListView and GridView on a single screen
Smooth and responsive scrolling behavior

Example Implementations
ListView.builder
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item $index'),
    );
  },
);

GridView.builder
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemCount: 6,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(child: Text('Tile $index')),
    );
  },
);

Reflection
ListView and GridView improve UI efficiency by rendering scrollable content cleanly.
Builder constructors are recommended for large data because they load only visible widgets.
Avoid nesting multiple scrollable widgets without proper constraints to prevent performance issues.
---

# 🖼️ Asset Management in MediQueue

## 📌 Overview
This section demonstrates proper asset management in Flutter, including how to add, register, and display images and icons in the MediQueue application. Assets are non-code resources like images, icons, fonts, and configuration files that enhance the user interface and experience.

---

## 📁 Asset Folder Structure

The project uses a structured approach to organize assets:

````

mediqueue/
├── assets/
│ ├── images/
│ │ └── logo.png # Application logo
│ └── icons/
│ └── (future custom icons)

````

---

## ⚙️ Asset Configuration in pubspec.yaml

All assets must be registered in the `pubspec.yaml` file under the `flutter:` section:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
````

**Important Notes:**

- Proper indentation (2 spaces) is critical in YAML files
- Trailing slashes include all files in the directory
- Run `flutter pub get` after modifying asset configuration

---

## 🎨 Image Usage in the Application

### 1. Welcome Screen Logo

The welcome screen displays the MediQueue logo using `Image.asset()`:

```dart
Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.blue.withOpacity(0.2),
        blurRadius: 20,
        spreadRadius: 5,
      ),
    ],
  ),
  child: ClipOval(
    child: Image.asset(
      'assets/images/logo.png',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ),
  ),
)
```

### 2. Authentication Screen Logo

The auth screen also uses the logo image for brand consistency:

```dart
Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: AppColors.primaryBlue.withOpacity(0.15),
        blurRadius: 15,
        spreadRadius: 3,
      ),
    ],
  ),
  child: ClipOval(
    child: Image.asset(
      'assets/images/logo.png',
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    ),
  ),
)
```

---

## 🎯 Material Icons Usage

MediQueue extensively uses Flutter's built-in Material Icons library for consistent and professional UI elements:

### Navigation Icons

```dart
BottomNavigationBar(
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.queue),
      label: 'My Queue',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
)
```

### Feature Icons (Welcome Screen)

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.schedule, color: Colors.blue.shade600, size: 24),
    const SizedBox(width: 12),
    Text('Skip the waiting room'),
  ],
)
```

### Admin Dashboard Icons

```dart
Icon(
  Icons.admin_panel_settings,
  color: Colors.white,
  size: 40,
)
```

### Department-Specific Icons

```dart
Icon(Icons.medical_services, color: Colors.blue),      // General Medicine
Icon(Icons.favorite, color: Colors.red),               // Cardiology
Icon(Icons.accessibility_new, color: Colors.orange),   // Orthopedics
Icon(Icons.child_care, color: Colors.pink),           // Pediatrics
```

---

## ✅ Best Practices Implemented

### 1. Consistent Asset Usage

- Logo appears consistently across all authentication and welcome screens
- Same asset path format used throughout the application
- Proper image sizing and fitting

### 2. Proper Configuration

- Assets registered in `pubspec.yaml` before use
- Directory-based registration for easy scalability
- Icons folder prepared for future custom icons

### 3. Performance Optimization

- Images wrapped in appropriate containers
- `BoxFit.cover` used for proper scaling
- Circular clipping applied for aesthetic presentation

### 4. Material Design Integration

- Extensive use of Material Icons for consistency
- Icons sized appropriately for different contexts
- Color-coded icons for quick visual identification

---

## 🚨 Common Errors Avoided

### 1. Missing Asset Registration

**Problem:** Images don't load if not registered in pubspec.yaml  
**Solution:** Always add asset directories under `flutter: assets:` section

### 2. Incorrect File Paths

**Problem:** Wrong path strings cause asset loading failures  
**Solution:** Ensure paths match exactly: `'assets/images/logo.png'`

### 3. YAML Indentation Issues

**Problem:** Improper spacing breaks configuration  
**Solution:** Always use 2 spaces for indentation in YAML files

### 4. Forgetting Hot Restart for New Assets

**Problem:** Hot reload doesn't pick up newly added assets  
**Solution:** Run `flutter pub get` and hot restart after adding new assets

---

## 📸 Asset Management Benefits in MediQueue

1. **Brand Consistency:** Logo appears uniformly across all screens
2. **Professional UI:** Material Icons provide consistent design language
3. **Easy Maintenance:** Centralized asset management in pubspec.yaml
4. **Scalability:** Structured folders allow easy addition of new assets
5. **Performance:** Proper image optimization and loading strategies

---

## 🔄 Workflow for Adding New Assets

1. **Add file** to appropriate folder (`assets/images/` or `assets/icons/`)
2. **Verify path** in pubspec.yaml is registered
3. **Run** `flutter pub get` in terminal
4. **Use** asset with `Image.asset()` or `AssetImage()`
5. **Test** on device/emulator
6. **Hot restart** if needed (for newly added assets)

---

## 📝 Reflection on Asset Management

**What steps are necessary to load assets correctly in Flutter?**

- Create organized folder structure for assets
- Register asset directories in pubspec.yaml with proper indentation
- Use correct asset paths in code with Image.asset() or AssetImage()
- Run flutter pub get after configuration changes
- Hot restart when adding new assets

**What common errors did you face while configuring pubspec.yaml?**

- Initially only images directory was configured; added icons directory for completeness
- Ensured proper 2-space indentation for YAML syntax
- Verified trailing slashes to include all files in directories

**How do proper asset management practices support scalability?**

- Directory-based registration allows adding multiple files without reconfiguration
- Consistent naming conventions make assets easy to locate
- Separation of images and icons provides logical organization
- Material Icons library reduces need for custom icon assets
- Centralized configuration in pubspec.yaml provides single source of truth
- Well-structured folders support team collaboration and maintenance

---

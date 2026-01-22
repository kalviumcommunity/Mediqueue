# Adding Hospital Data with Coordinates to Firebase

## Sample Hospital Data Structure

Here's how your hospital documents should look in Firebase Firestore with latitude and longitude:

```json
{
  "name": "City General Hospital",
  "location": "123 Main Street, Downtown",
  "latitude": 28.6139,
  "longitude": 77.209,
  "departments": [
    {
      "name": "General Medicine",
      "queueCount": 15
    },
    {
      "name": "Cardiology",
      "queueCount": 8
    },
    {
      "name": "Orthopedics",
      "queueCount": 12
    }
  ]
}
```

## How to Get Coordinates for Your Hospitals

### Method 1: Google Maps Website

1. Go to [Google Maps](https://maps.google.com)
2. Search for the hospital name or address
3. Right-click on the hospital location
4. Click on the coordinates (e.g., "28.6139, 77.2090")
5. The coordinates are now copied to your clipboard!

### Method 2: Google Maps Mobile App

1. Open Google Maps app
2. Long-press on the hospital location
3. A red pin will drop
4. Swipe up the bottom sheet
5. Tap on the coordinates to copy them

## Sample Hospitals with Real Coordinates

Here are some example hospitals you can add to your Firebase:

### 1. AIIMS Delhi

```json
{
  "name": "All India Institute of Medical Sciences (AIIMS)",
  "location": "Ansari Nagar, New Delhi, Delhi 110029",
  "latitude": 28.5672,
  "longitude": 77.21,
  "departments": [
    { "name": "Emergency", "queueCount": 25 },
    { "name": "Cardiology", "queueCount": 18 },
    { "name": "Neurology", "queueCount": 12 },
    { "name": "Orthopedics", "queueCount": 15 }
  ]
}
```

### 2. Apollo Hospital Delhi

```json
{
  "name": "Apollo Hospital",
  "location": "Sarita Vihar, New Delhi, Delhi 110076",
  "latitude": 28.5355,
  "longitude": 77.2883,
  "departments": [
    { "name": "General Medicine", "queueCount": 10 },
    { "name": "Cardiology", "queueCount": 8 },
    { "name": "Pediatrics", "queueCount": 6 }
  ]
}
```

### 3. Fortis Hospital Delhi

```json
{
  "name": "Fortis Hospital",
  "location": "Vasant Kunj, New Delhi, Delhi 110070",
  "latitude": 28.5167,
  "longitude": 77.1583,
  "departments": [
    { "name": "Emergency", "queueCount": 20 },
    { "name": "Orthopedics", "queueCount": 14 },
    { "name": "General Surgery", "queueCount": 9 }
  ]
}
```

### 4. Max Super Speciality Hospital

```json
{
  "name": "Max Super Speciality Hospital",
  "location": "Saket, New Delhi, Delhi 110017",
  "latitude": 28.5244,
  "longitude": 77.2066,
  "departments": [
    { "name": "Cardiology", "queueCount": 11 },
    { "name": "Neurology", "queueCount": 7 },
    { "name": "Oncology", "queueCount": 5 }
  ]
}
```

## Adding to Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Select your project (Mediqueue)
3. Click on **Firestore Database**
4. Navigate to your `hospitals` collection
5. Click **Add Document**
6. Use auto-generated ID or create custom ID
7. Add the fields:
   - `name` (string)
   - `location` (string)
   - `latitude` (number)
   - `longitude` (number)
   - `departments` (array)

## Programmatic Way (Optional)

If you want to add hospitals through code, create a helper function:

```dart
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addSampleHospitals() async {
  final firestore = FirebaseFirestore.instance;

  final hospitals = [
    {
      'name': 'AIIMS Delhi',
      'location': 'Ansari Nagar, New Delhi',
      'latitude': 28.5672,
      'longitude': 77.2100,
      'departments': [
        {'name': 'Emergency', 'queueCount': 25},
        {'name': 'Cardiology', 'queueCount': 18},
      ],
    },
    {
      'name': 'Apollo Hospital',
      'location': 'Sarita Vihar, New Delhi',
      'latitude': 28.5355,
      'longitude': 77.2883,
      'departments': [
        {'name': 'General Medicine', 'queueCount': 10},
        {'name': 'Cardiology', 'queueCount': 8},
      ],
    },
    // Add more hospitals...
  ];

  for (var hospital in hospitals) {
    await firestore.collection('hospitals').add(hospital);
  }

  print('Sample hospitals added successfully!');
}
```

You can call this function once from your app to populate test data.

## Coordinates for Different Cities

### Mumbai Hospitals

- Lilavati Hospital: `19.0594, 72.8326`
- KEM Hospital: `19.0016, 72.8420`
- Breach Candy Hospital: `18.9684, 72.8065`

### Bangalore Hospitals

- Apollo Hospital Bangalore: `12.9698, 77.6439`
- Manipal Hospital: `12.9716, 77.5946`
- Fortis Hospital Bangalore: `12.9591, 77.6470`

### Chennai Hospitals

- Apollo Hospital Chennai: `13.0358, 80.2464`
- Fortis Malar Hospital: `13.0418, 80.2530`
- MIOT Hospital: `13.0061, 80.2080`

## Important Notes

- **Latitude** ranges from -90 to +90 (North/South)
- **Longitude** ranges from -180 to +180 (East/West)
- Make sure coordinates are stored as **numbers**, not strings
- Test with a few hospitals first before adding many
- You can use the same coordinates for testing if you don't have real locations yet

## Verifying Your Data

After adding hospitals, verify in the map screen that:

1. ✅ Markers appear on the map
2. ✅ Tapping a marker shows hospital details
3. ✅ Hospital name and location are correct
4. ✅ Departments list is displayed properly

Happy mapping! 🗺️

# Mediqueue App Icon Setup

## ✅ Configuration Added

I've set up `flutter_launcher_icons` to automatically generate app icons for Android and iOS.

## 📱 How to Change Your App Icon

### Option 1: Use Your Own Icon (Recommended)

1. **Create or find your icon image:**
   - Must be a PNG file
   - Recommended size: **1024x1024 pixels** (minimum 512x512)
   - Should have a transparent or white background
   - Simple, recognizable design works best

2. **Save it to the project:**
   - Place your icon at: `assets/icons/app_icon.png`
   - The file MUST be named exactly `app_icon.png`

3. **Generate the icons:**

   ```bash
   cd mediqueue
   flutter pub get
   flutter pub run flutter_launcher_icons
   ```

4. **Rebuild your app:**
   ```bash
   flutter run
   ```

### Option 2: Use Online Icon Generator

1. Go to [App Icon Generator](https://www.appicon.co/) or [Icon Kitchen](https://icon.kitchen/)
2. Upload your design
3. Download the generated icons
4. Place the PNG in `assets/icons/app_icon.png`
5. Run the commands above

## 🎨 Design Tips for Mediqueue Icon

For a medical queue app, consider:

- **Medical cross** symbol (+ or ⊕)
- **Hospital building** icon
- **Queue/people** representation
- **Calendar with medical cross**
- Colors: Blue, green, or red (medical colors)

### Quick Icon Ideas:

- 🏥 Hospital building with a queue line
- ➕ Medical cross in a circular badge
- 📋 Clipboard with checkmarks
- 🩺 Stethoscope design
- 💊 Medical capsule with queue dots

## 📐 Technical Requirements

- **Format:** PNG with transparency (or solid background)
- **Size:** 1024x1024px (scales down automatically)
- **File name:** `app_icon.png`
- **Location:** `assets/icons/app_icon.png`

## 🚀 Commands to Run

After adding your icon image:

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate icons for all platforms
flutter pub run flutter_launcher_icons

# 3. Clean and rebuild
flutter clean
flutter run
```

## 📱 What Gets Generated

The tool will automatically create:

- **Android:** All mipmap variants (mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi)
- **iOS:** All required icon sizes in AppIcon.appiconset
- **Adaptive icons:** For Android 8.0+ with proper background/foreground

## 🔄 To Update Icon Later

Just replace `assets/icons/app_icon.png` with your new icon and run:

```bash
flutter pub run flutter_launcher_icons
```

## 🎨 Need a Quick Icon?

If you need a temporary icon to test, you can:

1. Use any medical-related PNG image
2. Resize it to 1024x1024 using online tools like [ResizeImage.net](https://resizeimage.net/)
3. Save as `app_icon.png` in `assets/icons/`

---

**Current Status:** ⏳ Waiting for `app_icon.png` in `assets/icons/` folder

Once you add the icon file, run the commands above to apply it!

// lib/utils/logout_notifier.dart
class LogoutNotifier {
  // Static variable to track if we should show logout message
  static bool _shouldShowMessage = false;

  /// Call this when user logs out to set the flag
  static void setShouldShowMessage() {
    _shouldShowMessage = true;
  }

  /// Check if we should show logout message and clear the flag
  /// Returns true if message should be shown, false otherwise
  static bool getAndClearShouldShowMessage() {
    final result = _shouldShowMessage;
    _shouldShowMessage = false; // Clear after reading
    return result;
  }
}

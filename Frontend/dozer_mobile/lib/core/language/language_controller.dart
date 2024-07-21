import 'package:get/get.dart';

// Enum to represent supported languages
enum Language { english, amharic }

// LanguageController class for managing language state
class LanguageController extends GetxController {
  // Observable variable to hold the current language
  Rx<Language> _currentLanguage = Rx<Language>(Language.english);

  // Getter for current language
  Language get currentLanguage => _currentLanguage.value;

  // Method to set the current language
  void setCurrentLanguage(Language language) {
    _currentLanguage.value = language;
  }
  

  // Method to toggle between languages
  void toggleLanguage() {
    if (_currentLanguage.value == Language.english) {
      _currentLanguage.value = Language.amharic;
    } else {
      _currentLanguage.value = Language.english;
    }
  }
}

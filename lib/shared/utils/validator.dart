class Validator {
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }
}
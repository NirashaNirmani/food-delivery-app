class Tvalidator {
  static String? validateEmail(String value) {
    if (value == null || value.isEmpty) {
      return "Email is  required";
    }
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email Address';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value == null || value.isEmpty) {
      return "Email is  required";
    }
    if (value.length < 6) {
      "Password is required";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    return null;
  }
}

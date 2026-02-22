class Validators {
  Validators._();

  static String? validateName(String value) {
    if (value.isEmpty) return "Name is required";
    if (value.length < 3) return "Name too short";
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) return "Phone number is required";
    if (value.length != 11) return "Phone must be 11 digits";
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return "Email is required";
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return "Password is required";
    if (value.length < 6) return "Minimum 6 characters";
    return null;
  }
}

class Validation {

static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  final RegExp passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$&*~]).{8,}$',
  );
  if (!passwordRegExp.hasMatch(value)) {
    return 'Password must be at least 8 characters long and include a number, a special character, a lowercase letter, and an uppercase letter.';
  }
  return null;
}

}
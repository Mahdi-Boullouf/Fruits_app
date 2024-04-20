extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }

    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    
}
}

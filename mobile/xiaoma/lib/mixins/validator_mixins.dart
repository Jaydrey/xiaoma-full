mixin ValidationMixins {
  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a phone number";
    }
    final phoneRegex = RegExp(r'^0[17]\d{8}$');

    if (phoneRegex.hasMatch(value.trim())) {
      return null;
    }
    return "Please enter a valid phone number";
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }

    if (value.length < 8) {
      return "Password should be more than 8 characters";
    }

    final characterRegex = RegExp(r'[A-Z]');
    if (!value.trim().contains(characterRegex)) {
      return "Password should have an uppercase character";
    }

    final symbolRegex = RegExp(r'[!"#$%^&*(),|]');
    if (!value.trim().contains(symbolRegex)) {
      return "Password should have a symbol character";
    }

    final numberRegex = RegExp(r'[0-9]');
    if (!value.trim().contains(numberRegex)) {
      return "Password should contain a number";
    }
    return null;
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your full name";
    }

    List<String> fullNames = value.split(" ");
    if (fullNames.length >= 2) {
      return null;
    }
    return "Enter atleast two names";
  }
}

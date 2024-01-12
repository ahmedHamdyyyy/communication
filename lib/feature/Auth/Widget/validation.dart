class InputValidation {
  static final _emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  // static final _phoneReg = RegExp(r'^\+?[0-9]{1-,12}$');
  // static final _passwordReg = RegExp(r'^(?=.*[a-zA-Z])(?=.*[!@#\$&*~]).{8,}$');
  // static final _namedReg =
  //     RegExp(r'^[a-zA-Z]+(([\,\.\-\][a-zA-Z])?[a-zA-z]*)*$');

  static String? textValidation(value) =>
      value!.isEmpty ? 'must not be empty' : null;

  static String? emailValidation(value) {
    if (value!.isEmpty) {
      return 'must not be empty';
    } else if (!_emailReg.hasMatch(value)) {
      return 'InValid Email Address';
    } else {
      return null;
    }
  }

  static String? nameValidation(value) {
    if (value!.isEmpty) {
      return 'must not be empty';
    } else if (value.length <= 5) {
      return 'too weak';
    } else {
      return null;
    }
  }

  static String? phoneValidation(value) {
    if (value!.length == 11) {
      if (value.startsWith('010') ||
          value.startsWith('011') ||
          value.startsWith('012') ||
          value.startsWith('015')) {
        return null;
      } else {
        return 'not valid';
      }
    } else {
      return 'not valid';
    }
  }

  static String? passwordValidation(value) {
    if (value!.isEmpty) {
      return 'must not be empty';
    } else if (value.length <= 7) {
      return 'too weak';
    } else if (value.length >= 50) {
      return 'too Strong';
      // } else if (!_passwordReg.hasMatch(value)) {
      //   return 'Special Characters are required';
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidation(
    String? value,
  ) {
    return (value!.isEmpty ? 'must not be empty' : null);
  }
}

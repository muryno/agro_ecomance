

enum PasswordValidationResults {
  VALID,
  TOO_SHORT,
  EMPTY_PASSWORD,
}

enum EmailValidationResults {
  VALID,
  NON_VALID,
  EMPTY_EMAIL,
}

class Validator {
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  PasswordValidationResults validatePassword(String password) {
    if (password.isEmpty) {
      return PasswordValidationResults.EMPTY_PASSWORD;
    }
    if (password.length < 6) {
      return PasswordValidationResults.TOO_SHORT;
    }
    return PasswordValidationResults.VALID;
  }

  EmailValidationResults validateEmail(String email) {
    if (email.isEmpty) {
      return EmailValidationResults.EMPTY_EMAIL;
    }
    if (!emailRegExp.hasMatch(email)) {
      return EmailValidationResults.NON_VALID;
    }
    return EmailValidationResults.VALID;
  }
}
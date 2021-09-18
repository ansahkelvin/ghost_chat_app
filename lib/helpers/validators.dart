class Validator {
  static dynamic emailValidator(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (value.contains("@")) {
      return 'Enter a valid email address';
    }
  }

  static dynamic nameValidator(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    } else if (value.length < 4) {
      return 'Enter your full name';
    }
  }

  static dynamic passwordValidator(String value){
     if (value.isEmpty) {
      return 'Password cannot be empty';
    }
    else if(value.length < 5) {
      return 'Password is too short';
    }
  }
}

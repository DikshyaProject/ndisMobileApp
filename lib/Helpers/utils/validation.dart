bool isvalidSSNNumber(String value) {
  bool isValid = false;
  String pattern = r'^(?:[1-9])?[0-9]{12}$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(value)) {
    isValid = true;
  } else {
    isValid = false;
  }
  return isValid;
}

bool isvalidNumber(String value) {
  bool isValid = false;
  String pattern = r'^(?:[+])?[0-9]{9,12}$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(value)) {
    isValid = true;
  } else {
    isValid = false;
  }
  return isValid;
}

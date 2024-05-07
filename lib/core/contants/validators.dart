class Validators {
  static final RegExp general = RegExp('.+');

  static final RegExp email =
      RegExp(r"^[a-zA-Z][a-zA-Z\d]+@[a-z]+\.[a-z]{3,}(\.[a-z]{2,})?$");

  static final RegExp phoneNumber = RegExp(r"^[+0][\d]+$");

  static final RegExp floatRegex = RegExp(r"^[\d]+(\.[\d]+)?$");

  static final RegExp integer = RegExp(r"^[\d]+$");
}

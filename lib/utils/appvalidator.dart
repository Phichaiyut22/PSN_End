class Appvalidator {
    //_validateEmail สำหรับการตรวจสอบการกรอกข้อมูลของอีเมล
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return "Please enter an emil";
    }
    //กำหนดค่า RegExp สำหรับการตรวจสอบรูปแบบของอีเมล (email)

    RegExp emailRegExp = RegExp(r'^[\w\-.]+@[a-zA-Z\d\-.]+\.[a-zA-Z]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "Please enter a valid emil";
    }
    return null;
  }

  //_validatePhoneNumber ว่ากรอก แล้วหรือยัง และครบ 10ตัวไหม
  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return "Please enter a Phone number";
    }
    if (value.length != 10) {
      return "Please enter a 10- digit phone number";
    }
    return null;
  }

  //_validatePassword ว่ากรอก แล้วหรือยัง
  String? validatePassword(value) {
    if (value!.isEmpty) {
      return "Please enter a Password";
    }

    return null;
  }

  String? validateUsename(value) {
    if (value!.isEmpty) {
      return "Please enter a Username";
    }
    return null;
  }
  String? isEmptyCheck(value) {
    if (value!.isEmpty) {
      return "Please fill detaill";
    }
    return null;
  }

}
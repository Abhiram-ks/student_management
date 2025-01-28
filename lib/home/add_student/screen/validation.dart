class PhoneNumberValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    if (value.length != 10) {
      return 'Invalid phone number';
    }
    return null;
  }
}

class AgeValidator {
  static String? validate(String? value){
    if(value == null || value.isEmpty){
       return 'Please enter Age';
    }
    int? age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid number';
    }
    if(age < 6 || age > 50){
      return 'Age must be in the range 6 - 50';
    }
    return null;
  }
}

class NameValidator {
  static String? validate(String? value){
    if(value == null || value.isEmpty){
      return 'Please enter a name';  
    }
    if(value[0] == ' '){
      return 'First letter must not be a space';   
    }

    if (!RegExp(r"^[A-Za-z][A-Za-z\s]*$").hasMatch(value)) {
      return 'Invalid Enter';
    }
    return null;
  }
  
}
class ValidationMixin {
  
  String pass;

  String validateName(String name){
    RegExp matcher= new RegExp((r'^[A-Za-z ]+$'));
    if(matcher.hasMatch(name)){
      return null;
    }
    else{
      return'Please enter your name correctly';
    }
  }
  String validatePhone(String phone){
    RegExp matcher = new RegExp(r'^(\+254|0)[1-9]\d{8}$');
    if (matcher.hasMatch(phone)){
      return null;
    }
    else{
      return 'please fill in your phone details correctly';
    }
  }
  String validateEmail(String email){
    RegExp matcher= RegExp(  r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if(matcher.hasMatch(email)){
    return null;
  }
  else{
    return 'Please fill in email address correctly';
  }
  }
  String validatePass(String pass){
    this.pass = pass;
    if (pass.length< 6){
      return 'Password should be atleast six characters';
    }
    else {
      return null;
    }
  }
  String validateConfirmPass(String confirmPass){
    if(confirmPass == pass){
      return null;
    }
    else{
      return 'password does not match';
    }
  }
}
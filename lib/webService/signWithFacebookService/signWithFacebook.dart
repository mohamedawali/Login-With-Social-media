import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class SignFacebookService{
  var statuss;
 FacebookAuth _facebookAuth=FacebookAuth.i;
  Future<String>  signFacebook()async{
    try {
var loginResult = await _facebookAuth.login();
 statuss = loginResult.status.name;
print('ssss${statuss}');
//print('ssss${statuss.name}');
    }catch(e){
      print('Error${e.toString()}');
    }
return statuss;
  }
}
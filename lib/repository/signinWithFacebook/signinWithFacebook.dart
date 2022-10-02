
import 'package:login_social_media/webService/signWithFacebookService/signWithFacebook.dart';

class SignFacebookRepository{
  SignFacebookService? _signinFacebookService;
  SignFacebookRepository(this._signinFacebookService);
  Future<String>  signFacebook()async{
    var status = await _signinFacebookService!.signFacebook();
return status;
  }
}
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_social_media/googleModel.dart';
import 'package:login_social_media/webService/signWithGoogleService/signWithGoogle.dart';

class SignGoogleRepository {
  SignGoogleService? _signinService;
  SignGoogleRepository(this._signinService);

  Future<GoogleSignInAccount?> signinGoogle() async {
    return await _signinService!.signinGoogle();
  }

  Future<void> signoutGoogle() async {
    await _signinService!.signoutGoogle();
  }
}

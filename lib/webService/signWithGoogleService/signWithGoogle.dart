import 'package:google_sign_in/google_sign_in.dart';

class SignGoogleService {
  GoogleSignIn? _googleSignIn;
  Future<GoogleSignInAccount?> signinGoogle() async {
    _googleSignIn = GoogleSignIn(scopes: ['email']);
    return await _googleSignIn!.signIn();
  }

  Future<void> signoutGoogle() async {
    await _googleSignIn!.signOut();
  }
}

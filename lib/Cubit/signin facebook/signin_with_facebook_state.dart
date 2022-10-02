part of 'signin_with_facebook_cubit.dart';

@immutable
abstract class SigninWithFacebookState {}

class SigninWithFacebookInitial extends SigninWithFacebookState {}
class LoadingSigninFacebook extends SigninWithFacebookState {
  LoadingSigninFacebook();
}

class LoadedSigninFacebook extends SigninWithFacebookState {
  String status;
  LoadedSigninFacebook(this.status);
}
class LoadingSignoutFacebook extends SigninWithFacebookState {
  LoadingSignoutFacebook();
}

class LoadedSignoutFacebook extends SigninWithFacebookState {
  LoadedSignoutFacebook();
}
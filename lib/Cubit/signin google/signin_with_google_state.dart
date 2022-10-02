part of 'signin_with_google_cubit.dart';

@immutable
abstract class SigninWithGoogleState {}

class SigninWithGoogleInitial extends SigninWithGoogleState {



}

class Loading extends SigninWithGoogleState {

Loading();

}
class Loaded extends SigninWithGoogleState {
 GoogleSignInAccount googleModel;
  Loaded(this.googleModel);

}
class LoadingSignout extends SigninWithGoogleState {

 LoadingSignout();

}
class LoadedSignout extends SigninWithGoogleState {
 LoadedSignout();

}
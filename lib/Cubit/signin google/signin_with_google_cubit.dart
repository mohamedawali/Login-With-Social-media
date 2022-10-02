import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_social_media/googleModel.dart';
import 'package:login_social_media/repository/signinWithGoogle/signwithgoogle.dart';
import 'package:meta/meta.dart';

part 'signin_with_google_state.dart';

class SigninWithGoogleCubit extends Cubit<SigninWithGoogleState> {
  SignGoogleRepository? _signGoogleRepository;
  SigninWithGoogleCubit(this._signGoogleRepository)
      : super(SigninWithGoogleInitial());
  Future<void> signinGoogle() async {
    emit(Loading());
    await _signGoogleRepository!.signinGoogle().then((user) {
      emit(Loaded(user!));
    });
  }

  Future<void> signoutGoogle() async {
    emit(LoadingSignout());
    await _signGoogleRepository!.signoutGoogle().then((value) {
      emit(LoadedSignout());
    });
  }
}

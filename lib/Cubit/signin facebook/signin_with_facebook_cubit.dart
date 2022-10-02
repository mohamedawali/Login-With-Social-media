import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:login_social_media/repository/signinWithFacebook/signinWithFacebook.dart';
import 'package:meta/meta.dart';

part 'signin_with_facebook_state.dart';

class SigninWithFacebookCubit extends Cubit<SigninWithFacebookState> {
  SignFacebookRepository _facebookRepository;
  SigninWithFacebookCubit(this._facebookRepository) : super(SigninWithFacebookInitial());
  Future<void>signFacebook()async{
    emit(LoadingSigninFacebook());
    await _facebookRepository.signFacebook().then((value) => emit(LoadedSigninFacebook(value)));
  }
  Future<void>signoutFacebook()async{
    emit(LoadingSignoutFacebook());
    await _facebookRepository.signFacebook().then((value) => emit(LoadedSignoutFacebook()));
  }
}

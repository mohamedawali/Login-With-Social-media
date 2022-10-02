import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_social_media/Cubit/signin%20facebook/signin_with_facebook_cubit.dart';
import 'package:login_social_media/Cubit/signin%20google/signin_with_google_cubit.dart';
import 'package:login_social_media/googleModel.dart';
import 'package:login_social_media/home.dart';
import 'package:login_social_media/homeFacebook.dart';
import 'package:login_social_media/login.dart';
import 'package:login_social_media/webService/signWithFacebookService/signWithFacebook.dart';

import 'repository/signinWithFacebook/signinWithFacebook.dart';
import 'repository/signinWithGoogle/signwithgoogle.dart';
import 'webService/signWithGoogleService/signWithGoogle.dart';

class AppRouter {
  SignGoogleRepository? _googleRepository;
  SigninWithGoogleCubit? _signinwithgoogleCubit;
  SigninWithFacebookCubit? _facebookCubit;
  SignFacebookRepository? _facebookRepository;
  AppRouter() {
    _googleRepository = SignGoogleRepository(SignGoogleService());
    _signinwithgoogleCubit = SigninWithGoogleCubit(_googleRepository);
    _facebookRepository = SignFacebookRepository(SignFacebookService());
    _facebookCubit = SigninWithFacebookCubit(_facebookRepository!);
  }
  Route? router(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (BuildContext context) =>
                          _signinwithgoogleCubit!),
                  BlocProvider(
                      create: (BuildContext context) => _facebookCubit!)
                ], child: Login()));
      case '/HomeGoogle':
        var arg = routeSettings.arguments as GoogleSignInAccount;

        return MaterialPageRoute(
            builder: (_) => BlocProvider<SigninWithGoogleCubit>(
                  create: (BuildContext context) => _signinwithgoogleCubit!,
                  child: Home(user: arg),
                ));
      case '/HomeFacebook':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SigninWithFacebookCubit>(
                  create: (BuildContext context) => _facebookCubit!,
                  child: HomeFacebook(),
                ));
    }
  }
}

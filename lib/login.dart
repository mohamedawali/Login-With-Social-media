import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_social_media/Cubit/signin%20facebook/signin_with_facebook_cubit.dart';
import 'package:login_social_media/Cubit/signin%20google/signin_with_google_cubit.dart';
import 'package:login_social_media/translations/local_keys.g.dart';
import 'package:login_social_media/webService/signWithFacebookService/signWithFacebook.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
// _googleSignIn.onCurrentUserChanged.listen((user) { _currentUser=user;});
// _googleSignIn.signInSilently();
  var blocGoogle, blocFacebook, user;
String lang='en';
  void initState() {
    blocGoogle = BlocProvider.of<SigninWithGoogleCubit>(context);
    blocFacebook = BlocProvider.of<SigninWithFacebookCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(children: [
                Image.asset(
                  'assets/logo/loginImage.png',
                ),

                    Padding(
                      padding: const EdgeInsets.only(top: 35,right: 10,left: 10),
                      child: Row(
                        children: [
                          OutlinedButton(
                            onPressed: () async{
                              if(context.locale.languageCode == "en"){
                               await context.setLocale(Locale('ar'));}
                              else {
                             await   context.setLocale(Locale('en'));
                              }

                            },
                            child: Text(LocaleKeys.ar.tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                            style: OutlinedButton.styleFrom(minimumSize: Size(0, 40)),
                          ),
                        ],
                      ),
                    )
            //)
              ]),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocaleKeys.getyourGroceries.tr(),
                     // 'Get your Groceries',
                      style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(LocaleKeys.withNectar.tr(),
                   //   'with Nectar',
                      style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              label: Text(LocaleKeys.hintEmail.tr(),
                            // 'Email *',
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              label: Text(LocaleKeys.hintPassword.tr(),
                                  //'Password *',
                                  style: TextStyle(fontSize: 18))),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async{
                        },
                        child: Row(
                          children: [
                            Container(height: 30,width: 27,child: Icon(Icons.mail)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(LocaleKeys.login.tr(),
                             // 'Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            minimumSize: Size(0, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    SizedBox(
                      height: 5,
                    ),
                    BlocListener<SigninWithGoogleCubit, SigninWithGoogleState>(
                      listener: (context, state) async {
                        if (state is Loading) {
                          Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            strokeWidth: 2,
                            color: Colors.blue,
                          ));
                        } else if (state is Loaded) {
                          user = state.googleModel;

                          Navigator.pushNamed(context, '/HomeGoogle',
                              arguments: user);
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          blocGoogle.signinGoogle();
                        },
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/logo/googleLogo.png'),
                              height: 30,
                              width: 27,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(LocaleKeys.continueWithGoogle.tr(),
                              //'Continue with Google',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: Size(0, 50),shadowColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    BlocListener<SigninWithFacebookCubit,
                        SigninWithFacebookState>(
                      listener: (context, state) {
                        if (state is LoadingSigninFacebook) {
                          CircularProgressIndicator();
                        } else if (state is LoadedSigninFacebook) {
                          if (state.status == 'cancelled') {
                            Navigator.pushNamed(context, '/');
                          } else {
                            Navigator.pushNamed(context, '/Home');
                          }
                        }
                      },
                      child: ElevatedButton(
                          onPressed: () {
                            blocFacebook.signFacebook();
                          },
                          child: Row(
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/logo/logo-facebook.png'),
                                height: 30,
                                width: 27,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(LocaleKeys.continueWithFacebook.tr(),
                               // 'Continue with Facebook',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: Size(0, 50),shadowColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(LocaleKeys.newinNectar.tr(),
                        //'New in Nectar ?',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () async{
                            },
                            child: Text(LocaleKeys.createAccount.tr(),
                           //   'Create Account',
                              style: TextStyle(fontSize: 22,color: Colors.orange),
                            ))),
                    SizedBox(
                      height: 30,
                    )
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}

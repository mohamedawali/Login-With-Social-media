import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_social_media/Cubit/signin%20google/signin_with_google_cubit.dart';
import 'package:login_social_media/googleModel.dart';
import 'package:login_social_media/translations/local_keys.g.dart';

class Home extends StatelessWidget {
  GoogleSignInAccount user;
  Home({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SigninWithGoogleCubit>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,title: Text('Google Account',),centerTitle: true,),
      body: Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(radius: 70,backgroundImage: NetworkImage('${user.photoUrl}'),),
                SizedBox(height: 20,),
                Text(
                 " ${user.displayName}",style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20,),
                Text('${user.email}',style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                BlocListener<SigninWithGoogleCubit, SigninWithGoogleState>(
                  listener: (context, state) async {
                    if (state is LoadingSignout) {
                      CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        strokeWidth: 2,
                        color: Colors.blue,
                      );
                    } else if (state is LoadedSignout) {
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: ElevatedButton(
                      onPressed: () {
                        bloc.signoutGoogle();
                      },
                      child: Text(LocaleKeys.signout.tr()),style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 25),
                    primary: Colors.orange,
                    minimumSize: Size(0, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                ),)
              ],
            ),
        ),
        ),
    )
    ;
  }
}

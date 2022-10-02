import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_social_media/Cubit/signin%20facebook/signin_with_facebook_cubit.dart';
class HomeFacebook extends StatelessWidget {
  const HomeFacebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc=BlocProvider.of<SigninWithFacebookCubit>(context);
    return Scaffold(body: SafeArea(child: Container(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //GoogleUserCircleAvatar(identity: user),
        CircleAvatar(radius: 70,backgroundImage: NetworkImage('{user.photoUrl}'),),
        SizedBox(height: 20,),
        Text(
          " {user.displayName}",style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20,),
        Text('{user.email}',style: TextStyle(fontSize: 20),),
        SizedBox(height: 20,),
        BlocListener<SigninWithFacebookCubit, SigninWithFacebookState>(
          listener: (context, state) async {
            if (state is LoadingSignoutFacebook) {
              CircularProgressIndicator(
                backgroundColor: Colors.black,
                strokeWidth: 2,
                color: Colors.blue,
              );
            } else if (state is LoadedSignoutFacebook)
              Navigator.pushNamed(context, '/');
            else
              print('errorrrrrrrrrrr');
          },
          child: ElevatedButton(
            onPressed: () {
              bloc.signoutFacebook();
            },
            child: Text('sign out'),style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 25),
              primary: Colors.orange,
              minimumSize: Size(0, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          ),)
      ],
    ),),),);
  }
}

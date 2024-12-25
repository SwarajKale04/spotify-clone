import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_darl_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child:SvgPicture.asset(
              AppVector.topPattern
            ) ,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:SvgPicture.asset(
              AppVector.bottomPattern
            ) ,
          ),
        Align(
            alignment: Alignment.bottomLeft,
            child:Image.asset(
              AppImages.authBG
            )
          ),
          Align(
            alignment: Alignment.center,
            child:Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children : [
                SvgPicture.asset(
                  AppVector.logo
                ),
                const SizedBox(
                  height: 55,
                ),
                const Text(
                  'Enjoy Listenint To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  'Spotify singnup kara kya reee',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children:[
                    Expanded(
                      flex:1  ,
                      child: BasicAppButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                             MaterialPageRoute(
                              builder:(BuildContext context) =>  SignupPage()
                              )
                          
                             );
                        },
                         title: 'Resigster'
                         ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                             MaterialPageRoute(
                              builder:(BuildContext context) =>  SigninPage()
                              )
                          
                             );
                        },
                         child:  Text('Sign up',
                         style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          // for changing color when we  shift from dark mode to light mode 
                          color: context.isDarkMode ? Colors.white : Colors.black ,
                         ),
                         ),
                         ),
                    )
                  ],
                  )
                ]
              ),
            )
          ),
        ],
      ),
    );
  }
}
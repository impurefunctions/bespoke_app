import 'package:bespoke_app/auth/widgets/losding.dart';
import 'package:bespoke_app/utils/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main/screens/main_screen.dart';
import '../../utils/theme/font_styles.dart';
import '../domain/models/index.dart';
import '../providers/blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginBloc = LoginBloc();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: loginFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
                ),
                SvgPicture.asset(
                  'assets/images/coat_of_arms.svg',
                  height: 150.w,
                  width: 150.w,
                ),
                SizedBox(
                  height: 50.h,
                ),
                /*StreamBuilder<ApiResponse<AuthModel>>(
                  stream: loginBloc.loginStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data!.status) {
                        case Status.LOADING:
                          return Loading(
                              loadingMessage: snapshot.data!.message!);
                        case Status.ERROR:
                          return const Text(
                            "Email and password incorrect",
                            style: TextStyle(color: Colors.redAccent),
                          );
                        case Status.COMPLETED:
                          SharedPreferences.getInstance()
                              .then((value) {
                            value.setString('token', snapshot.data!.data!.token).then((value) =>
                                WidgetsBinding.instance.addPostFrameCallback((_) {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MainScreen(token:snapshot.data!.data!.token!))); }));
                          });
                          break;
                        case Status.VALID:
                        // TODO: Handle this case.
                          break;
                        case Status.CREATED:
                        // TODO: Handle this case.
                          break;
                        case null:
                          break;
                      }
                    }
                    return const SizedBox.shrink();
                  },
                ),*/
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      StreamBuilder<String>(
                          stream: loginBloc.getEmail,
                          builder: (context, snapshot) {
                            return TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: loginBloc.updateEmail,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (!value!.isValidEmail()) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                //  errorText: snapshot.hasError ? snapshot.error.toString() : null,
                                labelText: 'username',
                                prefixIcon: const Icon(Icons.account_circle_outlined,color: Color(0xFF1AACF1),),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.h)),
                                ),
                              ),
                            );
                          }
                      ),
                      SizedBox(
                        height: 30.h,
                      ),


                      StreamBuilder<String>(
                          stream: loginBloc.getPassword,
                          builder: (context, snapshot) {
                            return TextFormField(
                              //  controller: passwordController,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                              onChanged: loginBloc.updatePassword,
                              textInputAction: TextInputAction.done,
                              decoration:  InputDecoration(
                                labelText: 'password',
                                prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF1AACF1),),
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.w))),
                              ),
                            );
                          }
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Forgot Password'),
                                ),
                              );
    /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPasswordScreen(),
                                ),
                              );*/
                            },
                            child: Text(
                              'Forgot Password?',
                              style: buttonFont.copyWith(
                                color: Color(0xFF1AACF1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.h),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen(token: "",)));

                           /* if (loginFormKey.currentState!.validate()) {
                              loginBloc.login();
                            }*/
                          },
                          child: const Text(
                            'Login',

                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
import 'package:cpa/export.dart';
import 'package:cpa/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../data/dummy.dart';
import '../../services/auth_services.dart';
import '../../services/shared_services.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  // bool isLoading = false;
  // String loginNotification = '';

  // void showNotification(String message) {
  //   setState(() {
  //     loginNotification = message;
  //   });
  // }

  bool isLoading = false;
  final SharedPrefencesServices shared = SharedPrefencesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(CPAAssets.CpaLogo),
                  SizedBoxes.verticalExtraGargangua,
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Login to your \nAccount',
                      textAlign: TextAlign.left,
                      style: CPATextTheme().heading1.copyWith(
                          color: CPAColorTheme().primarygolden,
                          fontSize: 49,
                          fontWeight: FontWeight.w600,
                          height: 0),
                    ),
                  ),
                  SizedBoxes.verticalExtraGargangua,
                  CustomTextField(
                    controller: TextEditingController(),
                    labelText: 'Email',
                    hintText: 'john.doe@gmail.com',
                  ),
                  SizedBoxes.verticalMedium,
                  CustomTextField(
                    controller: TextEditingController(),
                    // controller: password,
                    labelText: 'Password',
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBoxes.verticalMicro,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: CPATextTheme()
                            .body
                            .copyWith(color: CPAColorTheme().primaryblue),
                      ),
                    ),
                  ),
                  SizedBoxes.verticalLarge,
                  CustomButton(
                      buttonText: 'Signin',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSetup(uid: ""),
                          ),
                        );
                      }),
                  // ElevatedButton(
                  //   onPressed: isLoading
                  //       ? null
                  //       : () async {
                  //           setState(() {
                  //             isLoading = true;
                  //           });
                  //           final enteredEmail = email.text;
                  //           final enteredPassword = password.text;
                  //           final loginResult = await APIService.userLogin(
                  //               enteredEmail, enteredPassword, (result) {
                  //             showNotification(result);
                  //           });
                  //           setState(() {
                  //             isLoading = false;
                  //           });
                  //           if (loginResult == 'success') {
                  //             // Navigate to the next screen or perform other actions on successful login
                  //           }
                  //         },
                  //   child:
                  //       isLoading ? CircularProgressIndicator() : Text('Sign in'),
                  // ),
                  SizedBoxes.verticalLarge,
                  OrDivider(),
                  SizedBoxes.verticalMedium,
                  InkWell(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthServices.signInWithGoogle().then((value) {
                        Utils.showSnackbar(context, "Success Login");
                        uid = value.user!.uid;
                        shared.loginPrefences(
                            uid: value.user!.uid, isLogin: true);
                        setState(() {
                          isLoading = false;
                        });

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false);
                        print(value.user!.uid);
                      }).onError((error, stackTrace) {
                        setState(() {
                          isLoading = false;
                        });
                        Utils.showSnackbar(context, "Error Occured");
                        print("Error!");
                        print(error);
                      });
                    },
                    child: GoogleLogin(),
                  ),
                  SizedBoxes.verticalExtraGargangua,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an account? ',
                        style: CPATextTheme()
                            .small
                            .copyWith(color: CPAColorTheme().neutral400),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileSetup(
                                uid: "",
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: CPATextTheme().subtext.copyWith(
                              color: CPAColorTheme().primaryblue,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              height: 0),
                        ),
                      )
                    ],
                  ),
                  // if (loginNotification.isNotEmpty)
                  //   Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Text(
                  //       loginNotification,
                  //       style: TextStyle(
                  //         color: Colors.red, // You can choose a different color
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

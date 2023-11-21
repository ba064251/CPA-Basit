import 'package:cpa/UI/Widgets/orwidget.dart';
import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';
import 'package:cpa/services/shared_services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../services/auth_services.dart';
import '../../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  final SharedPrefencesServices shared = SharedPrefencesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(CPAAssets.CpaLogo),
                SizedBoxes.verticalExtraGargangua,
                Text(
                  "Let's you in",
                  style: CPATextTheme()
                      .heading1
                      .copyWith(color: CPAColorTheme().primarygolden),
                ),
                SizedBoxes.verticalBig,
                FacebookLogin(),
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
                      shared.saveAnalyzing(isAnalyzeComplete: true);
                      setState(() {
                        isLoading = false;
                      });

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfileSetup(uid: value.user!.uid),
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
                SizedBoxes.verticalMedium,
                AppleLogin(),
                SizedBoxes.verticalLarge,
                OrWidget(),
                SizedBoxes.verticalExtraGargangua,
                SizedBoxes.verticalExtraGargangua,
                SizedBoxes.verticalExtraGargangua,
                CustomButton(
                    buttonText: 'Sign in with password',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
                SizedBoxes.verticalGargangua,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: CPATextTheme()
                            .body
                            .copyWith(color: CPAColorTheme().neutral500),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: CPATextTheme()
                              .subtext
                              .copyWith(color: CPAColorTheme().primaryblue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

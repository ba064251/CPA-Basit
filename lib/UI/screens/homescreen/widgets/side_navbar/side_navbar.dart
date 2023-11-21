import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/UI/screens/homescreen/widgets/side_navbar/edit_profile.dart';
import 'package:cpa/UI/screens/homescreen/widgets/side_navbar/privacy_policy.dart';
import 'package:cpa/UI/screens/pdf_screen.dart/pdf_screen.dart';
import 'package:cpa/services/auth_services.dart';
import 'package:cpa/services/shared_services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/analyze_data.dart';
import '../../../../../export.dart';
import '../../../pdf_screen.dart/pdf_analyze.dart';
import '../../../pdf_screen.dart/pdf_api.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({
    super.key,
  });

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  var analysis;
  String? uid;

  bool loading = false;

  @override
  void initState() {
    haveUid();
    getUid();

    super.initState();
  }

  Future<String?> haveUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('uid');
  }

  void getUid() async {
    uid = await haveUid();
    setState(() {});
    print("--------------- UID ----------------------------");
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: loading,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.cancel_sharp)),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FutureBuilder<DocumentSnapshot>(
                        future: users.doc(uid).get(),
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          // print(snapshot.data!.data['f_name']);
                          print("_____________________________");
                          Map<String, dynamic> data;
                          if (!snapshot.hasData ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasData) {
                            data =
                                snapshot.data?.data() as Map<String, dynamic>;
                            analysis = data;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        data['imgUrl'] ??
                                            "https://conservation-innovations.org/wp-content/uploads/2019/09/Dummy-Person.png",
                                      ),
                                      onError: (exception, stackTrace) {
                                        return;
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data['f_name']),
                                    Text(data['nickname']),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'Edit',
                                        style: CPATextTheme().subtext.copyWith(
                                              color:
                                                  CPAColorTheme().primaryblue,
                                              fontSize: 10.84,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Text("Some Error OCcured");
                          }
                        }),
                  ),
                  SizedBoxes.verticalBig,
                  Container(
                    height: 57,
                    width: 305,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: CPAColorTheme().primarygolden),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        onPressed: () async {
                          final analysisData = AnalyzeData(
                            fAddress: analysis['f_address'],
                            fName: analysis['f_name'],
                            phone: analysis['number'],
                            alternateTransport: analysis['alternate_transport'],
                            basicTechnology: analysis['basic_technology'],
                            communication: analysis['communication'],
                            cpaLong: analysis['cpa_long'],
                            empdisaster: analysis['emp_disaster'],
                            foodAllergies: analysis['food_allergies'],
                            getNotify: analysis['get_notify'],
                            interested: analysis['interested'],
                            invest: analysis['invest'],
                            landSize: analysis['land_size'],
                            livingStyle: analysis['living_style'],
                            noOfAdults: analysis['no_of_adults'],
                            noOfChildren: analysis['no_of_children'],
                            noOfVehicle: analysis['no_of_vehicle'],
                            personalsDocuments: analysis['personals_documents'],
                            pets: analysis['pets'],
                            safeRoom: analysis['safe_room'],
                            secLandSize: analysis['sec_land_size'],
                            secondaryLocation: analysis['secondary_location'],
                          );

                          // print("analyze");
                          // final pdfFile =
                          //     await PdfAnalyzeApi.generate(analysisData);

                          // print("open");
                          // await PdfApi.openFile(pdfFile);
                          // print("open");

                          // navigate to PDF Screen

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PdfScreen(),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(CPAAssets.CpApplication),
                            SizedBoxes.horizontalTiny,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'CPA',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Text(
                                  'Your Analysis Report',
                                  style: CPATextTheme()
                                      .extrasmall
                                      .copyWith(color: CPAColorTheme().white),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  SizedBoxes.verticalExtraGargangua,
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfile(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(CPAAssets.EditProfile),
                        SizedBoxes.horizontalMedium,
                        Text(
                          'Edit Profile',
                          style: CPATextTheme().subtext.copyWith(
                                color: CPAColorTheme().black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: CPAColorTheme().primaryblue,
                        )
                      ],
                    ),
                  ),
                  SizedBoxes.verticalBig,
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(CPAAssets.ReferFriend),
                        SizedBoxes.horizontalMedium,
                        Text(
                          'Refer Friends',
                          style: CPATextTheme().subtext.copyWith(
                                color: CPAColorTheme().black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: CPAColorTheme().primaryblue,
                        )
                      ],
                    ),
                  ),
                  SizedBoxes.verticalBig,
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(CPAAssets.Language),
                        SizedBoxes.horizontalMedium,
                        Text(
                          'Language',
                          style: CPATextTheme().subtext.copyWith(
                                color: CPAColorTheme().black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: CPAColorTheme().primaryblue,
                        )
                      ],
                    ),
                  ),
                  SizedBoxes.verticalBig,
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicy(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(CPAAssets.Lock),
                        SizedBoxes.horizontalMedium,
                        Text(
                          'Privacy Policy',
                          style: CPATextTheme().subtext.copyWith(
                                color: CPAColorTheme().black,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: CPAColorTheme().primaryblue,
                        )
                      ],
                    ),
                  ),
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  SizedBoxes.verticalExtraGargangua,
                  Image.asset(CPAAssets.CpaLogo),
                  SizedBoxes.verticalBig,
                  SizedBox(
                    width: 305,
                    height: 52,
                    child: CustomButton(
                      buttonText: 'Logout',
                      onPressed: () async {
                        SharedPrefencesServices prefs =
                            await SharedPrefencesServices();

                        prefs.clearPrefences();

                        await AuthServices.signOutGoogle();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                            (route) => false);
                      },
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

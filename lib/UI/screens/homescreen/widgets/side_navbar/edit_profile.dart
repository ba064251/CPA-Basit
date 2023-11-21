import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/UI/screens/profilesetup/widgets/dob.dart';
import 'package:cpa/UI/screens/profilesetup/widgets/local_image_screen.dart';
import 'package:cpa/export.dart';
import 'package:cpa/utils/country_code_picker.dart';
import 'package:cpa/utils/gender_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  final File? image;
  EditProfile({super.key, this.image});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  String? uid;
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(uid).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  Map<String, dynamic> data;
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    data = snapshot.data?.data() as Map<String, dynamic>;
                    _nameController.text = data['f_name'];
                    _nickNameController.text = data['nickname'];
                    _dateController.text = data['dob'];
                    _numberController.text = data['number'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SideNavbar(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                            Text(
                              'Edit Profile',
                              textAlign: TextAlign.center,
                              style: CPATextTheme().small.copyWith(
                                  color: CPAColorTheme().black,
                                  fontSize: 18,
                                  fontFamily: 'Red Hat Display',
                                  fontWeight: FontWeight.w600,
                                  height: 0),
                            )
                          ],
                        ),
                        Center(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  data['imgUrl'] ??
                                      "https://conservation-innovations.org/wp-content/uploads/2019/09/Dummy-Person.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBoxes.verticalBig,
                        CustomTextField(
                            controller: _nameController, hintText: 'Name'),
                        SizedBoxes.verticalMedium,
                        CustomTextField(
                            controller: _nickNameController,
                            hintText: 'Nickname'),
                        SizedBoxes.verticalMedium,
                        _dateController.text == null
                            ? DateOfBirthWidget(
                                dateController: _dateController,
                              )
                            : Text(_dateController.text),
                        SizedBoxes.verticalMedium,
                        PhoneDropdown(
                          phoneController: _numberController,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GenderDropdown(SelectedValue: data['gender']),
                        ),
                        SizedBoxes.verticalExtraGargangua,
                        SizedBoxes.verticalExtraGargangua,
                        SizedBoxes.verticalExtraGargangua,
                        SizedBoxes.verticalExtraGargangua,
                        CustomButton(
                          buttonText: 'Update',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SideNavbar(),
                              ),
                            );
                          },
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: Text("error Something went wrong"),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}

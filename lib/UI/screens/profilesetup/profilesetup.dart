import 'dart:io';

import 'package:cpa/UI/screens/profilesetup/widgets/dob.dart';
import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';
import 'package:cpa/services/auth_services.dart';
import 'package:cpa/utils/country_code_picker.dart';
import 'package:cpa/utils/gender_picker.dart';

import 'widgets/local_image_screen.dart';

class ProfileSetup extends StatefulWidget {
  final String uid;
  const ProfileSetup({
    super.key,
    required this.uid,
  });

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  bool isSignUp = false;

  TextEditingController _nameController = TextEditingController();

  final TextEditingController _nickNameController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController(
      text: fName,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    SizedBoxes.horizontalExtraGargangua,
                    SizedBoxes.horizontalExtraGargangua,
                    SizedBoxes.horizontalBig,
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Signup',
                        textAlign: TextAlign.center,
                        style: CPATextTheme().small.copyWith(
                            color: CPAColorTheme().black,
                            fontSize: 18,
                            fontFamily: 'Red Hat Display',
                            fontWeight: FontWeight.w600,
                            height: 0),
                      ),
                    )
                  ],
                ),
                Center(
                  child: LocalImagePicker(),
                ),
                SizedBoxes.verticalBig,
                CustomTextField(controller: _nameController, hintText: 'Name'),
                SizedBoxes.verticalMedium,
                CustomTextField(
                    controller: _nickNameController, hintText: 'Nickname'),
                SizedBoxes.verticalMedium,
                DateOfBirthWidget(dateController: _dateController),
                SizedBoxes.verticalMedium,
                PhoneDropdown(phoneController: _phoneController),
                Align(
                  alignment: Alignment.topLeft,
                  child: GenderDropdown(),
                ),
                SizedBoxes.verticalExtraGargangua,
                SizedBoxes.verticalExtraGargangua,
                SizedBoxes.verticalExtraGargangua,
                SizedBoxes.verticalExtraGargangua,
                CustomButton(
                    buttonText: 'Continue',
                    onPressed: () async {
                      print(
                          "___________________________________URL______________");

                      print(profileImg);
                      if (profileImg != null) {
                        File profile = File(profileImg!);

                        await AuthServices.uploadImage(profile, widget.uid);
                      }
                      print("________________________________________________");
                      print(imgUrl);
                      print("________________________________________________");
                      uid = widget.uid;
                      await AuthServices.addUser(
                        name: _nameController.text.toString(),
                        nickname: _nickNameController.text.toString(),
                        dob: _dateController.text.toString(),
                        uid: widget.uid,
                        gender: gender,
                        imgUrl: imgUrl,
                        number: _phoneController.text.toString(),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

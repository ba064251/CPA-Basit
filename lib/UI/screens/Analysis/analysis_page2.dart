import 'package:cpa/UI/screens/Analysis/analysis_page1.dart';

import 'package:cpa/export.dart';

import '../../../data/dummy.dart';

class AnalysisScreen2 extends StatelessWidget {
  AnalysisScreen2({super.key});

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(CPAAssets.CpaLogo),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'One More...',
                    style: CPATextTheme().heading3.copyWith(
                          fontSize: 25,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 1,
                        ),
                  ),
                ),
                SizedBoxes.verticalMicro,
                Align(
                  alignment: Alignment.topLeft,
                  child: ProgressBar(
                    value: 0.4,
                    backgroundColor: CPAColorTheme().white,
                    fillColor: CPAColorTheme().primaryblue,
                  ),
                ),
                SizedBoxes.verticalMedium,
                Text(
                  'How many family pets i.e domestic animals (Dogs and Cats) would you like your CPA to account for?',
                  style: CPATextTheme().body.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w500, height: 1),
                ),
                SizedBoxes.verticalBig,
                CustomTextField(
                  controller: _controller1,
                  hintText: '1 Dog, 2 Cat...',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalBig,
                Text(
                  'Do you ive in a single-family home with a slab or do you live in an appartment not on the lowest level?',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                CustomTextField(
                  controller: _controller2,
                  hintText: 'example...',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalBig,
                Text(
                  'If in a single-family home, do you have more ot less than 1/2 acre of land?',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                CustomTextField(
                  controller: _controller3,
                  hintText: 'example...',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalBig,
                Text(
                  'How many vehicles would you like to have prepared within your CPA?',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                CustomTextField(
                  controller: _controller4,
                  hintText: 'example...',
                  hintStyle: CPATextTheme()
                      .subtext
                      .copyWith(color: CPAColorTheme().neutral400),
                ),
                SizedBoxes.verticalBig,
                Text(
                  'Are you interested in your analysis taking into \nconsideration personal non-lethal protection for you and your family? ',
                  style: CPATextTheme().body.copyWith(
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                ),
                SizedBoxes.verticalBig,
                SimpleDropdown(
                  onTap: (value) {
                    interested = value;
                  },
                ),
                SizedBoxes.verticalBig,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 47,
                      child: CustomButton(
                          isActive: true,
                          isOutlined: true,
                          color: CPAColorTheme().primaryblue,
                          textColor: CPAColorTheme().primaryblue,
                          buttonText: 'Back',
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnalysisScreen1(),
                              ),
                            );
                          }),
                    ),
                    // SizedBoxes.horizontalBig,
                    SizedBox(
                      width: 150,
                      height: 47,
                      child: CustomButton(
                          textColor: CPAColorTheme().primaryblue,
                          buttonText: 'Next',
                          onPressed: () {
                            pets = _controller1.text.toString();
                            livingStyle = _controller2.text.toString();
                            landSize = _controller3.text.toString();
                            noOfVehicle = _controller4.text.toString();
                            print("_______________________________");
                            print(pets);
                            print(livingStyle);
                            print(landSize);
                            print(noOfVehicle);
                            print(interested);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnalysisScreen3(),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

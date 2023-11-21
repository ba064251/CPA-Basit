import 'package:cpa/UI/Widgets/progress_bar.dart';
import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';

class AnalysisScreen5 extends StatelessWidget {
  const AnalysisScreen5({super.key});

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
              SizedBoxes.verticalBig,
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'And we are done....',
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
                  value: 1,
                  backgroundColor: CPAColorTheme().white,
                  fillColor: CPAColorTheme().primaryblue,
                ),
              ),
              SizedBoxes.verticalBig,
              Text(
                'Do you want to consider alternate transportation in case of disruption to traditional roadways?',
                style: CPATextTheme().small.copyWith(
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1,
                      letterSpacing: -0.21,
                    ),
              ),
              SizedBoxes.verticalBig,
              SimpleDropdown(
                onTap: (val) {
                  alternateTransport = val;
                },
              ),
              SizedBoxes.verticalBig,
              Text(
                'Do you want your CPA to provide suggestions for radiological or EMP disasters?',
                style: CPATextTheme().subtext.copyWith(
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1,
                      letterSpacing: -0.21,
                    ),
              ),
              SizedBoxes.verticalBig,
              SimpleDropdown(
                onTap: (val) {
                  empdisaster = val;
                },
              ),
              SizedBoxes.verticalBig,
              Text(
                'Are you interested in receiving select notices through your app such as new product reviews, important news updates and advances in technology?',
                style: CPATextTheme().subtext.copyWith(
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1,
                      letterSpacing: -0.21,
                    ),
              ),
              SizedBoxes.verticalBig,
              SimpleDropdown(
                onTap: (val) {
                  getNotify = val;
                },
              ),
              SizedBoxes.verticalBig,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
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
                              builder: (context) => AnalysisScreen4(),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    width: 150,
                    height: 47,
                    child: CustomButton(
                        textColor: CPAColorTheme().primaryblue,
                        buttonText: 'All Done',
                        onPressed: () {
                          print("____________________________");
                          print(alternateTransport);
                          print(empdisaster);
                          print(getNotify);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnalysisFinalScreen(),
                              ),
                              (route) => false);
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

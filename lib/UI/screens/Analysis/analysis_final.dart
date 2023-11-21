import 'package:cpa/export.dart';
import 'package:cpa/services/shared_services.dart';

import '../../../data/dummy.dart';

class AnalysisFinalScreen extends StatelessWidget {
  const AnalysisFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(CPAAssets.CpaLogo)),
                ],
              ),
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              SizedBoxes.verticalExtraGargangua,
              Card(
                elevation:
                    4, // Adjust the elevation to control the "floating" effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: CPAColorTheme().neutral100,
                    width: 1.0, // Adjust the border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Congrats!',
                        style: CPATextTheme().heading3.copyWith(
                              color: CPAColorTheme().primarygolden,
                              fontSize: 25,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                      ),
                      SizedBoxes.verticalBig,
                      Text(
                        'Create your Survival Machine Account to get the results from your CPA! After creating your account, your CPA will be housed in the app so that you can access it at any time!',
                        textAlign: TextAlign.center,
                        style: CPATextTheme().subtext.copyWith(
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: 0.56,
                            color: CPAColorTheme().neutral500),
                      ),
                      SizedBoxes.verticalLarge,
                      SizedBox(
                        width: 244,
                        child: CustomButton(
                          buttonText: 'Create Account',
                          onPressed: () async {
                            printall();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void printall() {
  print(alternateTransport);

  print(basicTechnology);

  print(communication);

  print(cpaLong);

  print(empdisaster);

  print(fAddress);

  print(fName);

  print(foodAllergies);

  print(getNotify);

  print(interested);

  print(invest);

  print(landSize);

  print(livingStyle);

  print(noOfAdults);

  print(noOfChildren);

  print(noOfVehicle);

  print(personalsDocuments);

  print(pets);

  print(safeRoom);

  print(secLandSize);

  print(secondaryLocation);
}

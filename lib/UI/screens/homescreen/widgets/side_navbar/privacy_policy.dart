import 'package:cpa/export.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SideNavbar(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: CPAColorTheme().black,
                        ),
                        SizedBoxes.horizontalMedium,
                        Text(
                          'Privacy Policy',
                          style: CPATextTheme().headline.copyWith(
                                color: CPAColorTheme().black,
                                fontSize: 20.43,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.92,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text('Privacy Policy Data here')
            ],
          ),
        ),
      ),
    );
  }
}

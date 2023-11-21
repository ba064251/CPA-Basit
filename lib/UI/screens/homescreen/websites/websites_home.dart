import 'package:cpa/export.dart';
import 'package:flutter/material.dart';

class WebsiteHome extends StatelessWidget {
  const WebsiteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: CPAColorTheme().white,
      //   iconTheme: IconThemeData(color: CPAColorTheme().black),
      //   title: Text(
      //     'Websites',
      //     style: CPATextTheme().heading6.copyWith(color: CPAColorTheme().black),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    'Websites',
                    style: CPATextTheme().heading5.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Open Sans',
                        letterSpacing: 0.92),
                  )
                ],
              ),
              Text(
                'Survival Machine has compiled all the best products to help you prepare for any disaster.',
                style: CPATextTheme().headline.copyWith(
                    color: CPAColorTheme().neutral400,
                    fontWeight: FontWeight.w300),
              ),
              SizedBoxes.verticalLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 179,
                    width: 150,
                    decoration: BoxDecoration(
                      color: CPAColorTheme().primarygolden,
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the value to change the corner radius
                    ),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.Website),
                          Text(
                            'Top 10 Overall \nWebsites',
                            textAlign: TextAlign.center,
                            style: CPATextTheme().body.copyWith(
                                color: CPAColorTheme().white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.63),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 179,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              CPAAssets.Off_Grid,
                              height: 53,
                              width: 53,
                            ),
                            Text(
                              'Off Grid \nSurvival',
                              style: CPATextTheme().body.copyWith(
                                  color: CPAColorTheme().black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              SizedBoxes.verticalLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 179,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Non_Lethal),
                            Text(
                              'Non-Lethal \nProtection',
                              style: CPATextTheme().body.copyWith(
                                  color: CPAColorTheme().black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.63),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 179,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Offline),
                            Text(
                              'Off-line \nCommunication',
                              textAlign: TextAlign.center,
                              style: CPATextTheme().body.copyWith(
                                  color: CPAColorTheme().black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.63),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              SizedBoxes.verticalLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 179,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Gardening),
                            Text(
                              'Gardening 101',
                              style: CPATextTheme().body.copyWith(
                                  color: CPAColorTheme().black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.63),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 179,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Disaster),
                            Text(
                              'Disasters',
                              style: CPATextTheme().body.copyWith(
                                  color: CPAColorTheme().black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.63),
                            ),
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

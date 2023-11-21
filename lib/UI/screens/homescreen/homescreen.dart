import 'package:cpa/UI/screens/homescreen/products/products_screen.dart';
import 'package:cpa/UI/screens/pdf_screen.dart/pdf_screen.dart';
import 'package:cpa/export.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CPAColorTheme().white,
        leading: IconButton(
          color: CPAColorTheme().primaryblue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SideNavbar(),
              ),
            );
          },
          icon: const Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBoxes.horizontalMedium,
            Image.asset(CPAAssets.CpaLogo),
            IconButton(
              color: CPAColorTheme().primaryblue,
              iconSize: 40,
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 433,
              height: 359,
              color: CPAColorTheme().primaryblue,
              child: const Text('Hello World'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 113,
                    width: 100,
                    color: CPAColorTheme().primarygolden,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.LatestNews),
                            const Text('Latest'),
                            const Text('News')
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 113,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductsHome(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Products),
                            SizedBoxes.verticalMicro,
                            Text(
                              'Products',
                              style: CPATextTheme()
                                  .small
                                  .copyWith(color: CPAColorTheme().primaryblue),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 113,
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WebsiteHome(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Websites),
                            SizedBoxes.verticalMicro,
                            Text(
                              'Websites',
                              style: CPATextTheme()
                                  .small
                                  .copyWith(color: CPAColorTheme().primaryblue),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 113,
                    width: 174,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrainingHome(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Training),
                            Text(
                              'Trainings',
                              style: CPATextTheme()
                                  .small
                                  .copyWith(color: CPAColorTheme().primaryblue),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 113,
                    width: 174,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(CPAAssets.Services),
                            Text(
                              'Services',
                              style: CPATextTheme()
                                  .small
                                  .copyWith(color: CPAColorTheme().primaryblue),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBoxes.verticalBig,
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 92,
                    width: 150,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: CPAColorTheme().primaryblue),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [], // Fit address data from the analysis screen here
                      ),
                    ),
                  ),
                  Container(
                    height: 92,
                    width: 150,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: CPAColorTheme().primarygolden),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return PdfScreen();
                          }));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(CPAAssets.CpApplication),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
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
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/wizard.png',
                height: 30,
              ),
              const Text(
                "Wizard",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

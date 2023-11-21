import 'package:cpa/UI/screens/homescreen/products/water_resources.dart';
import 'package:cpa/export.dart';
import 'package:cpa/utils/products_data.dart';
import 'package:flutter/material.dart';

class ProductsHome extends StatelessWidget {
  const ProductsHome({super.key});

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
                  'Products',
                  style: CPATextTheme().heading5.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Open Sans',
                      letterSpacing: 0.92),
                )
              ],
            ),
            Text(
              'Survival Machine has compiled all the best products to help you prepare for any disaster',
              style: CPATextTheme().small.copyWith(
                  color: CPAColorTheme().neutral500,
                  fontWeight: FontWeight.w300),
            ),
            SizedBoxes.verticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: CPAColorTheme().primarygolden,
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.transparent),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "Data",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.water),
                          SizedBoxes.verticalMicro,
                          Text(
                            'Water',
                            style: CPATextTheme().small.copyWith(
                                color: CPAColorTheme().white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Resources',
                            style: CPATextTheme().small.copyWith(
                                color: CPAColorTheme().white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "energy resources",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.power),
                          Text(
                            'Power',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                          Text(
                            'Resources',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "emergency kits",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.emergency),
                          Text(
                            'Emergency',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                          Text(
                            'Kits',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBoxes.verticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "food resources",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.food),
                          Text(
                            'Food',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                          Text(
                            'Resources',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "non-lethal protection",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.nonlethal),
                          Text(
                            'Non-Lethal',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                          Text(
                            'Protection',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "communication resources",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.communication),
                          Text(
                            'Communication',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBoxes.verticalLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "bartering resources",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.Bartering),
                          Text(
                            'Bartering',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                          Text(
                            'Items',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "travel resources",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.travel),
                          Text(
                            'Travel',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "shelters resources",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.shelters),
                          Text(
                            'Shelters',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBoxes.verticalLarge,
            Row(
              children: [
                SizedBox(
                  height: 118,
                  width: 110,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaterResource(
                              collectionName: "car emergency",
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CPAAssets.Services),
                          Text(
                            'Services',
                            style: CPATextTheme()
                                .small
                                .copyWith(color: CPAColorTheme().black),
                          ),
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

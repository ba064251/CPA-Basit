import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpa/export.dart';
import 'package:cpa/services/fetch_services.dart';
import 'package:flutter/material.dart';

import '../../../../model/products_model.dart';
import 'water_detail_screen.dart'; // Import the ProductDetailScreen

class WaterResource extends StatefulWidget {
  final String collectionName;
  const WaterResource({super.key, required this.collectionName});
  @override
  State<WaterResource> createState() => _WaterResourceState();
}

class _WaterResourceState extends State<WaterResource> {

  List<Map<String, dynamic>>? products = [];

  void fetch() async {
    products =
        await FetchServices.fetchAllDataFromCollection(widget.collectionName);
    print(products!.length);
    setState(() {});
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }
  List cat = ["Data","energy resources","emergency kits","food resources","non-lethal protection","communication resources","bartering resources","travel resources","shelters resources","car emergency"];
  int current = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CPAColorTheme().white,
        iconTheme: IconThemeData(color: CPAColorTheme().black),
        title: Text(
    cat[current],
    style: CPATextTheme().heading6.copyWith(color: CPAColorTheme().black),
    maxLines: 1, // Limit the title to one line
    overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
    ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: cat.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      current = index;
                    });
                  },
                  child: AnimatedContainer(
                    curve: decelerateEasing,
                    duration: Duration(milliseconds: 400),
                    margin: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                    width: cat[current]=="Data"?80:cat[current]=="communication resources"?180:140,
                    height: 30,
                    decoration: BoxDecoration(
                      color: current==index?CPAColorTheme().primaryblue:Colors.transparent,
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: current==index? Colors.grey.shade400:Colors.transparent,
                      ),
                      borderRadius: current==index?BorderRadius.circular(20):BorderRadius.circular(4),
                    ),
                    child: Center(child: Text(cat[index],style: TextStyle(color: current==index?Colors.white:Colors.black),)),
                  ),
                );
              },),
          ),
          SizedBox(height: 10,),
          StreamBuilder(
                stream: cat[current]=="Data"?FirebaseFirestore.instance.collection("Data").snapshots():
                cat[current]=="energy resources"?FirebaseFirestore.instance.collection("energy resources").snapshots():
                cat[current]=="emergency kits"?FirebaseFirestore.instance.collection("emergency kits").snapshots():
                cat[current]=="food resources"?FirebaseFirestore.instance.collection("food resources").snapshots():
                cat[current]=="non-lethal protection"?FirebaseFirestore.instance.collection("non-lethal protection").snapshots():
                cat[current]=="communication resources"?FirebaseFirestore.instance.collection("communication resources").snapshots():
                cat[current]=="bartering resources"?FirebaseFirestore.instance.collection("bartering resources").snapshots():
                cat[current]=="travel resources"?FirebaseFirestore.instance.collection("travel resources").snapshots():
                cat[current]=="shelters resources"?FirebaseFirestore.instance.collection("shelters resources").snapshots():
              FirebaseFirestore.instance.collection("car emergency").snapshots(),
                builder: (BuildContext context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    var dataLength = snapshot.data!.docs.length;
                    return dataLength!=0?GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: List.generate(dataLength, (index){
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Column(
                              children: [
                                Image.network(
                                  snapshot.data!.docs[index]['image link'] ??
                                      snapshot.data!.docs[index]['image address'] ??
                                      "",
                                  width: 100, // Adjust the width as needed
                                  height: 100, // Adjust the height as needed
                                ),
                                Text(
                                  snapshot.data!.docs[index]['title'] ??
                                      snapshot.data!.docs[index]['title '] ??
                                      "Not Found",
                                  maxLines: 1, // Limit the title to one line
                                  overflow:
                                  TextOverflow.ellipsis, // Handle overflow with ellipsis
                                ),
                              ],
                            ),
                            onTap: () {
                              // Navigate to the ProductDetailScreen when a card is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WaterDetailScreen(productLink: products![index]),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ):Text("Nothing to Show");
                  } if (snapshot.hasError) {
                    return Icon(Icons.error_outline);
                  }
                  return Container();
                })
          ],
      )
    );
  }
}

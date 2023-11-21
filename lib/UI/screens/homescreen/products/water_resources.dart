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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CPAColorTheme().white,
        iconTheme: IconThemeData(color: CPAColorTheme().black),
        title: Text(
          'Water Resources',
          style: CPATextTheme().heading6.copyWith(color: CPAColorTheme().black),
          maxLines: 1, // Limit the title to one line
          overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 1,
          childAspectRatio: 3,
          mainAxisExtent: 200, // Adjust the crossAxisCount to your preference
        ),
        itemCount: products?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          print(index);
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Column(
                children: [
                  Image.network(
                    products![index]['image link'] ??
                        products?[index]['image address'] ??
                        "",
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                  ),
                  Text(
                    products![index]['title'] ??
                        products?[index]['title '] ??
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
        },
      ),
    );
  }
}

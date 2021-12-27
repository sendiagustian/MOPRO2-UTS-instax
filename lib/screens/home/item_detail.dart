import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:instax/resources/models/product_model.dart';

// ignore: slash_for_doc_comments
/**
 * @nama  Sendi Agustian
 * @kelas TIF RM CID 19
 * @npm   19552011018
 */

class ItemDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const ItemDetailScreen(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey[700]!,
            width: 1,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(productModel.colorHex),
              width: 1,
            ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(productModel.colorHex),
            ),
          ),
        ),
        title: Image.asset(
          'assets/images/fujifilm_banner.png',
          width: 150,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Align(
              alignment: Alignment.center,
              child: Image.network(
                productModel.image,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            const SizedBox(height: 32.0),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Instax ',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: productModel.typeName,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        productModel.colorHex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Html(
              data: productModel.content,
              style: {
                'p': Style(padding: EdgeInsets.zero),
                'h3': Style(padding: EdgeInsets.zero)
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: 90,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[700]!,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ ${productModel.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(productModel.colorHex),
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

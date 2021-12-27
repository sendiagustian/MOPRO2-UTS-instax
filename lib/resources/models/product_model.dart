// ignore: slash_for_doc_comments
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: slash_for_doc_comments
/**
 * @nama  Sendi Agustian
 * @kelas TIF RM CID 19
 * @npm   19552011018
 */
class ProductModel {
  final DocumentReference? reference;
  final String typeName;
  final String image;
  final num price;
  final String content;
  final int colorHex;

  ProductModel({
    this.reference,
    required this.typeName,
    required this.image,
    required this.price,
    required this.content,
    required this.colorHex,
  });

  factory ProductModel.fromData(DocumentSnapshot<Map> doc) {
    return ProductModel(
      reference: doc.reference,
      typeName: doc.get('typeName'),
      image: doc.get('image'),
      price: doc.get('price'),
      content: doc.get('content'),
      colorHex: int.parse(doc.get('colorHex')),
    );
  }

  Map<String, dynamic> toData() {
    return {
      'reference': reference,
      'typeName': typeName,
      'image': image,
      'price': price,
      'content': content,
      'colorHex': colorHex,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instax/resources/models/product_model.dart';

class ProductDatabases {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionPath = 'products';

  Future create(ProductModel productModel) async {
    await firestore.collection(collectionPath).doc().set(
          productModel.toData(),
        );
  }

  Stream<QuerySnapshot<ProductModel>> streamVisit() {
    return firestore
        .collection(collectionPath)
        .orderBy('typeName', descending: true)
        .withConverter<ProductModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return ProductModel.fromData(snapshot);
      },
      toFirestore: (ProductModel model, _) {
        return model.toData();
      },
    ).snapshots();
  }

  Future<QuerySnapshot<ProductModel>> readVisits() async {
    return await firestore
        .collection(collectionPath)
        .withConverter<ProductModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return ProductModel.fromData(snapshot);
      },
      toFirestore: (ProductModel model, _) {
        return model.toData();
      },
    ).get();
  }

  Future<DocumentSnapshot<ProductModel>> readVisit(String docId) async {
    return await firestore
        .collection(collectionPath)
        .doc(docId)
        .withConverter<ProductModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return ProductModel.fromData(snapshot);
      },
      toFirestore: (ProductModel model, _) {
        return model.toData();
      },
    ).get();
  }

  Future update(
    DocumentReference reference, {
    required Map<String, dynamic> data,
  }) async {
    return await reference.update(data);
  }

  Future delete(DocumentReference reference) async {
    return await reference.delete();
  }
}

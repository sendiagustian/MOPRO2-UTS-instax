import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instax/resources/models/product_model.dart';

// ignore: slash_for_doc_comments
/**
 * @nama  Sendi Agustian
 * @kelas TIF RM CID 19
 * @npm   19552011018
 */

class SearchProvider with ChangeNotifier {
  final List<DocumentSnapshot<ProductModel>> listProduct;

  SearchProvider(this.listProduct) {
    searchControl.addListener(() {
      if (searchControl.text.isNotEmpty) {
        isSearch = true;
      }
    });
  }

  bool _isSearch = false;
  FocusNode _focusNode = FocusNode();
  TextEditingController _searchControl = TextEditingController();
  List<DocumentSnapshot<ProductModel>> _searchResult = [];

  bool get isSearch => _isSearch;

  set isSearch(bool newValue) {
    _isSearch = newValue;
    notifyListeners();
  }

  FocusNode get focusNode => _focusNode;

  set focusNode(FocusNode newValue) {
    _focusNode = newValue;
    notifyListeners();
  }

  TextEditingController get searchControl => _searchControl;

  set searchControl(TextEditingController newValue) {
    _searchControl = newValue;
    notifyListeners();
  }

  List<DocumentSnapshot<ProductModel>> get searchResult => _searchResult;

  set searchResult(List<DocumentSnapshot<ProductModel>> newValue) {
    _searchResult = newValue;
    notifyListeners();
  }

  Icon get iconSearch {
    if (isSearch) {
      return const Icon(
        Icons.close,
        color: Colors.white,
      );
    } else {
      return const Icon(
        Icons.search,
        color: Colors.white,
      );
    }
  }

  void searchOperation(String searchText) {
    searchResult.clear();
    if (searchText.isNotEmpty) {
      isSearch = true;
      for (int i = 0; i < listProduct.length; i++) {
        DocumentSnapshot<ProductModel> data = listProduct[i];
        if (data
            .data()!
            .typeName
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          searchResult.add(data);
        }
      }
    } else {
      searchResult.clear();
      isSearch = false;
    }
  }
}

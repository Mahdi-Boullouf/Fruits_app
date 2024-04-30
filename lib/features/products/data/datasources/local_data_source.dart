import 'dart:developer';

import 'package:fruit_animations_app/features/products/data/datasources/base/data_source.dart';

class ProductsLocalDataSource implements ProductsDataSource {
    final _mockData = [
  {
    "name": "Apple",
    "price": 1.99,
    "image": "assets/images/Apple.png",
    "description": "Fresh and crispy apples.",
    "category": "Apple",
    "id": "P001"
  },
  {
    "name": "Banana",
    "price": 0.99,
    "image": "assets/images/Banana.png",
    "description": "Ripe and sweet bananas.",
    "category": "Banana",
    "id": "P002"
  },
  {
    "name": "Orange",
    "price": 2.49,
    "image": "assets/images/Orange.png",
    "description": "Juicy and tangy oranges.",
    "category": "Orange",
    "id": "P003"
  },

  {
    "name": "Blueberry",
    "price": 4.49,
    "image": "assets/images/Blueberry.png",
    "description": "Juicy and succulent berries.",
    "category": "Blueberry",
    "id": "P005"
  },
 
  {
    "name": "Mango",
    "price": 3.49,
    "image": "assets/images/Mango.png",
    "description": "Sweet and tropical mangoes.",
    "category": "Mango",
    "id": "P008"
  },
  
];
  @override
  Future getProducts() async{
    // TODO: implement getProducts
 await Future.delayed(const Duration(seconds: 1));
 return _mockData;
  }
  @override
  Future getProductsByCategory(String category) async {
    // TODO: implement getProductsByCategory
    var mockFiltredResponseFromServert =  _mockData.where((element) => element['category'] == category).toList();
 await Future.delayed(const Duration(seconds: 1));
 return mockFiltredResponseFromServert;

  }

  @override
  Future getSearchedProducts(String query)async {
    // TODO: implement getSearchedProducts
    log("searching");
        var mockFiltredResponseFromServert =  _mockData.where((element) => (element['name'] as String ).toLowerCase().contains(query.toLowerCase())).toList();
 await Future.delayed(const Duration(seconds: 1));
 return mockFiltredResponseFromServert;

  }
  
  @override
  Future getProduct(String id) async {
    // TODO: implement getProduct
        var mockFiltredResponseFromServert = Map<String,dynamic>.from(  _mockData.singleWhere((element) => element['id'] == id));
        print("hmm -> ${mockFiltredResponseFromServert}");

 await Future.delayed(const Duration(seconds: 1));
 return mockFiltredResponseFromServert;
  }
  
}
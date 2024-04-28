import 'package:fruit_animations_app/features/home/data/datasources/base/category_data_source.dart';

class CategoryLocalDataSource implements CategoryDataSource{
  var _mockData = [
  {
    "name": "All",
    "id": "0",
    "image": "assets/images/All.svg"
  },
  {
    "name": "Apple",
    "id": "1",
    "image": "assets/images/Apple.svg"
  },
  {
    "name": "Banana",
    "id": "2",
    "image": "assets/images/Banana.svg"
  },
  {
    "name": "Blueberry",
    "id": "3",
    "image": "assets/images/Blueberry.svg"
  },
  {
    "name": "Mango",
    "id": "4",
    "image": "assets/images/Mango.svg"
  },
  {
    "name": "Orange",
    "id": "5",
    "image": "assets/images/Orange.svg"
  }
];
  @override
  Future getProductsData() async{
    // TODO: implement getProductsData
    await Future.delayed(Duration(seconds: 1));
    return _mockData;
  }

}
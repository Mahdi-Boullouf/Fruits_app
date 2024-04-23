abstract class Product{
  final String name ; 
  final double price;
  final String image ;
  final String description;
  final String category ; 
  final String id;


  Product(  {required this.description,  required this.name, required this.price, required this.image, required this.id,required this.category,}); 

}
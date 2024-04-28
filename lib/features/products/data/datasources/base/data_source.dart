abstract class ProductsDataSource {
  Future<dynamic> getProducts();
  Future<dynamic> getProduct(String id);

  Future<dynamic> getProductsByCategory(String category);
  Future<dynamic> getSearchedProducts(String query);

}
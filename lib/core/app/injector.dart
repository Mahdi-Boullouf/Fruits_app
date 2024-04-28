import 'package:fruit_animations_app/features/cart/data/datasources/base/cart_local_source.dart';
import 'package:fruit_animations_app/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/add_cart_item.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/delete_cart_item.dart';
import 'package:fruit_animations_app/features/cart/domain/usecases/get_user_cart_items.dart';
import 'package:fruit_animations_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:fruit_animations_app/features/home/data/datasources/category_local_source.dart';
import 'package:fruit_animations_app/features/home/data/repo/category_repo_impl.dart';
import 'package:fruit_animations_app/features/home/domain/usecases/get_categories_use_case.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:fruit_animations_app/features/products/data/datasources/local_data_source.dart';
import 'package:fruit_animations_app/features/products/data/repo/products_repo_impl.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_product.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_products.dart';
import 'package:fruit_animations_app/features/products/domain/usecases/get_products_by_category.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;



setUp(){

  // products 
  injector.registerLazySingleton<ProductsLocalDataSource>(() => ProductsLocalDataSource());
  injector.registerLazySingleton<ProductsRepoImpl>(() => ProductsRepoImpl(productsDataSource: injector.get<ProductsLocalDataSource>()));
  injector.registerLazySingleton<GetProductsByCategoryUseCase>(() => GetProductsByCategoryUseCase(productsRepo: injector.get<ProductsRepoImpl>()));
  injector.registerLazySingleton<GetProduct>(() => GetProduct(productsRepo: injector.get<ProductsRepoImpl>()));

  injector.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(productsRepo: injector.get<ProductsRepoImpl>()));
injector.registerFactory<ProductsCubit>(() => ProductsCubit(getProductsUseCase: injector.get<GetProductsUseCase>(), getProductsByCategoryUseCase: injector.get<GetProductsByCategoryUseCase>(), getProduct: injector.get<GetProduct>()));



  // categories
  injector.registerLazySingleton<CategoryLocalDataSource>(() => CategoryLocalDataSource());
  injector.registerLazySingleton<CategoryRepoImpl>(() => CategoryRepoImpl(categoryDataSource: injector.get<CategoryLocalDataSource>()));
  injector.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(categoryRepo: injector.get<CategoryRepoImpl>()));
injector.registerLazySingleton<CategoriesCubit>(() => CategoriesCubit(injector.get<GetCategoriesUseCase>()));
// cart
injector.registerLazySingleton<CartLocalSource>(() => CartLocalSource());
injector.registerLazySingleton<CartRepoImpl>(() => CartRepoImpl(cartDataSource: injector.get<CartLocalSource>()));
injector.registerLazySingleton<AddCartItem>(() => AddCartItem(cartRepo: injector.get<CartRepoImpl>()));
injector.registerLazySingleton<DeleteCartItem>(() => DeleteCartItem(cartRepo: injector.get<CartRepoImpl>()));
injector.registerLazySingleton<GetCartItems>(() => GetCartItems(cartRepo: injector.get<CartRepoImpl>()));
injector.registerLazySingleton<CartCubit>(() => CartCubit(addCartItem: injector.get<AddCartItem>(), deleteCartItem: injector.get<DeleteCartItem>(), getCartItems: injector.get<GetCartItems>(), getProduct: injector.get<GetProduct>()));



}
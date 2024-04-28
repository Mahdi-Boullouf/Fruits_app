part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState  extends Equatable{
  @override 
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}

final class CatgeoriesLoaded extends CategoriesState{
  final List<Category> categories ;

  CatgeoriesLoaded({required this.categories}); 
  @override
  List<Object> get props => [categories ];
}
final class CatgeoriesError extends CategoriesState{
  final String message;

  CatgeoriesError({required this.message});  
  @override
  List<Object> get props => [message ];


}

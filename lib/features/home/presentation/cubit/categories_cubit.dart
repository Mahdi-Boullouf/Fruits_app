import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_animations_app/core/app/injector.dart';
import 'package:fruit_animations_app/features/home/domain/entities/category.dart';
import 'package:fruit_animations_app/features/home/domain/usecases/get_categories_use_case.dart';
import 'package:fruit_animations_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.getCategoriesUseCase) : super(CategoriesInitial());
  final GetCategoriesUseCase getCategoriesUseCase;
  getCategories() async {
    emit(CategoriesLoading());
    final categories = await getCategoriesUseCase();

  categories.fold((error) => emit(CatgeoriesError(message: error.message)), (categories) => emit(CatgeoriesLoaded(categories: categories)));

}}

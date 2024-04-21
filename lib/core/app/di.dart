import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_animations_app/features/home/presentation/cubit/categories_cubit.dart';

class DI extends StatelessWidget {
  const DI({super.key, required this.app});
  final Widget app;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
     
      ],
      child: app,
    );

  }
}
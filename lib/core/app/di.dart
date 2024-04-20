import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DI extends StatelessWidget {
  const DI({super.key, required this.app});
  final Widget app;
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => Cubit(),
    //     ),
    //     BlocProvider(
    //       create: (context) => Cubit(),
    //     ),
    //   ],
    //   child: app,
    // )();

    return SizedBox();
  }
}
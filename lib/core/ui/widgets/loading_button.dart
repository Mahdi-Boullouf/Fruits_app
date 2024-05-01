import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
                            return const FilledButton(onPressed: null, child: CircularProgressIndicator());
  
  }
}
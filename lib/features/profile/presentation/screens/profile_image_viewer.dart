import 'package:flutter/material.dart';
import 'package:fruit_animations_app/core/res/assets_manager.dart';

class ProfileImageViewer extends StatelessWidget {
  const ProfileImageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(tag: AssetsManager.avatar, child: Image.asset(AssetsManager.avatar)),
    );
  }
}
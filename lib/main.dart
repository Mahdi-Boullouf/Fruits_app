import 'package:flutter/material.dart';
import 'package:fruit_animations_app/core/app/app.dart';
import 'package:fruit_animations_app/core/app/injector.dart';
import 'package:fruit_animations_app/features/cart/data/models/demand_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main(List<String> args) async {
 WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
  setUp();
  await Hive.openBox("cart");
 runApp(MyApp());
}
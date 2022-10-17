import 'package:flutter/material.dart';
import 'package:flutter_base_basic_app/providers/example_provider.dart';
import 'package:flutter_base_basic_app/router/app_router.dart';
import 'package:flutter_base_basic_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExampleProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Basic App',
        initialRoute: AppRouter.initialRoute,
        theme: AppTheme.lightTheme,
        routes: AppRouter.getAppRoutes(),
      ),
    );
  }
}
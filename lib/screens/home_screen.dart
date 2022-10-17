import 'package:flutter/material.dart';
import 'package:flutter_base_basic_app/router/app_router.dart';
import 'package:flutter_base_basic_app/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Básico'),
      ),
      body: ListView.separated(
        itemCount: AppRouter.menuOptions.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              AppRouter.menuOptions[index].icon,
              color: AppTheme.primaryColor,
            ),
            title: Text(AppRouter.menuOptions[index].name),
            onTap: () {
              Navigator.pushNamed(context, AppRouter.menuOptions[index].route);
            },
          );
        },
      ),
    );
  }
}
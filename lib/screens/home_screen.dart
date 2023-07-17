import 'package:flutter/material.dart';
import 'package:news_app/widget/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold( 
      appBar: AppBar(),
      drawer: const DrawerWidget(),
      body: Center(
        child: SwitchListTile(
            title: Text(
              themeProvider.getDarkTheme ? 'Dark' : 'Light',
            ),
            secondary: Icon(
              themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).colorScheme.secondary,
            ),
            value: themeProvider.getDarkTheme,
            onChanged: (bool value) {
              setState(() {
                themeProvider.setDarkTheme = value;
              });
            }),
      ),
    );
  }
}

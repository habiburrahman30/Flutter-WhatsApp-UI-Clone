import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/src/config/theme.dart';

import 'screens/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          title: 'WhatsApp Clone',
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          home: SplashScreen(),
        );
      },
    );
  }
}

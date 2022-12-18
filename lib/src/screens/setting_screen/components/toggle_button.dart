import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/src/config/constants.dart';
import 'package:whatsapp_clone/src/config/theme.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      activeColor: Theme.of(context).primaryColorLight,
      activeTrackColor: kFreshPrimaryColor.withOpacity(0.7),
      inactiveThumbColor: kDarkGreyColor,
      inactiveTrackColor: kIconColor,
    );
  }
}

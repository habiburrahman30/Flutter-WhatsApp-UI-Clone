import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/config/constants.dart';
import 'package:whatsapp_clone/src/screens/setting_screen/components/toggle_button.dart';

class ChatThemesScreen extends StatefulWidget {
  @override
  State<ChatThemesScreen> createState() => _ChatThemesScreenState();
}

class _ChatThemesScreenState extends State<ChatThemesScreen> {
  bool isSwitched1 = false;

  void toggleSwitch1(bool value) {
    setState(() {
      isSwitched1 = !isSwitched1;
    });
  }

  bool isSwitched2 = false;

  void toggleSwitch2(bool value) {
    setState(() {
      isSwitched2 = !isSwitched2;
    });
  }

  bool isSwitched3 = false;

  void toggleSwitch3(bool value) {
    setState(() {
      isSwitched3 = !isSwitched3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text('Chats'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: kLargePadding, left: kLargePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Display',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kDarkGreyColor),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(top: kLargePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.brightness_medium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: kLargePadding * 1.4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Theme',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  isDarkMode ? 'Dark' : 'Light',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ChangeThemeButtonWidget(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: kLargePadding),
                child: Row(
                  children: [
                    Icon(Icons.wallpaper),
                    Padding(
                      padding: EdgeInsets.only(left: kLargePadding * 1.4),
                      child: Text(
                        'Wallpaper',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: kLargePadding, bottom: kLargePadding),
                child: Divider(
                  height: 2,
                  endIndent: 20,
                ),
              ),
              Text(
                'Chat settings',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kDarkGreyColor),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: kLargePadding * 1, top: kLargePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter is send',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Enter key will send your message',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: toggleSwitch1,
                        value: isSwitched1,
                        activeColor: Theme.of(context).primaryColorLight,
                        activeTrackColor: kSecondaryColor.withOpacity(0.4),
                        inactiveThumbColor: kDarkGreyColor,
                        inactiveTrackColor: kIconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: kLargePadding * 1,
                  top: kLargePadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Media visibility',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: SizedBox(
                              height: 35,
                              width: 280,
                              child: Text(
                                "Show newly downloaded media in your phone's gallery.",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: toggleSwitch2,
                        value: isSwitched2,
                        activeColor: Theme.of(context).primaryColorLight,
                        activeTrackColor: kSecondaryColor.withOpacity(0.4),
                        inactiveThumbColor: kDarkGreyColor,
                        inactiveTrackColor: kIconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: kLargePadding * 1,
                  top: kLargePadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Font size',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        'Medium',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: kLargePadding, bottom: kLargePadding),
                child: Divider(
                  height: 2,
                  endIndent: 20,
                ),
              ),
              Text(
                'Archieved chats',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kDarkGreyColor),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: kLargePadding * 1, top: kLargePadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keep chats archieved',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 35,
                            width: 280,
                            child: Opacity(
                              opacity: 0.5,
                              child: Text(
                                'Archeived chats will remain archieved when you receive a new message.',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.scale(
                      scale: 1,
                      child: Switch(
                        onChanged: toggleSwitch3,
                        value: isSwitched3,
                        activeColor: Theme.of(context).primaryColorLight,
                        activeTrackColor: kSecondaryColor.withOpacity(0.4),
                        inactiveThumbColor: kDarkGreyColor,
                        inactiveTrackColor: kIconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: kLargePadding, bottom: kLargePadding),
                child: Divider(
                  height: 2,
                  endIndent: 20,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.language),
                  Padding(
                    padding: EdgeInsets.only(left: kLargePadding * 1.4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'App language',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            "Phone's language (English)",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: kLargePadding, bottom: kLargePadding),
                child: Row(
                  children: [
                    Icon(Icons.backup),
                    Padding(
                      padding: EdgeInsets.only(left: kLargePadding * 1.4),
                      child: Text('Chat backup'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: kLargePadding),
                child: Row(
                  children: [
                    Icon(Icons.history),
                    Padding(
                      padding: EdgeInsets.only(left: kLargePadding * 1.4),
                      child: Text('Chat history'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

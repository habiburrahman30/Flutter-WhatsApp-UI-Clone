import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/config/constants.dart';
import 'package:whatsapp_clone/src/screens/setting_screen/components/themes_data_screen.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/bill.jpg'),
              ),
              title: Text(
                'Ali Asar',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              subtitle: Text(
                'Hey there! I am using WhatsApp.',
                style: TextStyle(fontSize: 13),
              ),
              trailing: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.qr_code,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              dense: true,
              enabled: true,
              onTap: () {},
            ),
            Divider(height: 3),
            ListTile(
              minLeadingWidth: kMedSize,
              leading: Transform.rotate(
                angle: -4.75,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: kMedPadding, left: kMedPadding / 1.5),
                  child: Icon(
                    Icons.key,
                    color: kDarkGreyColor,
                    size: 22,
                  ),
                ),
              ),
              title: Text(
                'Account',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              subtitle: Text('Privacy, security, change number'),
              dense: true,
              enabled: true,
              onTap: () {},
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatThemesScreen()),
                );
              },
              child: tileBuilder(
                Icons.chat,
                'Chats',
                'Theme, wallpapers, chat history',
              ),
            ),
            InkWell(
              onTap: () {},
              child: tileBuilder(
                Icons.notifications,
                'Notifications',
                'Message, group & call tones',
              ),
            ),
            InkWell(
              onTap: () {},
              child: tileBuilder(
                Icons.circle_outlined,
                'Storage and data',
                'Network usage, auto-download',
              ),
            ),
            InkWell(
              onTap: () {},
              child: tileBuilder(
                Icons.help,
                'Help',
                'Help centre, contact us, privacy policy',
              ),
            ),
            InkWell(
              onTap: () {},
              child: tileBuilder(
                Icons.group,
                'Invite a friend',
                null,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      'from',
                      style: TextStyle(
                          color: isDarkMode ? kBackgroundColor : kTextColor,
                          fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/meta.png',
                        color: isDarkMode ? kBackgroundColor : kTextColor,
                        height: 14,
                        width: 14,
                      ),
                      Text(
                        ' Meta',
                        style: TextStyle(
                          color: isDarkMode ? kBackgroundColor : kTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  ListTile tileBuilder(
    IconData icon,
    String title,
    String? subtitle,
  ) {
    return ListTile(
      minLeadingWidth: kMedSize,
      leading: Padding(
        padding: subtitle == null
            ? EdgeInsets.only(top: 1)
            : EdgeInsets.only(top: kSmallPadding),
        child: Icon(
          icon,
          color: kDarkGreyColor,
          size: 22,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: kSmallPadding),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(left: kSmallPadding),
        child: Text(
          subtitle ?? '',
          style: TextStyle(),
        ),
      ),
      dense: true,
      enabled: true,
    );
  }
}

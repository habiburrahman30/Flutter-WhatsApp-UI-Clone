import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/config/constants.dart';
import 'package:whatsapp_clone/src/helpers/k_text.dart';
import 'package:whatsapp_clone/src/models/Chat.dart';
import 'package:whatsapp_clone/src/screens/chat_screen/chat_screen.dart';

import 'hero_dialogue.dart';
import 'profile_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // return CartWidget(chat: chat, isDarkMode: isDarkMode);
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              image: chat.image,
              name: chat.name,
              status: chat.isActive,
              chat: chat,
            ),
          ),
        );
      },
      onLongPress: () {
        print('object');
      },
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      leading: Container(
        decoration: BoxDecoration(
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(.5),
            //   blurRadius: 5.0,
            //   spreadRadius: 1,
            //   offset: Offset(0.0, 0.0),
            // )
          ],
          // borderRadius: BorderRadius.circular(100),
          // border: Border.all(
          //   width: 1,
          //   color: Colors.white,
          // ),
        ),
        child: CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage(
            chat.image,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: KText(
                  text: chat.name,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Opacity(
                opacity: 0.5,
                child: KText(
                  text: chat.time,
                  fontSize: 12,
                  // color: isDarkMode ? Colors.white : Colors.black87,
                  color: chat.msgTotal == 0
                      ? Colors.white
                      : isDarkMode
                          ? kBackgroundColor
                          : kSecondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (chat.isSeen == true && chat.msgTotal == 0)
                      Icon(
                        Icons.done_all_sharp,
                        color: kReceivedColor,
                        size: 18,
                      )
                    else if (chat.isSeen == false && chat.msgTotal > 0)
                      Icon(
                        Icons.done_all_sharp,
                        color: kIconColor,
                        size: 18,
                      )
                    else if (chat.isSeen == false && chat.msgTotal == 0)
                      Icon(
                        Icons.done_all_sharp,
                        color: kIconColor,
                        size: 18,
                      ),
                    Expanded(
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          ' ${chat.lastMessage}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 2),
                  Icon(Icons.volume_off_rounded),
                  SizedBox(width: 8),
                  if (chat.msgTotal != 0)
                    CircleAvatar(
                      radius: 10,
                      backgroundColor:
                          isDarkMode ? kFreshPrimaryColor : kSecondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: KText(
                          text: chat.msgTotal.toString() + 0.toString(),
                          fontSize: 10,
                          color: kBackgroundColor,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
      // trailing: KText(text: '11/11/2022'),
      dense: true,
      enabled: true,
      autofocus: true,
      // focusColor: hexToColor('#F3F3F3'),
      // hoverColor: hexToColor('#F3F3F3'),
      // selectedColor: hexToColor('#F3F3F3'),
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget({
    Key? key,
    required this.chat,
    required this.isDarkMode,
  }) : super(key: key);

  final Chat chat;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                image: chat.image,
                name: chat.name,
                status: chat.isActive,
                chat: chat,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: kSmallPadding * 1.5,
            right: kSmallPadding * 1.5,
            bottom: kLargePadding * 1.3,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(HeroDialogRoute(builder: (context) {
                    return ProfileView(chat: chat);
                  }));
                },
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(chat.image),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kSmallPadding, vertical: kSmallPadding * 0.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          if (chat.isSeen == true && chat.msgTotal == 0)
                            Icon(
                              Icons.done_all_sharp,
                              color: kReceivedColor,
                              size: 18,
                            )
                          else if (chat.isSeen == false && chat.msgTotal > 0)
                            Icon(
                              Icons.done_all_sharp,
                              color: kIconColor,
                              size: 18,
                            )
                          else if (chat.isSeen == false && chat.msgTotal == 0)
                            Icon(
                              Icons.done_all_sharp,
                              color: kIconColor,
                              size: 18,
                            ),
                          Opacity(
                            opacity: 0.6,
                            child: Text(
                              ' ${chat.lastMessage}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      '${chat.time}\n',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: chat.msgTotal == 0
                            ? kTextColor
                            : isDarkMode
                                ? kFreshPrimaryColor
                                : kSecondaryColor,
                      ),
                    ),
                  ),
                  if (chat.msgTotal != 0)
                    SizedBox(
                      height: 20,
                      width: 29,
                      child: CircleAvatar(
                        backgroundColor:
                            isDarkMode ? kFreshPrimaryColor : kSecondaryColor,
                        radius: 12,
                        child: Text(
                          chat.msgTotal.toString(),
                          style:
                              TextStyle(color: kBackgroundColor, fontSize: 14),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

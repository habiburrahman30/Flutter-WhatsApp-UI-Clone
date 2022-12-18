import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/config/constants.dart';
import 'package:whatsapp_clone/src/models/Chat.dart';
import 'package:whatsapp_clone/src/screens/call_history_screen/call_screen.dart';
import 'package:whatsapp_clone/src/screens/camera_screen/camera_screen.dart';
import 'package:whatsapp_clone/src/screens/contact_screen/contact_screen.dart';
import 'package:whatsapp_clone/src/screens/inbox_screen/components/broadcast_screen.dart';
import 'package:whatsapp_clone/src/screens/inbox_screen/components/linkdevice_screen.dart';
import 'package:whatsapp_clone/src/screens/inbox_screen/components/starred_messages.dart';
import 'package:whatsapp_clone/src/screens/setting_screen/setting_screen.dart';
import 'package:whatsapp_clone/src/screens/status_screen/status_screen.dart';
import 'components/newgroup_screen.dart';
import 'components/chats_card.dart';

class InboxScreen extends StatefulWidget {
  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor,
              pinned: true,
              floating: true,
              title: Text(
                'WhatsApp',
              ),
              elevation: 0,
              actions: [
                IconButton(
                  icon:
                      Icon(Icons.camera_alt_outlined, color: kBackgroundColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraScreen(
                          isCamTab: true,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search, color: kBackgroundColor),
                  onPressed: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                ),
                if (_tabController.index == 1)
                  PopupMenuButton<String>(
                    color: isDarkMode ? kBlackShadowBgColor : kBackgroundColor,
                    onSelected: (value) {
                      if (value == 'Settings') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()),
                        );
                      } else if (value == 'New group') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewGroupScreen()),
                        );
                      } else if (value == 'New broadcast') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BroadcastScreen()),
                        );
                      } else if (value == 'Linked Devices') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LinkDeviceScreen()),
                        );
                      } else if (value == 'Starred messages') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StarredMessagesScreen()),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'New group',
                          child: Text('New group'),
                        ),
                        PopupMenuItem(
                          value: 'New broadcast',
                          child: Text('New broadcast'),
                        ),
                        PopupMenuItem(
                          value: 'Linked Devices',
                          child: Text('Linked devices'),
                        ),
                        PopupMenuItem(
                          value: 'Starred messages',
                          child: Text('Starred messages'),
                        ),
                        PopupMenuItem(
                          value: 'Settings',
                          child: Text('Settings'),
                        ),
                      ];
                    },
                  )
                else if (_tabController.index == 2)
                  PopupMenuButton<String>(
                    color: isDarkMode ? kBlackShadowBgColor : kBackgroundColor,
                    onSelected: (value) {
                      if (value == 'Settings') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'Status privacy',
                          child: Text('Status privacy'),
                        ),
                        PopupMenuItem(
                          value: 'Settings',
                          child: Text('Settings'),
                        ),
                      ];
                    },
                  )
                else
                  PopupMenuButton<String>(
                    color: isDarkMode ? kBlackShadowBgColor : kBackgroundColor,
                    onSelected: (value) {
                      if (value == 'Settings') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'Clear call log',
                          child: Text('Clear call log'),
                        ),
                        PopupMenuItem(
                          value: 'Settings',
                          child: Text('Settings'),
                        ),
                      ];
                    },
                  ),
              ],
              bottom: TabBar(
                controller: _tabController,
                isScrollable: false,
                labelColor: Theme.of(context).indicatorColor,
                unselectedLabelColor: kShadeColor.withOpacity(0.5),
                indicatorColor: Theme.of(context).indicatorColor,
                indicatorWeight: 4,
                tabs: [
                  SizedBox(
                    width: 40,
                    child: Tab(
                      icon: Icon(
                        Icons.groups,
                        color: kBackgroundColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 86,
                    child: Tab(
                      text: 'Chats',
                    ),
                  ),
                  SizedBox(
                    width: 86,
                    child: Tab(
                      text: 'Status',
                    ),
                  ),
                  SizedBox(
                    width: 86,
                    child: Tab(
                      text: 'Calls',
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Text('data'),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: kMedPadding),
              itemCount: chatsData.length + 1,
              itemBuilder: ((context, index) => (index != chatsData.length)
                  ? ChatCard(
                      chat: chatsData[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InboxScreen()),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: kMedPadding, bottom: kLargePadding * 5),
                      child: Text(
                        'Tap and hold on a chat for more options',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: kIconColor,
                        ),
                      ),
                    )),
            ),
            StatusScreen(),
            CallScreen(),
          ],
        ),
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton(
              heroTag: 'Contact',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactScreen()),
                );
              },
              backgroundColor: Theme.of(context).primaryColorLight,
              child: Icon(
                Icons.chat,
                color: kBackgroundColor,
              ),
            )
          : null,
    );
  }

  bool getIsTabCamera(TabController tabController) {
    return tabController.animation!.value < 0.7;
  }
}

class CustomSearch extends SearchDelegate {
  List<String> data = [
    'Jenny Wilson',
    'Esther Howard',
    'Ralph Edwards',
    'Jacob Jones',
    'Albert Flores'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        results.add(item);
      }
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var show = results[index];
        return ListTile(
          title: Text(show),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> results = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        results.add(item);
      }
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var show = results[index];
        return ListTile(
          title: Text(show),
        );
      },
    );
  }
}

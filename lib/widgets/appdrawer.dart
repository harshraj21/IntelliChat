import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/self.dart';
import '../models/myself.dart';
import '../providers/customization.dart';
import '../models/customize.dart';
import './drawerheader.dart';

class AppDrawer extends StatelessWidget {
  final double width, height;
  final MediaQueryData mq;
  AppDrawer({
    required this.width,
    required this.height,
    required this.mq,
  });

  Widget listTileGen(IconData icondata, String title, Function funx) {
    return ListTile(
      leading: Icon(
        icondata,
        size: 30,
        color: Colors.white30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      enableFeedback: true,
      onTap: () => funx(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SelfProvider handle = Provider.of<SelfProvider>(context);
    final MyselfModel myself = handle.myself;
    final CustomizationProvider handle2 =
        Provider.of<CustomizationProvider>(context);
    final CustomizeModel theme = handle2.data;
    return Drawer(
      child: Column(
        children: [
          DrawerzHeader(
            height: height,
            mq: mq,
            myself: myself,
            theme: theme,
            width: width,
            handle: handle2,
          ),
          Container(
            color: Colors.black38,
            height: height - mq.padding.bottom - 195,
            child: Column(
              children: [
                listTileGen(
                  Icons.people_outline,
                  'New Group',
                  () {},
                ),
                listTileGen(
                  Icons.person_outline_rounded,
                  'Contacts',
                  () {},
                ),
                listTileGen(
                  Icons.save_outlined,
                  'Saved Chats',
                  () {},
                ),
                listTileGen(
                  Icons.settings_applications_outlined,
                  'Settings',
                  () {},
                ),
                Divider(
                  color: Colors.black54,
                  thickness: 2,
                ),
                listTileGen(
                  Icons.person_add_alt_outlined,
                  'Invite Friends',
                  () {},
                ),
                listTileGen(
                  Icons.help_outline_outlined,
                  'Changelogs',
                  () {},
                ),
                listTileGen(
                  Icons.info_outline_rounded,
                  'About',
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

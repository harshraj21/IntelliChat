import 'package:flutter/material.dart';

import 'package:flutter_search_bar/flutter_search_bar.dart';

import './chats.dart';
import './calls.dart';
import './status.dart';
import '../widgets/appdrawer.dart';

class IntelliChatHome extends StatefulWidget {
  @override
  _IntelliChatHomeState createState() => _IntelliChatHomeState();
}

class _IntelliChatHomeState extends State<IntelliChatHome> {
  late SearchBar searchBar;
  int _page = 0;
  late PageController _pc;
  int _totalpages = 3;
  late double width, height;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text('IntelliChat'),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  @override
  void initState() {
    _pc = new PageController(
      initialPage: _page,
    );
    searchBar = new SearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: buildAppBar,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);
    width = mq.size.width;
    height = mq.size.height;
    return Scaffold(
      appBar: searchBar.build(context),
      drawer: AppDrawer(
        mq: mq,
        width: width,
        height: height,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _page,
        // backgroundColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (p) {
          _pc.animateToPage(
            p,
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
      body: PageView(
        controller: _pc,
        onPageChanged: (p) {
          if (p > _totalpages - 1) {
            return;
          }
          setState(() {
            _page = p;
          });
        },
        children: [
          IntelliChatChats(),
          IntelliChatStatus(),
          IntelliChatCalls(),
        ],
      ),
    );
  }
}

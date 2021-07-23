import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/contacts.dart';
import '../models/contact.dart';

class IntelliChatChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);
    final ContactsProvider contactshandle =
        Provider.of<ContactsProvider>(context);
    final List<ContactModel> contacts = contactshandle.contacts;
    // return ListView.builder(
    //   itemCount: contacts.length,
    //   itemBuilder: (ctx, id) {
    //     return;
    //   },
    // );
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white12,
              width: 2,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: contacts.first.picuri == 'null'
                    ? Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                        ),
                        child: Center(
                          child: Text(
                            contacts.first.name.substring(0, 2),
                            /* split and then first */
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                      )
                    : Image(
                        image: NetworkImage(contacts.first.picuri),
                        fit: BoxFit.cover,
                        width: 58,
                        height: 58,
                      ),
              ),
            ),
            Container(
              width: mq.size.width - 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contacts.first.name,
                    style: TextStyle(
                      fontSize: 19,
                      // color: Color(0xEEFFFFFF),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    contacts.first.lastmsg,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: Icon(
                          Icons.done_all_rounded,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        DateFormat('h:mm a')
                            .format(contacts.first.lastchatdate),
                        style: TextStyle(fontSize: 13, color: Colors.white54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      child: Text(
                        contacts.first.unreadmsg.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

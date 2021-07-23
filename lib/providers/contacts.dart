import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactsProvider with ChangeNotifier {
  List<ContactModel> _contacts = [
    ContactModel(
      primaryid: 'foahioghaiogh',
      name: 'Akash Ranjan',
      lastchatdate: DateTime.now(),
      lastmsg:
          'hello brother how are you?? fhu ish fui sg ui su ish ugo hs uig bsu ibg uis ghb uis bgu isb gu ib sg uib su gi',
      sentbycontact: true,
      unreadmsg: 9999999,
    ),
    ContactModel(
      primaryid: 'aifhioasghnsiog',
      name: 'Anjnai Saurav',
      lastchatdate: DateTime.now(),
      lastmsg: 'fjajfhiaofhioahfif',
      sentbycontact: true,
    ),
    ContactModel(
      primaryid: 'oifhjsiogjsiogjisog',
      name: 'Avi Singh',
      lastchatdate: DateTime.now(),
      lastmsg: 'fjafgbuifbuisafgbisge',
      sentbycontact: true,
    ),
    ContactModel(
      primaryid: 'eguisjkvgbsuieg',
      name: 'Harshil Dhingra',
      lastchatdate: DateTime.now(),
      lastmsg: 'uigbuidsbguisngiosbg',
      sentbycontact: true,
    ),
    ContactModel(
      primaryid: 'yjfhjbsyuifgbsf',
      name: 'Devesh Mirani',
      lastchatdate: DateTime.now(),
      lastmsg: 'wuifghuiacnuisfgbesuif',
      sentbycontact: true,
    ),
    ContactModel(
      primaryid: 'ugebvsuivbuis',
      name: 'Harsh Kumar',
      lastchatdate: DateTime.now(),
      lastmsg: 'uihfuisnfuisgef',
      sentbycontact: true,
    ),
    ContactModel(
      primaryid: 'nchbecyuibsuievc',
      name: 'Harsh Deep',
      lastchatdate: DateTime.now(),
      lastmsg: 'winaifbayuifbafuifa',
      sentbycontact: true,
    ),
  ];

  List<ContactModel> get contacts {
    return _contacts;
  }
}

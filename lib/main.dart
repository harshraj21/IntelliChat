import "dart:math";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import './screens/home.dart';
import './providers/contacts.dart';
import './providers/self.dart';
import './providers/customization.dart';
import './models/customize.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelfProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CustomizationProvider(),
        ),
      ],
      child: IntelliChatMain(),
    ),
  );
}

class IntelliChatMain extends StatelessWidget {
  late final int _randomindex;

  ThemeData switchTheme(int rand, bool darkmode) {
    final ThemeData dark = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Oswald',
      brightness: Brightness.dark,
      /* theme */
      primaryColor: Colors.primaries[_randomindex],
      accentColor: Colors.primaries[_randomindex],

      // primarySwatch: Colors
      //     .primaries[new Random().nextInt(Colors.primaries.length)], //xD
      /////////////////////////////////////////////////////////////////////////
      textTheme: ThemeData.dark().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Color(0xEEFFFFFF),
            ),
          ),
    );
    final ThemeData light = ThemeData(
      // scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Oswald',
      // brightness: Brightness.light,
      /* theme */
      primaryColor: Colors.primaries[_randomindex],
      accentColor: Colors.primaries[_randomindex],
      // primarySwatch: Colors
      //     .primaries[new Random().nextInt(Colors.primaries.length)], //xD
    );
    return darkmode ? dark : light;
  }

  @override
  Widget build(BuildContext context) {
    final CustomizationProvider handle =
        Provider.of<CustomizationProvider>(context);
    final CustomizeModel mode = handle.data;
    try {
      // ignore: unnecessary_statements
      _randomindex;
    } catch (e) {
      _randomindex = new Random().nextInt(Colors.primaries.length);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: switchTheme(_randomindex, mode.darkmode),
      title: 'simply intelligent',
      home: IntelliChatHome(),
    );
  }
}

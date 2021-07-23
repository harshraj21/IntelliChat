import 'package:flutter/material.dart';

import '../models/myself.dart';

class SelfProvider with ChangeNotifier {
  MyselfModel _myself = MyselfModel(
    primaryid: 'nfioanfioaf',
    secondaryid: 'uifbanuifauif',
    name: 'Harsh Raj',
    bio: 'i am a good guy',
    isLoggedin: true,
    authToken: 'afkhfgbuibguisbguis',
  );

  MyselfModel get myself {
    return _myself;
  }
}

import 'package:flutter/material.dart';

import '../models/customize.dart';

class CustomizationProvider with ChangeNotifier {
  CustomizeModel _data = CustomizeModel(
    darkmode: true,
  );

  CustomizeModel get data {
    return _data;
  }

  void toggle() {
    _data.darkmode = !_data.darkmode;
    notifyListeners();
  }
}

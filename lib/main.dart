import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:vascomm_flutter_technical_assessment/app.dart';
import 'package:vascomm_flutter_technical_assessment/common/config/injectable_setup.dart';

enum EnvironmentMode { production, staging }

class Main {
  static final Main _instance = Main._internal();
  Main._internal();
  factory Main() {
    return _instance;
  }

  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const App());
  }
}

void main() async {
  await Main().init();
}

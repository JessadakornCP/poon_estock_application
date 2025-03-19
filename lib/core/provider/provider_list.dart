import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'global_provider.dart';
import 'user_profile_provider.dart';

class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (_) => GlobalProvider()),
    ChangeNotifierProvider(create: (_) => UserProfileProvider()),
  ];
  List<SingleChildWidget> uiChangesItems = [];
}

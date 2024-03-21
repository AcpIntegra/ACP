library test_helper;

import 'package:acp_app/main/config.dart';
import 'package:acp_app/main/flavor_utils/flavors.dart';
import 'package:integration_test/integration_test.dart';

class TestHelper {
  static void loadApp(Flavor appFlavor) {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    F.appFlavor = appFlavor;
    Config().initialize();
  }
}

import 'flavor_utils/flavors.dart';
import 'package:acp_app/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.annals;
  await runner.main();
}

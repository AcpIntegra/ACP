import 'flavor_utils/flavors.dart';
import 'dart:async';
import 'package:acp_app/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.aimcc;
  await runner.main();
}

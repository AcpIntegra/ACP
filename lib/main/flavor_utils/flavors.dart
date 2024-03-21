enum Flavor {
  aimcc,
  annals,
  guidelines,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.aimcc:
        return 'aimcc_app';
      case Flavor.annals:
        return 'annals_app';
      case Flavor.guidelines:
        return 'guildelines_app';
      default:
        return 'no_flavour';
    }
  }
}

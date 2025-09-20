enum Flavor { dev, prod }

class FlavorConfig {
  final String appName;
  final Flavor flavor;

  const FlavorConfig({
    required this.appName,
    required this.flavor,
  });

  bool get isDev => flavor == Flavor.dev;
  bool get isProd => flavor == Flavor.prod;
}

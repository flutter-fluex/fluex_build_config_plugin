import 'package:fluex/fluex.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel("org.axen.iflutter/build");

class FluexBuildConfigPlugin implements FuturePlugin<BuildConfig> {
  @override
  Future<BuildConfig> run() => _channel.invokeMethod("load")
      .then((map) => BuildConfig.fromMap(map));
}

class BuildConfig {
  final bool debug;
  final String? versionName;
  final int? versionCode;
  final String? buildType;
  final Map<String, dynamic> extras;

  BuildConfig(
      this.debug,
      this.versionName,
      this.versionCode,
      this.buildType,
      {
        this.extras = const {}
      });

  BuildConfig.fromMap(Map<String, dynamic> map)
      : debug = kDebugMode,
        versionName = map["versionName"],
        versionCode = map["versionCode"],
        buildType = map["buildType"],
        extras = map["extras"];

  Map<String, dynamic> toMap() => {
    "debug": debug,
    "versionName": versionName,
    "versionCode": versionCode,
    "buildType": buildType,
    "extras": extras
  };
}

extension BuildConfigExtension on Fluex {
  BuildConfig get build => getExtensionNonNull<FluexBuildConfigPlugin>();
}
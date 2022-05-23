#import "FluexBuildConfigPlugin.h"
#if __has_include(<fluex_build_config_plugin/fluex_build_config_plugin-Swift.h>)
#import <fluex_build_config_plugin/fluex_build_config_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fluex_build_config_plugin-Swift.h"
#endif

@implementation FluexBuildConfigPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFluexBuildConfigPlugin registerWithRegistrar:registrar];
}
@end

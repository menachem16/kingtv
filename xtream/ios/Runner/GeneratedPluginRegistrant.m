//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_vlc_player/FlutterVlcPlayerPlugin.h>)
#import <flutter_vlc_player/FlutterVlcPlayerPlugin.h>
#else
@import flutter_vlc_player;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

#if __has_include(<wakelock/WakelockPlugin.h>)
#import <wakelock/WakelockPlugin.h>
#else
@import wakelock;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterVlcPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterVlcPlayerPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
  [WakelockPlugin registerWithRegistrar:[registry registrarForPlugin:@"WakelockPlugin"]];
}

@end

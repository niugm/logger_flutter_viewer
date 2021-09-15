#import "LoggerFlutterViewerPlugin.h"
#if __has_include(<logger_flutter_viewer/logger_flutter_viewer-Swift.h>)
#import <logger_flutter_viewer/logger_flutter_viewer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "logger_flutter_viewer-Swift.h"
#endif

@implementation LoggerFlutterViewerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLoggerFlutterViewerPlugin registerWithRegistrar:registrar];
}
@end

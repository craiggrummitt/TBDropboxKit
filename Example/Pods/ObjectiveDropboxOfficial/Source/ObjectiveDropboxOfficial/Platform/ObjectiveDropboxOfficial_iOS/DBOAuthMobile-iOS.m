///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///

#import "DBOAuthManager.h"
#import "DBOAuthMobile-iOS.h"
#import "DBSDKSystem.h"

#pragma mark - Shared application

static DBMobileSharedApplication *s_mobileSharedApplication;

@implementation DBMobileSharedApplication {
  UIApplication * _Nullable _sharedApplication;
  UIViewController * _Nullable _controller;
  void (^_openURL)(NSURL * _Nullable);
}

+ (DBMobileSharedApplication *)mobileSharedApplication {
  return s_mobileSharedApplication;
}

+ (void)setMobileSharedApplication:(DBMobileSharedApplication *)mobileSharedApplication {
  s_mobileSharedApplication = mobileSharedApplication;
}

- (instancetype)initWithSharedApplication:(UIApplication *)sharedApplication
                               controller:(UIViewController *)controller
                                  openURL:(void (^)(NSURL *))openURL {
  self = [super init];
  if (self) {
    // fields saved for app-extension safety
    _sharedApplication = sharedApplication;
    _controller = controller;
    _openURL = openURL;
  }
  return self;
}

- (void)presentErrorMessage:(NSString *)message title:(NSString *)title {
  if (_controller) {
    UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:message
                                     preferredStyle:(UIAlertControllerStyle)UIAlertControllerStyleAlert];
    [_controller presentViewController:alertController
                              animated:YES
                            completion:^{
                              [NSException raise:@"FatalError" format:@"%@", message];
                            }];
  }
}

- (void)presentErrorMessageWithHandlers:(NSString * _Nonnull)message
                                  title:(NSString * _Nonnull)title
                         buttonHandlers:(NSDictionary<NSString *, void (^)()> * _Nonnull)buttonHandlers {
  UIAlertController *alertController =
      [UIAlertController alertControllerWithTitle:title
                                          message:message
                                   preferredStyle:(UIAlertControllerStyle)UIAlertControllerStyleAlert];

  [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                      style:(UIAlertActionStyle)UIAlertActionStyleCancel
                                                    handler:^(UIAlertAction *action) {
#pragma unused(action)
                                                      void (^handler)(void) = buttonHandlers[@"Cancel"];

                                                      if (handler != nil) {
                                                        handler();
                                                      }
                                                    }]];
  [alertController addAction:[UIAlertAction actionWithTitle:@"Retry"
                                                      style:(UIAlertActionStyle)UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction *action) {
#pragma unused(action)
                                                      void (^handler)(void) = buttonHandlers[@"Retry"];

                                                      if (handler != nil) {
                                                        handler();
                                                      }
                                                    }]];

  if (_controller) {
    [_controller presentViewController:alertController
                              animated:YES
                            completion:^{
                            }];
  }
}

- (BOOL)presentPlatformSpecificAuth:(NSURL * _Nonnull)authURL {
  [self presentExternalApp:authURL];
  return YES;
}

- (void)presentAuthChannel:(NSURL * _Nonnull)authURL cancelHandler:(DBOAuthCancelBlock)cancelHandler {
  if (_controller) {
    if ([DBMobileSafariViewController class]) {
      DBMobileSafariViewController *safariViewController =
          [[DBMobileSafariViewController alloc] initWithUrl:authURL cancelHandler:cancelHandler];
      [_controller presentViewController:safariViewController animated:YES completion:nil];
    } else {
      [self presentExternalApp:authURL];
    }
  }
}

- (void)presentExternalApp:(NSURL * _Nonnull)url {
  _openURL(url);
}

- (BOOL)canPresentExternalApp:(NSURL * _Nonnull)url {
  return [_sharedApplication canOpenURL:url];
}

- (void)dismissAuthController {
  if (_controller) {
    [_controller dismissViewControllerAnimated:YES completion:nil];
  }
}

@end

#pragma mark - Web view controller

@implementation DBMobileSafariViewController {
  DBOAuthCancelBlock _cancelHandler;
}

- (instancetype)initWithUrl:(NSURL *)url cancelHandler:(DBOAuthCancelBlock)cancelHandler {
  if (self = [super initWithURL:url]) {
    _cancelHandler = cancelHandler;
    self.delegate = self;
  }
  return self;
}

- (void)dealloc {
  self.delegate = nil;
}

- (void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
  if (!didLoadSuccessfully) {
    [controller dismissViewControllerAnimated:true completion:nil];
  }
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
#pragma unused(controller)
  _cancelHandler();
}

@end

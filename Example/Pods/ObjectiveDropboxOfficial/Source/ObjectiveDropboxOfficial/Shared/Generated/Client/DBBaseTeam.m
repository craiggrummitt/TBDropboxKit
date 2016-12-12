///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBBaseTeam.h"
#import "DBTEAMRoutes.h"
#import "DBTransportClientProtocol.h"

@implementation DBBaseTeam

- (instancetype)initWithTransportClient:(id<DBTransportClient> _Nonnull)client {
  self = [super init];
  if (self) {
    _teamRoutes = [[DBTEAMRoutes alloc] init:client];
  }
  return self;
}
@end

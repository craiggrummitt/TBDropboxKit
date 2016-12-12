///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"
#import "DBTEAMMembersListContinueArg.h"

#pragma mark - API Object

@implementation DBTEAMMembersListContinueArg

#pragma mark - Constructors

- (instancetype)initWithCursor:(NSString *)cursor {

  self = [super init];
  if (self) {
    _cursor = cursor;
  }
  return self;
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBTEAMMembersListContinueArgSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBTEAMMembersListContinueArgSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBTEAMMembersListContinueArgSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBTEAMMembersListContinueArgSerializer

+ (NSDictionary *)serialize:(DBTEAMMembersListContinueArg *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"cursor"] = valueObj.cursor;

  return jsonDict;
}

+ (DBTEAMMembersListContinueArg *)deserialize:(NSDictionary *)valueDict {
  NSString *cursor = valueDict[@"cursor"];

  return [[DBTEAMMembersListContinueArg alloc] initWithCursor:cursor];
}

@end

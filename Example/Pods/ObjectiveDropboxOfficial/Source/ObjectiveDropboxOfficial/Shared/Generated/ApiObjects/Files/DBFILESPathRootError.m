///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBFILESPathRootError.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBFILESPathRootError

#pragma mark - Constructors

- (instancetype)initWithPathRoot:(NSString *)pathRoot {

  self = [super init];
  if (self) {
    _pathRoot = pathRoot;
  }
  return self;
}

- (instancetype)init {
  return [self initWithPathRoot:nil];
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBFILESPathRootErrorSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBFILESPathRootErrorSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBFILESPathRootErrorSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBFILESPathRootErrorSerializer

+ (NSDictionary *)serialize:(DBFILESPathRootError *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  if (valueObj.pathRoot) {
    jsonDict[@"path_root"] = valueObj.pathRoot;
  }

  return jsonDict;
}

+ (DBFILESPathRootError *)deserialize:(NSDictionary *)valueDict {
  NSString *pathRoot = valueDict[@"path_root"] ?: nil;

  return [[DBFILESPathRootError alloc] initWithPathRoot:pathRoot];
}

@end

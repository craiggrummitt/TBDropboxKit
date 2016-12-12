///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import <Foundation/Foundation.h>

#import "DBSerializableProtocol.h"

@class DBSHARINGSharedFolderAccessError;
@class DBSHARINGUnshareFolderError;

#pragma mark - API Object

///
/// The `UnshareFolderError` union.
///
/// This class implements the `DBSerializable` protocol (serialize and
/// deserialize instance methods), which is required for all Obj-C SDK API route
/// objects.
///
@interface DBSHARINGUnshareFolderError : NSObject <DBSerializable>

#pragma mark - Instance fields

/// The `DBSHARINGUnshareFolderErrorTag` enum type represents the possible tag
/// states with which the `DBSHARINGUnshareFolderError` union can exist.
typedef NS_ENUM(NSInteger, DBSHARINGUnshareFolderErrorTag) {
  /// (no description).
  DBSHARINGUnshareFolderErrorAccessError,

  /// This action cannot be performed on a team shared folder.
  DBSHARINGUnshareFolderErrorTeamFolder,

  /// The current user does not have permission to perform this action.
  DBSHARINGUnshareFolderErrorNoPermission,

  /// This shared folder has too many files to be unshared.
  DBSHARINGUnshareFolderErrorTooManyFiles,

  /// (no description).
  DBSHARINGUnshareFolderErrorOther,

};

/// Represents the union's current tag state.
@property (nonatomic, readonly) DBSHARINGUnshareFolderErrorTag tag;

/// (no description). @note Ensure the `isAccessError` method returns true
/// before accessing, otherwise a runtime exception will be raised.
@property (nonatomic, readonly) DBSHARINGSharedFolderAccessError * _Nonnull accessError;

#pragma mark - Constructors

///
/// Initializes union class with tag state of "access_error".
///
/// @param accessError (no description).
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithAccessError:(DBSHARINGSharedFolderAccessError * _Nonnull)accessError;

///
/// Initializes union class with tag state of "team_folder".
///
/// Description of the "team_folder" tag state: This action cannot be performed
/// on a team shared folder.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithTeamFolder;

///
/// Initializes union class with tag state of "no_permission".
///
/// Description of the "no_permission" tag state: The current user does not have
/// permission to perform this action.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithNoPermission;

///
/// Initializes union class with tag state of "too_many_files".
///
/// Description of the "too_many_files" tag state: This shared folder has too
/// many files to be unshared.
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithTooManyFiles;

///
/// Initializes union class with tag state of "other".
///
/// @return An initialized instance.
///
- (nonnull instancetype)initWithOther;

#pragma mark - Tag state methods

///
/// Retrieves whether the union's current tag state has value "access_error".
///
/// @note Call this method and ensure it returns true before accessing the
/// `accessError` property, otherwise a runtime exception will be thrown.
///
/// @return Whether the union's current tag state has value "access_error".
///
- (BOOL)isAccessError;

///
/// Retrieves whether the union's current tag state has value "team_folder".
///
/// @return Whether the union's current tag state has value "team_folder".
///
- (BOOL)isTeamFolder;

///
/// Retrieves whether the union's current tag state has value "no_permission".
///
/// @return Whether the union's current tag state has value "no_permission".
///
- (BOOL)isNoPermission;

///
/// Retrieves whether the union's current tag state has value "too_many_files".
///
/// @return Whether the union's current tag state has value "too_many_files".
///
- (BOOL)isTooManyFiles;

///
/// Retrieves whether the union's current tag state has value "other".
///
/// @return Whether the union's current tag state has value "other".
///
- (BOOL)isOther;

///
/// Retrieves string value of union's current tag state.
///
/// @return A human-readable string representing the union's current tag state.
///
- (NSString * _Nonnull)tagName;

@end

#pragma mark - Serializer Object

///
/// The serialization class for the `DBSHARINGUnshareFolderError` union.
///
@interface DBSHARINGUnshareFolderErrorSerializer : NSObject

///
/// Serializes `DBSHARINGUnshareFolderError` instances.
///
/// @param instance An instance of the `DBSHARINGUnshareFolderError` API object.
///
/// @return A json-compatible dictionary representation of the
/// `DBSHARINGUnshareFolderError` API object.
///
+ (NSDictionary * _Nonnull)serialize:(DBSHARINGUnshareFolderError * _Nonnull)instance;

///
/// Deserializes `DBSHARINGUnshareFolderError` instances.
///
/// @param dict A json-compatible dictionary representation of the
/// `DBSHARINGUnshareFolderError` API object.
///
/// @return An instantiation of the `DBSHARINGUnshareFolderError` object.
///
+ (DBSHARINGUnshareFolderError * _Nonnull)deserialize:(NSDictionary * _Nonnull)dict;

@end

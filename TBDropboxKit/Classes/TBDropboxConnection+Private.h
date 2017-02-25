//
//  TBDropboxConnection+Private.h
//  Pods
//
//  Created by Bucha Kanstantsin on 2/7/17.
//
//

#ifndef TBDropboxConnection_Private_h
#define TBDropboxConnection_Private_h

@interface TBDropboxConnection ()

@property (weak, nonatomic, nullable) id<TBDropboxConnectionDelegate> delegate;

+ (instancetype _Nullable)connectionDesired:(BOOL)desired
                                usingAppKey:(NSString * _Nonnull)key
                                   delegate:(id<TBDropboxConnectionDelegate> _Nonnull)delegate;

@end

#endif /* TBDropboxConnection_Private_h */
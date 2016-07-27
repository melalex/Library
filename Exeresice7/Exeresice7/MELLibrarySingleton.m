//
//  MELLibrarySingleton.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/22/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrarySingleton.h"
#import "MELLibrary+MELCoding.h"

static NSString *const kMELLibrary = @"MELLibrary";

@interface MELLibrarySingleton()
{
    MELLibrary *_library;
}

@end


@implementation MELLibrarySingleton

static MELLibrarySingleton *sharedSingleton_ = nil;

+ (MELLibrarySingleton *)sharedInstance
{
    if (sharedSingleton_ == nil)
    {
        sharedSingleton_ = [[super allocWithZone:NULL] init];
    }
    return sharedSingleton_;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self sharedInstance] retain];
}

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (oneway void)release
{
    
}

- (id)autorelease
{
    return self;
}

- (MELLibrary *)library
{
    if (_library == nil)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *libraryData = [defaults dataForKey:kMELLibrary];
        
        if (libraryData)
        {
            _library = [[NSKeyedUnarchiver unarchiveObjectWithData:libraryData] retain];
        }
        else
        {
            _library = [MELLibrary new];
        }

    }
    return _library;
}

- (void)saveData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:_library] forKey:kMELLibrary];
    [defaults synchronize];
}

@end

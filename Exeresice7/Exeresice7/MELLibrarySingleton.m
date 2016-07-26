//
//  MELLibrarySingleton.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/22/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrarySingleton.h"
#import "MELLibrary+MELSerialization.h"

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
        _library = [[MELLibrary alloc] initWithFilePath:@"/Users/melalex/Desktop/Projects/MyBook Exercise 4/library1.json"];
    }
    return _library;
}

@end

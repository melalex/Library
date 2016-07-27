//
//  MyBook.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBook.h"
#import "MELVisitor.h"
#import "MELLibrary.h"
#import "Constants.h"

@implementation MELBook
 

+ (instancetype)bookWithName:(NSString *)name author:(NSString *)author type:(MELBookType)type
{
    return [[[MELBook alloc]initWithName:name author:author type:type] autorelease];

}

+ (instancetype)bookWithName:(NSString *)name author:(NSString *)author type:(MELBookType)type identifier:(NSString *)identifier
{
    return [[[MELBook alloc] initWithName:name author:author type:type identifier:identifier] autorelease];

}

- (instancetype)initWithName:(NSString *)name author:(NSString *)author type:(MELBookType)type
{
    return [self initWithName:name author:author type:type identifier:[NSUUID UUID].UUIDString];
}


- (instancetype)initWithName:(NSString *)name author:(NSString *)author type:(MELBookType)type identifier:(NSString *)identifier
{
    if (self = [self init])
    {
        _name = [name copy];
        _author = [author copy];
        _type = type;
        
        _identifier = [identifier copy];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%@ dealloced", [self description]);
    
    [_name release];
    [_identifier release];
    
    [super dealloc];
}

- (BOOL)isEqual:(MELBook *)other
{
    BOOL result = NO;
    
    if ([self.identifier isEqual:other.identifier])
    {
        result = YES;
    }
    
//    if([self.name isEqual:other.name]
//       && [self.owner isEqual:other.owner]
//       && self.year == other.year
//       && self.type == other.type)
//    {
//        result = YES;
//    }
    
    return result;
}

- (NSUInteger)hash
{
    return _name.hash + _type + _owner.hash;
}

//Setters

- (void)setName:(NSString*)name
{
    if (name != _name)
    {
        [_name release];
        _name = [name copy];
        [[NSNotificationCenter defaultCenter] postNotificationName:kMELBookDidChangeTitleNotification object:nil];
    }
}

- (void)setBookType:(MELBookType)type
{
    _type = type;
    [[NSNotificationCenter defaultCenter] postNotificationName:kMELVisitorDidReturnBookNotification object:nil];
} 

- (void)setAuthor:(NSString *)author
{
    if (author != _author)
    {
        [_author release];
        _author = [author copy];
        [[NSNotificationCenter defaultCenter] postNotificationName:kMELBookDidAuthrNotification object:nil];
    }

}

- (void)setOwner:(MELVisitor *)owner
{
    _owner = owner;
}

//Getters

- (NSString *)name
{
    return _name;
}

- (MELBookType)type
{
    return _type;
} 

- (NSString *)identifier
{
    if(!_identifier)
    {
        _identifier = [NSUUID UUID].UUIDString;
    }
    return _identifier;
}

- (NSString *)author
{
    return _author;
}

- (MELVisitor *)owner
{
    return _owner;
}

- (NSString *)getBookTypeAsNSString;
{
    NSString *type = nil;
    switch (_type)
    {
        case kMELBookTypePaperback:
            type = @"Paperback";
            break;
            
        case kMELBookTypeHadrcover:
            type = @"Hardcover";
            break;
            
        default:
            type = @"Unknown";
            break;
    }
    return type;
}

//


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@", [super description], self.name, self.author, [self getBookTypeAsNSString]];
}

@end
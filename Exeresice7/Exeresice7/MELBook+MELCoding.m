//
//  MELBook+MELCoding.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/27/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBook+MELCoding.h"
#import "MELVisitor+MELCoding.h"

@implementation MELBook (MELCoding)

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [self init])
    {
        _name = [[aDecoder decodeObjectForKey:@"name"] retain];
        _author = [[aDecoder decodeObjectForKey:@"author"] retain];
        _type = [aDecoder decodeIntegerForKey:@"type"];
        _identifier = [[aDecoder decodeObjectForKey:@"identifier"] retain];
        _owner = [[aDecoder decodeObjectForKey:@"owner"] retain];
    }
    
    return self;

}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.author forKey:@"author"];
    [aCoder encodeInteger:self.type forKey:@"type"];
    [aCoder encodeObject:self.identifier forKey:@"identifier"];
    [aCoder encodeObject:self.owner forKey:@"owner"];
}

@end

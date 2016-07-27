//
//  MELVisitor+MELCoding.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/27/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELVisitor+MELCoding.h"
#import "MELBook+MELCoding.h"


@implementation MELVisitor (MELCoding)

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [self init])
    {
        _name = [[aDecoder decodeObjectForKey:@"name"] retain];
        _lastName = [[aDecoder decodeObjectForKey:@"lastName"] retain];
        _yearOfBirth = [aDecoder decodeIntegerForKey:@"yearOfBirth"];
        _currentBooks = [[aDecoder decodeObjectForKey:@"currentBooks"]retain];
    }
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeInteger:self.yearOfBirth forKey:@"yearOfBirth"];
    [aCoder encodeObject:self.currentBooks forKey:@"currentBooks"];
}


@end

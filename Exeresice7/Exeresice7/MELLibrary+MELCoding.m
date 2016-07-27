//
//  MELLibrary+MELCoding.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/27/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrary+MELCoding.h"
#import "MELBook+MELCoding.h"
#import "MELVisitor+MELCoding.h"


@implementation MELLibrary (MELCoding)

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [self init])
    {
        _visitors = [[aDecoder decodeObjectForKey:@"visitors"] retain];
        _books = [[aDecoder decodeObjectForKey:@"books"] retain];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.visitors forKey:@"visitors"];
    [aCoder encodeObject:self.books forKey:@"books"];
}

@end

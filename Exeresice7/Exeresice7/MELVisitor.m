//
//  MELVisitor.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/6/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MELLibrary.h"
#import "MELVisitor.h"
#import "MELBook.h"
#import "NSArray+MELEquality.h"
#import "Constants.h"

@interface MELVisitor()

@property (readonly) NSMutableArray *mCurrentBooks;

@end

@implementation MELVisitor

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth
{
    return [[[MELVisitor alloc]initWithName:name lastName:lastName yearOfBirth:yearOfBirth] autorelease];
}

- (instancetype)init
{
    if(self = [super init])
    {
        _currentBooks = [NSMutableArray new];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth
{
    if(self = [self init])
    {
        _name = [name copy];
        _lastName = [lastName copy];
        _yearOfBirth = yearOfBirth;
    }
    return self;

}


- (void)dealloc
{
    NSLog(@"%@ dealloced", [self description]);
    
    for (MELBook *book in _currentBooks)
    {
        [self returnBook:book];
    }
    
    [_name release];
    [_lastName release];
    
    [_currentBooks release];
    
    [super dealloc];
}


- (BOOL)isEqual:(MELVisitor *)other
{
    BOOL result = NO;
    
    if([self.name isEqual:other.name]
       && [self.lastName isEqual:other.lastName]
       && [self.currentBooks isSame:other.currentBooks]
       && self.yearOfBirth == other.yearOfBirth)
    {
        result = YES;
    }
    
    return result;
}

- (NSUInteger)hash
{
    return self.name.hash + self.lastName.hash + self.yearOfBirth + self.currentBooks.count;
}

//Setters

- (void)setName:(NSString *)name
{
    if(name != _name)
    {
        [_name release];
        _name = [name copy];
        [[NSNotificationCenter defaultCenter] postNotificationName:kMELVisitorDidChangeNameNotification object:nil];
    }
}

- (void)setLastName:(NSString *)lastName
{
    if(lastName != _lastName)
    {
        [_lastName release];
        _lastName = [lastName copy];
        [[NSNotificationCenter defaultCenter] postNotificationName:kMELVisitorDidChangeSurnameNotification object:nil];
    }
}

- (void)setYearOfBirth:(NSInteger)yearOfBirth
{
    _yearOfBirth = yearOfBirth;
    [[NSNotificationCenter defaultCenter] postNotificationName:kMELVisitorDidChangeYearOfBirthNotification object:nil];
}

//Getters

- (NSString *)name
{
    return _name;
}

- (NSString *)lastName
{
    return _lastName;
}

- (NSInteger)yearOfBirth
{
    return  _yearOfBirth;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.name, self.lastName];
}

- (NSMutableArray *)mCurrentBooks
{
    return _currentBooks;
}

- (NSArray *)currentBooks
{
    return _currentBooks;
}

//"Book" methods

- (BOOL)takeBook:(MELBook *)aBook
{
    if(!aBook.owner)
    {
        [self.mCurrentBooks addObject:aBook];
        aBook.owner = self;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kMELVisitorDidTakeBookNotification object:nil];
        
        return YES;
    }
    return NO;
}

- (BOOL)returnBook:(MELBook *)aBook
{
    if([self.mCurrentBooks containsObject:aBook])
    {
        aBook.owner = nil;
        [self.mCurrentBooks removeObject:aBook];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kMELVisitorDidReturnBookNotification object:nil];
        
        return YES;
    }
    return NO;
}

//description

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", [super description], self.fullName];
}

@end
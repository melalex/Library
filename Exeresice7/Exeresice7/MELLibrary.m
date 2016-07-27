//
//  MELLibrary.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELLibrary.h"
#import "MELVisitor.h"
#import "MELBook.h"
#import "NSArray+MELEquality.h"
#import "Constants.h"

@interface MELLibrary()

@property (readonly) NSMutableArray *mBooks;
@property (readonly) NSMutableArray *mVisitors;

@end


@implementation MELLibrary

- (instancetype)init
{
    if (self = [super init])
    {
        _visitors = NSMutableArray.new;
        _books = NSMutableArray.new;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELBookDidChangeTypeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELBookDidChangeTitleNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELBookDidAuthrNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELVisitorDidChangeNameNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELVisitorDidChangeSurnameNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELVisitorDidChangeYearOfBirthNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELVisitorDidTakeBookNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(libraryDidChange)
                                                     name:kMELVisitorDidReturnBookNotification
                                                   object:nil];
    }
    return self;
}


- (void)dealloc
{
    [_visitors release];
    [_books release];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super dealloc];
}


- (BOOL)isEqual:(MELLibrary *)other
{
    BOOL result = NO;
    
    if([self.books isSame:other.books] && [self.visitors isSame:other.visitors])
        result = YES;
    
    return result;
}

- (NSUInteger)hash
{
    return self.visitors.hash + self.books.hash;
}

- (BOOL)containsIdentifier:(NSString *)identifier
{
    BOOL result = NO;
    
    for(MELBook *book in self.books)
    {
        if([book.identifier isEqual:identifier])
        {
            result = YES;
            break;
        }
    }
    
    return result;
}

- (BOOL)containsIdentityVisitor:(MELVisitor*)newVisitor
{
    BOOL result = NO;
    
    for(MELVisitor *visitor in self.visitors)
    {
        if(visitor == newVisitor)
        {
            result = YES;
            break;
        }
    }
    return result;
}



- (NSArray *)visitors
{
    return _visitors;
}

- (NSArray *)books
{
    return _books;
}

- (NSMutableArray *)mVisitors
{
    return _visitors;
}

- (NSMutableArray *)mBooks
{
    return _books;
}


- (void)addBook:(MELBook*)book
{
    if(![self containsIdentifier:book.identifier])
    {
        [self.mBooks addObject:book];
        [self libraryDidChange];
    }
}

- (void)removeBook:(MELBook*)book
{
    [book.owner returnBook:book];
    [self.mBooks removeObject:book];
    [self libraryDidChange];
}

- (void)addVisitor:(MELVisitor *)visitor
{
    if(![self containsIdentityVisitor:visitor])
    {
        [self.mVisitors addObject:visitor];
        [self libraryDidChange];
    }
}

- (void)removeVisitor:(MELVisitor *)visitor
{
    for (MELBook *book in visitor.currentBooks)
    {
        [visitor returnBook:book];
    }
    
    [self.mVisitors removeObject:visitor];
    [self libraryDidChange];
}

//Search

- (NSMutableArray *)findBook:(NSString *)name
{
    NSMutableArray *result = [NSMutableArray.new autorelease];
    for(MELBook *book in self.books)
    {
        if([book.name rangeOfString:name options:(NSCaseInsensitiveSearch)].length != 0)
        {
            [result addObject:book];
        }
    }
    return result;
}

- (NSMutableArray *)findVisitor:(NSString *)name
{
    NSMutableArray *result = [NSMutableArray.new autorelease];
    for(MELVisitor *visitor in self.visitors)
    {
        if([visitor.fullName rangeOfString:name options:(NSCaseInsensitiveSearch)].length != 0)
        {
            [result addObject:visitor];
        }
    }
    return result;
}

//Notification

- (void)libraryDidChange
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kMELLibraryDidChangeNotification object:nil];
}

@end


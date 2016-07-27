//
//  MELVisitor.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/6/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELBook;

@interface MELVisitor : NSObject
{
@private
    NSString *_name;
    NSString *_lastName;
    NSInteger _yearOfBirth;
    
    NSMutableArray *_currentBooks;
}

@property (copy) NSString *name;
@property (copy) NSString *lastName;
@property NSInteger yearOfBirth;
@property (readonly) NSString *fullName;
@property (readonly) NSArray *currentBooks;

+ (instancetype)createMELVisitorWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;

- (instancetype)initWithName:(NSString *)name lastName:(NSString *)lastName yearOfBirth:(NSInteger)yearOfBirth;

- (BOOL)takeBook:(MELBook *)aBook;
- (BOOL)returnBook:(MELBook *)aBook;

@end

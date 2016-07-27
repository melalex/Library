//
//  MELLibrary.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/7/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELBook;
@class MELVisitor;

@interface MELLibrary : NSObject
{
@private
    NSMutableArray *_visitors;
    NSMutableArray *_books;
}

@property (readonly) NSArray *visitors;
@property (readonly) NSArray *books;

- (BOOL)containsIdentifier:(NSString *)identifier;

- (void)addBook:(MELBook*)book;
- (void)removeBook:(MELBook*)book;

- (void)addVisitor:(MELVisitor*)visitor;
- (void)removeVisitor:(MELVisitor*)visitor;

- (NSArray *)findBook:(NSString *)name;
- (NSArray *)findVisitor:(NSString *)name;

@end

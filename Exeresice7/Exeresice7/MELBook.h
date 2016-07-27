//
//  MyBook.h
//  MyBook
//
//  Created by Александр Мелащенко on 7/5/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELVisitor;

typedef NS_ENUM (NSInteger, MELBookType)
{
    kMELBookTypeUnknown = 0,
    kMELBookTypePaperback = 1,
    kMELBookTypeHadrcover = 2
};


@interface MELBook : NSObject
{
@private
    NSString *_name;
    NSString *_author;
    MELBookType _type;
    
    MELVisitor *_owner;
    
    NSString *_identifier;
}


@property (readwrite, assign) MELVisitor *owner;
@property (readonly, copy) NSString *identifier;
@property (copy) NSString *author;

+ (instancetype)bookWithName:(NSString *)name author:(NSString *)author type:(MELBookType)type;
+ (instancetype)bookWithName:(NSString *)name author:(NSString *)year type:(MELBookType)type identifier:(NSString *)identifier;

- (instancetype)initWithName:(NSString *)name author:(NSString *)year type:(MELBookType)type;
- (instancetype)initWithName:(NSString *)name author:(NSString *)year type:(MELBookType)type identifier:(NSString *)identifier;

- (void)setName:(NSString*)name;
- (void)setBookType:(MELBookType)type;


- (NSString*)name;
- (MELBookType)type;
- (NSString *)getBookTypeAsNSString;


- (NSString*)description;

@end

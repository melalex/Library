//
//  MELLibrarySingleton.h
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/22/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MELLibrary;

@interface MELLibrarySingleton : NSObject

@property (assign, readonly) MELLibrary *library;

+ (MELLibrarySingleton *) sharedInstance;

- (void)saveData;

@end

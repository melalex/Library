//
//  AppDelegate.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/21/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "AppDelegate.h"
#import "MELLibrarySingleton.h"
#import "Constants.h"
#import "MELBook.h"
#import "MELVisitor.h"
#import "MELLibrary.h"
#import "MELBooksTableController.h"
#import "MELVisitorsTableController.h"

@interface AppDelegate () <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet MELBooksTableController *booksTable;
@property (assign) IBOutlet MELVisitorsTableController *visitorsTable;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (void)dealloc
{
    [super dealloc];
}

- (IBAction)addVisitor:(id)sender
{
    [MELLibrarySingleton.sharedInstance.library addVisitor:[MELVisitor createMELVisitorWithName:@"" lastName:@"" yearOfBirth:0]];
}

- (IBAction)deleteVisitor:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kAppDelegateDidPressDeleteVisitorNotification object:nil];
}

- (IBAction)addBook:(id)sender
{
    [MELLibrarySingleton.sharedInstance.library addBook:[MELBook bookWithName:@"" author:@"" type:kMELBookTypeUnknown]];
}

- (IBAction)deleteBook:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kAppDelegateDidPressDeleteBookNotification object:nil];
}

@end

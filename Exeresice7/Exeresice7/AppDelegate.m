//
//  AppDelegate.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/21/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "AppDelegate.h"
#import "MELLibrary+MELSerialization.h"
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

@end

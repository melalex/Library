//
//  MELVisitorsTableController.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/22/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELVisitorsTableController.h"
#import "Constants.h"
#import "MELLibrarySingleton.h"
#import "MELBook.h"
#import "MELVisitor.h"
#import "MELLibrary.h"
#import "MELVisitorWindowController.h"

#import <Cocoa/Cocoa.h>

@interface MELVisitorsTableController() <NSTableViewDataSource, NSTableViewDelegate>

@property (assign) IBOutlet NSTableView *visitorTableView;

@end

@implementation MELVisitorsTableController

- (void)awakeFromNib
{
    [_visitorTableView setTarget:self];
    [self.visitorTableView setDoubleAction:@selector(doubleClickHandler)];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return MELLibrarySingleton.sharedInstance.library.visitors.count;
}


- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *result = nil;
    
    
    if ([tableColumn.identifier isEqualToString:kVisitorNameIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kVisitorNameCellWithTextIdentifier owner:self];
        result.textField.stringValue = [[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:row] name];
    }
    else if ([tableColumn.identifier isEqualToString:kVisitorSurnameIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kVisitorSurnameCellWithTextIdentifier owner:self];
        result.textField.stringValue = [[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:row] lastName];
    }
    else if ([tableColumn.identifier isEqualToString:kVisitorYearIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kVisitorYearCellWithTextIdentifier owner:self];
        result.textField.stringValue = [NSString stringWithFormat:@"%lu",[[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:row] yearOfBirth]];
    }
    
    return result;
}

- (void)doubleClickHandler
{
    MELVisitorWindowController *controller = [[MELVisitorWindowController alloc]
                                              initWithWindowNibName:@"MELVisitorWindowController"
                                              visitor:[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:self.visitorTableView.clickedRow]];
    [controller showWindow:nil];
}


- (IBAction)nameFinishEditing:(id)sender
{
    [(MELVisitor *)[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:self.visitorTableView.selectedRow] setName:[(NSTextField *)sender stringValue]];
}

- (IBAction)surnameFinishEditing:(id)sender
{
    [(MELVisitor *)[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:self.visitorTableView.selectedRow] setLastName:[(NSTextField *)sender stringValue]];
}

- (IBAction)yearFinishEditing:(id)sender
{
    [(MELVisitor *)[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:self.visitorTableView.selectedRow] setYearOfBirth:[[(NSTextField *)sender stringValue] intValue]];
}

@end

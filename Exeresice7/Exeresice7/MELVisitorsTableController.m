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
{
@private
    MELVisitorWindowController *_visitorWindow;
}

@property (assign) IBOutlet NSTableView *visitorTableView;

@property (readonly) MELVisitorWindowController *visitorWindow;

@end

@implementation MELVisitorsTableController

- (void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(update)
                                                 name:kMELLibraryDidChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deleteVisitor)
                                                 name:kAppDelegateDidPressDeleteVisitorNotification
                                               object:nil];

    [_visitorTableView setTarget:self];
    [self.visitorTableView setDoubleAction:@selector(doubleClickHandler)];
}

- (void)dealloc
{
    [_visitorWindow release];
    
    [super dealloc];
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
    self.visitorWindow.visitor = [MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:self.visitorTableView.clickedRow];
    
    [self.visitorWindow showWindow:nil];
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

- (void)update
{
    [self.visitorTableView reloadData];
}

- (MELVisitorWindowController *)visitorWindow
{
    if (_visitorWindow == nil)
    {
        _visitorWindow = [[MELVisitorWindowController alloc]
                         initWithWindowNibName:@"MELVisitorWindowController"];
    }
    return _visitorWindow;
}

- (void)deleteVisitor
{
    NSInteger row = self.visitorTableView.selectedRow;
    if (row >= 0)
    {
        [MELLibrarySingleton.sharedInstance.library removeVisitor:(MELVisitor *)[MELLibrarySingleton.sharedInstance.library.visitors objectAtIndex:row]];

    }
}

@end

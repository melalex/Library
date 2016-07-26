//
//  MELBooksTableController.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/22/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBooksTableController.h"
#import "Constants.h"
#import "MELLibrary.h"
#import "MELBook.h"
#import "MELVisitor.h"
#import "MELLibrarySingleton.h"
#import "MELCellWithComboBox.h"

#import <Cocoa/Cocoa.h>

@interface MELBooksTableController() <NSTableViewDataSource, NSTableViewDelegate>

@property (assign) IBOutlet NSTableView *booksTableView;
@end

@implementation MELBooksTableController

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return MELLibrarySingleton.sharedInstance.library.books.count;
}

- (void)awakeFromNib
{
    [_booksTableView setTarget:self];
    [self.booksTableView setDoubleAction:@selector(doubleClickHandler)];
}


- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *result = nil; 
    
    if ([tableColumn.identifier isEqualToString:kBookTitleIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kBookTitleCellWithTextIdentifier owner:self];
        result.textField.stringValue = [[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] name];
    }
    else if ([tableColumn.identifier isEqualToString:kBookAuthorIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kBookAuthorCellWithTextIdentifier owner:self];
        result.textField.stringValue = [[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] name];
    }
    else if ([tableColumn.identifier isEqualToString:kBookTypeIdentifier])
    {
        MELCellWithComboBox *cellWithComboBox = [tableView makeViewWithIdentifier:kBookTypeCellWithComboBoxIdentifier owner:self];
        
        if ([(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] type] == kMELBookTypePaperback)
        {
            [cellWithComboBox.popUpButton selectItemAtIndex:0];
        }
        else if ([(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] type] == kMELBookTypeHadrcover)
        {
            [cellWithComboBox.popUpButton selectItemAtIndex:1];
        }
        
        result = cellWithComboBox;
    }
    else if ([tableColumn.identifier isEqualToString:kBookOwnerIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kBookOwnerCellWithTextIdentifier owner:self];
        result.textField.stringValue = [[[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] owner] fullName];
    }

    return result;
}

- (IBAction)titleFinishedEditing:(id)sender
{
    [(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:self.booksTableView.selectedRow] setName:[(NSTextField *)sender stringValue]];
}

- (IBAction)authorFinishEditing:(id)sender
{
//    [(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:self.booksTableView.selectedRow] setLastName:[(NSTextField *)sender stringValue]];
}

- (IBAction)typeFinishEditing:(id)sender
{
    
}

- (void)doubleClickHandler
{

}


@end

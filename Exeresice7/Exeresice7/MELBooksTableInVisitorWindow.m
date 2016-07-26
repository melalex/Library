//
//  MELBooksTableInVisitorWindow.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/25/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELBooksTableInVisitorWindow.h"
#import "MELVisitor.h"
#import "MELBook.h"
#import "MELLibrary.h"
#import "MELLibrarySingleton.h"
#import "Constants.h"
#import "MELCellWithButton.h"
#import "MELCellWithComboBox.h"

#import <Cocoa/Cocoa.h>

@interface MELBooksTableInVisitorWindow() <NSTableViewDataSource, NSTableViewDelegate>

@property (assign) IBOutlet NSScrollView *booksTable;

@end


@implementation MELBooksTableInVisitorWindow

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return MELLibrarySingleton.sharedInstance.library.books.count;
}


- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *result = nil;
    
    if ([tableColumn.identifier isEqualToString:kBookTitleIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kBookTitleFromVisitorWindowCellWithTextIdentifier owner:self];
        result.textField.stringValue = [[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] name];
    }
    else if ([tableColumn.identifier isEqualToString:kBookAuthorIdentifier])
    {
        result = [tableView makeViewWithIdentifier:kBookAuthorFromVisitorWindowCellWithTextIdentifier owner:self];
        result.textField.stringValue = [[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] name];
    }
    else if ([tableColumn.identifier isEqualToString:kBookTypeIdentifier])
    {
        MELCellWithComboBox *cellWithComboBox = [tableView makeViewWithIdentifier:kBookTypeFromVisitorWindowCellWithComboBoxIdentifier owner:self];
        
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
        MELCellWithButton *cellWithButton = [tableView makeViewWithIdentifier:kBookOwnerFromVisitorWindowCellWithButtonIdentifier owner:self];
        
        
        
        result = cellWithButton;

    }
    
    return result;
}


@end

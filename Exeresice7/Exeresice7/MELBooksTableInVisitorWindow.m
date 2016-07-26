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
#import "MELVisitorWindowController.h"

#import <Cocoa/Cocoa.h>

@interface MELBooksTableInVisitorWindow() <NSTableViewDataSource, NSTableViewDelegate>

@property (assign) IBOutlet NSTableView *booksTableView;


@end


@implementation MELBooksTableInVisitorWindow

- (void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(update)
                                                 name:kMELLibraryDidChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(update)
                                                 name:kMELVisitorWindowControllerDidChangeVisitorNotification
                                               object:nil];
}


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
        result.textField.stringValue = [[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] author];
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
        
        if ([(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] owner] == nil)
        {
            [cellWithButton.button setEnabled:YES];
            [cellWithButton.button  setTitle:@"Take"];
        }
        else if ([(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] owner]== [(MELVisitorWindowController *)[[self.booksTableView window] windowController] visitor])
        {
            [cellWithButton.button setEnabled:YES];
            [cellWithButton.button  setTitle:@"Return"];
        }
        else if ([(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:row] owner]!= nil)
        {
            [cellWithButton.button setEnabled:NO];
            [cellWithButton.button  setTitle:@"Return"];
        }
        
        result = cellWithButton;

    }
    
    return result;
}

- (IBAction)titleFinishedEditing:(id)sender
{
    [(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:self.booksTableView.selectedRow] setName:[(NSTextField *)sender stringValue]];
}

- (IBAction)authorFinishEditing:(id)sender
{
    [(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:self.booksTableView.selectedRow] setAuthor:[(NSTextField *)sender stringValue]];
}

- (IBAction)typeFinishEditing:(id)sender
{
    NSInteger selectedItemIndex = [(NSPopUpButton *)sender indexOfSelectedItem];
    
    if (selectedItemIndex == 0)
    {
        [(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:[self.booksTableView rowForView:sender]] setBookType:kMELBookTypePaperback];
    }
    else if (selectedItemIndex == 1)
    {
        [(MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:[self.booksTableView rowForView:sender]] setBookType:kMELBookTypeHadrcover];
    }
}

- (IBAction)ownerFinishEditing:(id)sender
{
    MELBook *book = (MELBook *)[MELLibrarySingleton.sharedInstance.library.books objectAtIndex:[self.booksTableView rowForView:sender]];
    
    if ([[(NSButton *)sender title] isEqualToString:@"Return"])
    {
        [book.owner returnBook:book];
    }
    else if ([[(NSButton *)sender title] isEqualToString:@"Take"])
    {
        [[(MELVisitorWindowController *)[[self.booksTableView window] windowController] visitor] takeBook:book];
    }
}

- (void)update
{
    [self.booksTableView reloadData];
}

@end

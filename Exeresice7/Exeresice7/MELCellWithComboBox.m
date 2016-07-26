//
//  MELCellWithComboBox.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/22/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELCellWithComboBox.h"

@interface MELCellWithComboBox()
{
@private
    NSPopUpButton *_popUpButton;
}


@end

@implementation MELCellWithComboBox

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
}

- (void)awakeFromNib
{
    NSArray *listOfProfiles = [[NSArray alloc] initWithObjects:@"Paperback", @"Hardcover", nil];
    
    [self.popUpButton removeAllItems];
    [self.popUpButton addItemsWithTitles:listOfProfiles];
}

- (void)setPopUpButton:(NSPopUpButton *)popUpButton
{
    _popUpButton = popUpButton;
}

- (NSPopUpButton *)popUpButton
{
    return _popUpButton;
}

@end

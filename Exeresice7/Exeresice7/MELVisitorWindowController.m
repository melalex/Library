//
//  MELVisitorWindowController.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/25/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELVisitorWindowController.h"
#import "MELVisitor.h"
#import "Constants.h"

@interface MELVisitorWindowController ()
{
@private
    NSTextField *_nameTextField;
    MELVisitor *_visitor;
}

@property (assign) IBOutlet NSTextField *nameTextField;
@property (assign) IBOutlet NSTextField *surnameTextField;
@property (assign) IBOutlet NSTextField *yearTextField;


@end

@implementation MELVisitorWindowController

- (void)windowDidLoad
{
    _nameTextField.stringValue = _visitor.name;
    _surnameTextField.stringValue = _visitor.lastName;
    _yearTextField.stringValue = [@(_visitor.yearOfBirth) description];
    
    [super windowDidLoad];
}

- (void)dealloc
{
    [_visitor release];
    
    [super dealloc];
}

- (NSTextField *)nameTextField
{
    return _nameTextField;
}

- (void)setNameTextField:(NSTextField *)nameTextField
{
    _nameTextField = nameTextField;
}

- (IBAction)nameFinishEditing:(id)sender
{
    self.visitor.name = self.nameTextField.stringValue;
}

- (IBAction)surnameFinishEditing:(id)sender
{
    self.visitor.lastName = self.surnameTextField.stringValue;
}

- (IBAction)yearFinishEditing:(id)sender
{
    self.visitor.yearOfBirth = [self.nameTextField.stringValue integerValue];
}

- (void)setVisitor:(MELVisitor *)visitor
{
    if (_visitor != visitor)
    {
        [_visitor release];
        _visitor = visitor;
        [_visitor retain];
        
        _nameTextField.stringValue = _visitor.name;
        _surnameTextField.stringValue = _visitor.lastName;
        _yearTextField.stringValue = [@(_visitor.yearOfBirth) description];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kMELVisitorWindowControllerDidChangeVisitorNotification object:nil];
    }
}

- (MELVisitor *)visitor
{
    return _visitor;
}

@end

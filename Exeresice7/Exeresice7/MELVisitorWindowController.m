//
//  MELVisitorWindowController.m
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/25/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "MELVisitorWindowController.h"
#import "MELVisitor.h"

@interface MELVisitorWindowController ()
{
@private
    NSTextField *_nameTextField;
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

- (instancetype)initWithWindowNibName:(NSString *)windowNibName visitor:(MELVisitor *)visitor
{
    if (self = [super initWithWindowNibName:windowNibName])
    {
        [visitor retain];
        _visitor = visitor;
        
    }
    return self;
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
    
}

- (IBAction)surnameFinishEditing:(id)sender
{
}


@end

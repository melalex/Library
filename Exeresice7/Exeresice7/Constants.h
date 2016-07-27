//
//  Constants.h
//  Exeresice7
//
//  Created by Александр Мелащенко on 7/22/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

static NSString *const kVisitorNameCellWithTextIdentifier = @"VisitorNameText";
static NSString *const kVisitorSurnameCellWithTextIdentifier = @"VisitorSurnameText";
static NSString *const kVisitorYearCellWithTextIdentifier = @"VisitorYearText";

static NSString *const kBookTitleCellWithTextIdentifier = @"BookTitleText";
static NSString *const kBookAuthorCellWithTextIdentifier = @"BookAuthorText";
static NSString *const kBookTypeCellWithComboBoxIdentifier = @"BookTypeComboBox";
static NSString *const kBookOwnerCellWithTextIdentifier = @"BookOwnerText";

static NSString *const kBookTitleFromVisitorWindowCellWithTextIdentifier = @"BookTitleTextFromVisitorWindow";
static NSString *const kBookAuthorFromVisitorWindowCellWithTextIdentifier = @"BookAuthorTextFromVisitorWindow";
static NSString *const kBookTypeFromVisitorWindowCellWithComboBoxIdentifier = @"BookTypeComboBoxFromVisitorWindow";
static NSString *const kBookOwnerFromVisitorWindowCellWithButtonIdentifier = @"BookOwnerButtonFromVisitorWindow";

static NSString *const kVisitorNameIdentifier = @"VisitorName";
static NSString *const kVisitorSurnameIdentifier = @"VisitorSurname";
static NSString *const kVisitorYearIdentifier = @"VisitorYear";

static NSString *const kBookTitleIdentifier = @"BookTitle";
static NSString *const kBookAuthorIdentifier = @"BookAuthor";
static NSString *const kBookTypeIdentifier = @"BookType";
static NSString *const kBookOwnerIdentifier = @"BookOwner";

static NSString *const kMELBookDidChangeTypeNotification = @"MELBookDidChangeTypeNotification";
static NSString *const kMELBookDidChangeTitleNotification = @"MELBookDidChangeTitleNotification";
static NSString *const kMELBookDidAuthrNotification = @"MELBookDidAuthrNotification";


static NSString *const kMELVisitorDidChangeNameNotification = @"MELVisitorDidChangeNameNotification";
static NSString *const kMELVisitorDidChangeSurnameNotification = @"MELVisitorDidChangeSurnameNotification";
static NSString *const kMELVisitorDidChangeYearOfBirthNotification = @"MELVisitorDidChangeYearOfBirthNotification";
static NSString *const kMELVisitorDidTakeBookNotification = @"MELVisitorDidTakeBookNotification";
static NSString *const kMELVisitorDidReturnBookNotification = @"MELVisitorDidReturnBookNotification";

static NSString *const kMELLibraryDidChangeNotification = @"MELLibraryDidChangeNotification";

static NSString *const kMELVisitorWindowControllerDidChangeVisitorNotification = @"MELVisitorWindowControllerDidChangeVisitorNotification";

static NSString *const kAppDelegateDidPressDeleteVisitorNotification = @"AppDelegateDidPressDeleteVisitorNotification";
static NSString *const kAppDelegateDidPressDeleteBookNotification = @"AppDelegateDidPressDeleteBookNotification";

#endif /* Constants_h */

//
//  OCBaseViewController+getContactInfor.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/28.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

/// iOS 9前的框架
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
/// iOS 9的新框架
#import <ContactsUI/ContactsUI.h>

#define Is_up_Ios_9      ([[UIDevice currentDevice].systemVersion floatValue]) >= 9.0

@interface BaseViewController (getContactInfor)<ABPeoplePickerNavigationControllerDelegate,CNContactPickerDelegate>

//通讯录获取联系人信息
- (void)CheckAddressBookAuthorizationandGetPeopleInfor:(void (^)(NSDictionary *data))handler;

@end

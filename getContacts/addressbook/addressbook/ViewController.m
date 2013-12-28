//
//  ViewController.m
//  addressbook
//
//  Created by Thiruvengadam Krishnasamy on 28/12/13.
//  Copyright (c) 2013 TWILIGHT SOFTWARES. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ABAddressBookRef addressBook = ABAddressBookCreate();
    CFArrayRef addressBookData = ABAddressBookCopyArrayOfAllPeople(addressBook);
    
    CFIndex count = CFArrayGetCount(addressBookData);
    
    NSMutableArray *contactsArray = [NSMutableArray new];
    
    for (CFIndex idx = 0; idx < count; idx++) {
        ABRecordRef person = CFArrayGetValueAtIndex(addressBookData, idx);
        
        NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        
        if (firstName) {
            NSDictionary *dict = [NSDictionary dictionaryWithObject:firstName ForKey:@"name"];
            [contactsArray addObject:dict];
        }
        
    }
    CFRelease(addressBook);
    CFRelease(addressBookData);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

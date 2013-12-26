//
//  ViewController.m
//  twilightFW
//
//  Created by Thiruvengadam Krishnasamy on 24/12/13.
//  Copyright (c) 2013 TWILIGHT SOFTWARES. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    genClass *common;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [genClass getCommon];
    [genClass makeTost:self.view withMessage:@"Sample Toast MSG"] ;
    [genClass print];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

-(BOOL)isValidURL
{
    BOOL isValidURL = NO;
    NSURL *candidateURL = [NSURL URLWithString:self];
    if (candidateURL && candidateURL.scheme && candidateURL.host)
        isValidURL = YES;
    return isValidURL;
}

@end

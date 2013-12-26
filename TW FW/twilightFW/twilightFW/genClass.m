//
//  genClass.m
//  twilightFW
//
//  Created by Thiruvengadam Krishnasamy on 24/12/13.
//  Copyright (c) 2013 TWILIGHT SOFTWARES. All rights reserved.
//

#import "genClass.h"
#import "defs.h"

@implementation genClass

NSCharacterSet *nonNumberSet;

+(genClass *)getCommon {
    static genClass *__instance = nil;
    if (__instance == nil) {
        __instance = [[genClass alloc] init];
        nonNumberSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    }
    
    return __instance;
}
#pragma mark - TextFields
+(void)setTextFieldIndentation:(id) textFields indentSize:(int) size type:(int) type
{
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    switch (type) {
        case 0:
        {
            [textFields setLeftViewMode:UITextFieldViewModeAlways];
            [textFields setLeftView:spacerView];	// Do any additional setup after loading the view.
        }
            break;
        case 1:
        {
            [textFields setRightViewMode:UITextFieldViewModeAlways];
            [textFields setRightView:spacerView];	// Do any additional setup after loading the view.
        }
            break;
        case 2:
        {
            [textFields setLeftViewMode:UITextFieldViewModeAlways];
            [textFields setLeftView:spacerView];	// Do any additional setup after loading the view.
            [textFields setRightViewMode:UITextFieldViewModeAlways];
            [textFields setRightView:spacerView];	// Do any additional setup after loading the view.
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - Plists
+(NSString*) getPlistPathfromfileManager:(NSString*) fileName fileType:(NSString*) filetype
{
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",fileName,filetype]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:fileName ofType:filetype];
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error];
    }
    
    return path;
}


#pragma mark - Keyboard & Toolbars
+(UIToolbar *)getKeyboardToolbar:(id)sender type:(int) type
{
    NSString *next = @"Next";
    NSString *previous = @"Previous";
    NSString *done = @"Done";
    NSString *cancel = @"Cancel";
    NSString *clear = @"Clear";
    UIToolbar* toolbarType;
    switch (type) {
        case 0:
        {
            toolbarType = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            toolbarType.barStyle = UIBarStyleBlackTranslucent;
            toolbarType.items = [NSArray arrayWithObjects:
                                  [[UIBarButtonItem alloc]initWithTitle:previous style:UIBarButtonItemStyleBordered target:sender action:@selector(previous)],
                                  [[UIBarButtonItem alloc]initWithTitle:next style:UIBarButtonItemStyleDone target:sender action:@selector(next)],
                                  [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                  [[UIBarButtonItem alloc]initWithTitle:done style:UIBarButtonItemStyleDone target:sender action:@selector(done)],
                                  nil];
            [toolbarType sizeToFit];
            
        }
            break;
        case 1:
        {
            toolbarType = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            toolbarType.barStyle = UIBarStyleBlackTranslucent;
            toolbarType.items = [NSArray arrayWithObjects:
                                 [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                 [[UIBarButtonItem alloc]initWithTitle:done style:UIBarButtonItemStyleDone target:sender action:@selector(done)],
                                 nil];
            [toolbarType sizeToFit];
        }
            break;
        case 2:
        {
            toolbarType = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            toolbarType.barStyle = UIBarStyleBlackTranslucent;
            toolbarType.items = [NSArray arrayWithObjects:
                                 [[UIBarButtonItem alloc]initWithTitle:cancel style:UIBarButtonItemStyleBordered target:sender action:@selector(cancel)],
                                 [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                 [[UIBarButtonItem alloc]initWithTitle:done style:UIBarButtonItemStyleDone target:sender action:@selector(done)],
                                 nil];
            [toolbarType sizeToFit];
        }
            break;
        case 3:
        {
            toolbarType = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            toolbarType.barStyle = UIBarStyleBlackTranslucent;
            toolbarType.items = [NSArray arrayWithObjects:
                                 [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                 [[UIBarButtonItem alloc]initWithTitle:clear style:UIBarButtonItemStyleDone target:sender action:@selector(clear)],
                                 nil];
            [toolbarType sizeToFit];
        }
            break;
        case 4:
        {
            toolbarType = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
            toolbarType.barStyle = UIBarStyleBlackTranslucent;
            toolbarType.items = [NSArray arrayWithObjects:
                                 [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                 [[UIBarButtonItem alloc]initWithTitle:next style:UIBarButtonItemStyleDone target:sender action:@selector(next)],
                                 nil];
            [toolbarType sizeToFit];
        }
            break;
            
        default:
            toolbarType = nil;
            break;
    }
    
    return toolbarType;
    
    
}

#pragma mark - Temps
+(void)makeTost:(id)sender withMessage:(NSString *)message{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(60,5, 200, 20)];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.text = message;
    [lbl setTextColor:[UIColor whiteColor]];
    [view setBackgroundColor:[UIColor blackColor]];
    [view addSubview:lbl];
    [sender addSubview:view];
    [view setHidden:YES];
    [view setAlpha:1.0];
    CGPoint location;
    location.x = 160;
    location.y = 120;
    view.center = location;
    location.x = 160;
    location.y = 320;
    //[sender bringSubviewToFront:view];
    [view setHidden:NO];
    [UIView animateWithDuration:2.0 animations:^{
        view.alpha = 0.0;
        view.center = location;
    }];
}

+(NSString*) formatPhoneNumber:(NSString*) simpleNumber deleteLastChar:(BOOL)deleteLastChar {
    if(simpleNumber.length==0) return @"";
    // use regex to remove non-digits(including spaces) so we are left with just the numbers
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\s-\\(\\)]" options:NSRegularExpressionCaseInsensitive error:&error];
    simpleNumber = [regex stringByReplacingMatchesInString:simpleNumber options:0 range:NSMakeRange(0, [simpleNumber length]) withTemplate:@""];
    
    // check if the number is to long
    if(simpleNumber.length>10) {
        // remove last extra chars.
        simpleNumber = [simpleNumber substringToIndex:10];
    }
    
    if(deleteLastChar) {
        // should we delete the last digit?
        simpleNumber = [simpleNumber substringToIndex:[simpleNumber length] - 1];
    }
    
    // 123 456 7890
    // format the number.. if it's less then 7 digits.. then use this regex.
    if(simpleNumber.length<7)
        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d+)"
                                                               withString:@"($1) $2"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [simpleNumber length])];
    
    else   // else do this one..
        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d{3})(\\d+)"
                                                               withString:@"($1) $2-$3"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [simpleNumber length])];
    return simpleNumber;
}

+(void) print
{
    NSLog(@"HI");
}


#pragma mark - Validations
+(BOOL)isEmail:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+(int) isPassword:(NSString*) txt rangeFrom:(int) x rangeTo:(int) y containNumbers:(BOOL) num containsLetters:(BOOL) letters
{
    if(txt.length<x || txt.length>y)
    {
        return 1;
    }else if (!(([txt rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].location != NSNotFound) && ([txt stringByTrimmingCharactersInSet:nonNumberSet].length > 0)))
    {
        return 2;
    }
    return 0;
}

+(BOOL) isComparePassword:(NSString*) pass1 passStr:(NSString*) pass2
{
    if(![pass1 isEqualToString:pass2])
    {
        return NO;
    }
    return YES;
}

+(BOOL) isRangeText:(NSString*) txt rangeFrom:(int) x rangeTo:(int) y
{
    if(txt.length<x || txt.length>y)
    {
        return NO;
    }
    return YES;
}

+(BOOL) isRangeNumber:(int) num rangeFrom:(int) x rangeTo:(int) y
{
    if((num <= x) || (num > y))
    {
        return NO;
    }
    return YES;
}

+(BOOL) isMaxLength:(int) num range:(int) x
{
    if(num < x)
    {
        return NO;
    }
    return YES;
}

+(BOOL) isContainsString:(NSString*) str
{
    if(![str rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].location != NSNotFound)
    {
        return NO;
    }
    
    return YES;
}

+(BOOL) isContainsNumber:(NSString*) num
{
    if(![num stringByTrimmingCharactersInSet:nonNumberSet].length > 0)
    {
        return NO;
    }
    
    return YES;
}

+(BOOL) isEmpty:(id) txt
{
    if([txt isEqualToString:@""])
    {
        return YES;
    }
    return NO;
}

+(BOOL) isUrl: (NSString *) candidate {
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

#pragma mark - UTILITES
+(int)GetIntFromString:(NSString *)string
{
    //NSLog(@"CLASS==> %@",[string class]);
    if([string isKindOfClass:[NSString class]])
    {
        if (validStr(string)) {
            return [string integerValue];
        }
    }
    else if([string isKindOfClass:[NSNumber class]])
    {
        NSNumber *number =(NSNumber *)string;
        return [number intValue];
    }
    
    return 0;
}
+(NSString *)GetStringFromString:(NSString *)string
{
    if([string isKindOfClass:[NSString class]])
    {
        if (validStr(string)) {
            return string;
        }
    }
    
    return @"";
}
+(float)GetFloatFromString:(NSString *)string
{
    if([string isKindOfClass:[NSString class]])
    {
        if (validStr(string)) {
            return [string floatValue];
        }
    }
    else if([string isKindOfClass:[NSNumber class]])
    {
        NSNumber *number =(NSNumber *)string;
        return [number floatValue];
    }
    return 0;
}


@end

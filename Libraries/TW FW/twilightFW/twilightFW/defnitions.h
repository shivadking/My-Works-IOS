//
//  defnitions.h
//  twilightFW
//
//  Created by Thiruvengadam Krishnasamy on 28/12/13.
//  Copyright (c) 2013 TWILIGHT SOFTWARES. All rights reserved.
//

#ifndef twilightFW_defnitions_h
#define twilightFW_defnitions_h


#pragma mark - Push & Pops

#define pushViewAnim(x) [self.navigationController pushViewController:x animated:YES];
#define pushView(x) [self.navigationController pushViewController:x animated:NO];
#define popViewAnim [self.navigationController popViewControllerAnimated:YES];
#define popView [self.navigationController popViewControllerAnimated:YES];

#pragma mark - Local Storages
//NSuser Defaults Process
#define allocUserDefault NSUserDefaults *dVal = [NSUserDefaults standardUserDefaults]
#define getUserDefault(key) [dVal objectForKey:key]
#define setUserDefault(values,key) [dVal setObject:values forKey:key]


#endif

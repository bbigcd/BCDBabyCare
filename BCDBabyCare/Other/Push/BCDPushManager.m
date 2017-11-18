//
//  BCDPushManager.m
//  BCDBabyCare
//
//  Created by chendi on 2017/11/18.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "BCDPushManager.h"

@implementation BCDPushManager


// 在didFinishLaunchingWithOptions方法中添加如下代码
+ (void)getPushSetting:(UIApplication *)application
{
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge
                                            | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
    [application registerUserNotificationSettings:settings];
}

@end

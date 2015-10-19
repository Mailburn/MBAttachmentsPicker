//
//  MBSheetAction.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBSheetAction.h"

@implementation MBSheetAction

+ (MBSheetAction *)actionWithTitle:(NSString *)title thumbnail:(UIImage *)thumbnail handler:(MBActionHandler)handler
{
    MBSheetAction *action = [[MBSheetAction alloc] init];
    action.title = title;
    action.thumbnail = thumbnail;
    action.handler = handler;
    return action;
}

@end

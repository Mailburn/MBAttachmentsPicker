//
//  MBSheetAction.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBSheetAction.h"

@implementation MBSheetAction

+ (MBSheetAction *)actionWithTitle:(NSString *)title thumbnail:(UIImage *)thumbnail style:(MBSheetActionStyle)style handler:(MBActionHandler)handler
{
    MBSheetAction *action = [[MBSheetAction alloc] init];
    action.title = title;
    action.thumbnail = thumbnail;
    action.handler = handler;
    action.style = style;
    return action;
}

@end

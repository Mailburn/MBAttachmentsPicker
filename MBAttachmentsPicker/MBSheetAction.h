//
//  MBSheetAction.h
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBSheetItem.h"

typedef void(^MBActionHandler)();

typedef NS_ENUM(NSInteger, MBSheetActionStyle)
{
    MBSheetActionStyleDefault = 0,
    MBSheetActionStyleCancel = 1,
    MBSheetActionStyleDestructive = 2
};

@interface MBSheetAction : MBSheetItem
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) MBActionHandler handler;
@property (nonatomic, assign) MBSheetActionStyle style;

+ (MBSheetAction *)actionWithTitle:(NSString *)title thumbnail:(UIImage *)thumbnail style:(MBSheetActionStyle)style handler:(MBActionHandler)handler;

@end

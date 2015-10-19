//
//  MBSheetAction.h
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^MBActionHandler)();

@interface MBSheetAction : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) MBActionHandler handler;

+ (MBSheetAction *)actionWithTitle:(NSString *)title thumbnail:(UIImage *)thumbnail handler:(MBActionHandler)handler;

@end

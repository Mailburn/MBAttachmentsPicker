//
//  MBSheetHostCell.h
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 20/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MBSheetCornerStyle)
{
    MBSheetCornerStyleDefault = 0,
    MBSheetCornerStyleTop,
    MBSheetCornerStyleBottom,
    MBSheetCornerStyleAll
};

@interface MBSheetHostCell : UICollectionViewCell
@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) MBSheetCornerStyle cornerStyle;
@property (nonatomic, assign) CGFloat cornerRadius;
@end

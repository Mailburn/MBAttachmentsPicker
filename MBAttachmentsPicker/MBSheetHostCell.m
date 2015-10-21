//
//  MBSheetHostCell.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 20/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBSheetHostCell.h"

@implementation MBSheetHostCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        test.textColor = [UIColor blackColor];
        test.text = @"test";
        [self.contentView addSubview:test];
        
        self.backgroundColor = [UIColor colorWithWhite:(arc4random() % 255 + 100)/255.f alpha:1];
    }
    return self;
}

@end

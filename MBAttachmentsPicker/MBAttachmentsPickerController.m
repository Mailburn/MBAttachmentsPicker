//
//  MBAttachmentsPickerController.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBAttachmentsPickerController.h"

@interface MBAttachmentsPickerController ()
@property (nonatomic, strong) UIView *backgroundView;
@end

@implementation MBAttachmentsPickerController

#pragma mark - 

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backgroundView];
}

- (UIView *)backgroundView
{
    if (_backgroundView == nil)
    {
        _backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    }

    return _backgroundView;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.backgroundView.frame = self.view.bounds;
}

#pragma mark - Actions

- (void)addAction:(MBSheetAction *)action
{
    
}

@end

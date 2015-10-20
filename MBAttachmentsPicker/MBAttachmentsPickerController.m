//
//  MBAttachmentsPickerController.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBAttachmentsPickerController.h"
#import "MBPickerAnimationController.h"

@interface MBAttachmentsPickerController () <UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) id<MBPickerAnimationProtocol> animationController;
@end

@implementation MBAttachmentsPickerController

#pragma mark - Initialization

- (instancetype)init
{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.animationController = [[MBPickerAnimationController alloc] init];
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.transitioningDelegate = self;
}

#pragma mark - Loading cycle

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

#pragma mark - UIViewControllerTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.animationController;
    
}

@end

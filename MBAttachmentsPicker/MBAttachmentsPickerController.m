//
//  MBAttachmentsPickerController.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBAttachmentsPickerController.h"
#import "MBPickerAnimationController.h"
#import "MBSheetController.h"

@interface MBAttachmentsPickerController () <UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) id<MBPickerAnimationProtocol> animationController;
@property (nonatomic, strong) MBSheetController *sheetController;
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
    self.animationController.animatedController = self;
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.transitioningDelegate = self;
}

#pragma mark - Getters

- (MBSheetController *)sheetController
{
    if (_sheetController == nil) {
        _sheetController = [[MBSheetController alloc] init];
    }
    
    return _sheetController;
}

- (UICollectionView *)sheetCollectionView
{
    return self.sheetController.collectionView;
}

#pragma mark - Loading cycle

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.sheetCollectionView];
}

- (UIView *)backgroundView
{
    if (_backgroundView == nil)
    {
        _backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.65];
    }

    return _backgroundView;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.backgroundView.frame = self.view.bounds;
    
    CGFloat sheetHeight = self.sheetController.preferredSheetHeight;
    CGSize sheetSize = CGSizeMake(self.view.bounds.size.width, sheetHeight);
    
    self.sheetCollectionView.frame = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMaxY(self.view.bounds) - sheetSize.height, sheetSize.width, sheetSize.height);
}

#pragma mark - Actions

- (void)addAction:(MBSheetAction *)action
{
    
}

#pragma mark - UIViewControllerTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.animationController.presenting = YES;
    return self.animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.animationController.presenting = NO;
    return self.animationController;
}

@end

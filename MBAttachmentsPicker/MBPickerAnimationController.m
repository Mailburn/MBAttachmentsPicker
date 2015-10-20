//
//  MBPickerAnimationController.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 20/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MBAttachmentsPickerController.h"
#import "MBPickerAnimationController.h"

@interface MBPickerAnimationController()
@end

@implementation MBPickerAnimationController
@synthesize animatedController = _animatedController;
@synthesize presenting = _presenting;

- (instancetype)initWithAnimatedController:(MBAttachmentsPickerController *)animatedController presenting:(BOOL)presenting
{
    if (self = [super init]) {
        self.animatedController = animatedController;
        self.presenting = presenting;
    }
    return self;
}

- (void)animateDismissalInContext:(id<UIViewControllerContextTransitioning>)context
{
    UIView *containerView = [context containerView];
    [containerView addSubview:self.animatedController.view];
    
    [UIView animateWithDuration:[self transitionDuration:context] delay:0.f options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.animatedController.view.alpha = 1.f;
    } completion:^(BOOL finished) {
        [context completeTransition:YES];
    }];
}

- (void)animatePresentationInContext:(id<UIViewControllerContextTransitioning>)context
{
    [UIView animateWithDuration:[self transitionDuration:context] delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.animatedController.view.alpha = 0.f;
    } completion:^(BOOL finished) {
        [context completeTransition:YES];
    }];
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_8_3) {
        return 0.3f;
    }
    
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (_presenting) {
        [self animatePresentationInContext:transitionContext];
    } else {
        [self animateDismissalInContext:transitionContext];
    }
}

@end

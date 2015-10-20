@class MBAttachmentsPickerController;
@class UIViewControllerContextTransitioning;

@protocol MBPickerAnimationProtocol <NSObject, UIViewControllerAnimatedTransitioning>
@property (nonatomic, weak) UIViewController *animatedController;
@property (nonatomic, assign) BOOL presenting;
- (void)animatePresentationInContext:(UIViewControllerContextTransitioning *)context;
- (void)animateDismissalInContext:(UIViewControllerContextTransitioning *)context;
@optional
- (instancetype)initWithAnimatedController:(UIViewController *)animatedController presenting:(BOOL)presenting;
@end

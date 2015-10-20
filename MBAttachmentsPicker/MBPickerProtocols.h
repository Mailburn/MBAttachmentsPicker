@class MBAttachmentsPickerController;
@class UIViewControllerContextTransitioning;

@protocol MBPickerAnimationProtocol <NSObject, UIViewControllerAnimatedTransitioning>
@property (nonatomic, weak) MBAttachmentsPickerController *animatedController;
@property (nonatomic, assign) BOOL presenting;
- (void)animatePresentationInContext:(id<UIViewControllerContextTransitioning>)context;
- (void)animateDismissalInContext:(id<UIViewControllerContextTransitioning>)context;
@optional
- (instancetype)initWithAnimatedController:(MBAttachmentsPickerController *)animatedController;
- (instancetype)initWithAnimatedController:(MBAttachmentsPickerController *)animatedController presenting:(BOOL)presenting;
@end
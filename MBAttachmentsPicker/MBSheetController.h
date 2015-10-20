//
//  MBSheetController.h
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MBSheetController : NSObject
@property (nonatomic, strong) UICollectionView *collectionView;

- (CGFloat)preferredSheetHeight;

@end

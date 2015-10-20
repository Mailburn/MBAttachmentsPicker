//
//  MBSheetController.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 19/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBSheetController.h"
#import "MBSheetCollectionViewLayout.h"
#import "MBSheetHostCell.h"

@interface MBSheetController() <UICollectionViewDataSource, UICollectionViewDelegate>
@end

@implementation MBSheetController

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[MBSheetCollectionViewLayout alloc] init]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.accessibilityIdentifier = @"SheetCollectionView";
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.alwaysBounceVertical = YES;
        [_collectionView registerClass:[MBSheetHostCell class] forCellWithReuseIdentifier:NSStringFromClass([MBSheetHostCell class])];
    }
    
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MBSheetHostCell *cell = (MBSheetHostCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MBSheetHostCell class]) forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

@end

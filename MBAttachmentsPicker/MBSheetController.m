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
#import "NSArray+MBUtils.h"
#import "MBFunctionalExtensions.h"

@interface MBSheetController() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *items;
@end

@implementation MBSheetController

- (instancetype)init
{
    if (self = [super init]) {
        _defaultInset = 4.f;
    }
    return self;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[MBSheetCollectionViewLayout alloc] init]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.accessibilityIdentifier = @"SheetCollectionView";
        _collectionView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.3];
        _collectionView.alwaysBounceVertical = YES;
        [_collectionView registerClass:[MBSheetHostCell class] forCellWithReuseIdentifier:NSStringFromClass([MBSheetHostCell class])];
    }
    
    return _collectionView;
}

- (NSArray *)allIndexPaths
{
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger numberOfSections = [self numberOfSectionsInCollectionView:self.collectionView];
    for (NSInteger section = 0; section < numberOfSections; ++section) {
        for (NSInteger item = 0; item < [self numberOfItemsInSection:section]; ++item) {
            [array addObject:[NSIndexPath indexPathForItem:item inSection:section]];
        }
    }
    
    return array;
}

- (CGFloat)preferredSheetHeight
{
    NSNumber *height = [[[self allIndexPaths] map:^id(NSIndexPath *indexPath) {
        return [NSValue valueWithCGSize:[self sizeForItemAtIndexPath:indexPath]];
    }] inject:^id(NSNumber *accumulator, NSValue *object) {
        return @(accumulator.floatValue + [object CGSizeValue].height);
    } initial:@0];
    
    return [height floatValue];
}

- (CGFloat)preferredSheetWidth
{
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_8_3) {
        return self.collectionView.bounds.size.width - 2 * self.defaultInset;
    } else {
        return self.collectionView.bounds.size.width;
    }
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return 7;//[self.items count];
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(320, 40);
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
    if (section == 0) {
        return 3;
    }
    return 1;
}

#pragma mark - UICollectionViewFlowLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self sizeForItemAtIndexPath:indexPath];
}

@end

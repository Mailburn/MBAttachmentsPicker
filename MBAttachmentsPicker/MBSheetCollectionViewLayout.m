//
//  MBSheetCollectionViewLayout.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 20/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBSheetCollectionViewLayout.h"
#import "MBFunctionalExtensions.h"
#import "NSArray+MBUtils.h"

@interface MBSheetCollectionViewLayout()
@property (nonatomic, strong) NSMutableArray *layoutAttributes;
@property (nonatomic, strong) NSMutableArray *invalidatedLayoutAttributes;
@property (nonatomic, assign) CGSize contentSize;
@end

@implementation MBSheetCollectionViewLayout

- (NSMutableArray *)layoutAttributes
{
    if (_layoutAttributes == nil) {
        _layoutAttributes = [NSMutableArray array];
    }
    
    return _layoutAttributes;
}

#pragma mark - Layout

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self.layoutAttributes removeAllObjects];
    self.contentSize = CGSizeZero;
    
    id<UICollectionViewDataSource> dataSource = self.collectionView.dataSource;
    id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    
    CGFloat contentHeight = 0.f;
    
    if ((delegate) && (dataSource)) {
        NSInteger sections = [dataSource numberOfSectionsInCollectionView:self.collectionView];
        CGPoint origin = CGPointZero;
        
        for (int section = 0; section < sections; ++section) {
            NSMutableArray *sectionAttributes = [NSMutableArray array];
            NSInteger items = [dataSource collectionView:self.collectionView numberOfItemsInSection:section];
            NSArray *indexPaths = [[NSArray arrayWithRange:NSMakeRange(0, items)] map:^id(NSNumber *item) {
                return [NSIndexPath indexPathForItem:item.integerValue inSection:section];
            }];
            for (NSIndexPath *indexPath in indexPaths) {
                CGSize size = [delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
                
                UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
                
                CGFloat centerX = origin.x;
                CGFloat centerY = size.height * indexPath.item + [self offsetWithSize:size indexPath:indexPath];
                
                attributes.frame = CGRectMake(centerX, centerY, size.width, size.height);
                
                [sectionAttributes addObject:attributes];
                contentHeight += attributes.frame.size.height + [self offsetWithSize:size indexPath:indexPath];
            }
            
            [self.layoutAttributes addObject:sectionAttributes];
        }
        
        self.contentSize = CGSizeMake(self.collectionView.frame.size.width, contentHeight);
    }
}

- (CGFloat)offsetWithSize:(CGSize)size indexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    if (section == 0) {
        return 0.f;
    }
    
    NSInteger numberOfRows = [self.collectionView numberOfItemsInSection:section - 1];
    return numberOfRows * size.height + 5.f;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (void)invalidateLayout
{
    self.invalidatedLayoutAttributes = self.layoutAttributes;
}

- (CGSize)collectionViewContentSize
{
    return self.contentSize;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [[self.layoutAttributes reduce:^id(NSArray *lhsAttributes, NSArray *rhsAttributes) {
        return [lhsAttributes arrayByAddingObjectsFromArray:rhsAttributes];
    }] filter:^BOOL(UICollectionViewLayoutAttributes *attributes) {
        return CGRectIntersectsRect(rect, attributes.frame);
    }];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath allAttributes:(NSArray *)allAttributes
{
    if ((allAttributes.count > indexPath.section) && ([allAttributes[indexPath.section] count] > indexPath.item)) {
        return allAttributes[indexPath.section][indexPath.item];
    } else {
        return nil;
    }
}

- (UICollectionViewLayoutAttributes *)invalidatedLayoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.invalidatedLayoutAttributes == nil) {
        return nil;
    }
    
    return [self layoutAttributesForItemAtIndexPath:indexPath allAttributes:self.invalidatedLayoutAttributes];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self layoutAttributesForItemAtIndexPath:indexPath allAttributes:self.layoutAttributes];
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    return [self invalidatedLayoutAttributesForItemAtIndexPath:itemIndexPath] == nil ? [self invalidatedLayoutAttributesForItemAtIndexPath:itemIndexPath] : [self layoutAttributesForItemAtIndexPath:itemIndexPath];
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    return [self layoutAttributesForItemAtIndexPath:itemIndexPath];
}

@end

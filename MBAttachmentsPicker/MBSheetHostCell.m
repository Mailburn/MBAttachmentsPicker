//
//  MBSheetHostCell.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 20/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "MBSheetHostCell.h"

@implementation MBSheetHostCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        test.textColor = [UIColor blackColor];
        test.text = @"test";
        [self.contentView addSubview:test];
        
        self.backgroundColor = [UIColor colorWithWhite:(arc4random() % 255 + 100)/255.f alpha:1];
        
        _cornerRadius = 15.f;//2.f;
        self.cornerStyle = MBSheetCornerStyleAll;
    }
    return self;
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self reloadMask];
}

#pragma mark - Setters

- (void)setCornerStyle:(MBSheetCornerStyle)cornerStyle
{
    _cornerStyle = cornerStyle;
    
    [self reloadMask];
}

#pragma mark - Corner mask

- (void)reloadMask
{
    if (self.layer.mask == nil) {
        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.lineWidth = 0;
        mask.fillColor = [UIColor blackColor].CGColor;
        
        self.layer.mask = mask;
    }
    
    CAShapeLayer *mask = (CAShapeLayer *)self.layer.mask;
    mask.frame = self.bounds;
    mask.path = [self maskPathWithRect:self.bounds cornerStyle:_cornerStyle];
}

- (CGPathRef)maskPathWithRect:(CGRect)rect cornerStyle:(MBSheetCornerStyle)cornerStyle
{
    UIRectCorner corners;
    
    switch (_cornerStyle) {
        case MBSheetCornerStyleDefault:
        {
            return [UIBezierPath bezierPathWithRect:rect].CGPath;
        }
            break;
        case MBSheetCornerStyleTop:
        {
            corners = UIRectCornerTopLeft | UIRectCornerTopRight;
        }
            break;
        case MBSheetCornerStyleBottom:
        {
            corners = UIRectCornerBottomLeft | UIRectCornerBottomRight;
        }
            break;
        case MBSheetCornerStyleAll:
        {
            corners = UIRectCornerAllCorners;
        }
            break;
    }
    
    return [[UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)] CGPath];
}

@end

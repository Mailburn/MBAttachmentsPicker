//
//  NSArray+MBUtils.m
//  MBAttachmentsPicker
//
//  Created by Vladimir Kaltyrin on 21/10/2015.
//  Copyright © 2015 Vladimir Kaltyrin. All rights reserved.
//

#import "NSArray+MBUtils.h"

@implementation NSArray (MBUtils)

+ (NSArray *)arrayWithRange:(NSRange)range
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = range.location; i < range.length; ++i) {
        [array addObject:[NSNumber numberWithInteger:i]];
    }
    return array;
}

@end

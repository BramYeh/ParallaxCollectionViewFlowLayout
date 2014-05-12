//
//  ParallaxCollectionViewFlowLayout.m
//  ParallaxCollectionViewFlowLayout
//
//  Created by Bram Yeh on 1/13/14.
//  Copyright (c) 2014 Bram Yeh. All rights reserved.
//

#import "ParallaxCollectionViewFlowLayout.h"

static CGFloat parallax_radio = 2.0f;


@interface ParallaxCollectionViewFlowLayout ()

@property (nonatomic, strong) NSArray *parallaxIndexPaths;

@end


@implementation ParallaxCollectionViewFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributesArray = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    if ([layoutAttributesArray count] == 0) {
        return layoutAttributesArray;
    }
    
    CGPoint contentOffset = self.collectionView.contentOffset;
    
    for (NSIndexPath *indexPath in self.parallaxIndexPaths) {
        UICollectionViewLayoutAttributes *cellAttrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        if (![layoutAttributesArray containsObject:cellAttrs]) {
            [layoutAttributesArray addObject:cellAttrs];
        }
    }
    
    for (UICollectionViewLayoutAttributes *layoutAttributes in layoutAttributesArray) {
        if (layoutAttributes.representedElementCategory == UICollectionElementCategoryCell) {
            layoutAttributes.zIndex = layoutAttributes.indexPath.row;
            
            if (self.allCellParallax || [self isEnabledParallaxCellforRow:layoutAttributes.indexPath.row section:layoutAttributes.indexPath.section]) {
                CGPoint headerOrigin = layoutAttributes.frame.origin;
                if (headerOrigin.y > (contentOffset.y + self.collectionView.contentInset.top)) {
                    continue;
                }
                
                CGFloat scrollDiff = self.collectionView.contentOffset.y + self.collectionView.contentInset.top - headerOrigin.y;
                if (scrollDiff < 0.0f) {
                    scrollDiff = 0.0f;
                }
            
                headerOrigin.y = headerOrigin.y + scrollDiff / parallax_radio;
                
                layoutAttributes.frame = CGRectMake(headerOrigin.x, headerOrigin.y, CGRectGetWidth(layoutAttributes.frame), CGRectGetHeight(layoutAttributes.frame));
            }
        }
        
    }
    
    return layoutAttributesArray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBound
{
    return YES;
}

#pragma mark - Private Method

- (void)enableParallaxCellsAtIndexPaths:(NSArray *)indexPaths
{
    self.allCellParallax = NO;
    self.parallaxIndexPaths = indexPaths;
}

- (BOOL)isEnabledParallaxCellforRow:(NSInteger)row section:(NSInteger)section
{
    for (NSIndexPath *indexPath in self.parallaxIndexPaths) {
        if (indexPath.row == row && indexPath.section == section) {
            return YES;
        }
    }
    return NO;
}

@end

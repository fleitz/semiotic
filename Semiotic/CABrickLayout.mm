//
//  CABrickLayout.m
//  CollectionViewPrototype
//
//  Created by Fred Leitz on 2013-04-27.
//  Copyright (c) 2013 Fred Leitz. All rights reserved.
//

#import "CABrickLayout.h"
#import <math.h>
#include "GuillotineBinPack.h"
#import "Cell.h"
@interface CABrickLayout () {
  GuillotineBinPack* binpacker;
}

@property (nonatomic,strong) NSMutableArray* attributes;

@end
@implementation CABrickLayout

- (id)init
{
    self = [super init];
    if (self) {
        self.itemSize = 50;
        self.maxItemSizeFactor = 5;
        binpacker = new GuillotineBinPack(2048,2048);
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.itemSize = 50;
    self.maxItemSizeFactor = 5;
    binpacker = new GuillotineBinPack(2048,2048);
}

- (CGSize)collectionViewContentSize{
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    CGFloat width = self.collectionView.frame.size.width;
    CGFloat x = sqrt(items*_maxItemSize*_maxItemSize);
    CGFloat height = (x/width)*width;
    height *= 13;
    CGSize size = CGSizeMake(width  ,height);
    binpacker->Init(size.width, size.height);
    return size;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes* attributes = [[UICollectionViewLayoutAttributes alloc] init];
    return nil;
}

- (void)setMaxItemSizeFactor:(CGFloat)maxItemSizeFactor {
    _maxItemSizeFactor = maxItemSizeFactor;
    _maxItemSize = maxItemSizeFactor*_itemSize;
}

- (void)setItemSize:(CGFloat)itemSize{
    _itemSize = itemSize;
    _maxItemSize = _maxItemSizeFactor*_itemSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes* attributes = [[UICollectionViewLayoutAttributes alloc] init];
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat sz = self.collectionView.frame.size.width/round(frand(1.3, 3));
    CGRect frame = CGRectMake(0, 0, sz, sz);
    CGSize size = frame.size;
    CGPoint origin = frame.origin;
    binpack::Rect rect = binpacker->Insert(size.width, size.height, true, GuillotineBinPack::RectBestLongSideFit, GuillotineBinPack::SplitMinimizeArea);
    origin.x = rect.x;
    origin.y = rect.y;
    frame.origin = origin;
    attributes.frame = frame;
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSLog(@"%f,%f",rect.size.height,rect.size.width);
    if(self.attributes){
        return self.attributes;
    }
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray* attributes = [NSMutableArray arrayWithCapacity:items];
    for(int i = 0; i < items; i++){
        NSIndexPath* path = [NSIndexPath indexPathForRow:i inSection:0];
        attributes[i] = [self layoutAttributesForItemAtIndexPath: path];
    }
    self.attributes = attributes;
    return attributes;
}

@end

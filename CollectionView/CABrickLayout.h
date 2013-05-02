//
//  CABrickLayout.h
//  CollectionViewPrototype
//
//  Created by Fred Leitz on 2013-04-27.
//  Copyright (c) 2013 Fred Leitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CABrickLayout : UICollectionViewLayout

@property (nonatomic,assign) CGFloat itemSize;
@property (nonatomic,readonly) CGFloat maxItemSize;
@property (nonatomic,assign) CGFloat maxItemSizeFactor;

@end

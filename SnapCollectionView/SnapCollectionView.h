//
//  SnapCollectionView.h
//  SnapCollectionViewDemo
//
//  Created by Henry on 3/25/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnapCollectionView : UICollectionView
@property (nonatomic,strong) NSArray *viewList;
@property (nonatomic) CGRect selectedArea;
@end

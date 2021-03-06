//
//  SelectionCollectionViewFlowLayout.m
//  SelectionCollectionViewDemo
//
//  Created by Henry on 3/26/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "SelectionCollectionViewFlowLayout.h"

@implementation SelectionCollectionViewFlowLayout
- (instancetype) init{
    self = [super init];
    if(self){
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
        self.itemSize = CGSizeMake(80, 80);
    }
    return self;
}
@end

//
//  SelectionCollectionViewCell.m
//  SelectionCollectionViewDemo
//
//  Created by Henry on 3/26/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "SelectionCollectionViewCell.h"

@implementation SelectionCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.label = [[UILabel alloc]initWithFrame:self.bounds];
        self.label.text = @"0";
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

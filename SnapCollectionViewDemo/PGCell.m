//
//  PGCell.m
//  SnapCollectionViewDemo
//
//  Created by Henry on 3/25/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "PGCell.h"

@implementation PGCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self addSubview:self.label];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2, 0, 1, self.frame.size.height)];
        view.backgroundColor = [UIColor yellowColor];
        [self addSubview:view];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0f;
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

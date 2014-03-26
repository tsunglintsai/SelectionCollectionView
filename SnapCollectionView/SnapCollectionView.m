//
//  SnapCollectionView.m
//  SnapCollectionViewDemo
//
//  Created by Henry on 3/25/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "SnapCollectionView.h"
#import "SnapCollectionViewLayout.h"
#import "PGCell.h"

@interface SnapCollectionView()<UICollectionViewDelegate>
@property (nonatomic,strong) SnapCollectionViewLayout *layout;
@property (nonatomic) CGFloat cellWidth;
@end

@implementation SnapCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void) setup{
    [self setCollectionViewLayout:self.layout];
    self.delegate = self;
    self.cellWidth = 80;
    self.selectedArea = CGRectMake(200, 0, 10, self.frame.size.height);
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = self.selectedArea;
    layer.borderWidth = 1.0;
    layer.borderColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:layer];
    
}

- (SnapCollectionViewLayout*) layout{
    if (!_layout) {
        _layout = [[SnapCollectionViewLayout alloc] init];
    }
    return _layout;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGRect selectedLine = self.selectedArea;
    if (velocity.x == 0) { //check which item is selected and move to it
        UICollectionViewCell *selectedCell;
        for (UICollectionViewCell *cell in [self visibleCells]){
            PGCell *pgCell = (PGCell*) cell;
            CGRect windowRectOfPgCell = [self convertRect:pgCell.frame toView:nil];
            if( CGRectIntersectsRect(windowRectOfPgCell, selectedLine) ){
                NSLog(@"=================%@",pgCell.label.text);
                selectedCell = pgCell;
                break;
            }
        }
        if(selectedCell){
            NSLog(@"selected page cell:%f",selectedCell.frame.origin.x);
            *targetContentOffset = [self contentOffsetBySelectedCellFrame:selectedCell.frame];
        }
    } else if(velocity.x > 0) {
        NSLog(@"scrollViewWillEndDragging:%f,%f, current offset:%f", velocity.x, velocity.y, scrollView.contentOffset.x);
        //*targetContentOffset = CGPointMake(scrollView.contentOffset.x + 10*velocity.x, 0);
        *targetContentOffset = CGPointMake( ((int) scrollView.contentOffset.x/80) * 80 + ((int)(velocity.x * 3))  * 80 , 0);
    } else if( velocity.x < 0) {
        NSLog(@"scrollViewWillEndDragging:%f,%f, current offset:%f", velocity.x, velocity.y, scrollView.contentOffset.x);
        //*targetContentOffset = CGPointMake(scrollView.contentOffset.x + 10*velocity.x, 0);
        *targetContentOffset = CGPointMake( ((int) scrollView.contentOffset.x/80) * 80 + ((int)(velocity.x * 3))  * 80 , 0);
    }
}

- (CGPoint) contentOffsetBySelectedCellFrame:(CGRect)frame{
    NSUInteger selectedIndex = frame.origin.x / self.cellWidth;
    return CGPointMake(selectedIndex*self.cellWidth + self.cellWidth/2 - 200, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"%f",scrollView.contentOffset.x);
    
}

@end

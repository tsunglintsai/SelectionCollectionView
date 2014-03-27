//
//  SelectionCollectionView.m
//  SelectionCollectionViewDemo
//
//  Created by Henry on 3/26/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "SelectionCollectionView.h"
#import "SelectionCollectionViewFlowLayout.h"
#import "SelectionCollectionViewCell.h"

static const NSString *cellIdentifier = @"SelectionCollectionViewCellIdentifier";

@interface SelectionCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *innerCollectionView;
@property (nonatomic, strong) SelectionCollectionViewFlowLayout *collectionViewLayout;
@property (nonatomic) CGRect selectedArea;
@property (nonatomic) CGFloat cellWidth;
@end

@implementation SelectionCollectionView

#pragma mark view init
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [self setup];
}

- (void)setup{
    [self.innerCollectionView registerClass:[SelectionCollectionViewCell class] forCellWithReuseIdentifier:[cellIdentifier copy]];
    [self addSubview:self.innerCollectionView];
    self.selectedArea = CGRectMake(200, 0, 1, self.frame.size.height);
    UIView *view = [[UIView alloc]initWithFrame:self.selectedArea];
    view.layer.borderColor = [UIColor blueColor].CGColor;
    view.layer.borderWidth = 1.0;
    [self addSubview:view];
    self.innerCollectionView.delegate = self;
    
    UIView *yelloView = [[UIView alloc]initWithFrame:CGRectMake(160, 0, 80, self.frame.size.height)];
    yelloView.layer.borderColor = [UIColor yellowColor].CGColor;
    yelloView.layer.borderWidth = 1.0;
    [self addSubview:yelloView];
    
    self.innerCollectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth;


}

#pragma component init

- (UICollectionView*) innerCollectionView{
    if(!_innerCollectionView){
        _innerCollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.collectionViewLayout];
        _innerCollectionView.dataSource = self;
    }
    return _innerCollectionView;
}

- (SelectionCollectionViewFlowLayout*) collectionViewLayout{
    if(!_collectionViewLayout){
        _collectionViewLayout = [[SelectionCollectionViewFlowLayout alloc]init];
    }
    return _collectionViewLayout;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SelectionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[cellIdentifier copy] forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    cell.layer.borderWidth = 1.0;
    cell.layer.borderColor = [UIColor redColor].CGColor;
    cell.label.text = [@(indexPath.row) description];
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGRect selectedLine = self.selectedArea;
    if (velocity.x == 0) { //check which item is selected and move to it
        UICollectionViewCell *selectedCell;
        for (UICollectionViewCell *cell in [self.innerCollectionView visibleCells]){
            CGRect windowRectOfPgCell = [self convertRect:cell.frame toView:nil];
            if( CGRectIntersectsRect(windowRectOfPgCell, selectedLine) ){
                selectedCell = cell;
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

#pragma class property

- (void) setCellspace:(CGFloat)cellspace{
    _cellspace = cellspace;
    self.collectionViewLayout.minimumInteritemSpacing = cellspace;
    [self.innerCollectionView reloadData];
}
@end

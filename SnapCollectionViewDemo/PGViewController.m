//
//  PGViewController.m
//  SnapCollectionViewDemo
//
//  Created by Henry on 3/25/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "PGViewController.h"
#import "SnapCollectionView.h"
#import "PGCell.h"

@interface PGViewController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet SnapCollectionView *snapCollectionView;

@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.snapCollectionView.dataSource = self;
    [self.snapCollectionView registerClass:[PGCell class] forCellWithReuseIdentifier:@"identifer"];
    self.snapCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(200, 0, 1, self.view.frame.size.height)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PGCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifer" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    cell.label.text = [@(indexPath.row) description];
    return cell;
}



@end

//
//  PGViewController.m
//  SelectionCollectionViewDemo
//
//  Created by Henry on 3/26/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "PGViewController.h"
#import "SelectionCollectionView.h"

@interface PGViewController ()
@property (weak, nonatomic) IBOutlet SelectionCollectionView *selectionCollectionView;

@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClicked:(id)sender {
}

@end

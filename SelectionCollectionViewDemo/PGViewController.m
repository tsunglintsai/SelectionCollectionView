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
@property (strong, nonatomic) NSArray *imageURLList;
@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSArray *)imageURLList{
    if(!_imageURLList){
        NSString *filesPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"image"];
        // where pngfolder is the folder as described above.
        _imageURLList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filesPath error:nil];
    }
    return _imageURLList;
}

- (UIImage*) imageOfIndex:(NSUInteger)index{
    NSString *sourcePath = [[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"image"]stringByAppendingPathComponent:self.imageURLList[index]];
    return [[UIImage alloc]initWithContentsOfFile:sourcePath];
}

- (IBAction)buttonClicked:(id)sender {
}

@end

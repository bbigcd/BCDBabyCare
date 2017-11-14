//
//  MainViewController.m
//  BCDBabyCare
//
//  Created by chendi on 2017/11/14.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"

@interface MainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation MainViewController

static NSString *const collectionViewCell = @"SimpleCollectionViewCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"宝宝陪护";
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumInteritemSpacing = 5;  // 左右中间间隔距离
    self.flowLayout.minimumLineSpacing = 5;       // 选项间上下距离间距
    
    self.collectionView.layoutMargins = UIEdgeInsetsMake(5, 5, 5, 5);
    self.collectionView.collectionViewLayout = self.flowLayout;
    
//    [self.collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCell];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:collectionViewCell];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - -- UICollectionViewDelegate --

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor brownColor];
//    cell.layer.borderWidth = 0.5;
//    cell.layer.borderColor = [UIColor grayColor].CGColor;
    
    cell.titleLabel.text = [NSString stringWithFormat:@"第%ld项", (long)indexPath.row];
    return cell;
}

// 选择项
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld", indexPath.row);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width - 20), 120);
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}


// 点击高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell *cell = (MainCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.titleLabel.text = @"test";
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    MainCollectionViewCell *cell = (MainCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor brownColor];
    cell.titleLabel.text = @"Label";
}

@end

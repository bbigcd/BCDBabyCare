//
//  MainViewController.m
//  BCDBabyCare
//
//  Created by chendi on 2017/11/14.
//  Copyright © 2017年 bbigcd. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;

@end

@implementation MainViewController

static NSString *const collectionViewCell = @"SimpleCollectionViewCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"宝宝陪护";
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout.minimumInteritemSpacing = 5;  // 左右中间间隔距离
    self.flowLayout.minimumLineSpacing = 5;       // 选项间上下距离间距
    self.flowLayout.itemSize = CGSizeMake(SCREEN_W - 20, 120);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(15, 10, 5, 10);
    
    self.collectionView.collectionViewLayout = self.flowLayout;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:@"MainCollectionViewCell" bundle:nil]  
          forCellWithReuseIdentifier:collectionViewCell];
    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"ceshi";
//    [self.collectionView addSubview:label];
//
//    NSLog(@"%@", NSStringFromCGSize(self.collectionView.bounds.size));
//    NSLog(@"%@", NSStringFromCGSize(self.collectionView.contentSize));
//    label.frame = (CGRect){10, self.collectionView.contentSize.height - 104, 100, 40};
    
//    UserNotifications *userNotifiations = [[UserNotifications alloc] init];
//    userNotifiations.name =
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertTitle = @"alertTitle";
    localNotification.alertBody = @"alertBody";
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
    
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
    cell.titleLabel.text = [NSString stringWithFormat:@"第%ld项", (long)indexPath.row];
    return cell;
}

// 选择项
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"短按 %ld", indexPath.row);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

// Cell显示动画
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) {
    
    cell.contentView.alpha = 0;
    cell.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0, 0), 0);
    
    
    [UIView animateKeyframesWithDuration:.6 delay:0.0 options:0 animations:^{
        
        /**
         *  分步动画   第一个参数是该动画开始的百分比时间  第二个参数是该动画持续的百分比时间
         */
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.2 animations:^{
            cell.contentView.alpha = .2;
            cell.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.4, 0.4), 0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.2 animations:^{
            cell.contentView.alpha = .5;
            cell.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.7, 0.7), 0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.4 animations:^{
            cell.contentView.alpha = .7;
            cell.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1.1, 1.1), 0);
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
            cell.contentView.alpha = 1;
            cell.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(1, 1), 0);
            
        }];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

//- (CGSize)collectionView:(UICollectionView *)collectionView
//                  layout:(UICollectionViewLayout*)collectionViewLayout
//  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake((self.view.frame.size.width - 20) / 3, 120);
//}



/* 移动代理
- (BOOL)collectionView:(UICollectionView *)collectionView
canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView
   moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath
           toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSLog(@"..");
}
*/

//// 点击高亮
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    MainCollectionViewCell *cell = (MainCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
//    cell.titleLabel.text = @"test";
//    NSLog(@"长按 %ld", indexPath.row);
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    MainCollectionViewCell *cell = (MainCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor brownColor];
////    cell.titleLabel.text = @"Label";
//}

/* 移动方法
 ViewDidLoad
 
 self.longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressMoving:)];
 [self.collectionView addGestureRecognizer:_longPress];
 
- (void)lonePressMoving:(UILongPressGestureRecognizer *)longPress
{
    switch (_longPress.state) {
        case UIGestureRecognizerStateBegan: {
            {
                NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPress locationInView:self.collectionView]];
                // 找到当前的cell
                MainCollectionViewCell *cell = (MainCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:selectIndexPath];
                // 定义cell的时候btn是隐藏的, 在这里设置为NO
                //                [cell.btnDelete setHidden:NO];
                cell.titleLabel.text = @"移动了";
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:_longPress.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [self.collectionView endInteractiveMovement];
            break;
        }
        default: [self.collectionView cancelInteractiveMovement];
            break;
    }
}
*/
@end

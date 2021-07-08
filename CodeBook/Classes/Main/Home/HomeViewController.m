//
//  CBFirstViewController.m
//  CodeBook
//
//  Created by Podinn on 2019/5/27.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import "HomeViewController.h"


#import "FirstCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic)UICollectionView *mainCollectionView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"功能调试";
    [self setBackItemHidden:YES];
    
    [self.view addSubview:self.mainCollectionView];
    [self.mainCollectionView reloadData];
    
}

#pragma mark -------- lazy load ---------
- (UICollectionView *)mainCollectionView {
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 2;
        layout.minimumInteritemSpacing = 2;
        layout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
        
        self.mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.height - 49 - [self safeAreaBottom] - [self statusBarHeight] - 44) collectionViewLayout:layout];
        
        [self.mainCollectionView registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"mainCell"];
        self.mainCollectionView.showsVerticalScrollIndicator = NO;
        self.mainCollectionView.scrollEnabled = YES;
        
        self.mainCollectionView.backgroundColor = [UIColor whiteColor];
        self.mainCollectionView.dataSource = self;
        self.mainCollectionView.delegate = self;
    }
    return _mainCollectionView;
}

#pragma mark - UICollectionViewDataSource and Delegate

//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return TITLE_ARRAY.count;
}

//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width-12)/3.0, 120);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = 5.0;
    cell.layer.borderWidth = 1.0;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    if (indexPath.row < TITLE_ARRAY.count) {
        [cell loadDataWith:TITLE_ARRAY[indexPath.row]];
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
        config.scannerType = SWScannerTypeBoth;
        
        SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
        qrcodeVC.codeConfig = config;
        qrcodeVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:qrcodeVC animated:YES];
    }else {
        NSString *nibName = NIB_ARRAY[indexPath.row];
        if (nibName && nibName.length > 0) {
            [self pageJumpTo:nibName];
        }else {
            [self.view makeToast:@"开发中。。。"];
        }
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

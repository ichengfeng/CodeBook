//
//  CBMasonryViewController.m
//  CodeBook
//
//  Created by chengfeng on 2019/7/19.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import "MasonryViewController.h"

@interface MasonryViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    mainTableView.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:mainTableView];
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.with.offset(10);
        make.topMargin.with.offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(redView.mas_bottom).offset(20);
        make.leading.with.offset(10);
        make.trailing.with.offset(10);
        make.height.with.offset(300);
    }];
    
}

#pragma mark ----- datasoure and delegate ------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
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

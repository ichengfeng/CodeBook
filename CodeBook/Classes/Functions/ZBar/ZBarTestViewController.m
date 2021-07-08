//
//  ZBarTestViewController.m
//  CodeBook
//
//  Created by mac on 2021/6/30.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "ZBarTestViewController.h"
@import LBXZBarSDK;

@interface ZBarTestViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation ZBarTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UILabel *openLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 44)];
    openLabel.text = @"打开相册";
    openLabel.textColor = [UIColor blackColor];
    openLabel.userInteractionEnabled = YES;
    [self.view addSubview:openLabel];
    
    MJWeakSelf
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
        [weakSelf openPhoto];
    }];
    [openLabel addGestureRecognizer:tapGes];
}

//打开相册
- (void)openPhoto {
   //ZBarsSDK初始化
    ZBarReaderController *imagePicker = ZBarReaderController.new;
    imagePicker.showsHelpOnFail = YES;//禁止显示读取失败页面
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

//选中图片后的处理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
   
   id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];

   ZBarSymbol *symbol = nil;

   for (symbol in results) {
       //扫码信息
       NSString *QRCodeString = symbol.data;
       NSLog(@"QRCodeString = %@,%@",QRCodeString,symbol.typeName);
//       break;
   }
   
//   [picker dismissViewControllerAnimated:YES completion:^{
//       //扫码信息
////       NSString *QRCodeString = symbol.data;
////       NSLog(@"QRCodeString = %@",QRCodeString);
//   }];
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

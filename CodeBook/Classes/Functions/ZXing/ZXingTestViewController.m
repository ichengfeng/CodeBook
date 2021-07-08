//
//  ZXingTestViewController.m
//  CodeBook
//
//  Created by mac on 2021/6/29.
//  Copyright © 2021 Podinn. All rights reserved.
//

#import "ZXingTestViewController.h"
#import "ZXReader.h"
@import LBXScan;
@import LBXZBarSDK;
@interface ZXingTestViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation ZXingTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *openLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 44)];
    openLabel.text = @"打开相册";
    openLabel.textColor = [UIColor blackColor];
    openLabel.userInteractionEnabled = YES;
    [self.view addSubview:openLabel];
    
    MJWeakSelf
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
        [weakSelf imagePicker];
    }];
    [openLabel addGestureRecognizer:tapGes];
}

#pragma mark -- 跳转相册
- (void)imagePicker {
    [SWQRCodeManager sw_checkAlbumAuthorizationStatusWithGrand:^(BOOL granted) {
        if (granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePicker.delegate = self;
                imagePicker.editing = YES;
                [self presentViewController:imagePicker animated:YES completion:nil];
            });
        }
    }];
    
}

#pragma mark -- UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *pickImage = info[UIImagePickerControllerOriginalImage];
    __weak __typeof(self) weakSelf = self;
    [ZXingWrapper recognizeImage:pickImage block:^(ZXBarcodeFormat barcodeFormat, NSString *str) {
        
        if (str) {
            LBXScanResult *result = [[LBXScanResult alloc]init];
            result.strScanned = str;
            result.imgScanned = pickImage;
            result.strBarCodeType = AVMetadataObjectTypeEAN13Code;
            
            [weakSelf scanResultWithArray:@[result]];
        }else
        {
//            [self showError:@"识别失败"];
        }
    }];
    
//    CGImageRef imageToDecode = pickImage.CGImage;
//    ZXLuminanceSource *source = [[ZXCGImageLuminanceSource alloc] initWithCGImage:imageToDecode];
//    ZXBinaryBitmap *bitmap = [ZXBinaryBitmap binaryBitmapWithBinarizer:[ZXHybridBinarizer binarizerWithSource:source]];
//
//    NSError *error = nil;
//    ZXDecodeHints *hints = [ZXDecodeHints hints];
//    [hints addPossibleFormat:kBarcodeFormatEan13];
//
//    ZXMultiFormatReader *multiReader = [[ZXMultiFormatReader alloc]init];
//    ZXResult *multiResult = [multiReader decode:bitmap hints:hints error:&error];
//
//    ZXCodaBarReader *reader = [[ZXCodaBarReader alloc]init];
//    ZXResult *result = [reader decode:bitmap hints:hints error:&error];
//
//    NSLog(@"%@,%@",multiResult.text,result.text);
}

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (!array || array.count < 1)
    {
//        [self showError:@"识别失败了"];
        
        return;
    }
    
    //经测试，可以同时识别2个二维码，不能同时识别二维码和条形码
    for (LBXScanResult *result in array) {
        
        NSLog(@"scanResult:%@",result.strScanned);
    }
    
    if (!array[0].strScanned || [array[0].strScanned isEqualToString:@""] ) {
        
//         [self showError:@"识别失败了"];
        return;
    }
    LBXScanResult *scanResult = array[0];
    
//    [self showNextVCWithScanResult:scanResult];
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

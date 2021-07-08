//
//  AppDelegate.m
//  CodeBook
//
//  Created by Podinn on 2019/5/27.
//  Copyright © 2019 Podinn. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
//#import <UMShare/UMShare.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)shareAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initializeApplication:launchOptions];
    //    [self getToken];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self loadTabBarController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark ----- intial SDK -----
- (void)initializeApplication:(NSDictionary *)launchOptions {
    
    [[SDWebImageManager sharedManager].imageDownloader setValue: nil forHTTPHeaderField:@"Accept"];
    //第三方键盘适配
    [self setupIQKeyBoardManager];
    //友盟分享
    
}

- (void)loadTabBarController {
    
    if (!_tabBarController) {
        self.tabBarController = [[TabBarViewController alloc]init];
    }
    self.window.rootViewController = self.tabBarController;
}

- (void)setupUMShareManager {
    [self configUSharePlatforms];
}

- (void)configUSharePlatforms
{
    
  //U-ShareSDK为了兼容大部分平台命名,统一用appKey和appSecret进行参数设置,而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
    
    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
//    /* 微信收藏 */
//    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
//    /* 设置分享到QQ互联的appID */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105821097"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
//    /* 设置新浪的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3921700954"  appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}

//IQ
- (void)setupIQKeyBoardManager {
    /**
     *适配第三方键盘（解决第三方键盘高度不确定出现的遮掩输入框的问题）
     */
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = NO;
    
    /**
     *  由于不需要使用toolBar上面的done（完成）按钮，所以需要注释掉以下方法
     *  方法在 IQUIView+IQKeyboardToolbar.m 中
     *
     *  IQBarButtonItem *doneButton =[[IQBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStyleDone target:target action:action];
     *  items addObject:doneButton];
     */
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

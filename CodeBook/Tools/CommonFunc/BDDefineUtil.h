//
//  BDDefineUtil.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#ifndef BDDefineUtil_h
#define BDDefineUtil_h

/**
 全局宏定义
 */

/********************** define - util **********************/

/**
 判断是否是iphone4，4s
 */
#define ISIPHONE_4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640., 960.), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 判断是否是iphone5，5s,5se
 */
#define ISIPHONE_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640., 1136.), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 判断是否是iphone6/7  iphone6s/7s
 */
#define ISIPHONE_6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750., 1334.), [[UIScreen mainScreen] currentMode].size) : NO)
/**
 判断是否是iphone6P/7P  iphone6Ps/7Ps
 */
#define ISIPHONE_6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242., 2208.), [[UIScreen mainScreen] currentMode].size) : NO)
/**
 判断是否是iphoneX,XS
 */
#define ISIPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
/**
 判断是否是iphoneXR
 */
#define ISIPHONE_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 判断是否是iphoneX MAX
 */
#define ISIPHONE_X_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 设备宽度
 */
#define SCREEN_WIDTH (float)[[UIScreen mainScreen] bounds].size.width

/**
 设备高度
 */
#define SCREEN_HEIGHT (float)[[UIScreen mainScreen] bounds].size.height

//状态栏高度
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

#define IPHONE5_HEIGHT 568.

#define IPHONE6_WIDTH 375.

#define AJ_HEIGHT(a) (a*SCREEN_WIDTH/IPHONE6_WIDTH)

/**
 颜色和透明度设置
 */

#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]

#define FONT(a) [UIFont systemFontOfSize:a]



/********************** defalut-value **********************/
/**
 状态栏高度
 */
#define DEFAULT_START_HEIGHT 20.

/**间距*/
#define kPadding  10.0

/**
 导航栏高度
 */
#define DEFAULT_NAV_HEIGHT 44.

/**
 设备默认纵坐标偏移量
 */
#define DEFAULT_TOP_Y_OFFSET (IsIos7 ? DEFAULT_START_HEIGHT + DEFAULT_NAV_HEIGHT: 0)


/********************** custom-notification-name **********************/

#define AFTER_UPDATE_LOCATION_NOTIFICATION_NAME @"after_update_location"   //坐标更新后

/********************** setting **********************/
//语言
#define ENGLISH    (@"en")
#define SIMPLIFIED (@"zh-Hans")
#define TRADITION  (@"zh-Hant")

//未加载值
#define UNLOAD_VALUE @"--"

/********************** custom-localized-language **********************/
/**
 多语言文本获取
 */
#define CustomLocalizedString(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"key_language"]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]

/********************** open lib **********************/
//友盟 54d9c474fd98c53c62000301
#define UMENG_APPKEY     @"5c135432f1f55636d0000284"

//QQ 1101137187
#define Tencent_APPID        @"101533830"
//usNSzJF8C7CJcKXD 
#define Tencent_APPKEY       @"252436ec86876d35632d17b7f19f8316"
#define Tencent_redirectURI  @"www.qq.com"
#define Tencent_SCHEME       @"tencent101533830"
//41a20523
#define Tencent_QQ_SCHEME    @"QQ060d4886"

//微信 wx956bd9e26451f2de
#define Wechat_APPID        @"wx2267184bcd45a61b"
#define Wechat_APPKEY       @"7e4495f3243adf0362b6bb7552bdf3fd"
#define Wechat_SCHEME       @"wx2267184bcd45a61b"
#define Wechat_Login        @"WeChatLogin"

//微信商户号 1238931402
#define Wechat_MCH_ID          @"1516320251"
//商户API密钥，填写相应参数
#define Wechat_PARTNER_ID      @"budingjiudian4008802802budingjiu"
//支付结果回调页面
#define Wechat_NOTIFY_URL      @"http://wxpay.weixin.qq.com/pub_v2/pay/notify.v2.php"
//获取服务器端支付数据地址（商户自定义）
#define Wechat_SP_URL          @"http://wxpay.weixin.qq.com/pub_v2/app/app_pay.php"

//百度地图
#define BAIDU_KEY        @"rgGIKzGio1lTog90fLE5U7ff650g8MSY"
//#define BAIDU_KEY        @"E4AMBYpIQ9gGo4uBduMR198qjaVu92hR"//线下发行，企业版开发者账号发布时使用

//支付宝
#define Alipay_APPID        @"2014121900020769"
#define Alipay_SCHEME       @"aliask2088301484361992"

////新浪
//#define Sina_SCHEME       @"sina.559cc53b67e58e09620043c9"
//新浪
#define Sina_SCHEME       @"wb4018552791"
#define Sina_APPKEY       @"4018552791"
#define Sina_APPSECRET    @"b386100fe6f21a4f0df8817ceb16c4f0"
#define Sina_NOTIFY_URL   @"http://sns.whalecloud.com/sina2/callback"


#define TalkingData_APPID @"76499403997146F0B693886000C15979"

//用于发送短信验证码
#define SmsMessage_KEY @"8f6eef69-25a9-4484-ab95-3a7b063486bd"

/**********************NSUserDefaults*******************************/

#define  BDUserDefaults [NSUserDefaults standardUserDefaults]

#endif /* BDDefineUtil_h */

//
//  BDApplicationUtilBase.h
//  BD
//
//  Created by Podinn on 2017/9/11.
//  Copyright © 2017年 杭州睿创科技有限公司. All rights reserved.
//

#ifndef BDApplicationUtilBase_h
#define BDApplicationUtilBase_h

typedef NS_ENUM(NSUInteger, ExpressionType) {
    NODATA = 0,         //无数据
    NOAUTHORITY,          //无权限
    NOCOMPETOR,    //无竞品
};

typedef enum {
    RoomPriceType, //首页房价
    CommentViewType   //评价页面
}PodinnPriceUseType;


typedef enum {
    RoomPriceView, //首页房价
    HotelPriceList, //酒店房价列表（二级页面）
    CommentView   //评价页面
    
}OtherPriceCellUseType;

typedef NS_ENUM(NSInteger, ViewFromType) {
    ViewFromMyHotelType = 0,//自有酒店
    ViewFromOtherHotelType //其他酒店
};


#endif /* BDApplicationUtilBase_h */

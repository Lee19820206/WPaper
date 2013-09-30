//
//  GlobalDef.h
//  CYShow
//
//  Created by Lee on 13-7-4.
//  Copyright (c) 2013年 Lee. All rights reserved.
//

#ifndef CYShow_GlobalDef_h
#define CYShow_GlobalDef_h


//theme

#define CYSHOW_DAY_THEME   100
#define CYSHOW_NIGHT_THEME 101


//appID
#define App_ID @"688147997"

//ver
#define App_Ver @"V1.0"
//app has new
#define APP_NEW_VER [[NSUserDefaults standardUserDefaults] objectForKey:@"newVer"]

//[白天]
//detialCell webView[白天]html样式
#define DETAILCELL_HTML_DAY_STYLE    @"<style>body{text-align:justify;text-indent:2em;margin:0;background-color:transparent;font:12px/20px Arial}</style>"
#define BG_DAY_COLOR ([UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0])
#define TXT_DAY_COLOR ([UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0])
#define TITLE_DAY_COLOR ([UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0])
#define TABLE_HEDA_LINE_DAY_COLOR ([UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0])
#define TABLE_FOOT_LINE_DAY_COLOR ([UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0])
//hotpage的[白天]html样式
#define HOTPAGE_HTML_DAY_STYLE @"<style>body{text-align:justify;margin:0;background-color:transparent;font:12px/20px Arial}</style>"

//[夜间]
//detialCell webView[夜间]html样式
#define DETAILCELL_HTML_NIGHT_STYLE  @"<style>body{text-align:justify;text-indent:2em;margin:0;background-color:transparent;font:12px/20px Arial;color:#798492}</style>"
#define BG_NIGHT_COLOR ([UIColor colorWithRed:31/255.0 green:32/255.0 blue:35/255.0 alpha:1.0])
#define TXT_NIGHT_COLOR ([UIColor colorWithRed:121/255.0 green:132/255.0 blue:146/255.0 alpha:1.0])
#define TITLE_NIGHT_COLOR ([UIColor colorWithRed:174/255.0 green:184/255.0 blue:197/255.0 alpha:1.0])
#define TABLE_HEDA_LINE_NIGHT_COLOR ([UIColor colorWithRed:37/255.0 green:39/255.0 blue:44/255.0 alpha:1.0])
#define TABLE_FOOT_LINE_NIGHT_COLOR ([UIColor colorWithRed:23/255.0 green:25/255.0 blue:28/255.0 alpha:1.0])
//hotpage的[夜间]html样式
#define HOTPAGE_HTML_NIGHT_STYLE @"<style>body{text-align:justify;margin:0;background-color:transparent;font:12px/20px Arial;color:#798492}</style>"

//
#define CYTHEME_BG_COLOR ((CYSHOW_CURRENT_THEME == CYSHOW_DAY_THEME)?(BG_DAY_COLOR):(BG_NIGHT_COLOR))
#define CYTHEME_TXT_COLOR ((CYSHOW_CURRENT_THEME == CYSHOW_DAY_THEME)?(TXT_DAY_COLOR):(TXT_NIGHT_COLOR))
#define CYTHEME_SUB_TXT_COLOR ((CYSHOW_CURRENT_THEME == CYSHOW_DAY_THEME)?([UIColor grayColor]):(TXT_NIGHT_COLOR))
#define CYTHEME_TABLE_HEDA_LINE_COLOR ((CYSHOW_CURRENT_THEME == CYSHOW_DAY_THEME)?(TABLE_HEDA_LINE_DAY_COLOR):(TABLE_HEDA_LINE_NIGHT_COLOR))
#define CYTHEME_TABLE_FOOT_LINE_COLOR ((CYSHOW_CURRENT_THEME == CYSHOW_DAY_THEME)?(TABLE_FOOT_LINE_DAY_COLOR):(TABLE_FOOT_LINE_NIGHT_COLOR))
#define CYTHEME_HOTPAGE_HTML_STYLE ((CYSHOW_CURRENT_THEME == CYSHOW_DAY_THEME)?(HOTPAGE_HTML_DAY_STYLE):(HOTPAGE_HTML_NIGHT_STYLE))
#define CYTHEME_TITLE_COLOR ((CYSHOW_CURRENT_THEME == CYSHOW_DAY_THEME)?(TITLE_DAY_COLOR):(TITLE_NIGHT_COLOR))

#define CYSHOW_CURRENT_THEME ([[NSUserDefaults standardUserDefaults] integerForKey:@"theme"])

//************
//各种api
//************
#define STATE_OK 1
#define API_PRE @"http://192.168.1.104/wpaper/"
#define API_TODAY @"today.php"

//获取首页数据
#define HOT_SPOT_API @"http://www.ioye.com.cn/api/news.aspx"

//获取内页数据
#define DETAIL_API @"http://www.ioye.com.cn/api/newsdetail.aspx"

//获取分类的列表
#define FETCH_CATEGORY_API @"http://www.ioye.com.cn/api/news.aspx"

//发送deviceToken
#define POST_DEVICE_TOKEN_API @"http://www.ioye.com.cn/api/devicetoken.aspx"

#define GET_NEW_VER_API @"http://www.ioye.com.cn/api/getver.aspx"


//OAUth2.0  sina
#define SINA_WEIBO_OAUTH_APP_KEY @"2381795914"
#define SINA_WEIBO_OAUTH_APP_SECRET @"4840303eb8c63f8748c31a0559c68207"
#define SINA_WEIBO_REDIRECT_URI @"https://api.weibo.com/oauth2/default.html"
#define SINA_WEIBO_OAUTHORIZE @"https://api.weibo.com/oauth2/authorize"
#define SINA_WEIBO_ACCESS_TOKEN_API @"https://api.weibo.com/oauth2/access_token"
//OAUth2.0  tencent
#define TC_OAUTH_APP_KEY @"100504128"
#define TC_OAUTH_APP_SECRET @"1cb33593f692ce9e31c9b63eae7c368c"
#define TC_REDIRECT_URI @"http://qq.com"
#define TC_OAUTHORIZE @"https://graph.qq.com/oauth2.0/authorize"




//message
#define NETWORK_FAILED @"网络不给力啊"

#define NETWORK_BUSY @"网络繁忙,稍后重试- -!!!"

//
#define NUM_PER_PAGE 10

//cell图片下载之后的通知
#define MWPHOTO_LOADING_DID_END_NOTIFICATION @"MWPHOTO_LOADING_DID_END_NOTIFICATION"





//图片缓存位置
#define IMAGE_CACHE_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/ASIHTTPRequestCache/PermanentStore"]

//view ScaleLimit
#define VIEW_SCALE_LIMIT 0.98

//bgMask alpha
#define BGMASK_ALPHA 0.5

//获取内页图片宽度
#define DETAIL_VIEW_WIDTH 290

//WPTabBar  tag 偏移量
#define WPTAb_TAG_OFFSET 1000

//main View 中的btn的tag偏移量
#define MAIN_TAG_OFFSET 2000

//right View的btn的tag偏移量
#define RIGHT_TAG_OFFSET 7000

//detail View的btn的tag偏移量
#define DETAIL_TAG_OFFSET 4000

//collect View的btn的tag偏移量
#define COLLECT_TAG_OFFSET 6000

//hotpage 的btn的tag偏移量
#define HOTPAGE_TAG_OFFSET 5000

//ssoVC 的btn的tag偏移量
#define SSOV_TAG_OFFSET 8000

//shareVc 的btn的tag偏移量
#define SHARE_TAG_OFFSET 9000

//aboutVc 的btn的tag偏移量
#define ABOUT_TAG_OFFSET 9900

//各种事件
#define EVENT_COLLECT_VIEW_REMOVED @"collect view removed event"
//detailView离开舞台的事件
#define EVENT_DETAIL_VIEW_REMOVED @"detail view removed event"
#define EVENT_CHANGE_THEME @"change theme event"
#define EVENT_GET_DEVICE_TOKEN @"get device token event"
#define EVENT_SHARE_VIEW_REMOVED @"share view removed event"
#define EVENT_ABOUT_VIEW_REMOVED @"about view removed event"

//record
#define CY_DOT @"$5782$"



//当前设备的屏幕宽度
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width

//当前设备的屏幕高度
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

#define MY_H 480

//statuBar高度
#define STATU_BAR_HEIGHT 20

//头部高度
#define HEAD_H 50

//tabBarHeight
#define TAB_BAR_HEIGHT 46

//背景颜色
#define BG_COLOR [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0]

#define H_GAP 10


//Today
#define TODAY_CELL_H 350

#define TODAY_MAIN_BTN_W 130
#define TODAY_MAIN_BTN_H (SCREEN_HEIGHT * (TODAY_MAIN_BTN_W / SCREEN_WIDTH))

#define TODAY_KID_BAR_W 58
#define TODAY_KID_BAR_H 9

#define PIC_X_GAP 5
#define TODAY_PIC_W 75
#define TODAY_PIC_H (TODAY_PIC_W * (SCREEN_HEIGHT / SCREEN_WIDTH))


//iPad文章列表的宽度
#define ARTICLE_AREA_WIDTH_IPAD   568


//iKnow默认背景颜色
#define CELL_BACKGROUND  [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]

//操作指南背景色
#define GUIDE_VIEW_COLOR [UIColor colorWithRed:48.0/255.0 green:48.0/255.0 blue:48.0/255.0 alpha:1.0]

//导航条文字颜色
#define NAVIGATION_TEXT_COLOR [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]

//辅助文字颜色
#define LIGHT_TEXT_COLOR [UIColor colorWithRed:101.0/255.0 green:107.0/255.0 blue:101.0/255.0 alpha:1.0]

//蓝色字体颜色
#define BLUE_TEXT_COLOR [UIColor colorWithRed:39.0/255.0 green:117.0/255.0 blue:180.0/255.0 alpha:1.0]

//用户选中反馈颜色
#define SELECTED_BACKGROUND [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0]

//用户选中反馈颜色
#define TAG_SELECTED_BACKGROUND [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0]

//官方回复颜色
#define OFFICIAL_COLOR [UIColor colorWithRed:255.0/255.0 green:155.0/255.0 blue:57.0/255.0 alpha:1.0]

#define NAV_BAR_ITEM_COLOR [UIColor darkGrayColor]

//终于告别讨厌的长长的颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

//终于告别讨厌的长长的颜色再加一个透明度
#define ARGBCOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//无色
#define CLEANCOLOR [UIColor clearColor]


//head title
#define TODAY_HEAD_TITLE @"新鲜"

#define HEAD_TITLE_STYLE_FONT ([UIFont boldSystemFontOfSize:22])

#define ZBSTYLE1_font ([UIFont systemFontOfSize:18])
#define ZBSTYLE2_font ([UIFont systemFontOfSize:17])
#define ZBSTYLE3_font ([UIFont systemFontOfSize:16])
#define ZBSTYLE4_font ([UIFont systemFontOfSize:14])
#define ZBSTYLE5_font ([UIFont systemFontOfSize:15])
#define ZBSTYLE_font ([UIFont systemFontOfSize:14])
#define ZBSTYLE_font_smaller ([UIFont systemFontOfSize:12])
#define ZBSTYLE_tableFont ([UIFont boldSystemFontOfSize:17])
#define ZBSTYLE_highlightedTextColor ([UIColor whiteColor])
#define ZBSTYLE_tableSubTextColor (RGBCOLOR(79, 89, 105))
#define ZBSTYLE_textColor ([UIColor blackColor])

#define English_font_des ([UIFont fontWithName:@"Georgia" size:15])
#define English_font_title ([UIFont fontWithName:@"Georgia-Bold" size:17])
#define English_font_body ([UIFont fontWithName:@"Georgia" size:15])

#define English_font_des_iPad ([UIFont fontWithName:@"Georgia" size:17])
#define English_font_title_iPad ([UIFont fontWithName:@"Georgia-Bold" size:19])
#define English_font_body_iPad ([UIFont fontWithName:@"Georgia" size:17])

#define HotSpot_info_font ([UIFont fontWithName:@"Georgia" size:18])


#define kTableCellSmallMargin   6.0f
#define kTableCellSpacing       8.0f
#define kTableCellMargin        10.0f
#define kTableCellHPadding      10.0f
#define kTableCellVPadding      10.0f

//字符串
#define SAFE_STRING(str) ([(str) length] ? (str) : @"")
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

#define ENABLE_SDWEBIMAGE_DECODER


#endif

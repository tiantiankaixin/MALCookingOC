//
//  XCFUrl.h
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#ifndef XCFUrl_h
#define XCFUrl_h

#pragma mark - 下厨房
#define HomeSection0Url @"http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=ae3385fa7a2a16cda4a04b14258019a1&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=zRbAJPx6TqqUQU5TKo-73A"

#define HomeAdDataUrl @"http://api.xiachufang.com/v2/ad/show.json?slot_name=homepage_banner_ad2&height=172.5&origin=iphone&api_sign=16128eeb78abd2e694a62ca9eee5ef33&width=690&sk=zRbAJPx6TqqUQU5TKo-73A&supported_types=1&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"

#define HomeIssuesDataUrl @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=a817d07fb7662ca91c7644e9380cf4e0&sk=zRbAJPx6TqqUQU5TKo-73A&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"


#pragma mark - 市集
#define MarketUrl @"https://www.xiachufang.com/page/ec-tab/?version=12"


#pragma mark - 社区
//首页url
#define CommunityIndexUrl @"http://api.xiachufang.com/v2/social/init_page.json?origin=iphone&longitude=&api_sign=be1230617fcac6650c325b1ba0b0da54&sk=zRbAJPx6TqqUQU5TKo-73A&latitude=&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"


//主题
//主题列表
#define TopicListUrl @"http://api.xiachufang.com/v2/forums/2/topics.json?offset=0&origin=iphone&api_sign=3d1b537c1786e169000b7192103cef5e&sk=zRbAJPx6TqqUQU5TKo-73A&limit=20&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00"
//单个主题
#define TopicWithID(ID)  [NSString stringWithFormat:@"http://api.xiachufang.com/v2/topics/%@/comments.json?offset=0&origin=iphone&api_sign=3d1b537c1786e169000b7192103cef5e&sk=zRbAJPx6TqqUQU5TKo-73A&limit=20&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00",ID]

#endif

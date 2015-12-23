//
//  MALAFNManger.m
//  MALCookingOC
//
//  Created by wangtian on 15/12/18.
//  Copyright © 2015年 wangtian. All rights reserved.
//

#import "MALAFNManger.h"

#define AFNRequestTimeout  15
#define AFNGeneralManager  [MALAFNManger shareAFNManger].generalSession
#define AFNJsonManager     [MALAFNManger shareAFNManger].jsonSession

static MALAFNManger *manger = nil;


@interface MALAFNManger()

@property (nonatomic, strong) AFHTTPSessionManager *generalSession;
@property (nonatomic, strong) AFHTTPSessionManager *jsonSession;

@end

@implementation MALAFNManger

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (manger == nil)
    {
        manger = [super allocWithZone:zone];
    }
    return manger;
}

+ (MALAFNManger *)shareAFNManger
{
    if (manger == nil)
    {
        manger = [[super alloc] init];
        [manger setTimeOut:AFNRequestTimeout];
    }
    return manger;
}

- (AFHTTPSessionManager *)generalSession
{
    if (_generalSession == nil)
    {
        _generalSession = [AFHTTPSessionManager manager];
        //NSURLSessionConfiguration
        _generalSession.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _generalSession;
}

- (AFHTTPSessionManager *)jsonSession
{
    if (_jsonSession == nil)
    {
        _jsonSession = [AFHTTPSessionManager manager];
        _jsonSession.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return _jsonSession;
}

#pragma mark - 设置请求超时时间
- (void)setTimeOut:(NSTimeInterval)time
{
    [self.generalSession.requestSerializer setTimeoutInterval:time];
    [self.jsonSession.requestSerializer setTimeoutInterval:time];
}

+ (void)getDataWithUrl:(NSString *)url parameters:(NSDictionary *)parameters finish:(FinishBlock)finish des:(NSString *)des
{
    //TODO: 方法过期。。 有时间再研究吧。。。
    [AFNGeneralManager GET:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        RequestResult *result = [[RequestResult alloc] init];
        result.requestData = YNDic(responseObject);
        result.requestStr = YNStr(responseObject);
        [MALAFNManger logFullUrl:url andParameters:parameters outPut:result des:des];
        finish(result);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MALAFNManger logFullUrl:url andParameters:parameters outPut:@"请求失败" des:des];
        finish([RequestResult requestWithError:error]);
    }];
}

//  打印出请求链接全路径    <待修改>
+ (NSString *)logFullUrl:(NSString *)urlString  andParameters:(NSDictionary *)pa outPut:(id)outPut des:(NSString *)des
{
    NSMutableString *paString = [[NSMutableString alloc] init];
    [paString appendString:[NSString stringWithFormat:@"%@",urlString]];
    if (pa != nil)
    {
        [paString appendString:@"&"];
    }
    NSInteger paCount = pa.count;
    __block NSInteger index = 0;
    [pa enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
     {
         [paString appendFormat:@"%@=%@",key,obj];
         index++;
         if (index != paCount) {
             
             [paString appendString:@"&"];
         }
     }];
    if ([outPut isKindOfClass:[RequestResult class]])
    {
        RequestResult *result = (RequestResult *)outPut;
        outPut = result.requestData;
        if (result.requestData == nil)
        {
            outPut = result.requestStr;
        }
    }
    YNLog(@"\n{\n\n 请求url : %@\n\n 请求描述 : %@\n\n 请求结果 : %@\n\n}\n",paString,des,outPut);
    return paString;
}

@end

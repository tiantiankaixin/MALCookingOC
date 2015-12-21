//
//  NSString+YN.h
//  YNDoctor
//
//  Created by Elaine on 15--24.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SafeString(str) [NSString getSafeStr:str]

@interface NSString (YN)

/**
*  判断输入的字符串是否全是英文
*
*  @param str 输入字符串
*
*  @return      YES: 是     NO：否
*/
+ (BOOL)isEnString:(NSString *)str;

/**
 *  判断输入的是否全是中文
 *
 *  @param str 输入字符串
 *
 *  @return     YES：是   NO：否
 */
+ (BOOL)isChineseString:(NSString *)str;

/**
 *  判断输入的是否全是数字
 *
 *  @param str 输入字符串
 *
 *  @return     YES：是   NO：否
 */
+ (BOOL)isNumString:(NSString *)str;

/**
 *  是否是一个有效的手机号
 *
 *  @return YES 是   NO 否
 */
- (BOOL)isMobileNumber;

/**
 *  是否是一个有效的邮箱
 *
 *  @return YES 是   NO 否
 */
- (BOOL)isEmail;


- (NSDictionary *)JSONStringToDic;


/**
 *清楚字符串空格
 */
- (NSString *)clearBlank;


/**
 *  utf-8编码
 *
 *  @return utf-8编码
 */
- (NSString *)utf8String;

/**
 *  gbk转码
 *
 *  @return <#return value description#>
 */
- (NSString *)gbkStr;

/**
 *  3.5 = 4  3.3 = 3
 *
 *  @return 四舍五入
 */
- (NSString *)getIntStr;

/**
 *  得到安全的字符串
 *
 *  @param ob id 类型
 *
 *  @return   如果是NSValue类型转为NSString  如果是nil或者NSNull返回@""   否则返回本身
 */
+ (NSString *)getSafeStr:(id)ob;

+ (NSInteger)getSafeNumber:(id)obj;

+ (id)safeObject:(id)obj;

- (NSString *)utf8ToGBK;

/**
 *  判断字符串是否包含emoji字符
 *
 *  @return YES 有
 */
- (BOOL)stringContainsEmoji;

/**
 *  得到md5编码后的字符串
 *
 *  @return md5字符串
 */
- (NSString *)md5Str;

- (CGFloat)stringHeightWithAttributes:(NSDictionary *)attributes viewWidth:(CGFloat)viewWidth minHeight:(CGFloat)minHeight;

+ (NSString *)changToStr:(id)shouldChange;

@end

//
//  NSString+YN.m
//  YNDoctor
//
//  Created by Elaine on 15--24.
//  Copyright (c) 2015年 yinuo. All rights reserved.
//

#import "NSString+YN.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YN)

// 判断输入的字符串是否全是英文
+ (BOOL)isEnString:(NSString *)str
{
    NSString *regex = @"^[a-zA-Z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
}

//  判断输入的是否全是中文
+ (BOOL)isChineseString:(NSString *)str
{
    NSString *regex = @"^[\u4e00-\u9fa5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
}

//  判断输入的是否全是数字
+ (BOOL)isNumString:(NSString *)str
{
    NSString *regex = @"^[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:str];
}

#pragma mark - 是否是一个有效地手机号
- (BOOL)isMobileNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,147,150,151,152,157,158,159,178,182,183,184,187,188
     * 联通：130,131,132,145,155,156,176,185,186
     * 电信：133,1349,153,177,180,181,189
     * 虚拟：170(电信是1700；联通是1709；移动是1705)
     */
    
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|47|5[0-27-9]|78|8[2-478])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,176,185,186
     */
    NSString * CU = @"^1(3[0-2]|45|5[56]|76|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,177,180,181,189
     */
    NSString * CT = @"^1((33|77|53|8[019])[0-9]|349)\\d{7}$";
    /**
     * 虚拟：Virtual
     * 170
     */
    NSString * VT = @"^(170)\\d{8}$";
    
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestvt = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", VT];
    
    if (([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES)
        || ([regextestvt evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - 是否是一个有效地邮箱
- (BOOL)isEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


- (NSDictionary *)JSONStringToDic
{
    NSData *JSONData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}

#pragma mark - 清除字符串中得空格
- (NSString *)clearBlank
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark - utf8编码
- (NSString *)utf8String
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - gbk转码
- (NSString *)gbkStr
{
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [[NSString alloc] initWithData:data encoding:gbkEncoding];
}

- (NSString *)utf8ToGBK
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingGB_2312_80));
    return result;
}

- (NSString *)getIntStr
{
    NSString *result;
    NSArray *strArray = [self componentsSeparatedByString:@"."];
    int tou;
    if(strArray.count == 1)
    {
        return [strArray firstObject];
    }
    if (strArray.count != 2)
    {
        return nil;
    }
    else
    {
        tou = [strArray[0] intValue];
        int wei = [[(NSString *)strArray[1] substringWithRange:NSMakeRange(0, 1)] intValue];
        if (wei >= 5)
        {
            tou++;
        }
    }
    result = [NSString stringWithFormat:@"%d",tou];
    return result;
}

#pragma mark - 得到安全的字符串
+ (NSString *)getSafeStr:(id)ob
{
    if(ob == nil || [ob isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    if ([ob isKindOfClass:[NSValue class]])
    {
        ob = [NSString stringWithFormat:@"%@",ob];
    }
    return ob;
}

+ (id)safeObject:(id)obj
{
    if ([obj isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    return obj;
}

+ (NSInteger)getSafeNumber:(id)obj
{
    if ([obj isKindOfClass:[NSNull class]])
    {
        return 0;
    }
    return [obj integerValue];
}

#pragma mark - 判断一个字符串是否包含emoji字符
- (BOOL)stringContainsEmoji
{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    return returnValue;
}

#pragma mark 使用MD5加密字符串
- (NSString *)md5Str
{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

- (CGFloat)stringHeightWithAttributes:(NSDictionary *)attributes viewWidth:(CGFloat)viewWidth minHeight:(CGFloat)minHeight
{
    //iOS 7+
    CGSize strSize = [self boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    if (strSize.height < minHeight)
    {
        strSize.height = minHeight;
    }
    return strSize.height;
}

+ (NSString *)changToStr:(id)shouldChange
{
    NSString * str = [NSString stringWithFormat:@"%@",shouldChange];
    return str;
}

@end

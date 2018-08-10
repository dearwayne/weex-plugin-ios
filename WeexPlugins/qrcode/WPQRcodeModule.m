//
//  WPQRcodeModule.m
//  WeexPlugins
//
//  Created by DoNow on 2018/8/9.
//  Copyright © 2018 DoNow. All rights reserved.
//

#import "WPQRcodeModule.h"
#import <LBXScan/LBXScanNative.h>
#import <WeexPluginLoader/WeexPluginLoader.h>

WX_PlUGIN_EXPORT_MODULE(qrcode, WPQRcodeModule)

@implementation WPQRcodeModule

WX_EXPORT_METHOD_SYNC(@selector(createQR:))

-(UIImage *)createQR:(NSDictionary *)options {
    NSString *text = [WXConvert NSString:options[@"text"]];
    CGFloat width = [WXConvert CGFloat:options[@"size"][@"width"]];
    CGFloat height = [WXConvert CGFloat:options[@"size"][@"height"]];
    CGSize size = CGSizeMake(width, height);
    UIColor *color = [WXConvert UIColor:options[@"color"]];
    UIColor *bkcolor = [WXConvert UIColor:options[@"backgroundColor"]];
    return [LBXScanNative createQRWithString:text QRSize:size QRColor:color bkColor:bkcolor];
}

@end

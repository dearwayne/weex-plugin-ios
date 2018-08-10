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
    UIColor *bkColor = [WXConvert UIColor:options[@"bkColor"]];
    NSString *bkImage = [WXConvert NSString:options[@"bkImage"][@"url"]];
    if (bkImage) {
        CGFloat bkWidth = [WXConvert CGFloat:options[@"bkImage"][@"width"]];
        CGFloat bkHeight = [WXConvert CGFloat:options[@"bkImage"][@"height"]];
        CGFloat offsetX = [WXConvert CGFloat:options[@"bkImage"][@"offsetX"]];
        CGFloat offsetY = [WXConvert CGFloat:options[@"bkImage"][@"offsetY"]];
        UIImage *qrImage = [LBXScanNative createQRWithString:text QRSize:size QRColor:color bkColor:bkColor];
    }
    return [LBXScanNative createQRWithString:text QRSize:size QRColor:color bkColor:bkColor];
}

@end

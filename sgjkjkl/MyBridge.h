//
//  MyBridge.h
//  TestH5
//
//  Created by 胡礼来 on 16/6/20.
//  Copyright © 2016年 kobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>


@protocol MyBridgeDelegate <JSExport>
JSExportAs
(doApp,
 - (void)doApp:(NSInteger)type jsonString:(NSString *)jsonString
 );

//-(void)doApp:(NSInteger)type jsonString:(NSString*)jsonString;

@end
@interface MyBridge : NSObject<MyBridgeDelegate>
@property (nonatomic,strong)JSContext *jsContext;


@end

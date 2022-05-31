//
//  XCFlutterVC.h
//  XCSDK
//
//  Created by eric on 2020/1/11.
//  Copyright © 2020 eric. All rights reserved.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCFlutterVC : FlutterViewController
@property (nonatomic, copy, nullable) NSString *pageId;
@property (nonatomic, copy, nullable) NSString *uiStyle;
@end

NS_ASSUME_NONNULL_END

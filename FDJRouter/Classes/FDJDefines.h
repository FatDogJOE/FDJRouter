//
//  FDJDefines.h
//  FDJRouter
//
//  Created by mac on 2019/11/1.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#ifndef FDJDefines_h
#define FDJDefines_h

typedef NS_ENUM(NSUInteger, OpenType) {
    OpenTypePush,
    OpenTypePresent,
    OpenTypeAuto
};

typedef void(^FinishedCallback)(NSDictionary * _Nullable info);

#endif /* FDJDefines_h */

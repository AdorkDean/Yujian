//
//  KGDefine.h
//  遇见智能
//
//  Created by KG on 2017/12/19.
//  Copyright © 2017年 KG祁增奎. All rights reserved.
//

#ifndef KGDefine_h
#define KGDefine_h

#define KGscreenWidth [UIScreen mainScreen].bounds.size.width
#define KGscreenHeight [UIScreen mainScreen].bounds.size.height
//黄色
#define KGYellowColor [UIColor colorWithRed:255/255.0 green:209/255.0 blue:43/255.0 alpha:1]
//自定义颜色
#define KGcolor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
//橘色
#define KGOrangeColor [UIColor colorWithRed:(255)/255.f green:(70)/255.f blue:(17)/255.f alpha:1.f]
//请求管理者
#define KGManager [AFHTTPRequestOperationManager manager]
//判断是否是iPhone X
#define KGDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//设置字号
#define KGFont(h) [UIFont systemFontOfSize:h]

#endif /* KGDefine_h */

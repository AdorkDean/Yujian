//
//  KGOrderInfoModel.m
//  遇见智能
//
//  Created by KG on 2018/1/24.
//  Copyright © 2018年 KG祁增奎. All rights reserved.
//

#import "KGOrderInfoModel.h"

@implementation KGOrderInfoModel


- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
}

@end

//
//  TestModel.m
//  RolloutDemo
//
//  Created by Harry on 16/5/17.
//  Copyright © 2016年 HarryDeng. All rights reserved.
//

#import "TestModel.h"

#import <objc/runtime.h>

@implementation TestModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

+ (NSValueTransformer *)appJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:AppModel.class];
}

+ (NSValueTransformer *)envJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:EnvModel.class];
}

+ (NSValueTransformer *)eventJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:EventModel.class];
}

+ (NSValueTransformer *)pageJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:PageModel.class];
}

+ (NSValueTransformer *)userJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:UserModel.class];
}



+ (id)testModel{
    TestModel *model = [[TestModel alloc] init];
    model.uuid = @"iosiosiosiosiosuuioduid";
    model.bid = @"iosiosiosbuidbuid";
    
    AppModel *app = [AppModel new];
    app.version = @"6.6";
    app.channel = @"iOS2131";
    model.app = app;
    
    NSMutableArray *events = [NSMutableArray array];
    EventModel *event = [EventModel new];
    event.t = @"预约看房";
    event.s = 1461582081;
    event.ss = @"91441498d94dd301";
    event.ri = 234;
    [events addObject:event];
    model.event = events;
    
    EnvModel *env = [EnvModel new];
    env.network = @"WiFi";
    env.deviceToken = @"399a8f49bf91441498d94dd3017e535a";
    env.os = @"iPhone OS 9.3";
    env.carrier = @"liantong";
    model.env = env;
    
    NSMutableArray *pages = [NSMutableArray array];
    PageModel *page = [PageModel new];
    page.ss = @"xxx";
    page.ur = @"xxx";
    page.ul = @"xxx";
    page.st = 23;
    page.ct = 343;
    page.ri = 3432;
    [pages addObject:page];
    model.page = pages;
    
    UserModel *user = [UserModel new];
    user.phone = @"123124123413";
    user.userId = 123123;
    model.user = user;
    
    return model;
}

+ (NSData *)getTestData{
    TestModel *model = [TestModel testModel];
    NSError *parseError0 = nil;
    NSDictionary *dic = [MTLJSONAdapter JSONDictionaryFromModel:model error:&parseError0];
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *ss = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonData;
}

@end


@implementation AppModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

@end


@implementation EnvModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

@end


@implementation UserModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

@end


@implementation EventModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

@end


@implementation PageModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

@end



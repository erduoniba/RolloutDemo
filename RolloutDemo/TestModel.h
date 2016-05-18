//
//  TestModel.h
//  RolloutDemo
//
//  Created by Harry on 16/5/17.
//  Copyright © 2016年 HarryDeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle/Mantle.h"

@class AppModel,EnvModel,UserModel,EventModel,PageModel;


@interface TestModel : MTLModel <MTLJSONSerializing>


@property (nonatomic, strong) AppModel *app;

@property (nonatomic, strong) NSArray<EventModel *> *event;

@property (nonatomic, copy) NSString *uuid;

@property (nonatomic, strong) EnvModel *env;

@property (nonatomic, copy) NSString *bid;

@property (nonatomic, strong) NSArray<PageModel *> *page;

@property (nonatomic, strong) UserModel *user;


+ (id)testModel;
+ (NSData *)getTestData;


@end


@interface AppModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *version;

@property (nonatomic, copy) NSString *channel;

@end



@interface EnvModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *network;

@property (nonatomic, copy) NSString *os;

@property (nonatomic, copy) NSString *device;

@property (nonatomic, copy) NSString *carrier;

@property (nonatomic, copy) NSString *deviceToken;

@end



@interface UserModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) NSInteger userId;

@end



@interface EventModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *t;

@property (nonatomic, assign) NSInteger s;

@property (nonatomic, copy) NSString *ss;

@property (nonatomic, assign) NSInteger ri;

@end




@interface PageModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *ur;

@property (nonatomic, assign) NSInteger ct;

@property (nonatomic, assign) NSInteger st;

@property (nonatomic, copy) NSString *ss;

@property (nonatomic, copy) NSString *ul;

@property (nonatomic, assign) NSInteger ri;

@end


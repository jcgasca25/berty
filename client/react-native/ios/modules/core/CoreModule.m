//
//  CoreModule.m
//  berty
//
//  Created by Godefroy Ponsinet on 29/08/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "React/RCTBridge.h"

@interface RCT_EXTERN_REMAP_MODULE(CoreModule, CoreModule, NSObject)

RCT_EXTERN_METHOD(initialize:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(listAccounts:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(start:(NSString)nickname
                    resolve:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(restart:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(dropDatabase:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(getPort:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(getNetworkConfig:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(updateNetworkConfig:(NSString *)config
                    resolve:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(isBotRunning:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(startBot:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject);

RCT_EXTERN_METHOD(stopBot:(RCTPromiseResolveBlock)resolve
                    reject:(RCTPromiseRejectBlock)reject);

@end

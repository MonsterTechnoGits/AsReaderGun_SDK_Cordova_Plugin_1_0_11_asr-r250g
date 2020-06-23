//
//  FileModel.h
//  AsRingSample
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 mrx_DS.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FloderModel.h"

@interface FileModel : NSObject
@property (strong, nonatomic, readonly)FloderModel *superFloder;
@property (strong, nonatomic)NSString *fileName;
@property (strong, nonatomic)NSString *fileType;
@property (strong, nonatomic)NSDate *createTime;
@property (strong, nonatomic,readonly)NSString *path;
@property (assign, nonatomic)NSUInteger byte;
@property (strong, nonatomic)NSData *data;

- (instancetype)initWithSuperFloder:(FloderModel *)superFloder;
@end

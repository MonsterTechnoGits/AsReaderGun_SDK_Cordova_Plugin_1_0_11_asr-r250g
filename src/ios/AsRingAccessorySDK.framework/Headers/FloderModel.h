//
//  FloderModel.h
//  AsRingSample
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 mrx_DS.Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FileModel;
@interface FloderModel : NSObject
@property (strong, nonatomic, readonly)FloderModel *superFloder;
@property (strong, nonatomic)NSString *floderName;
@property (strong, nonatomic)NSDate *createTime;
@property (strong, nonatomic,readonly)NSString *path;

@property (strong, nonatomic)NSMutableArray *files;

- (instancetype)initWithSuperFloder:(FloderModel *)superFloder;

- (id)selectFileWithIndex:(NSUInteger)index;
@end

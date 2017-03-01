//
//  DDSectionModel.h
//  UItableview Cell的点击
//
//  Created by apple on 28/2/17.
//  Copyright © 2017年 mark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDCellModel.h"

@interface DDSectionModel : NSObject


/**
  头部
 */
@property (nonatomic, copy) NSString *sectionTitle;

/**
  是否展开
 */
@property (nonatomic, assign) BOOL isExpanded;

/**
 cell的模型
 */
@property (nonatomic, strong) NSArray<DDCellModel *> *cellModels;



+ (void)loadData:(void(^)(NSArray *models))finished;



@end

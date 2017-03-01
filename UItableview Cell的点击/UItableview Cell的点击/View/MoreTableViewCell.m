//
//  MoreTableViewCell.m
//  UItableview Cell的点击
//
//  Created by apple on 28/2/17.
//  Copyright © 2017年 mark. All rights reserved.
//

#import "MoreTableViewCell.h"

@implementation MoreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellModel:(DDCellModel *)cellModel{

     _cellModel = cellModel;
    
     self.textLabel.text = cellModel.title;

}


@end

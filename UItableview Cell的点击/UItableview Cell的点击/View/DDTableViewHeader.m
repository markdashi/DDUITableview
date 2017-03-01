//
//  DDTableViewHeader.m
//  UItableview Cell的点击
//
//  Created by apple on 28/2/17.
//  Copyright © 2017年 mark. All rights reserved.
//

#define ScreenW  [UIScreen mainScreen].bounds.size.width

#import "DDTableViewHeader.h"
#import "UIColor+Extension.h"

@interface DDTableViewHeader ()

@property (nonatomic,strong) UIImageView *directionImageView;

@end


@implementation DDTableViewHeader



- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setupItems];
    }
    
    return self;
}


- (void)setupItems{

    //右上角箭头图片
    self.directionImageView.image = [UIImage imageNamed:@"brand_expand"];
    self.directionImageView.frame = CGRectMake(ScreenW - 30, (44-8)/2, 15, 8);
    [self.contentView addSubview:self.directionImageView];

    //btn覆盖header,相应点击
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 44)];
    button.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:button];
    [button addTarget:self action:@selector(headerClick:) forControlEvents:UIControlEventTouchUpInside];
    self.contentView.backgroundColor = [UIColor defaultColor];
    self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.contentView.layer.borderWidth = 0.5;

}

- (void)headerClick:(UIButton *)btn{

    self.sectionModel.isExpanded = !self.sectionModel.isExpanded;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        if (!self.sectionModel.isExpanded) {
            
            self.directionImageView.transform = CGAffineTransformIdentity;
            
        }else{
        
            self.directionImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }

    }];
    
    if (self.HeaderClickedBack) {
        
        self.HeaderClickedBack(self.sectionModel.isExpanded);
    }


}



- (UIImageView *)directionImageView{


    if (!_directionImageView) {
        
        _directionImageView = [[UIImageView alloc] init];
    }

    return _directionImageView;
}


- (void)setSectionModel:(DDSectionModel *)sectionModel{

    _sectionModel = sectionModel;
    
    self.textLabel.text = sectionModel.sectionTitle;
    
    if (!_sectionModel.isExpanded) {
        
        self.directionImageView.transform = CGAffineTransformIdentity;
        
    }else{
    
        self.directionImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }


}




@end

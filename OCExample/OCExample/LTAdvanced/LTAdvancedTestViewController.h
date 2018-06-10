//
//  LTAdvancedTestViewController.h
//  OCExample
//
//  Created by 高刘通 on 2018/4/19.
//  Copyright © 2018年 LT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestTableViewProtocol

- (void)viewDidTap:(UIView *)view atPotin:(CGPoint)location;

@end

@interface TestTableView : UITableView

@property(nonatomic,strong)UIView<TestTableViewProtocol> *headerView;

@end

/////////////////////////
@interface LTAdvancedTestViewController : UIViewController

@property(nonatomic,strong)UIView<TestTableViewProtocol> *headerView;

@end

//
//  MineController.m
//  ios-demo
//
//  Created by 曹先运 on 2020/7/16.
//  Copyright © 2020 Tee-cxy. All rights reserved.
//

#import "MineController.h"

@interface MineController ()
@property(nonatomic,assign)CGRect viewRect;
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UIView * userCenter;
@property(nonatomic,strong)UIView * createCenter;
@property(nonatomic,strong)UIView * recommendService;
@property(nonatomic,strong)UIView * moreService;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的";
    _viewRect = [UIScreen mainScreen].bounds;
    
    [self addScrollView];
    [self initSubViews];
    [self configUserCenter];
    [self configCreateCenter];
    [self configRecommendService];
    [self configMoreService];
}

-(void)initSubViews{
    _userCenter = [[UIView alloc]init];
    _createCenter = [[UIView alloc]init];
    _recommendService = [[UIView alloc]init];
    _moreService = [[UIView alloc]init];
    
    [_scrollView addSubview:_userCenter];
    [_scrollView addSubview:_createCenter];
    [_scrollView addSubview:_recommendService];
    [_scrollView addSubview:_moreService];
}

- (void)addScrollView{
    self.scrollView = [[UIScrollView alloc]init];
    _scrollView.frame = CGRectMake(0, 0, _viewRect.size.width, 5500);
    _scrollView.backgroundColor = [UIColor grayColor];
//    _scrollView.scrollEnabled = YES;
    [self.view addSubview:_scrollView];
}

- (void)configUserCenter
{
    _userCenter.frame = CGRectMake(0, 0, _viewRect.size.width, 100);
    _userCenter.backgroundColor = [UIColor orangeColor];
    
}

- (void)configCreateCenter
{
    _createCenter.frame = CGRectMake(0, CGRectGetMaxY(_userCenter.frame), _viewRect.size.width, 200);
    _createCenter.backgroundColor = [UIColor blackColor];
}

- (void)configRecommendService
{
    _recommendService.frame = CGRectMake(0, CGRectGetMaxY(_createCenter.frame), _viewRect.size.width, 200);
    _recommendService.backgroundColor = [UIColor greenColor];
}

-(void)configMoreService
{
    _moreService.frame = CGRectMake(0, CGRectGetMaxY(_recommendService.frame), _viewRect.size.width, 200);
    _moreService.backgroundColor = [UIColor purpleColor];
}

@end

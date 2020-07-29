//
//  MineController.m
//  ios-demo
//
//  Created by 曹先运 on 2020/7/16.
//  Copyright © 2020 Tee-cxy. All rights reserved.
//

#import "MineController.h"

@interface MineController ()
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;

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
    self.title = @"我的";
    _width = [UIScreen mainScreen].bounds.size.width;
    _height = [UIScreen mainScreen].bounds.size.height;
    [self initSubViews];
    [self configScrollView];
    [self configUserCenter];
    [self configCreateCenter];
    [self configRecommendService];
    [self configMoreService];
}

-(void)initSubViews{
    self.scrollView = [[UIScrollView alloc]init];
    self.userCenter = [[UIView alloc]init];
    self.createCenter = [[UIView alloc]init];
    self.recommendService = [[UIView alloc]init];
    self.moreService = [[UIView alloc]init];
    
    [_scrollView addSubview:_userCenter];
    [_scrollView addSubview:_createCenter];
    [_scrollView addSubview:_recommendService];
    [_scrollView addSubview:_moreService];
    
}

- (void)configScrollView{
    _scrollView.frame = CGRectMake(0, 0, _width, _height);
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.contentSize = CGSizeMake(_width, _height*1.2);
    _scrollView.showsVerticalScrollIndicator = false;
    [self.view addSubview:self.scrollView];
}
//用户
- (void)configUserCenter
{
    _userCenter.frame = CGRectMake(0, 0, _width, 100);
    UIButton * headBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    [headBtn setImage:[UIImage imageNamed:@"face"] forState:UIControlStateNormal];
    headBtn.imageView.layer.cornerRadius = headBtn.frame.size.width/2;
    headBtn.imageView.layer.masksToBounds = true;
    [headBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [_userCenter addSubview:headBtn];
    
    UILabel * name = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 200, 20)];
    name.text = @"cslive0222";
    name.textColor = [UIColor systemPinkColor];
    [_userCenter addSubview:name];
}

- (void)btnClicked
{
    NSLog(@"22333~~");
}

//创作中心
- (void)configCreateCenter
{
    _createCenter.frame = CGRectMake(0, CGRectGetMaxY(_userCenter.frame)+50, _width, 100);
    
    UILabel * centerLabel = [[UILabel alloc]initWithFrame:CGRectMake(6, 0, 100, 20)];
    centerLabel.text = @"创作中心";
    centerLabel.textColor = [UIColor blackColor];
    centerLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
    [_createCenter addSubview:centerLabel];
    
    NSArray * namelist = [NSArray arrayWithObjects:@"创作首页", @"稿件管理", @"创作激励", @"热门活动", nil];
    for (int i =0; i<namelist.count; i++) {
        UIButton * btn = [[ UIButton alloc]initWithFrame:CGRectMake(35 + i*(_width/4 - 10), 40, 60, 60)];
        [btn setImage:[UIImage imageNamed:namelist[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:namelist[i]] forState:UIControlStateSelected];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 14, 25, 14)];
        btn.tag = i;
        btn.accessibilityIdentifier = [NSString stringWithFormat:@"%d", i];
        
        [btn setTitle:namelist[i] forState:UIControlStateNormal];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(45, -60, 0, -30)];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        [btn addTarget:self action:@selector(btnCenter:) forControlEvents:UIControlEventTouchUpInside];
        [_createCenter addSubview:btn];
    }
}

-(void)btnCenter:(UIButton *)btn
{
    NSLog(@"%ld", btn.tag);
}

//推荐服务
- (void)configRecommendService
{
    _recommendService.frame = CGRectMake(0, CGRectGetMaxY(_createCenter.frame)+20, _width, 280);
//    _recommendService.backgroundColor = [UIColor greenColor];

    UILabel * centerLabel = [[UILabel alloc]initWithFrame:CGRectMake(6, 0, 100, 20)];
    centerLabel.text = @"推荐服务";
    centerLabel.textColor = [UIColor blackColor];
    centerLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
    [_recommendService addSubview:centerLabel];
    
    NSArray * namelist = [NSArray arrayWithObjects:@"我的课程", @"看视频免流量", @"个性装扮", @"邀好友赚红包", nil];
    for (int i =0; i<namelist.count; i++) {
        UIImageView * imageView0 = [[UIImageView alloc]initWithFrame:CGRectMake(50 + i*(_width/4 - 10), 40, 30, 30)];
        imageView0.image = [UIImage imageNamed:namelist[i]];
        
        [_recommendService addSubview:imageView0];
        
        UILabel * label0 = [[UILabel alloc]initWithFrame:CGRectMake(35 + i*(_width/4 - 10), CGRectGetMaxY(imageView0.frame)+10, 85, 15)];
        label0.text = namelist[i];
        label0.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        [_recommendService addSubview:label0];
    }
    
    NSArray * namelist2 = [NSArray arrayWithObjects:@"游戏中心", @"我的钱包", @"会员购中心", @"直播中心", nil];
    for (int i =0; i<namelist2.count; i++) {
        UIImageView * imageView0 = [[UIImageView alloc]initWithFrame:CGRectMake(50 + i*(_width/4 - 10), 120, 30, 30)];
        imageView0.image = [UIImage imageNamed:namelist2[i]];
        
        [_recommendService addSubview:imageView0];
        
        UILabel * label0 = [[UILabel alloc]initWithFrame:CGRectMake(35 + i*(_width/4 - 10), CGRectGetMaxY(imageView0.frame)+10, 85, 15)];
        label0.text = namelist2[i];
        label0.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        [_recommendService addSubview:label0];
    }
    
    NSArray * namelist3 = [NSArray arrayWithObjects:@"创作学院", @"反馈论坛", @"BW乐园", nil];
    for (int i =0; i<namelist3.count; i++) {
        UIImageView * imageView0 = [[UIImageView alloc]initWithFrame:CGRectMake(50 + i*(_width/4 - 10), 200, 30, 30)];
        imageView0.image = [UIImage imageNamed:namelist3[i]];
        
        [_recommendService addSubview:imageView0];
        
        UILabel * label0 = [[UILabel alloc]initWithFrame:CGRectMake(42 + i*(_width/4 - 10), CGRectGetMaxY(imageView0.frame)+10, 85, 15)];
        label0.text = namelist3[i];
        label0.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        [_recommendService addSubview:label0];
    }
}

//更多设置
-(void)configMoreService
{
    _moreService.frame = CGRectMake(0, CGRectGetMaxY(_recommendService.frame)+10, _width, 200);
//    _moreService.backgroundColor = [UIColor purpleColor];
    
    UILabel * centerLabel = [[UILabel alloc]initWithFrame:CGRectMake(6, 0, 100, 20)];
    centerLabel.text = @"更多服务";
    centerLabel.textColor = [UIColor blackColor];
    centerLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
    [_moreService addSubview:centerLabel];
    
    NSArray * namelist3 = [NSArray arrayWithObjects:@"联系客服", @"课堂模式", @"青少年模式", @"设置", nil];
    for (int i =0; i<namelist3.count; i++) {
        UIImageView * imageView0 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 40 + i*40, 25, 25)];
        imageView0.image = [UIImage imageNamed:namelist3[i]];
        
        [_moreService addSubview:imageView0];
        
        UILabel * label0 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView0.frame)+10, 45+i*40, 85, 15)];
        label0.text = namelist3[i];
        label0.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
        [_moreService addSubview:label0];
    }
}

@end

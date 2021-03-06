//
//  KGIdeaViewController.m
//  遇见智能
//
//  Created by KG on 2017/12/19.
//  Copyright © 2017年 KG祁增奎. All rights reserved.
//

#import "KGIdeaViewController.h"
#import <MessageUI/MessageUI.h>

@interface KGIdeaViewController ()<UITextViewDelegate,MFMessageComposeViewControllerDelegate>{
    UITextView *contentTextView;
    //在UITextView上面覆盖个UILable
    UILabel *placeHolder;
}

@end

@implementation KGIdeaViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    /**
     设置UItextview中的提示文字，制造出预留字效果，当开始编辑是影藏，每次进入页面时清空UItextview，显示预留字
     **/
    contentTextView.text = @"";
    placeHolder.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"投诉建议";
    self.view.backgroundColor = KGcolor(231, 231, 231, 1);
    
    [self setUpLeftNavButtonItmeTitle:@"" icon:@"Return"];
    
    [self setTextView];
}

- (void)jionOutClick:(UIButton *)sender{
    if (contentTextView.text.length > 1) {
        /*
         *调用手机发送短信
         */
        if( [MFMessageComposeViewController canSendText] )
        {
            //初始化短信发送窗口
            MFMessageComposeViewController *message = [[MFMessageComposeViewController alloc]init];
            //文本内容
            message.body = contentTextView.text;
            //目标手机号，是一个数组，可以同时向多个人发送短信，用的系统的短信发送接口
            message.recipients = @[@"18801496926"];
            //遵守协议，然后在代理方法里面实现短信发送成功后是否返回软件
            message.messageComposeDelegate = self;
            [self presentViewController:message animated:YES completion:nil];
        }
        
    }else{
        [self alertViewControllerTitle:@"提示" message:@"请输入您宝贵的意见" name:@"确定" type:0 preferredStyle:1];
    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
    if (result == MessageComposeResultCancelled) {//点击取消发送按钮后走这个判断
        [self alertViewControllerTitle:@"提示" message:@"已取消发送意见" name:@"确定" type:0 preferredStyle:1];
    }else if (result == MessageComposeResultSent) {//点击发送后发送成功走这个判断
        [self alertViewControllerTitle:@"提示" message:@"意见发送成功" name:@"确定" type:0 preferredStyle:1];
    }else {//点击发送短信后短信发送失败后走这个判断
        [self alertViewControllerTitle:@"提示" message:@"意见发送失败" name:@"确定" type:0 preferredStyle:1];
    }
}

#pragma mark -创建意见-
- (void)setTextView{
    //意见内容
    contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, KGscreenWidth - 20, KGscreenHeight/2)];
    contentTextView.font = KGFont(13);
    contentTextView.textColor = [UIColor blackColor];
    contentTextView.delegate = self;
    contentTextView.layer.cornerRadius = 10;
    contentTextView.layer.masksToBounds = YES;
    [self.view addSubview:contentTextView];
    
    placeHolder = [[UILabel alloc]initWithFrame:CGRectMake(20, 110, 100, 20)];
    placeHolder.textColor = [UIColor lightGrayColor];
    placeHolder.text = @"请输入您的意见";
    placeHolder.font = KGFont(13);
    [self.view addSubview:placeHolder];
    
    UIButton *jionOutBtu = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KGscreenWidth - 100, 30)];
    jionOutBtu.center = CGPointMake(KGscreenWidth/2,KGscreenHeight - 100);
    [jionOutBtu setTitle:@"提交" forState:UIControlStateNormal];
    jionOutBtu.backgroundColor = KGcolor(231, 99, 40, 1);
    [jionOutBtu setTitleColor:KGcolor(255, 255, 255, 1) forState:UIControlStateNormal];
    [jionOutBtu addTarget:self action:@selector(jionOutClick:) forControlEvents:UIControlEventTouchUpInside];
    jionOutBtu.layer.cornerRadius = 5;
    jionOutBtu.layer.masksToBounds = YES;
    [self.view addSubview:jionOutBtu];
}

#pragma mark -UITextView的代理方法
-(void)textViewDidChange:(UITextView *)textView{

    if (placeHolder.hidden == NO) {
        placeHolder.hidden = YES;
    }
    
    //首行缩进
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 3;    //行间距
    paragraphStyle.maximumLineHeight = 30;   /**最大行高*/
    paragraphStyle.firstLineHeadIndent = 20.f;    /**首行缩进宽度*/
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:13],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    //设置UItextview的字体，字号，颜色
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [contentTextView resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

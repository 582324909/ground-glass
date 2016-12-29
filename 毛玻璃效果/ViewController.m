//
//  ViewController.m
//  毛玻璃效果
//
//  Created by 张伟伟 on 2016/12/29.
//  Copyright © 2016年 张伟伟. All rights reserved.
//

#import "ViewController.h"
#import "BlurEffectMenu.h"

@interface ViewController ()<BlurEffectMenuDelegate>

@end

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)click:(id)sender
{
    [self btnClicked];
}

#pragma mark - Event
- (void)btnClicked{
    BlurEffectMenuItem *addMattersItem=[[BlurEffectMenuItem alloc]init];
    [addMattersItem setTitle:@"添加事项"];
    [addMattersItem setIcon:[UIImage imageNamed:@"addMatters"]];
    
    BlurEffectMenuItem *addSchedulesItem=[[BlurEffectMenuItem alloc]init];
    [addSchedulesItem setTitle:@"添加日程"];
    [addSchedulesItem setIcon:[UIImage imageNamed:@"addSchedule"]];
    
    BlurEffectMenuItem *setupChatItem=[[BlurEffectMenuItem alloc]init];
    [setupChatItem setTitle:@"发起会话"];
    [setupChatItem setIcon:[UIImage imageNamed:@"setupChat"]];
    
    BlurEffectMenuItem *searchContactsItem=[[BlurEffectMenuItem alloc]init];
    [searchContactsItem setTitle:@"查找联系人"];
    [searchContactsItem setIcon:[UIImage imageNamed:@"searchContacts"]];
    
    BlurEffectMenu *menu=[[BlurEffectMenu alloc]initWithMenus:@[addMattersItem,addSchedulesItem,setupChatItem,searchContactsItem]];
    [menu setDelegate:self];
    menu.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [menu setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:menu animated:YES completion:nil];
}

#pragma mark - BlurEffectMenu Delegate
- (void)blurEffectMenuDidTapOnBackground:(BlurEffectMenu *)menu{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)blurEffectMenu:(BlurEffectMenu *)menu didTapOnItem:(BlurEffectMenuItem *)item{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"item.title:%@",item.title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

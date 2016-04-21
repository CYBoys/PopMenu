//
//  ViewController.m
//  PopoVerMenu
//
//  Created by chairman on 16/3/27.
//  Copyright © 2016年 LaiYoung. All rights reserved.
//

#import "ViewController.h"
#import "DropdownMenuController.h"
@interface ViewController ()
<
DropdownMenuControllerDelegate,
UIPopoverPresentationControllerDelegate
>
@property (nonatomic, strong) DropdownMenuController *popoVerMenu;
@property (nonatomic, strong) NSDictionary *dataDic;
@end

@implementation ViewController
- (DropdownMenuController *)popoVerMenu {
    if (!_popoVerMenu) {
        _popoVerMenu = [[DropdownMenuController alloc] init];
        _popoVerMenu.delegate = self;
    }
    return _popoVerMenu;
}
- (NSDictionary *)dataDic {
    if (!_dataDic) {
        _dataDic = @{
                     @"扫一扫":[UIImage imageNamed:@"right_menu_QR"],
                     @"加好友":[UIImage imageNamed:@"right_menu_addFri"],
                     @"创建讨论组":[UIImage imageNamed:@"right_menu_multichat"],
                     @"发送到电脑":[UIImage imageNamed:@"right_menu_sendFile"],
                     @"面对面快传":[UIImage imageNamed:@"right_menu_facetoface"],
                     @"收钱":[UIImage imageNamed:@"right_menu_payMoney"]
                     };
    }
    return _dataDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"PopoVerMenu";
    UIBarButtonItem *popoVerMenuItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(popoVerMenu:)];
    self.navigationItem.rightBarButtonItem = popoVerMenuItem;
}
- (void)popoVerMenu:(UIBarButtonItem *)sender {
//    self.popoVerMenu = [[DropdownMenuController alloc]init];
//    self.popoVerMenu.delegate = self;
    self.popoVerMenu.modalPresentationStyle = UIModalPresentationPopover;
    self.popoVerMenu.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;//箭头方向指向
    self.popoVerMenu.dataDic =self.dataDic;
    self.popoVerMenu.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUnknown;//箭头方向,如果是baritem不设置方向，会默认up，up的效果也是最理想的
    self.popoVerMenu.popoverPresentationController.delegate = self;
    [self presentViewController:self.popoVerMenu animated:YES completion:nil];

}
- (void)DropdownMenuController:(DropdownMenuController *)dropdownMenuVC withIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"－-> %li",indexPath.row);
}
//popover样式
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //点击蒙版popover不消失， 默认yes
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

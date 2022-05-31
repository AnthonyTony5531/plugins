//
//  XCSampleVC.m
//  iOSSDKSample
//
//  Created by eric on 2019/10/14.
//  Copyright © 2019 eric. All rights reserved.
//

#import "XCSampleVC.h"

@interface XCSampleVC ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation XCSampleVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.contentLabel.text = self.showName;
    self.title = self.showName;
    self.view.backgroundColor = UIColor.purpleColor;
}

- (IBAction)backSDK:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}
@end

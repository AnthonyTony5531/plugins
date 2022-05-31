//
//  XCSelectView.m
//  checkOnline
//
//  Created by tn on 2020/5/8.
//  Copyright © 2020 nc. All rights reserved.
//

#import "XCSelectView.h"
#import "XCMacro.h"
#import <XCSDK/XCSDK.h>

@interface XCSelectView ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy, nullable) NSArray<NSDictionary<NSString *, NSString *> *> *items;
@property (nonatomic, copy, nullable) TNSelectViewHandler handler;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewConstraintTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewConstraintLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewConstraintWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewConstraintHeight;
@property (nonatomic) BOOL removing;
@end

@implementation XCSelectView

+ (void)showSelectViewOnView:(UIView *_Nullable)parentView
                contentFrame:(CGRect)contentFrame
                  dataSource:(NSArray<NSDictionary<NSString *, NSString *> *> *_Nullable)dataSource
                     handler:(TNSelectViewHandler _Nullable)handler {
    UIView *view = parentView ?: kXCKeyWindow;
    XCSelectView *selectView = [XCSelectView loadViewNib];
    selectView.items = dataSource;
    [selectView addTarget:selectView action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    selectView.frame = view.bounds;
    selectView.handler = handler;
    [view addSubview:selectView];
    [selectView.tableView reloadData];
    
    selectView.tableViewConstraintTop.constant = contentFrame.origin.y;
    selectView.tableViewConstraintLeft.constant = contentFrame.origin.x;
    selectView.tableViewConstraintWidth.constant = contentFrame.size.width;
    selectView.tableViewConstraintHeight.constant = contentFrame.size.height;
    
    selectView.alpha = 0.f;
    [UIView animateWithDuration:.25f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        selectView.alpha = 1.f;
    } completion:^(BOOL finished) {
        
    }];
}

+ (void)showSelectViewOnView:(UIView *_Nullable)parentView
                    contentY:(CGFloat)contentOffsetY
                     handler:(TNSelectViewHandler _Nullable)handler {
    [self showSelectViewOnView:parentView contentFrame:CGRectMake(20, contentOffsetY, 120, 80) dataSource:nil handler:handler];
}

- (void)awakeFromNib {
    [super awakeFromNib];
        
    self.tableView.layer.cornerRadius = 4;
    self.tableView.clipsToBounds = YES;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 40;
    self.tableView.separatorColor = TNColorWithHex(0xF5F5F5);
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 8, 0, 8);
    //NSLog(@"self.tableView.separatorInset=%@", NSStringFromUIEdgeInsets(self.tableView.separatorInset));
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
}

- (NSArray<NSDictionary<NSString *,NSString *> *> *)items {
    if (!_items) {
        _items = @[
            @{XCSelectTitleKey : @"UAT",   XCSelectTypeKey : @(XCSDKConfigUAT)},
            @{XCSelectTitleKey : @"PROD",  XCSelectTypeKey : @(XCSDKConfigPre)},
            @{XCSelectTitleKey : @"自定义", XCSelectTypeKey : @(XCSDKConfigDev)},
        ];
    }
    return _items;
}

- (void)dismiss {
    if (self.removing) {
        return;
    }
    
    self.removing = YES;
    [UIView animateWithDuration:.25f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = TNColorWithHexA(0x000000, 0.5f);
    cell.textLabel.text = self.items[indexPath.row][XCSelectTitleKey];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.handler) {
        self.handler(self.items[indexPath.row], indexPath.row);
    }
    
    [self dismiss];
}
@end

@implementation UIView (XCKit)
+ (id)loadViewNib {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    if (views.count) {
        return [views lastObject];
    }
    return nil;
}
@end

@implementation UIWindow (TNKit)
+ (UIWindow *)getKeyWindow {
    if (@available(iOS 13.0, *)) {
        UIWindow *keyWindow = nil;
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if ([windowScene isKindOfClass:UIWindowScene.class]) {
                //if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        keyWindow = window;
                        break;
                    }
                }
                //}
            }
        }
        return keyWindow;
    }
    else {
        return [UIApplication sharedApplication].keyWindow;
    }
}
@end

//
//  FLEXTableView.m
//  FLEX
//
//  Created by Tanner on 4/17/19.
//  Copyright © 2020 FLEX Team. All rights reserved.
//
// 遇到问题联系中文翻译作者：pxx917144686

#import "FLEXTableView.h"
#import "FLEXUtility.h"
#import "FLEXSubtitleTableViewCell.h"
#import "FLEXMultilineTableViewCell.h"
#import "FLEXKeyValueTableViewCell.h"
#import "FLEXCodeFontCell.h"

FLEXTableViewCellReuseIdentifier const kFLEXDefaultCell = @"kFLEXDefaultCell";
FLEXTableViewCellReuseIdentifier const kFLEXDetailCell = @"kFLEXDetailCell";
FLEXTableViewCellReuseIdentifier const kFLEXMultilineCell = @"kFLEXMultilineCell";
FLEXTableViewCellReuseIdentifier const kFLEXMultilineDetailCell = @"kFLEXMultilineDetailCell";
FLEXTableViewCellReuseIdentifier const kFLEXKeyValueCell = @"kFLEXKeyValueCell";
FLEXTableViewCellReuseIdentifier const kFLEXCodeFontCell = @"kFLEXCodeFontCell";

#pragma mark 私有

@interface UITableView (Private)
- (CGFloat)_heightForHeaderInSection:(NSInteger)section;
- (NSString *)_titleForHeaderInSection:(NSInteger)section;
@end

@implementation FLEXTableView

+ (instancetype)flexDefaultTableView {
    if (@available(iOS 13.0, *)) {
        return [[self alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    } else {
        return [[self alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
}

#pragma mark - 初始化

+ (id)groupedTableView {
    if (@available(iOS 13.0, *)) {
        return [[self alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    } else {
        return [[self alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
}

+ (id)plainTableView {
    return [[self alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
}

+ (id)style:(UITableViewStyle)style {
    return [[self alloc] initWithFrame:CGRectZero style:style];
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self registerCells:@{
            kFLEXDefaultCell : [FLEXTableViewCell class],
            kFLEXDetailCell : [FLEXSubtitleTableViewCell class],
            kFLEXMultilineCell : [FLEXMultilineTableViewCell class],
            kFLEXMultilineDetailCell : [FLEXMultilineDetailTableViewCell class],
            kFLEXKeyValueCell : [FLEXKeyValueTableViewCell class],
            kFLEXCodeFontCell : [FLEXCodeFontCell class],
        }];
    }

    return self;
}


#pragma mark - 公开方法

- (void)registerCells:(NSDictionary<NSString*, Class> *)registrationMapping {
    [registrationMapping enumerateKeysAndObjectsUsingBlock:^(NSString *identifier, Class cellClass, BOOL *stop) {
        [self registerClass:cellClass forCellReuseIdentifier:identifier];
    }];
}

@end

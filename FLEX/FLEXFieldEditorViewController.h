//
//  FLEXFieldEditorViewController.h
//  FLEX
//
//  Created by Tanner on 11/22/18.
//  Copyright © 2020 FLEX Team. All rights reserved.
//
// 遇到问题联系中文翻译作者：pxx917144686
// 遇到问题联系中文翻译作者：pxx917144686

#import "FLEXVariableEditorViewController.h"
#import "FLEXProperty.h"
#import "FLEXIvar.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLEXFieldEditorViewController : FLEXVariableEditorViewController

/// @return nil if the property is readonly or if the type is unsupported
+ (nullable instancetype)target:(id)target property:(FLEXProperty *)property commitHandler:(void(^_Nullable)(void))onCommit;
/// @return nil if the ivar type is unsupported
+ (nullable instancetype)target:(id)target ivar:(FLEXIvar *)ivar commitHandler:(void(^_Nullable)(void))onCommit;

/// Subclasses can change the button title via the \c title property
@property (nonatomic, readonly) UIBarButtonItem *getterButton;

- (void)getterButtonPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END

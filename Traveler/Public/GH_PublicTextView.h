//
//  GH_PublicTextView.h
//  Traveler
//
//  Created by ZhiYuan on 2020/2/29.
//  Copyright © 2020 郭徽. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger){
    typeAndeNone,//无
    typeAndScreentInput,//有密文输入
    typeAndGetCode,//有获取验证码按钮
} textViewType;

typedef void(^textFieldBlock)(NSString * text);
@interface GH_PublicTextView : UIView

- (id)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title placeHolder:(NSString *)placeHolder type:(textViewType)type text:(textFieldBlock)text;
    
    
@end

NS_ASSUME_NONNULL_END

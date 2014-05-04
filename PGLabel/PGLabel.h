//
//  PGLabel.h
//  PGLabel
//
//  Created by Masashi Tanaka on 2014/05/03.
//  Copyright (c) 2014年 Masashi Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PGLabel;

@protocol PGLabelDelegate <NSObject>

- (void)labelDidFinishTimer:(PGLabel *)label;

@end

@interface PGLabel : UILabel

@property (weak) id delegate;
@property NSTimeInterval timeInteval;
@property NSString *prefixString;
@property NSString *suffixString;

- (void)start;
- (void)stop;


@end

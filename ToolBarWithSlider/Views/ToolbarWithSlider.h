//
//  ToolbarWithSlider.h
//  ToolBarWithSlider
//
//  Created by xyooyy on 13-11-16.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolbarWithSliderDelegate;


@interface ToolbarWithSlider : UIView



@property (weak, nonatomic) id<ToolbarWithSliderDelegate>delegate;


- (id)initWithImages:(NSArray *)images frame:(CGRect)frame tintColor:(UIColor*)tintColor;


@end


@protocol ToolbarWithSliderDelegate <NSObject>


- (void)barButtonItem:(UIBarButtonItem *)barButtonItem didSelectItemIndex:(NSInteger)index;


@end

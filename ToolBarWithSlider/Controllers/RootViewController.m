//
//  RootViewController.m
//  ToolBarWithSlider
//
//  Created by xyooyy on 13-11-16.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end


@implementation RootViewController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    NSArray *images = [NSArray arrayWithObjects:@"image1.png", @"image2.png",@"image3.png",
                                                @"image4.png",@"image5.png", nil];
    
    CGRect toolbarWithSliderFrame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);
    UIColor *tintColor = [UIColor colorWithRed:78.0/255.0 green:156.0/255.0 blue:206.0/255.0 alpha:1.0];
    ToolbarWithSlider *toolbarWithSlider = [[ToolbarWithSlider alloc] initWithImages:images
                                                                               frame:toolbarWithSliderFrame
                                                                           tintColor:tintColor];
    toolbarWithSlider.delegate = self;
    [self.view addSubview:toolbarWithSlider];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark ToolbarWithSliderDelegate
- (void)toolbarButtonItem:(UIButton *)toolbarButton didSelectItemIndex:(NSInteger)index
{
    
//    NSLog(@"%@", toolbarButton.image.accessibilityIdentifier);
    NSLog(@"%i", index);
    
}


@end

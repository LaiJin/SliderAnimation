//
//  ToolbarWithSlider.m
//  ToolBarWithSlider
//
//  Created by xyooyy on 13-11-16.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "ToolbarWithSlider.h"


@interface ToolbarWithSlider ()

@property (strong, nonatomic) UIImageView *slideImageView;
@property (strong, nonatomic) UIToolbar *toobar;


@end



@implementation ToolbarWithSlider


@synthesize toobar = _toolbar;
@synthesize slideImageView = _slideImageView;
@synthesize delegate = _delegate;


#pragma mark -
#pragma mark Public Method
- (id)initWithImages:(NSArray *)images frame:(CGRect)frame tintColor:(UIColor *)tintColor
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.toobar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width,self.frame.size.height)];
        [self.toobar setTintColor:tintColor];
        [self.toobar setBarStyle:UIBarStyleDefault];
        [self.toobar setBackgroundColor:self.backgroundColor];
        [self addImagesToBarButtoItem:images];
        [self addSlideImageViewToToolbar];
        [self addSubview:self.toobar];
        
        
    }
    
    return self;
    
}


#pragma mark -
#pragma mark Private Methods

#pragma mark -Add BarButtonItems Method
- (void)addImagesToBarButtoItem:(NSArray *)images
{
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil action:nil];
    
    NSMutableArray *toolbarButtonItems = [[NSMutableArray alloc] init];
    [toolbarButtonItems addObject:space];
    
    for (int i = 0; i < images.count; i++) {
        [self creatBarButtonItem:toolbarButtonItems images:images toolbarButtonTag:i];
        [toolbarButtonItems addObject:space];
        
    }
    
    [self.toobar setItems:toolbarButtonItems animated:YES];
    
}


- (void)creatBarButtonItem:(NSMutableArray *)toolbarButtonItems images:(NSArray *)images toolbarButtonTag:(int)tag;
{
    
    UIImage *buttonBackgroundImage = [UIImage imageNamed:[images objectAtIndex:tag]];
    
    UIButton *toolbarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [toolbarButton setFrame:CGRectMake(0, 0, buttonBackgroundImage.size.width, buttonBackgroundImage.size.height)];
    [toolbarButton setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];
    [toolbarButton addTarget:self action:@selector(selectedbarButtonItem:)
                        forControlEvents:UIControlEventTouchUpInside];
    [toolbarButton setShowsTouchWhenHighlighted:YES];
    toolbarButton.tag = tag;
    
    UIBarButtonItem *toolbarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:toolbarButton];
    [toolbarButtonItems addObject:toolbarButtonItem];
    
}


#pragma mark -Add sliderImageView Method
- (void)addSlideImageViewToToolbar
{
    
    self.slideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slider.png"]];
    self.slideImageView.frame = CGRectMake(0, 0, self.slideImageView.image.size.width,
                                                                                self.toobar.frame.size.height);
    UIBarButtonItem *secondBarButtonItem = [self.toobar.items objectAtIndex:1];
    self.slideImageView.center = CGPointMake(secondBarButtonItem.customView.center.x, self.slideImageView.center.y);
    
    if (self.toobar.items.count)
        [self.toobar addSubview:self.slideImageView];
    
}


#pragma mark -BarButtonItem Action Method

#define kSlideImageViewAnimationDuration 0.15
- (void)selectedbarButtonItem:(UIButton *)toolbarButton
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:kSlideImageViewAnimationDuration];
    self.slideImageView.center = CGPointMake(toolbarButton.center.x, self.slideImageView.center.y);
    [UIView commitAnimations];
    
    [_delegate toolbarButtonItem:toolbarButton didSelectItemIndex:toolbarButton.tag];
    
}


@end

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
        [self addSubview:self.toobar];
        
    }
    
    return self;
    
}





#pragma mark -
#pragma mark Private Methods

#pragma mark -Add BarButtonItems Method

#define kImageViewFirstPositionCenterPointX(x) (x / 2 * 3)
#define kToolbarItemsCount(x) ((2 * x) + 1)

- (void)addImagesToBarButtoItem:(NSArray *)images
{
    
    CGFloat barButtonItemWidth = self.frame.size.width / kToolbarItemsCount(images.count);
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil action:nil];
    space.width = barButtonItemWidth;
    
    NSMutableArray *toolbarButtonItems = [[NSMutableArray alloc] init];
    [toolbarButtonItems addObject:space];
    
    for (int i = 0; i < images.count; i++) {
        [self creatBarButtonItem:toolbarButtonItems barButtonItemWith:barButtonItemWidth images:images
                                                                                barButtonItemTag:i];
        [toolbarButtonItems addObject:space];
    }
    
    [self.toobar setItems:toolbarButtonItems animated:YES];
    
    CGFloat SlideImageViewCenterPointX = kImageViewFirstPositionCenterPointX(barButtonItemWidth);
    [self addSlideImageViewToToolbar:SlideImageViewCenterPointX];
    
}


- (void)creatBarButtonItem:(NSMutableArray *)toolbarButtonItems barButtonItemWith:(CGFloat)width images:(NSArray *)images barButtonItemTag:(int)tag;
{
    
    UIImage *barButtonItemImage = [UIImage imageNamed:[images objectAtIndex:tag]];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithImage:barButtonItemImage
                                                                     style:UIBarButtonItemStylePlain target:self
                                                                    action:@selector(selectedbarButtonItem:)];
    barButtonItem.tag = tag;
    barButtonItem.width = width;
    [toolbarButtonItems addObject:barButtonItem];
    
}


#pragma mark -Add sliderImageView Method
- (void)addSlideImageViewToToolbar:(CGFloat)slideImageViewCenterPointX
{
    
    self.slideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slider.png"]];
    self.slideImageView.frame = CGRectMake(0, -2, self.slideImageView.image.size.width,
                                                                                self.toobar.frame.size.height);
    self.slideImageView.center = CGPointMake(slideImageViewCenterPointX, self.slideImageView.center.y);
    if (self.toobar.items.count)
        [self.toobar addSubview:self.slideImageView];
    
}


#pragma mark -BarButtonItem Action Method


#define kDoubleToolbarItemsCount(x) (2 * x)
#define kWidthMultiples(x) ((4 * x) +  3)

- (void)selectedbarButtonItem:(UIBarButtonItem *)barButtonItem
{
    
    CGFloat bisectsToolbarWidth = (self.toobar.frame.size.width / kDoubleToolbarItemsCount(self.toobar.items.count));
    CGFloat slideImageViewCenterPointX = bisectsToolbarWidth * kWidthMultiples(barButtonItem.tag);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.15];
    self.slideImageView.center = CGPointMake(slideImageViewCenterPointX, self.slideImageView.center.y);
    [UIView commitAnimations];
    
    [_delegate barButtonItem:barButtonItem didSelectItemIndex:barButtonItem.tag];
    
}


@end

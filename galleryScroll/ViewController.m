//
//  ViewController.m
//  galleryScroll
//
//  Created by Navaneethan Sivabalaviknarajah on 2015-06-23.
//  Copyright (c) 2015 Navaneethan Sivabalaviknarajah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *galleryView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.galleryView.delegate = self;
    
    NSArray *gallery = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"Lighthouse-in-Field.jpg"], [UIImage imageNamed:@"Lighthouse-night.jpg"], [UIImage imageNamed:@"Lighthouse.jpg"], nil];
                       
    CGFloat xPosition = 1;
    
    for (UIImage *image in gallery ) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect) {xPosition,0,self.galleryView.frame.size.width, self.galleryView.frame.size.height}];
        
        xPosition += self.galleryView.frame.size.width;
        imageView.image = image;
        
        [self.galleryView addSubview:imageView];
    }
        self.galleryView.contentSize = (CGSize){xPosition, self.galleryView.frame.size.height};


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
        return [self.galleryView.subviews firstObject];
}

@end

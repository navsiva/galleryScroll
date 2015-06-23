//
//  ViewController2.m
//  galleryScroll
//
//  Created by Navaneethan Sivabalaviknarajah on 2015-06-23.
//  Copyright (c) 2015 Navaneethan Sivabalaviknarajah. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView2;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image2 = [UIImage imageNamed:@"Lighthouse-in-Field.jpg"];
    UIView *scrollView2 = self.scrollView2;
    UIImageView *framingView = [[UIImageView alloc] initWithImage:image2];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [scrollView2 addSubview:framingView];
    
    
    [scrollView2 addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:scrollView2
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1.0
                                                               constant:0.0]];
    
    [scrollView2 addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                              attribute:NSLayoutAttributeLeading
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:scrollView2
                                                              attribute:NSLayoutAttributeLeading
                                                             multiplier:1.0
                                                               constant:0.0]];
    
    [scrollView2 addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:scrollView2
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:0.0]];
    
    [scrollView2 addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                              attribute:NSLayoutAttributeTrailing
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:scrollView2
                                                              attribute:NSLayoutAttributeTrailing
                                                             multiplier:1.0
                                                               constant:0.0]];
    
    self.scrollView2.delegate = self;
    

//    UIImage *image2 = [UIImage imageNamed:@"Lighthouse-in-Field.jpg"];
//    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];

    //    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:(CGRect)];
//    
//                               
//    imageView2.image = image;
    //[self.scrollView2 addSubview:framingView];
    
    self.framingView = framingView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.framingView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

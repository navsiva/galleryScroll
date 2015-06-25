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
@property (weak, nonatomic) UIImage *image1;
@property (weak, nonatomic) UIImage *image2;
@property (weak, nonatomic) UIImage *image3;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.galleryView.delegate = self;
    
    self.image1 = [UIImage imageNamed:@"Lighthouse-in-Field.jpg"];
    self.image2 = [UIImage imageNamed:@"Lighthouse-night.jpg"];
    self.image3 = [UIImage imageNamed:@"Lighthouse.jpg"];
    
    
    
    NSArray *gallery = @[self.image1, self.image2, self.image3];
                       
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
//
//-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    
//        return [self.galleryView.subviews firstObject];
//}
- (IBAction)userTappedView:(UITapGestureRecognizer *)sender {
    //ViewController2 *two = segue.destinationViewController;
    //two.delegate = self;
    
        
   [ self performSegueWithIdentifier:@"showDetails" sender:sender];
     //sender should be image and passed to prepare for segue
   
    
    
    NSLog(@"tapped");
}





-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showDetails"]) {
        ViewController2 *target= [segue destinationViewController];
        
        CGPoint location= [sender locationInView:self.galleryView];
        int image= location.x/self.galleryView.frame.size.width;
        
        if (image == 0){
            target.zoomImage = self.image1;
        }
        else if (image == 1){
            target.zoomImage = self.image2;
        } else {
            target.zoomImage = self.image3;
        }
        
    }
    
   
    NSLog(@"segue\n");



}

@end

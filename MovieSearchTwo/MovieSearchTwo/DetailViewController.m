//
//  DetailViewController.m
//  MovieSearchTwo
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "DetailViewController.h"
#import "MovieController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleYear;
@property (weak, nonatomic) IBOutlet UITextView *movieDescriptionView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *movieInfo = [MovieController sharedInstance].movieInfo;
    
    //    self.imageView.image = movieInfo[@"backdrop_path"];
    self.movieTitleLabel.text = movieInfo[@"original_title"];
    self.movieTitleYear.text = movieInfo[@"release_date"];
    //    self.movieDescriptionView.text = movieInfo[@""];


}




@end

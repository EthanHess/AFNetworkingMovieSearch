//
//  ViewController.m
//  MovieSearchTwo
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "NetworkController.h"
#import "DetailViewController.h"
#import "MovieController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.textField.delegate = self;
}

- (IBAction)search:(id)sender {
    
    NSString *movieTitle = [self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[MovieController sharedInstance]searchMoviesWithName:movieTitle completion:^(BOOL success) {
        if (success) {
            [self.tableView reloadData];
        }
        else {
            NSLog(@"failed to search");
        }
        
    }];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [MovieController sharedInstance].resultMovies.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSDictionary *movie = [MovieController sharedInstance].resultMovies[indexPath.row];
    cell.textLabel.text = movie[@"title"];
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"viewEntry"]) {
        
        [[MovieController sharedInstance] searchMoviesWithID:[MovieController sharedInstance].resultMovies[indexPath.row][@"id"] completion:^(BOOL success) {
            DetailViewController *detailViewController = [DetailViewController new];
            [self.navigationController pushViewController:detailViewController animated:YES];
        
        }];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES; 
}





@end

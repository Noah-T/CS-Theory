//
//  NATStringSearchViewController.m
//  CS-Theory
//
//  Created by Noah Teshu on 12/13/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATStringSearchViewController.h"

@interface NATStringSearchViewController ()
@property (weak, nonatomic) IBOutlet UITextView *searchTextField;
@property (weak, nonatomic) IBOutlet UITextField *substringTextField;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

- (IBAction)search:(id)sender;
@end

@implementation NATStringSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)search:(id)sender {
    NSString *textToSearch = self.searchTextField.text;
    NSString *searchTerm = self.substringTextField.text;
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:searchTerm options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:textToSearch options:0 range:NSMakeRange(0, textToSearch.length) ];
    self.outputLabel.text = [NSString stringWithFormat:@"Your search for %@ returned %li matches.", searchTerm,(long)numberOfMatches];
    
    
}
@end

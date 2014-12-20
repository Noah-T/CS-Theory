//
//  ReverseStringViewController.m
//  CS-Theory
//
//  Created by Noah Teshu on 12/19/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "ReverseStringViewController.h"

@interface ReverseStringViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userText;
- (IBAction)reverseString:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *reversedStringOutput;

@end

@implementation ReverseStringViewController

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

- (IBAction)reverseString:(id)sender {
    
    NSMutableString *userText = [self.userText.text mutableCopy];
    NSUInteger userTextLength = userText.length;
    for (int i = 0; i < userTextLength/2; i++) {
        //index of element at beginning
        unichar firstCharacter = [userText characterAtIndex:i];
        //index of element towards end
        unichar lastCharacter = [userText characterAtIndex:userTextLength - 1 - i];
        [userText replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithCharacters:&lastCharacter length:1]];
        [userText replaceCharactersInRange:NSMakeRange(userTextLength - 1 -i, 1) withString:[NSString stringWithCharacters:&firstCharacter length:1]];
        
        //swap
    }
    NSLog(@"Reversed string is: %@", userText);
    self.reversedStringOutput.text = userText;
    
}

//-(NSMutableString *)recursiveReverseString:(NSMutableString *)userString
//{
//    
//}
@end

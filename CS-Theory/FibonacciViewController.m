//
//  FibonacciViewController.m
//  CS-Theory
//
//  Created by Noah Teshu on 12/16/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "FibonacciViewController.h"

@interface FibonacciViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userInputTextField;
- (IBAction)showFibonacciButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *fibonacciOutput;

@end

@implementation FibonacciViewController

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

- (IBAction)showFibonacciButton:(id)sender {
    
    if (self.userInputTextField.text.length < 1) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Make sure you enter a number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        int fibonacciResult = [self findFibonacci:self.userInputTextField.text.integerValue];
        self.fibonacciOutput.text = [NSString stringWithFormat:@"At index %@, the number in the Fibonacci sequence is: %d.", self.userInputTextField.text,  fibonacciResult];

    }
}

-(int)findFibonacci:(int)number
{
    if (number == 0) {
        return number;
    } else if(number == 1){
        return number;
    } else {
        return [self findFibonacci:(number-1)]+[self findFibonacci:(number-2)];
    }
}
@end

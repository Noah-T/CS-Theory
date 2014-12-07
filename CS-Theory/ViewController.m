//
//  ViewController.m
//  CS-Theory
//
//  Created by Noah Teshu on 12/6/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)runBubbleSort:(id)sender {
    NSMutableArray *randomArray = [self createArrayOfRandomNumbers];
    
    int n = randomArray.count;
    
    NSLog(@"unsorted array: ");
    for (NSNumber *number in randomArray) {
        NSLog(@"%@ ", number);
    }
    NSLog(@"\n\n");
    for (int i = 0; i < n -2; i++) {
        
        for (int j = 0; j < n -1; j++) {
            
            if (randomArray[j] > randomArray[j+1]) {
                
                NSNumber *swapValue;
                swapValue = randomArray[j];
                randomArray[i] = randomArray[j+1];
                randomArray[j+1] = swapValue;
            }
        }
    }
    
    NSLog(@"sorted array: ");
    for (NSNumber *number in randomArray) {
        NSLog(@"%@ ", number);
    }
    NSLog(@"\n");
    
    
}

-(NSMutableArray *)createArrayOfRandomNumbers
{
    NSMutableArray *randomArray = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        int randomNumber = arc4random() % 1000;
        [randomArray addObject:[NSNumber numberWithInt:randomNumber]];
    }
    return randomArray;
}
@end

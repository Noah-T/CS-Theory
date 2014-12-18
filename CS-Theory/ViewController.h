//
//  ViewController.h
//  CS-Theory
//
//  Created by Noah Teshu on 12/6/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//searching
- (IBAction)runLinearSearch:(id)sender;
- (IBAction)runBinarySearch:(id)sender;

//sorting
- (IBAction)runBubbleSort:(id)sender;
- (IBAction)runMergeSort:(id)sender;
- (IBAction)runSelectionSort:(id)sender;

- (IBAction)runFactorialRecursion:(id)sender;

- (IBAction)printOddNumbers:(id)sender;

@end


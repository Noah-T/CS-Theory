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

- (IBAction)runLinearSearch:(id)sender {
    NSMutableArray *randomArray = [self createArrayOfThisManyRandomNumbers:20 upperBound:20];
    
    NSNumber *searchKey = [NSNumber numberWithInt:5];
    
    NSLog(@"searching this array for the key of: %@ \n\n %@", searchKey, randomArray);
    
    NSUInteger n = randomArray.count;
    for (int i = 0; i < n; i++) {
        if (randomArray[i] == searchKey) {
            NSLog(@"Number found: %@", randomArray[i]);
            return;
        }
    }
    NSLog(@"Number not found");
}

- (IBAction)runBinarySearch:(id)sender {
}

- (IBAction)runBubbleSort:(id)sender {
    NSMutableArray *randomArray = [self createArrayOfThisManyRandomNumbers:100 upperBound:1000];
    
    NSUInteger n = randomArray.count;
    
    NSLog(@"unsorted array: ");
    for (NSNumber *number in randomArray) {
        NSLog(@"%@ ", number);
    }
    NSLog(@"\n\n");
    
    BOOL valuesWereSwapped;
    for (int i = 0; i < n-2; i++) {
        valuesWereSwapped = NO;
        for (int j = 0; j < n-1; j++) {
            
            if (randomArray[j] > randomArray[j+1]) {
                
                NSNumber *swapValue;
                swapValue = randomArray[j];
                randomArray[j] = randomArray[j+1];
                randomArray[j+1] = swapValue;
                valuesWereSwapped = YES;
            }
        }
        if (!valuesWereSwapped) {
            break;
        }
    }
    
    NSLog(@"sorted array: ");
    for (NSNumber *number in randomArray) {
        NSLog(@"%@ ", number);
    }
    NSLog(@"\n");
    
    
}

- (IBAction)runMergeSort:(id)sender {
    NSMutableArray *randomArray = [self createArrayOfThisManyRandomNumbers:100 upperBound:1000];
    NSArray *fixedArrayForSorting = [randomArray copy];
    NSLog(@"the unsorted array is: %@", fixedArrayForSorting);
    NSArray *sortedArray = [self mergeSort:fixedArrayForSorting];
    NSLog(@"the sorted array is: %@", sortedArray);
    
}

-(NSMutableArray *)createArrayOfThisManyRandomNumbers:(int)n upperBound:(u_int32_t)upperBound{
    NSMutableArray *randomArray = [NSMutableArray array];
    for (int i = 0; i < n; i++) {
        u_int32_t randomNumber = arc4random_uniform(upperBound);
        [randomArray addObject:[NSNumber numberWithInt:randomNumber]];
    }
    return randomArray;
}

-(NSArray *)mergeSort:(NSArray *)unsortedArray
{
    if (unsortedArray.count < 2) {
        return unsortedArray;
    }
    
    long middle = unsortedArray.count/2;
    NSRange left = NSMakeRange(0, middle); //note: middle is not inclusive
    NSRange right = NSMakeRange(middle, unsortedArray.count - middle);
    NSArray *leftArray = [unsortedArray subarrayWithRange:left];
    NSArray *rightArray = [unsortedArray subarrayWithRange:right];
    
    NSArray *resultsArray = [self merge:[self mergeSort:leftArray] andRight:[self mergeSort:rightArray]];
    
    return resultsArray;
}

-(NSArray *)merge:(NSArray *)leftArray andRight:(NSArray *)rightArray
{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    int right = 0;
    int left = 0;
    
    //while there are still remaining items in the sub arrays
    while (left <  leftArray.count && right < rightArray.count) {
        if ([leftArray objectAtIndex:left] < [rightArray objectAtIndex:right]) {
            //add object at index left, then increment the index
            [result addObject:[leftArray objectAtIndex:left++]];
        } else {
            //add object at index right, then increment the index
            [result addObject:[rightArray objectAtIndex:right++]];
        }
    }
    
    NSRange leftRange = NSMakeRange(left, leftArray.count - left);
    NSRange rightRange = NSMakeRange(right, rightArray.count - right);
    NSArray *newRightArray = [rightArray subarrayWithRange:rightRange];
    NSArray *newLeftArray = [leftArray subarrayWithRange:leftRange];
    newLeftArray = [result arrayByAddingObjectsFromArray:newLeftArray];
    return [newLeftArray arrayByAddingObjectsFromArray:newRightArray];
    
}
@end

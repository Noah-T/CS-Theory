//
//  ViewController.m
//  CS-Theory
//
//  Created by Noah Teshu on 12/6/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *randomArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.randomArray = [self createArrayOfThisManyRandomNumbers:8 upperBound:12];
    [self reverseArray:self.randomArray];
    //[self decrementWithRecursion:5];
    //[self incrementWithRecursion:42];
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

- (IBAction)runFactorialRecursion:(id)sender {
    
    
}

- (IBAction)printOddNumbers:(id)sender {
    [self printOddRecursiveFrom:0 to:100];
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

-(void)reverseArray:(NSMutableArray *)array
{
    NSUInteger arrayCount = array.count;
    NSUInteger haflOfArrayCount = arrayCount/2;
    
    NSLog(@"array pre: %@", array);
    for (int i = 0; i < haflOfArrayCount; i++) {
        NSUInteger indexOfFirstObject = i;
        NSUInteger indexOfLastObject = arrayCount-1-indexOfFirstObject;
        
        if (indexOfFirstObject == indexOfLastObject) {
            NSLog(@"fires on array with odd number of items");
        }
        
        id temp = [array objectAtIndex:indexOfFirstObject];
        array[indexOfFirstObject] = array[indexOfLastObject];
        array[indexOfLastObject] = temp;
    }
    
    NSLog(@"array post: %@", array);


}

- (int)factorial:(int)n
{
    if (n == 1) {
        return 1;
    }
    
    return n * [self factorial:n-1];
}

- (void)decrementWithRecursion:(int)myInt
{
//    NSLog(@"this is the beginning of the function");
//    NSLog(@"the passed in value is: %d", myInt);
    //identify base case
    if (myInt == 0) {
        NSLog(@"that's all folks");
        return;
    }
    
    NSLog(@"myInt has a value of %d", myInt);
    
    [self decrementWithRecursion:myInt-1];
}

- (void)incrementWithRecursion:(int)myInt
{
    if (myInt == 101) {
        NSLog(@"that's all folks");
        return;
    }
    
    NSLog(@"myInt has a value of %d", myInt);

    [self incrementWithRecursion:myInt+1];
}

- (void)printOddRecursiveFrom:(int)min to:(int)max
{
    if (min > max) {
        return;
    }
    
    if (min % 2 != 0) {
        NSLog(@"%d", min);
    }
    [self printOddRecursiveFrom:min+1 to:max];
}
@end

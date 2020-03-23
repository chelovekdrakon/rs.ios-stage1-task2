#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int prev = 0;
    int curr = 1;
    int prod = [number intValue];
    int multiplied = prev * curr;

    while (multiplied < prod) {
        int temp = curr;
        curr += prev;
        prev = temp;
        multiplied = prev * curr;
    }
    
    return @[@(prev), @(curr), @(multiplied == prod ? 1 : 0)];
}

@end

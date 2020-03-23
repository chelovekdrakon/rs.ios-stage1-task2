#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *mutableA = [a mutableCopy];
    NSCharacterSet *lowercaseLetters = [NSCharacterSet lowercaseLetterCharacterSet];
    
    for (int i = 0; i < b.length; i++) {
        NSString *charB = [b substringWithRange:NSMakeRange(i, 1)];
        
        while(true) {
            NSString *charA = [mutableA substringWithRange:NSMakeRange(i, 1)];
            
            if ([charB isEqualToString:charA]) {
                break;
            }
            
            NSRange range = [charA rangeOfCharacterFromSet:lowercaseLetters];
            BOOL isLowerCased = range.location != NSNotFound;
            
            if (isLowerCased) {
                NSString *charA_uppercased = [charA uppercaseString];
                
                if ([charB isEqualToString:charA_uppercased]) {
                    [mutableA replaceCharactersInRange:NSMakeRange(i, 1) withString:charA_uppercased];
                    
                    if (mutableA.length == i + 1) {
                        return [mutableA isEqual:b] ? @"YES" : @"NO";
                    }
                    
                    break;
                } else {
                    [mutableA deleteCharactersInRange:NSMakeRange(i, 1)];
                    
                    if (mutableA.length == i) {
                        return [mutableA isEqual:b] ? @"YES" : @"NO";
                    }
                }
            } else {
                return @"NO";
            }
        }
    }
    
    return [mutableA containsString:b] ? @"YES" : @"NO";
}
@end

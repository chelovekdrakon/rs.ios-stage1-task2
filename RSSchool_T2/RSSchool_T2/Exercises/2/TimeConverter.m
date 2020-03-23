#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSInteger hoursInt = [hours intValue];
    NSInteger minutesInt = [minutes intValue];
    
    if (minutesInt > 60 || minutesInt < 0 || hoursInt < 0 || hoursInt > 24) {
        return @"";
    }
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterSpellOutStyle;
    
    NSString *result = @"";
    NSMutableString *minutesStr = [[numberFormatter stringFromNumber:@(minutesInt > 30 ? 60 - minutesInt : minutesInt)] mutableCopy];
    NSMutableString *hoursStr = [[numberFormatter stringFromNumber:@((minutesInt > 30) ? hoursInt + 1 : hoursInt)] mutableCopy];
    NSString *pastTo = (minutesInt < 30) ? @"past" : @"to";
    
    [hoursStr replaceOccurrencesOfString:@"-" withString:@" " options:kNilOptions range:NSMakeRange(0, hoursStr.length)];
    [minutesStr replaceOccurrencesOfString:@"-" withString:@" " options:kNilOptions range:NSMakeRange(0, minutesStr.length)];
    
    if (minutesInt == 0) {
        result = [NSString stringWithFormat:@"%@ o' clock", hoursStr];
    } else if (minutesInt == 30) {
        result = [NSString stringWithFormat:@"half past %@", hoursStr];
    } else if (minutesInt % 15 == 0) {
        result = [NSString stringWithFormat:@"quarter %@ %@", pastTo, hoursStr];
    } else if (minutesInt == 1 || minutesInt == 59) {
        result = [NSString stringWithFormat:@"1 minute %@ %@", pastTo, hoursStr];
    } else {
        result =  [NSString stringWithFormat:@"%@ minutes %@ %@", minutesStr, pastTo, hoursStr];
    }
    
    return result;
}
@end

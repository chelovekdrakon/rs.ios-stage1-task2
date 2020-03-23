#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *dateString = [NSString stringWithFormat:@"%@ %@ %@", day, month, year];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd MM yyyy";
    dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    if (date) {
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"ru"];
        dateFormatter.dateFormat = @"dd MMMM, EEEE";
        
        return [dateFormatter stringFromDate:date];
    } else {
        return @"Такого дня не существует";
    }
}

@end

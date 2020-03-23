#import "Blocks.h"

@interface Blocks()
@property (nonatomic, weak) NSArray *data;
@property (nonatomic, copy) BlockC executableBlock;
@end

@implementation Blocks

- (BlockA) blockA {
    __weak Blocks *weakself = self;
    
    BlockA block = ^(NSArray *array) {
        weakself.data = array;
    };
    
    return Block_copy(block);
}

- (BlockB) blockB {
    __weak Blocks *weakself = self;
    
    BlockB block = ^(Class class) {
        if ([NSString class] == class) {
            NSMutableString *result = [NSMutableString string];
            
            for (NSObject *el in weakself.data) {
                if ([el isKindOfClass:class]) {
                    [result appendString:(NSString *)el];
                }
            }
            
            weakself.executableBlock(result);
        } else if ([NSNumber class] == class) {
            int result = 0;
            
            for (NSObject *el in weakself.data) {
                if ([el isKindOfClass:class]) {
                    result += [(NSNumber *)el intValue];
                }
            }
            
            weakself.executableBlock(@(result));
        } else if ([NSDate class] == class) {
           NSTimeInterval biggestTimestamp = 0;
            
            for (NSObject *el in weakself.data) {
                if ([el isKindOfClass:class]) {
                    NSTimeInterval timeInterval = [(NSDate *)el timeIntervalSince1970];
                    
                    if (timeInterval > biggestTimestamp) {
                        biggestTimestamp = timeInterval;
                    };
                }
            }
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"dd.MM.yyyy";
            
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:biggestTimestamp];
            NSString *dateString = [dateFormatter stringFromDate:date];
                            
            weakself.executableBlock(dateString);
        }
    };
    
    return Block_copy(block);
}

- (void) setBlockC:(BlockC)executable {
    self.executableBlock = executable;
};

@end


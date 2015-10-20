#define $a(...) ([NSArray arrayWithObjects:__VA_ARGS__, nil])
#define $d(...) ([NSDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil])

#import <Foundation/Foundation.h>

@interface NSArray (MBFunctionalExtensions)
- (void)each:(void(^)(id object))block;
- (NSArray *)map:(id(^)(id object))block;
- (id)reduce:(id(^)(id a, id b))block;
- (NSArray *)filter:(BOOL(^)(id object))block;
- (id)inject:(id(^)(id accumulator, id object))block initial:(id)accumulator;
@end

@interface NSDictionary (MBFunctionalExtensions)
- (void)each:(void(^)(id key, id object))block;
- (NSDictionary *)map:(id(^)(id key, id object))block;
- (NSDictionary *)filter:(BOOL(^)(id key, id object))block;
- (id)inject:(id(^)(id accumulator, id key, id object))block initial:(id)accumulator;
- (NSArray *)keys;
- (NSArray *)objects;
@end

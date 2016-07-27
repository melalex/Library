//
//  NSArray+MELEquality.m
//  MyBook
//
//  Created by Александр Мелащенко on 7/8/16.
//  Copyright © 2016 Александр Мелащенко. All rights reserved.
//

#import "NSArray+MELEquality.h"

#define BOOLEAN char
#define TRUE 1
#define FALSE 0

@implementation NSArray (MELEquality)

// Проверяет на равенство независимо от порядка элементов

- (BOOL)isSame:(NSArray *)other;
{
    BOOL result = NO;
    if(other.count == self.count)
    {
        BOOLEAN *visited = (BOOLEAN *)calloc(self.count, sizeof(BOOLEAN));
        
        NSInteger selfIndex = 0;
        NSInteger otherIndex = 0;
        
        for(selfIndex = 0; selfIndex < self.count; selfIndex++)
        {
            for(otherIndex = 0; otherIndex < other.count; otherIndex++)
            {
                if([self[selfIndex] isEqual:other[otherIndex]] && !visited[otherIndex])
                {
                    visited[otherIndex] = TRUE;
                    break;
                }
            }
            
            if(otherIndex == other.count)
                break;
        }
        
        if(selfIndex == self.count)
            result = YES;
        
        free(visited);
    }
    
    return result;
}

@end


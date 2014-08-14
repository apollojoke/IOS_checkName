//
//  WDWPerson.m
//  CheckName
//
//  Created by twer on 8/13/14.
//  Copyright (c) 2014 Jun Lee. All rights reserved.
//

#import "WDWPerson.h"

@implementation WDWPerson

-(NSString *)checkName{
    if ([@"yibo" isEqualToString:[self.name lowercaseString]]){
        return @"100\n绝世大淫魔！！！";
    }
    int score=0;
    
    for (int i=0;i<self.name.length;i++) {
        score+=[self.name characterAtIndex:i];
    }
    score=score%100;
    
    if (score>0&&score<=25) {
        return [NSString stringWithFormat:@"%d\n有点不纯洁了", score];
    }
    if (score>25&&score<=50) {
        return [NSString stringWithFormat:@"%d\n满脑子花花肠子", score];
    }
    if (score>50&&score<=75) {
        return [NSString stringWithFormat:@"%d\n没品的色狼", score];
    }
    if (score>75&&score<100) {
        return [NSString stringWithFormat:@"%d\n色中恶鬼", score];
    }
    return @"0\n小纯洁";
}

@end
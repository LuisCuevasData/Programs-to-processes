#include <stdio.h>
#include "mini.h"

/*
    Input: A long long (64 bit) integer, x.
    Returns 11 if x > 3, otherwise returns 17.
*/
unsigned long long sort(long long x) {
     if (x > 3) {
        return 11;
    } else {
        return 17;
    }   
}

/*
    Input: Two long long (64 bit) integers x and y.
    Returns 1 if x > y, otherwise, if both x and y are greater than 3, returns 12.
    All other cases return 33.
*/
unsigned long long branch(long long x, long long y) {
        if (x > y) {
        return 1;
    } else if (x > 3 && y > 3) {
        return 12;
    } else {
        return 33;
    }

}

/*
    Input: Two integers (32 bits) x and y.
    Returns: the sum of i*j where i < x, and j < y. 
    For example loop(3,2) = 3*2 + 2*1 = 8.
*/
int loop(int x, int y) {
     int result = 0;
    while (x > 0 && y > 0) {
        result += x * y;
        x--;
        y--;
    }
    return result; 
}
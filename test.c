#include <stdio.h>

int foo(unsigned int x)
{
    long i;
    double a=1, b=2, c=3, d=4;
    for (i = 0; i < 1000000000; i++) {
        x *= x;
        x += 3;
        a /= d;
        c *= a;
        c /= c * b;
        b += c + b * a / d * (a+b+c+d);
    }
    return (int)x;
}

int main(int argc, char **argv)
{
    int z = 2347823;
    z = foo(z);
    printf("Hello, world! %d\n", z);
    z += 4;
    printf("z = %d\n", z);
}

# Fibonacci Tests

## Implementations tested:

### Recursive

The usual recursive calculation of Fibonacci numbers.

#### Recursive1

The usual recursive calculation but with 1 to 9 as constants.

#### Recursive2

A variant of the recursive algorithm where the Fibonacci numbers of roughly half the original request
are combined.

### Iterative

The usual iterative calculation

### Binet

Calculation using Binet's equation. Binet1 and Binet2 use slightly different implementations of the equation.

While the equation is simple it rapidly becomes subject to rounding errors.

### Array

The values are stored in an array.

### Hybrid

For 1 to 40 the array method is used and for values over 40 the recursive2 method is used.

## Results

![results of Fibonacci tests](timing.svg)

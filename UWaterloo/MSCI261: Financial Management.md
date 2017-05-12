### Interest Rates
```

              ↑ F=172,220
1965          |
--------------- 2013
|
↓ P=18

F = P(F|P,i,N), F|P mean F given P
F = 18(1+i)^48
solving for i, we get 21% annual ROR over 50 years, or Return on Revenue
```

**Nominal** is the stated interest rate, agnostic of compounding period (sometimes called APR)
- 12% compounded monthly refers to the nominal rate, but is actually **Effectively** 12.68%

Annuity starts not at payment period 0 but at 1.
- method 1: P = 20/(1+i)^2 + 20/(1+i)^3 + 20/(1+i)^4
- method 2: P<sub>1</sub> = A(P given A, i, N)
  - multiplying (1+i)<sup>n</sup> is (F/P,i,N)
  - multiply by 1/(1+i)^n is (P/F,i,N)

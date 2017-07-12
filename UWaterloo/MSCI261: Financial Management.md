### Chapter 3: Interest and Equivalence
tl;dr money at different times should be valued at different ratios, based on interest rates that compound
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
- P<sub>1</sub> = A(P given A, i, N)
  - multiplying (1+i)<sup>n</sup> is (F/P,i,N)
  - multiply by 1/(1+i)^n is (P/F,i,N)

### Chapter 4: Equivalence of Repeated Cash Flows

For uniform series over time, to calculate future amount:

<img width="449" alt="screen shot 2017-05-30 at 11 07 28 pm"  alt="uniform series" src="https://cloud.githubusercontent.com/assets/7998752/26614184/d629a0cc-458c-11e7-9a84-ea0f84119caa.png">

For uniform series calculating its present value (considering compounding interest):

<img width="424" alt="screen shot 2017-05-30 at 11 08 19 pm" alt="" src="https://cloud.githubusercontent.com/assets/7998752/26614195/e4bd599e-458c-11e7-92b7-188104538876.png">



<img width="382" alt="screen shot 2017-05-30 at 11 08 44 pm" src="https://cloud.githubusercontent.com/assets/7998752/26614208/f4466da6-458c-11e7-8571-7b68232d3970.png">


<img width="517" alt="screen shot 2017-05-30 at 11 09 07 pm" src="https://cloud.githubusercontent.com/assets/7998752/26614229/03d360a8-458d-11e7-8cd9-894712fe2ac4.png">

### Chapter 5: Present Worth Analysis
One way of comparing things is with present worth analysis
- **independent alternatives** are the cash flows of each alternative not relating 
- **mutually exclusive alternatives** choose only one out of many
- **present worth analysis** is evaluating mutually exlcusive alternatives at the present time
  - net present worth = PW(benefit) - PW(cost)

### Chapter 8: Risk
Average, Sqr, Varp, Stdevp, Frequency, Count, Ln

Three risk characteristics of financial assets
- **Horizon**, how long it takes to get money
- **Safety** is there guarantee?
- **Liquidity** how easy it is to sell the asset

**Ex-ante** is the expected return of an investment
- on a bond, we already know what to expect, so you can simply calculate ex-ante

**Ex-post** is a measure of past performance
- actual return realized upon sale of the asset
- will be the same as ex-ante if you sell at bond maturity date


### Chapter 6: Choosing a discount rate
We used net present value and internal rate of return
- for **discounting**,  
- Weighted average cost of capital (WACC) is the funding cost for many corporate projects

<img width="641" alt="screen shot 2017-07-12 at 1 33 04 pm" src="https://user-images.githubusercontent.com/7998752/28131059-b697443a-6706-11e7-98cd-4f2c16f90ae6.png">

### Chapter 15: Minimum Attractive Rate of Return (MARR)

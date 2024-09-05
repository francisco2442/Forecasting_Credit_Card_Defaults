# Forecasting Credit Card Defaults
**The question we want to answer:** 

What is the probability of a client defaulting on their next month's credit card payment?

## Conclusion 
**The probability of someone defaulting on their next month's credit card payment is 7.46 %.**

The model correctly predicted 81.1% of the outcomes for the credit card clients.

### Confusion Matrix Results:

True Negatives (No → No): 22,729

False Positives (Yes → No): 5,034

False Negatives (No → Yes): 635

True Positives (Yes → Yes): 1,602

Accuracy: 0.811           
95% CI: (0.8066, 0.8154)
No Information Rate: 0.7788          
P-Value [Acc > NIR]: < 2.2e-16 

### Calculating Probability of Default
Total Default (Yes) = True Positives + False Negatives

Total Default = 1602 + 635 = 2237

Total Predictions = Sum of all Results

Total Predictions = 22729 + 5034 + 635 + 1602 = 30000

Probability of Default = Total Defaults / Total Predictions

Probability of Default = (2237 / 30000) * 100 = 7.46%
#### Probability of Default = 7.46 %

## Recommendations


## Summary of Insights

## Metrics

## Data Visuals 

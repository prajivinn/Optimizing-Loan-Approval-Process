# Optimizing-Loan-Approval-Process

Project_Link: https://prajivinn.github.io/2024/01/07/Optimizing-Loan-Approval-Process.html

In this project we aim to create an end-to-end solution using SQL, Power BI, and Python, providing valuable insights to help the FinTech company in India make informed decisions and optimize their loan approval process.

## Context

A fintech company operating in India wants to optimize its loan approval process. They receive a large volume of loan applications daily and want to improve their approval process to reduce the risk of defaults while ensuring fair and timely approval decisions.

I will build an ML model that would help the company to assess the creditworthiness of future applicants which would help them process loans faster.


## Data Dictionary


* loan_id - Loan ID of the applicant.
* no_of_dependents - Number of Dependents for the person.
* gender - Refers to the gender of the person i.e ‘male’ or ‘female’
* education - Refers to the education.
* self_employed - whether the person is self-employed or not.
* income_annum - Refers to the yearly income of the person.
* loan_amount - Refers to the loan amount disbursed.
* loan_term_yrs - Refers to the loan term in years.
* cibil_score - This is a cibil score of the person.
* residential_assets_value - Refers to the price of residential assets such as apartment, villa etc.
* commercial_assets_value - Refers to the price of commerical assets such as offices, medical centres, hotels, malls etc.
* luxury_assets_value - Refers to the price of luxury assets such as luxury cars or items.
* bank_asset_value - Refers how much money is in the bank including bank shares, Fixed deposits etc.
* loan_status - Refers to the status of the loan whether it is approved or not.


## Actions

I’ve peformed data cleaning using SQL and exploratory data analysis using PowerBI and found out that cibil_score is not the only contributor to the loan approval. Moreover, Approximately 62.2% of the loans in the dataset are approved (2656 out of 4,269), indicating a moderate class imbalance.

Even so, I make sure to not rely on classification accuracy alone when assessing results - also analysing Precision, Recall, and F1-Score.

As I am predicting a binary output, I tested four classification modelling approaches, namely:

* Logistic Regression
* Decision Tree
* Random Forest
* K Nearest Neighbours (KNN)
  
For each model, I will import the data in the same way but will need to pre-process the data based up the requirements of each particular algorithm. I will train & test each model, look to refine each to provide optimal performance, and then measure this predictive performance based on several metrics to give a well-rounded overview of which is best.


## Results
Based on the exploratory data analysis performed using SQL, PowerBI and Python it is found that the major factors affecting the loan approval or rejection are

* Cibil_score
* annual_income
* loan_term

The goal was to build a model that would accurately predict the loan_status which will be helpful in determining the creditworthiness of future applicants.

The chosen model is the Random Forest as it was

a) the most consistently performant on the test set across classification accuracy, precision, recall, and f1-score.

b) the feature importance and permutation importance allows the client an understanding of the key drivers behind loan_status.


**Metric 1: Classification Accuracy**

Random Forest = 0.985
Decision Tree = 0.968
Logistic Regression = 0.917
KNN = 0.876


**Metric 2: Precision**

Random Forest = 0.985
Decision Tree = 0.983
Logistic Regression = 0.921
KNN = 0.903


**Metric 3: Recall**

Random Forest = 0.991
Decision Tree = 0.966
Logistic Regression = 0.947
KNN = 0.896


**Metric 4: F1 Score**

Random Forest = 0.988
Decision Tree = 0.974
Logistic Regression = 0.934
KNN = 0.900


## Growth & Next Steps 

While predictive accuracy was relatively high - other modelling approaches could be tested, especially those somewhat similar to Random Forest, for example XGBoost, LightGBM to see if even more accuracy could be gained.

While the model demonstrates strong performance, further improvements can be made by incorporating additional relevant features such as alternative credit signals (e.g., transaction behavior, repayment history, or digital footprint data). Additionally, advanced feature engineering techniques and hyperparameter tuning can be applied to further enhance model performance.

Additionally, Validation using time-based splits or evaluation on recent loan application data prior to deployment is recommended to ensure the model generalizes well to future applicants and evolving credit risk dynamics.

From a business perspective, optimizing the classification threshold to reduce false positives (i.e., approving risky applicants) would be critical to minimize financial losses because Saving from bad loans ( False positives ) > losing some good customers ( False negatives )

While the model is already well balanced in terms of false positives and false negatives, from a business perspective, further optimization of the decision threshold can be explored depending on the company’s risk appetite. In lending scenarios, reducing false positives (approving risky applicants) may be prioritized even at the cost of slightly increasing false negatives.

Continuous monitoring and periodic retraining of the model will be important to capture changing borrower behavior, economic conditions, and credit risk patterns over time, ensuring the model maintains its predictive performance and reliability

Introduction
=================================

Variables used:
- a(x_test.txt) :   Text set containing 561-feature vector with time and frequency domain variables.
- b(x_train.txt) :  Train set containing 561-feature vector with time and frequency domain variables. 
- c(y_test.txt) :   Test label set
- d(y_train.txt) :  Train label set
- e(subject_test.txt) : Test dataset identifying which subject performed which activity.
- f( subject_train.txt) : Train dataset identifying which subject performed which activity.

Note: All clipped together using rbind() to form:
  - X_combined : rbind() on a and b variables.
  - Y_combined : rbind() on c and d variables.
  - Subjects_combined : rbind() on e and f variables.
- allData : cbind() on the X_combined, Y_combined and Subjects_combined variables.

- features : variable to store the data in features.txt.
activity_type : variable to to store the data in features.txt.

original_colnames : original input column names
updated_colnames : labels and columns names after they have been cleaned.

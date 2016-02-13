---
title: "README"
author: "d.farber"
output: html_document
---

#How to run the script
To run "run_analysis.R" locate it in a folder containing the directories "test" and "train" and the files "activity_labels" and "features". The directory "test" should contain the files "subject_test", "X_test" and "y_test". "train" should contain the files "subject_train", "X_train" and "y_train".
The script uses alle these files to construct one tidy dataset called "tidyData". It has descriptive column names and descriptive activity values.
# ==============================================================================
# Decision Curve Analysis (DCA) Example
# Using a Publicly Available Cancer Diagnosis Dataset
# ==============================================================================

#Install pacakges --------------------------------------------------------------
install.packages(c(  "tidyverse", "dcurves", "gtsummary", "readxl", "labelled"))

# Load Libraries ---------------------------------------------------------------
library(dcurves)
library(tidyverse)
library(gtsummary)
library(readxl)
library(labelled)

# Set Working Directory -------------------------------------------------------
setwd("C:/Your/Folder/Path")

# Import Public Dataset --------------------------------------------------------
dataset <-
  readr::read_csv(
    file = "https://raw.githubusercontent.com/ddsjoberg/dca-tutorial/main/data/df_cancer_dx.csv"
  ) %>%
  labelled::set_variable_labels(
    patientid       = "Patient ID",
    cancer          = "Cancer Diagnosis",
    risk_group      = "Risk Group",
    age             = "Patient Age",
    famhistory      = "Family History",
    marker          = "Marker",
    cancerpredmarker = "Prediction Model"
  )
#Import your own dataset
dataset <- read.csv("your_data_file.csv")
dataset <- read_excel("your_data_file.xlsx")

# Handle Missing Data ----------------------------------------------------------
colSums(is.na(cancer_dataset[, c("cancer", "famhistory", "marker")]))

cancer_dataset <- cancer_dataset %>% 
   drop_na(cancer, famhistory, marker)

  
# Quick Summary ----------------------------------------------------------------
cancer_dataset %>%
  select(cancer, famhistory, marker) %>%
  tbl_summary()

# Logistic Regression Models --------------------------------------------------

# Model 1: Family History Only
model_family <- glm(
  cancer ~ famhistory,
  data = cancer_dataset,
  family = binomial
)
#Regression Summary for model_family
tbl_regression(model_family, exponentiate = TRUE)

# Model 2: Marker Only
model_marker <- glm(
  cancer ~ marker,
  data = cancer_dataset,
  family = binomial
)
#Regression Summary for model_marker
tbl_regression(model_marker, exponentiate = TRUE)

# Model 3: Marker + Family History
model_combined <- glm(
  cancer ~ marker + famhistory,
  data = cancer_dataset,
  family = binomial
)
#Regression Summary for mod_fam
tbl_regression(model_combined, exponentiate = TRUE)

# Add Predicted Probabilities to your dataset ----------------------------------
cancer_dataset$family_pred <-predict(model_family, type = "response")
cancer_dataset$marker_pred <-predict(model_marker, type = "response")
cancer_dataset$combo_pred <-predict(model_combined, type = "response")
#Check if the variables are added to the dataset
View(cancer_dataset)

# Decision Curve Analysis ------------------------------------------------------
dca_results <- dca(
  cancer ~ family_pred + marker_pred + combo_pred,
  data = cancer_dataset,
  thresholds = seq(0, 0.5, 0.01)
)

# Save your DCA results as CSV--------------------------------------------------
View(dca_results$dca)
write.csv(dca_results$dca, "dca_results_cancer.csv", row.names = FALSE)

# Plot DCA Curves---------------------------------------------------------------
dca(
  cancer ~ family_pred + marker_pred + combo_pred,
  data = cancer_dataset,
  thresholds = seq(0, 0.5, 0.01)
) %>% 
  plot()

#Individual plot 
dca(
  cancer ~ family_pred , data = cancer_dataset, 
  thresholds = seq(0, 0.5, 0.01)) %>%  plot()

dca(
  cancer ~ marker_pred , data = cancer_dataset, 
  thresholds = seq(0, 0.5, 0.01)) %>%  plot()

dca(
  cancer ~ combo_pred , data = cancer_dataset, 
  thresholds = seq(0, 0.5, 0.01)) %>%  plot()


# Martin R. Vasilev, 2017

# calculate the correlation between means in within-subject design studies (r)

# Due to the fact that this information is not reported in published reports, I use the raw data from available 
# studies (and one published correlation coefficient) to estimate this value. 

# The obtained estimates are meta-analysed to obtained the pooled correlation coefficient that will be used for 
# calculating the effect sizes in the meta-analysis.


##########
source("Functions/effect_sizes.R")

r<- NULL
var_r<- NULL
N<- NULL

# available studies:

# 1 (Hyönä & Ekholm, 2016, Experiment 1)
library(readr)

HE1 <- read_delim("Literature_search/study_data/H&E_Exp1.txt", 
                       "\t", escape_double = FALSE, trim_ws = TRUE)
# average out sentence complexity
sub<- HE1$subject
Silence_first_pass<- (HE1$`silence_SVO_first-pass`+HE1$`silence_OVS_first-pass`)/2
Silence_lookback<-  (HE1$silence_SVO_lookback+HE1$silence_OVS_lookback)/2
Italian_first_pass<- (HE1$`Italian_SVO_first-pass`+ HE1$`Italian_OVS_first-pass`)/2
Italian_lookback<- (HE1$Italian_SVO_lookback+ HE1$Italian_OVS_lookback)/2
Finnish_first_pass<- (HE1$`Finnish_SVO_first-pass`+ HE1$`Finnish_OVS_first-pass`)/2
Finnish_lookback<- (HE1$Finnish_SVO_lookback+HE1$Finnish_OVS_lookback)/2

HE1<- data.frame(sub, Silence_first_pass, Silence_lookback, Italian_first_pass, Italian_lookback,
                 Finnish_first_pass, Finnish_lookback)

# Silence vs Italian (first-pass):
Corr1<- cor.test(HE1$Silence_first_pass, HE1$Italian_first_pass)

# Silence vs Italian (lookback):
Corr2<- cor.test(HE1$Silence_lookback, HE1$Italian_lookback)

# Silence vs Finnish (first-pass):
Corr3<- cor.test(HE1$Silence_first_pass, HE1$Finnish_first_pass)

# Silence vs Finnish (lookback):
Corr4<- cor.test(HE1$Silence_lookback, HE1$Finnish_lookback)

# I aggregate coefficients to avoid stochastical dependency between the effect sizes
# (bc they are computed from same participants)
r[1]<- mean(c(Corr1$estimate, Corr2$estimate, Corr3$estimate, Corr4$estimate))
var_r[1]<- corr_var(r[1], max(HE1$sub))
N[1]<- max(HE1$sub)

##################

# 2 (Hyönä & Ekholm, 2016, Experiment 2):
HE2 <- read_delim("Literature_search/study_data/H&E_Exp2.txt", 
                  "\t", escape_double = FALSE, trim_ws = TRUE)
# average out sentence complexity:
sub<- HE2$subject 
Silence_first_pass<- (HE2$`silence_SVO_first-pass` + HE2$`silence_OVS_first-pass`)/2
Silence_lookback<- (HE2$silence_SVO_lookback+ HE2$silence_OVS_lookback)/2

Scr_diff_first_pass<- (HE2$`scr_diff_SVO_first-pass`+ HE2$`scr_diff_OVS_first-pass`)/2
Scr_diff_lookback<- (HE2$scr_diff_SVO_lookback+ HE2$scr_diff_OVS_lookback)/2

Scr_same_first_pass<- (HE2$`scr_same_SVO_first-pass`+ HE2$`scr_same_OVS_first-pass`)/2
Scr_same_lookback<- (HE2$scr_same_SVO_lookback+ HE2$scr_same_OVS_lookback)/2

HE2<- data.frame(sub, Silence_first_pass, Silence_lookback, Scr_diff_first_pass, Scr_diff_lookback,
                 Scr_same_first_pass, Scr_same_lookback)

# Silence vs Scrambled different (first-pass):
Corr1<- cor.test(HE2$Silence_first_pass, HE2$Scr_diff_first_pass)

# Silence vs Scrambled different (lookback):
Corr2<- cor.test(HE2$Silence_lookback, HE2$Scr_diff_lookback)

# Silence vs Scrambled same (first-pass):
Corr3<- cor.test(HE2$Scr_diff_first_pass, HE2$Scr_same_first_pass)

# Silence vs Scrambled same (lookback):
Corr4<- cor.test(HE2$Silence_lookback, HE2$Scr_same_lookback)


r[2]<- mean(c(Corr1$estimate, Corr2$estimate, Corr3$estimate, Corr4$estimate))
var_r[2]<- corr_var(r[2], max(as.numeric(as.character(HE2$sub))))
N[2]<- max(as.numeric(as.character(HE2$sub)))



##################

# 3 (Hyönä & Ekholm, 2016, Experiment 3):
HE3 <- read_delim("Literature_search/study_data/H&E_Exp3.txt", 
                  "\t", escape_double = FALSE, trim_ws = TRUE)
# 3 subjects missing for unknown reason
N[3]<- nrow(HE3)

# average out sentence complexity:
sub<- HE3$subject 
Silence_first_pass<- (HE3$`silence_SVO_first-pass`+ HE3$`silence_OVS_first-pass`)/2
Silence_lookback<- (HE3$silence_SVO_lookback+ HE3$silence_OVS_lookback)/2

Coherent_first_pass<- (HE3$`coherent_SVO_first-pass`+ HE3$`coherent_OVS_first-pass`)/2
Coherent_lookback<- (HE3$coherent_SVO_lookback+ HE3$coherent_OVS_lookback)/2

Scrambled_first_pass<- (HE3$`scrambled_SVO_first-pass`+ HE3$`scrambled_OVS_first-pass`)/2
Scrambled_lookback<- (HE3$scrambled_SVO_lookback+ HE3$scrambled_OVS_lookback)/2

HE3<- data.frame(sub, Silence_first_pass, Silence_lookback, Coherent_first_pass, Coherent_lookback,
                 Scrambled_first_pass, Scrambled_lookback)

# Silence vs Coherent (first-pass):
Corr1<- cor.test(HE3$Silence_first_pass, HE3$Coherent_first_pass)

# Silence vs Coherent (lookback):
Corr2<- cor.test(HE3$Silence_lookback, HE3$Coherent_lookback)

# Silence vs Scrambled (first-pass):
Corr3<- cor.test(HE3$Silence_first_pass, HE3$Scrambled_first_pass)

# Silence vs Scrambled (lookback):
Corr4<- cor.test(HE3$Silence_lookback, HE3$Scrambled_lookback)


r[3]<- mean(c(Corr1$estimate, Corr2$estimate, Corr3$estimate, Corr4$estimate))
var_r[3]<- corr_var(r[3], N[3])



##################

# 4 (Hyönä & Ekholm, 2016, Experiment 4):
HE4 <- read_delim("Literature_search/study_data/H&E_Exp4.txt", 
                  "\t", escape_double = FALSE, trim_ws = TRUE)
# 3 subjects missing for unknown reason
N[4]<- nrow(HE4)


# average out sentence complexity:
sub<- HE4$subject 
Silence_first_pass<- (HE4$`silence_SVO_first-pass`+HE4$`silence_OVS_first-pass`)/2
Silence_lookback<- (HE4$silence_SVO_lookback+HE4$silence_OVS_lookback)/2

Scr_sem_first_pass<- (HE4$`scr_sem_SVO_first-pass`+HE4$`scr_sem_OVS_first-pass`)/2
Scr_sem_lookback<- (HE4$scr_sem_SVO_lookback+HE4$scr_sem_OVS_lookback)/2

Scr_syn_first_pass<- (HE4$`scr_syn_SVO_first-pass`+HE4$`scr_syn_OVS_first-pass`)/2
Scr_syn_lookback<- (HE4$scr_syn_SVO_lookback+HE4$scr_syn_OVS_lookback)/2

HE4<- data.frame(sub, Silence_first_pass, Silence_lookback, Scr_sem_first_pass, Scr_sem_lookback,
                 Scr_syn_first_pass, Scr_syn_lookback)

# Silence vs Scr_sem (first-pass):
Corr1<- cor.test(HE4$Silence_first_pass, HE4$Scr_sem_first_pass)

# Silence vs Scr_sem (lookback):
Corr2<- cor.test(HE4$Silence_lookback, HE4$Scr_sem_lookback)

# Silence vs Scr_syn (first-pass):
Corr3<- cor.test(HE4$Silence_first_pass, HE4$Scr_syn_first_pass)

# Silence vs Scr_syn (lookback):
Corr4<- cor.test(HE4$Silence_lookback, HE4$Scr_syn_lookback)


r[4]<- mean(c(Corr1$estimate, Corr2$estimate, Corr3$estimate, Corr4$estimate))
var_r[4]<- corr_var(r[4], N[4])


##################

# 4 (Hyönä & Ekholm, 2016, Experiment 4):

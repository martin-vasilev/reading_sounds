

load("Data/data.Rda")
source("functions/settings.R")
source("functions/effect_sizes.R")

t<- data[1,]; t[1,]<- NA

#----------------------------------------
# "general" meta-analysis (all sounds):
#----------------------------------------

## reading comprehension:
d<- subset(subset(data, is.element(task, RC) & measure!="reading_speed"))

# ID 1:
N=1
gen<- d[N,]# only 1 ES
gen$sound<- as.character(gen$sound)
gen$sound_type<- as.character(gen$sound_type)

# ID 2: 
N<- 2

a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$N_C[N]<- a$N_C[1] # only 1 control group
gen$N_E[N]<- sum(a$N_E)
gen$sound[N]<- "noise+speech"
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)

gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N], S_E = gen$var_E[N], 
                    N_C = gen$N_C[N], N_E = gen$N_E[N], design = gen$design[N], type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N_C = gen$N_C[N], N_E = gen$N_E[N], design = gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N_C = gen$N_C[N], N_E = gen$N_E[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N_C = gen$N_C[N], N_E = gen$N_E[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N]- 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N]+ 1.96*sqrt(gen$g_var[N])


# ID 3:
N<- 3
a<- subset(d, ID==N)
gen<- rbind(gen, a)


# ID 4:
N<- 4
a<- subset(d, ID==N)
gen<- rbind(gen, a)


# ID 5:
N<- 5
a<- subset(d, ID==N)
gen<- rbind(gen, a)

# ID 6: 
N<- 6
a<- subset(d, ID==N)
gen<- rbind(gen, a)

# ID 7:
N<- 7
a<- subset(d, ID==N)
gen<- rbind(gen, a)

# ID 8:
N<- 8
a<- subset(d, ID==N)
gen<- rbind(gen, a)

# ID 9:
N<- 9
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]

gen$sound[N]<- "music"
gen$sound_type[N]<- "classical+pop+vocal"

# WATCH OUT for SE!
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)

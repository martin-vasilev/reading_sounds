

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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 10:
N<- 10
a<- subset(d, ID==N)
gen<- rbind(gen, a)

# ID 11:
N<- 11
a<- subset(d, ID==N)
gen<- rbind(gen, a)


# ID 12:
N<- 12
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "noise+music"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 13:
N<- 13
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$sound[N]<- "music"
gen$sound_type[N]<- "classical+rock"
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N], S_E = gen$var_E[N],
                    N = gen$N_C[N], design = gen$design[N], type = "E-C", r=r)
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], design = gen$design[N], r = r)
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])

# ID 14:
N<- 14
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music"
gen$sound_type[N]<- "vocal+instrumental"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 15:
N<- 15
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music"
gen$sound_type[N]<- "various"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)  
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 16:
N<- 16
a<- subset(d, ID==N)
gen<- rbind(gen, a)


# ID 17:
N<- 17
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$sound[N]<- "music"
gen$sound_type[N]<- "classical+pop"
gen$mean_C[N]<- a$mean_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 18:
N<- 18
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$sound[N]<- "music"
gen$sound_type[N]<- "classical+rock"
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 19:
N<- 19
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music"
gen$sound_type[N]<- "complex+simple"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 20:
N<- 20
a<- subset(d, ID==N)
gen<- rbind(gen, a)


# ID 21:
N<- 21
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music"
gen$sound_type[N]<- "vocal+instrumental"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 22:
N<- 22
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$sound[N]<- "music"
gen$sound_type[N]<- "lyrical+ non-lyrical"
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N]*sqrt(gen$N_C[N]),
                    S_E = gen$var_E[N]*sqrt(gen$N_C[N]), N = gen$N_C[N], r = r, design = gen$design[N],
                    type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], r = r, design = gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 23:
N<- 23
a<- subset(d, ID==N)
gen<- rbind(gen, a)


# ID 24:
N<- 24
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music"
gen$sound_type[N]<- "sedative+stimulative"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]  
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])


# ID 25:
N<- 25
a<- subset(d, ID==N)
gen<- rbind(gen, a)


# ID 26:
N<- 26
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$db[N]<- mean(a$db)
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$sound[N]<- "noise"
gen$sound_type[N]<- "continuous+intermittent"
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N])  


# ID 27:
N<- 27
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$sound[N]<- "speech+noise"
gen$mean_C[N]<- mean(a$mean_C[1:2])
gen$var_C[N]<- mean(a$var_C[1:2])
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N]*sqrt(gen$N_C[N]), 
                    S_E = gen$var_E[N]*sqrt(gen$N_C[N]), N = gen$N_C[N], r = r, design = gen$design[N], type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], r = r, design = gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 28:
N<- 28
a<- subset(d, ID==N) # not in this group


# ID 29:
N<- 29
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$sound[N]<- "music+speech"
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N]*sqrt(gen$N_C[N]),
                    S_E = gen$var_E[N]*sqrt(gen$N_C[N]), N = gen$N_C[N], r = r, design = gen$design[N],
                    type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], r = r, design= gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 30:
N<- 30
a<- subset(d, ID==N)
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music+noise"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N], S_E = gen$var_E[N], 
                    N = gen$N_C[N], r = r, design = gen$design[N], type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], r = r, design = gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 31:
N<- 31
a<- subset(d, ID==N) # no ES


# ID 32:
N<- 32
a<- subset(d, ID==N) # no ES


# ID 33:
N<- 33
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music+speech+noise"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 34:
N<- 34
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music"
gen$sound_type[N]<- "vocal+instrumental"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 35:
N<- 35
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "noise+speech"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$d[N]<- mean(a$d)  
gen$d_var[N]<- mean(a$d_var)  
gen$g[N]<- mean(a$g)  
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 36:
N<- 36
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "noise+speech"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1] 
gen$mean_C[N]<- a$mean_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 37:
N<- 37
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "speech+music"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N], S_E = gen$var_E[N], N = gen$N_C[N],
                    r = r, design = gen$design[N], type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], r = r, design= gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 38:
N<- 38
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 39:
N<- 39
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "speech"
gen$sound_type[N]<- "TV ads+drama"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 40:
N<- 40
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "speech+music"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 41:
N<- 41
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "speech+music"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 42:
N<- 42
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "noise"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- sum(a$N_E)
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 43:
N<- 43
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "speech"
gen$sound_type[N]<- "native+foreign"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N], S_E = gen$var_E[N], N = gen$N_C[N], 
                    r = r, design = gen$design[N], type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], r = r, design = gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 44:
N<- 44
a<- subset(d, ID==N) # no cases


# ID 45:
N<- 45
a<- subset(d, ID==N) # no cases


# ID 46:
N<- 46
a<- subset(d, ID==N) # no cases


# ID 47:
N<- 47
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 48:
N<- 48
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 49:
N<- 49
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 50
N<- 50
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 51:
N<- 51
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 52:
N<- 52
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 53:
N<- 53
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 54:
N<- 54
a<- subset(d, ID==N) # no case


# ID 55:
N<- 55
a<- subset(d, ID==N) # no case


# ID 56:
N<- 56
a<- subset(d, ID==N) # no case


# ID 57:
N<- 57
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 58:
N<- 58
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "noise+speech"
gen$N_C[N]<- a$N_C[1]
gen$N_E[N]<- a$N_E[1]
gen$mean_C[N]<- a$mean_C[1]
gen$var_C[N]<- a$var_C[1]
gen$mean_E[N]<- mean(a$mean_E)
gen$var_E[N]<- mean(a$var_E)
gen$d[N]<- Cohens_d(M_C = gen$mean_C[N], M_E = gen$mean_E[N], S_C = gen$var_C[N], S_E = gen$var_E[N], N = gen$N_C[N], 
                    r = r, design = gen$design[N], type = "E-C")
gen$d_var[N]<- Cohens_d_var(d = gen$d[N], N = gen$N_C[N], r = r, design = gen$design[N])
gen$g[N]<- Hedges_g(d = gen$d[N], N = gen$N_C[N], design = gen$design[N])
gen$g_var[N]<- Hedges_g_var(d_var = gen$d_var[N], N = gen$N_C[N], design = gen$design[N])
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


#-----
gen<- subset(gen, !is.na(ID))

references<- gen$reference
gen$reference<- NULL

gen$mds<- NULL
gen$mds_var<- NULL
for(i in 1:nrow(gen)){
  if(gen$design[i]=="between"){
    gen$mds[i]<- gen$g[i]
    gen$mds_var[i]<- var_IG(N_C = gen$N_C[i], N_E = gen$N_E[i], d_IG = gen$g[i])  # gen$g_var[i]
  } else{
    gen$mds[i]<- d_IG(d_RM =gen$g[i], r = r) #gen$g[i]
    gen$mds_var[i]<- var_IGr(r = r, n = gen$N_C[i], d_IG = gen$mds[i])
  }
}


# Save data: 
save(gen, file= "Data/subset/gen.Rda")
write.csv(gen, file= "Data/subset/gen.csv")
rm(gen)



#----------------------------------------
# "general" meta-analysis (all sounds):
#----------------------------------------

## reading comprehension:
d<- subset(subset(data, is.element(task, RC) & measure=="reading_speed"))
d$sound<- as.character(d$sound)

# ID 1:
N<- 1
a<- subset(d, ID==N) 
gen_speed<- a


# ID 2:
N<- 2
a<- subset(d, ID==N) 
gen_speed<- rbind(gen_speed, t)
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- sum(a$N_E)
gen_speed$sound[N]<- "noise+speech"
gen_speed$mean_C[N]<- a$mean_C[1]
gen_speed$var_C[N]<- a$var_C[1]
gen_speed$mean_E[N]<- mean(a$mean_E)
gen_speed$var_E[N]<- mean(a$var_E)
gen_speed$d[N]<- mean(a$d)
gen_speed$d_var[N]<- mean(a$d_var)
gen_speed$g[N]<- mean(a$g)
gen_speed$g_var[N]<- mean(a$g_var)
gen_speed$CI95_L[N]<- gen_speed$g[N] - 1.96*sqrt(gen_speed$g_var[N])
gen_speed$CI95_R[N]<- gen_speed$g[N] + 1.96*sqrt(gen_speed$g_var[N]) 


# ID 15:
N<- 15
a<- subset(d, ID==N) 
gen_speed<- rbind(gen_speed, t)
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- sum(a$N_E)
gen_speed$sound[N]<- "music"
gen_speed$mean_C[N]<- a$mean_C[1]
gen_speed$var_C[N]<- a$var_C[1]
gen_speed$mean_E[N]<- mean(a$mean_E)
gen_speed$var_E[N]<- mean(a$var_E)
gen_speed$d[N]<- mean(a$d)
gen_speed$d_var[N]<- mean(a$d_var)
gen_speed$g[N]<- mean(a$g)
gen_speed$g_var[N]<- mean(a$g_var)
gen_speed$CI95_L[N]<- gen_speed$g[N] - 1.96*sqrt(gen_speed$g_var[N])
gen_speed$CI95_R[N]<- gen_speed$g[N] + 1.96*sqrt(gen_speed$g_var[N]) 


# ID 24:
N<- 24
a<- subset(d, ID==N) 
gen_speed<- rbind(gen_speed, t)
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- sum(a$N_E)
gen_speed$sound[N]<- "music"
gen_speed$mean_C[N]<- a$mean_C[1]
gen_speed$var_C[N]<- a$var_C[1]
gen_speed$mean_E[N]<- mean(a$mean_E)
gen_speed$var_E[N]<- mean(a$var_E)
gen_speed$d[N]<- mean(a$d)
gen_speed$d_var[N]<- mean(a$d_var)
gen_speed$g[N]<- mean(a$g)
gen_speed$g_var[N]<- mean(a$g_var)
gen_speed$CI95_L[N]<- gen_speed$g[N] - 1.96*sqrt(gen_speed$g_var[N])
gen_speed$CI95_R[N]<- gen_speed$g[N] + 1.96*sqrt(gen_speed$g_var[N]) 



gen_speed<- subset(gen_speed, !is.na(ID))

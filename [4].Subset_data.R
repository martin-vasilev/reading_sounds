
rm(list=ls())

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

gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
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
gen$d[N]<- mean(a$d)
gen$d_var[N]<- mean(a$d_var)
gen$g[N]<- mean(a$g)
gen$g_var[N]<- mean(a$g_var)
gen$CI95_L[N]<- gen$g[N] - 1.96*sqrt(gen$g_var[N])
gen$CI95_R[N]<- gen$g[N] + 1.96*sqrt(gen$g_var[N]) 


# ID 59:
N<- 59
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 60:
N<- 60
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


# ID 61:
N<- 61
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music"
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


# ID 62:
N<- 62
a<- subset(d, ID==N) 
gen<- rbind(gen, t)
gen[N,studyCols]<- a[1,studyCols]
gen$sound[N]<- "music+noise"
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


# ID 65:
N<- 65
a<- subset(d, ID==N) 
gen<- rbind(gen, a)


#-----
gen<- subset(gen, !is.na(ID))

references<- gen$reference
gen$reference<- NULL

#gen$mds<- NULL
#gen$mds_var<- NULL
#for(i in 1:nrow(gen)){
#  if(gen$design[i]=="between"){
#    gen$mds[i]<- gen$g[i]
#    gen$mds_var[i]<- var_IG(N_C = gen$N_C[i], N_E = gen$N_E[i], d_IG = gen$g[i])  # gen$g_var[i]
#  } else{
#    gen$mds[i]<- d_IG(d_RM =gen$g[i], r = r) #gen$g[i]
#    gen$mds_var[i]<- var_IGr(r = r, n = gen$N_C[i], d_IG = gen$mds[i])
#  }
#}


# recalculate CIs (due to applying MdS adjustment):
for(i in 1:nrow(gen)){
  gen$CI95_L[i]<- gen$g[i]- 1.96*sqrt(gen$g_var[i])
  gen$CI95_R[i]<- gen$g[i]+ 1.96*sqrt(gen$g_var[i])
}



# Save data: 
save(gen, file= "Data/subset/gen.Rda")
write.csv(gen, file= "Data/subset/gen.csv")
rm(gen)



#----------------------------------------
# "general" meta-analysis (all sounds):
#----------------------------------------

## reading speed:
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


# ID 29:
N<- 29
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech+music"
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


# ID 30:
N<- 30
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "music+noise"
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


# ID 37:
N<- 37
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech+music"
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


# ID 43:
N<- 43
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech"
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


# ID 44:
N<- 44
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech"
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


# ID 45:
N<- 45
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech"
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


# ID 46:
N<- 46
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech"
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


# ID 58:
N<- 58
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech+noise"
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


# ID 64:
N<- 64
a<- subset(d, ID==N) 
gen_speed[N,studyCols]<- a[1,studyCols]
gen_speed$N_C[N]<- a$N_C[1]
gen_speed$N_E[N]<- a$N_C[1]
gen_speed$sound[N]<- "speech"
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

# re-calculate ES:
for(i in 1:nrow(gen_speed)){
  gen_speed$CI95_L[i]<- gen_speed$g[i] - 1.96*sqrt(gen_speed$g_var[i])
  gen_speed$CI95_R[i]<- gen_speed$g[i] + 1.96*sqrt(gen_speed$g_var[i]) 
}

save(gen_speed, file= "Data/subset/gen_speed.Rda")
write.csv(gen_speed, file= "Data/subset/gen_speed.csv")
rm(gen_speed)



#-----------------------------------------------------------------------------------------------------#
#                                     Music (reading comprehension)                                   #
#-----------------------------------------------------------------------------------------------------#

d<- subset(subset(data, is.element(task, RC) & measure!="reading_speed" & sound=="music"))

#t<- data[1,]; t[1,]<- NA


# initial:
music<- d[1:6,]# only 1 ES


# 9:
N<-9
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 10:
N<-10
a<- subset(d, ID==N)
music<- rbind(music, a)


# 11:
N<-11
a<- subset(d, ID==N)
music<- rbind(music, a)


# 12:
N<-12
a<- subset(d, ID==N)
music<- rbind(music, a)


# 13:
N<-13
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- a$N_C[1]
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 14:
N<-14
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 15:
N<-15
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 16:
N<-16
a<- subset(d, ID==N)
music<- rbind(music, a)


# 17:
N<-17
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 18:
N<-18
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 19:
N<-19
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 20:
N<-20
a<- subset(d, ID==N)
music<- rbind(music, a)


# 21:
N<-21
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 22:
N<-22
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- a$N_C[1]
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 23:
N<-23
a<- subset(d, ID==N)
music<- rbind(music, a)


# 24:
N<-24
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- sum(a$N_E)
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 29:
N<-29
a<- subset(d, ID==N)
music<- rbind(music, a)


# 30:
N<-30
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- a$N_C[1]
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 




# 33:
N<-33
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- a$N_C[1]
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 34:
N<-34
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- a$N_C[1]
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 37:
N<-37
a<- subset(d, ID==N)
music<- rbind(music, a)


# 38:
N<-38
a<- subset(d, ID==N)
music<- rbind(music, a)


# 40:
N<-40
a<- subset(d, ID==N)
music<- rbind(music, a)


# 41:
N<-41
a<- subset(d, ID==N)
music<- rbind(music, a)


# 48:
N<-48
a<- subset(d, ID==N)
music<- rbind(music, a)


# 59:
N<-59
a<- subset(d, ID==N)
music<- rbind(music, a)


# 60:
N<-60
a<- subset(d, ID==N)
music<- rbind(music, a)


# 61:
N<-61
a<- subset(d, ID==N)
music[N,studyCols]<- a[1,studyCols]
music$N_C[N]<- a$N_C[1]
music$N_E[N]<- a$N_C[1]
music$sound[N]<- "music"
music$mean_C[N]<- a$mean_C[1]
music$var_C[N]<- a$var_C[1]
music$mean_E[N]<- mean(a$mean_E)
music$var_E[N]<- mean(a$var_E)
music$d[N]<- mean(a$d)
music$d_var[N]<- mean(a$d_var)
music$g[N]<- mean(a$g)
music$g_var[N]<- mean(a$g_var)
music$CI95_L[N]<- music$g[N] - 1.96*sqrt(music$g_var[N])
music$CI95_R[N]<- music$g[N] + 1.96*sqrt(music$g_var[N]) 


# 62:
N<-62
a<- subset(d, ID==N)
music<- rbind(music, a)


# 65:
N<-65
a<- subset(d, ID==N)
music<- rbind(music, a)


music<- subset(music, !is.na(ID))

# re-calculate CIs:
for(i in 1:nrow(music)){
  music$CI95_L[i]<- music$g[i] - 1.96*sqrt(music$g_var[i])
  music$CI95_R[i]<- music$g[i] + 1.96*sqrt(music$g_var[i]) 
}

save(music, file= "Data/subset/music.Rda")
write.csv(music, file= "Data/subset/music.csv")
rm(music)




#-----------------------------------------------------------------------------------------------------#
#                                     Noise (reading comprehension)                                   #
#-----------------------------------------------------------------------------------------------------#

d<- subset(subset(data, is.element(task, RC) & measure!="reading_speed" & sound=="noise"))

noise<- d[1:2,]


# 26:
N<-26
a<- subset(d, ID==N)
noise[N,studyCols]<- a[1,studyCols]
noise$db[N]<- mean(a$db)
noise$N_C[N]<- a$N_C[1]
noise$N_E[N]<- sum(a$N_E)


noise$sound[N]<- "noise"
noise$mean_C[N]<- a$mean_C[1]
noise$var_C[N]<- a$var_C[1]
noise$mean_E[N]<- mean(a$mean_E)
noise$var_E[N]<- mean(a$var_E)
noise$d[N]<- mean(a$d)
noise$d_var[N]<- mean(a$d_var)
noise$g[N]<- mean(a$g)
noise$g_var[N]<- mean(a$g_var)
noise$CI95_L[N]<- noise$g[N] - 1.96*sqrt(noise$g_var[N])
noise$CI95_R[N]<- noise$g[N] + 1.96*sqrt(noise$g_var[N]) 


# 27:
N<-27
a<- subset(d, ID==N)
noise[N,studyCols]<- a[1,studyCols]
noise$N_C[N]<- a$N_C[1]
noise$N_E[N]<- a$N_C[1]
noise$sound[N]<- "noise"
noise$mean_C[N]<- mean(a$mean_C[c(1,2)])
noise$var_C[N]<- mean(a$var_C[c(1,2)])
noise$mean_E[N]<- mean(a$mean_E)
noise$var_E[N]<- mean(a$var_E)
noise$d[N]<- mean(a$d)
noise$d_var[N]<- mean(a$d_var)
noise$g[N]<- mean(a$g)
noise$g_var[N]<- mean(a$g_var)
noise$CI95_L[N]<- noise$g[N] - 1.96*sqrt(noise$g_var[N])
noise$CI95_R[N]<- noise$g[N] + 1.96*sqrt(noise$g_var[N]) 


# 30:
N<-30
a<- subset(d, ID==N)
noise<- rbind(noise, a)


# 33:
N<-33
a<- subset(d, ID==N)
noise<- rbind(noise, a)

# 35:
N<-35
a<- subset(d, ID==N)
noise<- rbind(noise, a)


# 36:
N<-36
a<- subset(d, ID==N)
noise<- rbind(noise, a)


# 42: 
N<-42
a<- subset(d, ID==N)
noise[N,studyCols]<- a[1,studyCols]
noise$N_C[N]<- a$N_C[1]
noise$N_E[N]<- sum(a$N_E)
noise$sound[N]<- "noise"
noise$mean_C[N]<- a$mean_C[1]
noise$var_C[N]<- a$var_C[1]
noise$mean_E[N]<- mean(a$mean_E)
noise$var_E[N]<- mean(a$var_E)
noise$d[N]<- mean(a$d)
noise$d_var[N]<- mean(a$d_var)
noise$g[N]<- mean(a$g)
noise$g_var[N]<- mean(a$g_var)
noise$CI95_L[N]<- noise$g[N] - 1.96*sqrt(noise$g_var[N])
noise$CI95_R[N]<- noise$g[N] + 1.96*sqrt(noise$g_var[N]) 


# 49:
N<-49
a<- subset(d, ID==N)
noise<- rbind(noise, a)


# 58:
N<-58
a<- subset(d, ID==N)
noise<- rbind(noise, a)


# 62:
N<-62
a<- subset(d, ID==N)
noise<- rbind(noise, a)


noise<- subset(noise, !is.na(ID))

# re-calculate CIs:
for(i in 1:nrow(noise)){
  noise$CI95_L[i]<- noise$g[i] - 1.96*sqrt(noise$g_var[i])
  noise$CI95_R[i]<- noise$g[i] + 1.96*sqrt(noise$g_var[i]) 
}

save(noise, file= "Data/subset/noise.Rda")
write.csv(noise, file= "Data/subset/noise.csv")
rm(noise)


#-----------------------------------------------------------------------------------------------------#
#                                     Speech (reading comprehension)                                  #
#-----------------------------------------------------------------------------------------------------#

d<- subset(subset(data, is.element(task, RC) & measure!="reading_speed" & sound=="speech"))

speech<- d[1:3,]


# 27:
N<-27
a<- subset(d, ID==N)
speech[N,studyCols]<- a[1,studyCols]
speech$N_C[N]<- a$N_C[1]
speech$N_E[N]<- a$N_C[1]
speech$sound[N]<- "speech"
speech$mean_C[N]<- a$mean_C[1]
speech$var_C[N]<- a$var_C[1]
speech$mean_E[N]<- mean(a$mean_E)
speech$var_E[N]<- mean(a$var_E)
speech$d[N]<- mean(a$d)
speech$d_var[N]<- mean(a$d_var)
speech$g[N]<- mean(a$g)
speech$g_var[N]<- mean(a$g_var)
speech$CI95_L[N]<- speech$g[N] - 1.96*sqrt(speech$g_var[N])
speech$CI95_R[N]<- speech$g[N] + 1.96*sqrt(speech$g_var[N]) 


# 29:
N<-29
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 33:
N<- 33
a<- subset(d, ID==N)
speech[N,studyCols]<- a[1,studyCols]
speech$N_C[N]<- a$N_C[1]
speech$N_E[N]<- a$N_C[1]
speech$sound[N]<- "speech"
speech$mean_C[N]<- a$mean_C[1]
speech$var_C[N]<- a$var_C[1]
speech$mean_E[N]<- mean(a$mean_E)
speech$var_E[N]<- mean(a$var_E)
speech$d[N]<- mean(a$d)
speech$d_var[N]<- mean(a$d_var)
speech$g[N]<- mean(a$g)
speech$g_var[N]<- mean(a$g_var)
speech$CI95_L[N]<- speech$g[N] - 1.96*sqrt(speech$g_var[N])
speech$CI95_R[N]<- speech$g[N] + 1.96*sqrt(speech$g_var[N]) 


# 35:
N<- 35
a<- subset(d, ID==N)
speech[N,studyCols]<- a[1,studyCols]
speech$N_C[N]<- a$N_C[1]
speech$N_E[N]<- a$N_C[1]
speech$sound[N]<- "speech"
speech$mean_C[N]<- a$mean_C[1]
speech$var_C[N]<- a$var_C[1]
speech$mean_E[N]<- mean(a$mean_E)
speech$var_E[N]<- mean(a$var_E)
speech$d[N]<- mean(a$d)
speech$d_var[N]<- mean(a$d_var)
speech$g[N]<- mean(a$g)
speech$g_var[N]<- mean(a$g_var)
speech$CI95_L[N]<- speech$g[N] - 1.96*sqrt(speech$g_var[N])
speech$CI95_R[N]<- speech$g[N] + 1.96*sqrt(speech$g_var[N]) 


# 36:
N<- 36
a<- subset(d, ID==N)
speech[N,studyCols]<- a[1,studyCols]
speech$N_C[N]<- a$N_C[1]
speech$N_E[N]<- a$N_C[1]
speech$sound[N]<- "speech"
speech$mean_C[N]<- a$mean_C[1]
speech$var_C[N]<- a$var_C[1]
speech$mean_E[N]<- mean(a$mean_E)
speech$var_E[N]<- mean(a$var_E)
speech$d[N]<- mean(a$d)
speech$d_var[N]<- mean(a$d_var)
speech$g[N]<- mean(a$g)
speech$g_var[N]<- mean(a$g_var)
speech$CI95_L[N]<- speech$g[N] - 1.96*sqrt(speech$g_var[N])
speech$CI95_R[N]<- speech$g[N] + 1.96*sqrt(speech$g_var[N]) 


#37:
N<- 37
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 39:
N<- 39
a<- subset(d, ID==N)
speech[N,studyCols]<- a[1,studyCols]
speech$N_C[N]<- a$N_C[1]
speech$N_E[N]<- sum(a$N_E)
speech$sound[N]<- "speech"
speech$mean_C[N]<- a$mean_C[1]
speech$var_C[N]<- a$var_C[1]
speech$mean_E[N]<- mean(a$mean_E)
speech$var_E[N]<- mean(a$var_E)
speech$d[N]<- mean(a$d)
speech$d_var[N]<- mean(a$d_var)
speech$g[N]<- mean(a$g)
speech$g_var[N]<- mean(a$g_var)
speech$CI95_L[N]<- speech$g[N] - 1.96*sqrt(speech$g_var[N])
speech$CI95_R[N]<- speech$g[N] + 1.96*sqrt(speech$g_var[N]) 


# 40: 
N<- 40
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 41:
N<- 41
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 43:
N<- 43
a<- subset(d, ID==N)
speech[N,studyCols]<- a[1,studyCols]
speech$N_C[N]<- a$N_C[1]
speech$N_E[N]<- a$N_C[1]
speech$sound[N]<- "speech"
speech$mean_C[N]<- a$mean_C[1]
speech$var_C[N]<- a$var_C[1]
speech$mean_E[N]<- mean(a$mean_E)
speech$var_E[N]<- mean(a$var_E)
speech$d[N]<- mean(a$d)
speech$d_var[N]<- mean(a$d_var)
speech$g[N]<- mean(a$g)
speech$g_var[N]<- mean(a$g_var)
speech$CI95_L[N]<- speech$g[N] - 1.96*sqrt(speech$g_var[N])
speech$CI95_R[N]<- speech$g[N] + 1.96*sqrt(speech$g_var[N]) 


# 47:
N<- 47
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 50:
N<- 50
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 51:
N<- 51
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 52:
N<- 52
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 53:
N<- 53
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 57:
N<- 57
a<- subset(d, ID==N)
speech<- rbind(speech, a)


# 58:
N<- 58
a<- subset(d, ID==N)
speech[N,studyCols]<- a[1,studyCols]
speech$N_C[N]<- a$N_C[1]
speech$N_E[N]<- a$N_C[1]
speech$sound[N]<- "speech"
speech$mean_C[N]<- a$mean_C[1]
speech$var_C[N]<- a$var_C[1]
speech$mean_E[N]<- mean(a$mean_E)
speech$var_E[N]<- mean(a$var_E)
speech$d[N]<- mean(a$d)
speech$d_var[N]<- mean(a$d_var)
speech$g[N]<- mean(a$g)
speech$g_var[N]<- mean(a$g_var)
speech$CI95_L[N]<- speech$g[N] - 1.96*sqrt(speech$g_var[N])
speech$CI95_R[N]<- speech$g[N] + 1.96*sqrt(speech$g_var[N]) 

speech<- subset(speech, !is.na(ID))

# re-calculate CIs:
for(i in 1:nrow(speech)){
  speech$CI95_L[i]<- speech$g[i] - 1.96*sqrt(speech$g_var[i])
  speech$CI95_R[i]<- speech$g[i] + 1.96*sqrt(speech$g_var[i]) 
}

save(speech, file= "Data/subset/speech.Rda")
write.csv(speech, file= "Data/subset/speech.csv")
rm(speech)



#-----------------------------------------------------------------------------------------------------#
#                                        Proofreading accuracy                                        #
#-----------------------------------------------------------------------------------------------------#

d<- subset(data, is.element(task, Proof))

proof<- d[1,]

# 31:
N<-31
a<- subset(d, ID==N)
proof[N,studyCols]<- a[1,studyCols]
proof$N_C[N]<- a$N_C[1]
proof$N_E[N]<- a$N_E[1]
proof$sound[N]<- "noise"
proof$sound_type[N]<- a$sound_type[1]
proof$task[N]<- "proofreading"
proof$mean_C[N]<- mean(a$mean_C)
proof$var_C[N]<- mean(a$var_C)
proof$mean_E[N]<- mean(a$mean_E)
proof$var_E[N]<- mean(a$var_E)
proof$d[N]<- mean(a$d)
proof$d_var[N]<- mean(a$d_var)
proof$g[N]<- mean(a$g)
proof$g_var[N]<- mean(a$g_var)
proof$CI95_L[N]<- proof$g[N] - 1.96*sqrt(proof$g_var[N])
proof$CI95_R[N]<- proof$g[N] + 1.96*sqrt(proof$g_var[N]) 


# 32:
N<-32
a<- subset(d, ID==N)
proof[N,studyCols]<- a[1,studyCols]
proof$N_C[N]<- a$N_C[1]
proof$N_E[N]<- a$N_C[1]
proof$sound[N]<- "speech"
proof$sound_type[N]<- a$sound_type[1]
proof$task[N]<- "proofreading"
proof$mean_C[N]<- mean(a$mean_C)
proof$mean_E[N]<- mean(a$mean_E)
proof$d[N]<- mean(a$d)
proof$d_var[N]<- mean(a$d_var)
proof$g[N]<- mean(a$g)
proof$g_var[N]<- mean(a$g_var)
proof$CI95_L[N]<- proof$g[N] - 1.96*sqrt(proof$g_var[N])
proof$CI95_R[N]<- proof$g[N] + 1.96*sqrt(proof$g_var[N]) 


# 54:
N<-54
a<- subset(d, ID==N)
proof[N,studyCols]<- a[1,studyCols]
proof$N_C[N]<- a$N_C[1]
proof$N_E[N]<- a$N_C[1]
proof$sound[N]<- "speech"
proof$sound_type[N]<- a$sound_type[1]
proof$task[N]<- "proofreading"
proof$mean_C[N]<- mean(a$mean_C)
proof$var_C[N]<- mean(a$var_C)
proof$mean_E[N]<- mean(a$mean_E)
proof$var_E[N]<- mean(a$var_E)
proof$d[N]<- mean(a$d)
proof$d_var[N]<- mean(a$d_var)
proof$g[N]<- mean(a$g)
proof$g_var[N]<- mean(a$g_var)
proof$CI95_L[N]<- proof$g[N] - 1.96*sqrt(proof$g_var[N])
proof$CI95_R[N]<- proof$g[N] + 1.96*sqrt(proof$g_var[N]) 


# 55:
N<-55
a<- subset(d, ID==N)
proof[N,studyCols]<- a[1,studyCols]
proof$N_C[N]<- a$N_C[1]
proof$N_E[N]<- a$N_C[1]
proof$sound[N]<- "speech"
proof$sound_type[N]<- a$sound_type[1]
proof$task[N]<- "proofreading"
proof$mean_C[N]<- mean(a$mean_C)
proof$var_C[N]<- mean(a$var_C)
proof$mean_E[N]<- mean(a$mean_E)
proof$var_E[N]<- mean(a$var_E)
proof$d[N]<- mean(a$d)
proof$d_var[N]<- mean(a$d_var)
proof$g[N]<- mean(a$g)
proof$g_var[N]<- mean(a$g_var)
proof$CI95_L[N]<- proof$g[N] - 1.96*sqrt(proof$g_var[N])
proof$CI95_R[N]<- proof$g[N] + 1.96*sqrt(proof$g_var[N]) 


# 56:
N<-56
a<- subset(d, ID==N)
proof[N,studyCols]<- a[1,studyCols]
proof$N_C[N]<- a$N_C[1]
proof$N_E[N]<- a$N_C[1]
proof$sound[N]<- "speech"
proof$sound_type[N]<- a$sound_type[1]
proof$task[N]<- "proofreading"
proof$mean_C[N]<- mean(a$mean_C)
proof$var_C[N]<- mean(a$var_C)
proof$mean_E[N]<- mean(a$mean_E)
proof$var_E[N]<- mean(a$var_E)
proof$d[N]<- mean(a$d)
proof$d_var[N]<- mean(a$d_var)
proof$g[N]<- mean(a$g)
proof$g_var[N]<- mean(a$g_var)
proof$CI95_L[N]<- proof$g[N] - 1.96*sqrt(proof$g_var[N])
proof$CI95_R[N]<- proof$g[N] + 1.96*sqrt(proof$g_var[N]) 


# 63:
N<- 63
a<- subset(d, ID==N)
proof<- rbind(proof, a)


proof<- subset(proof, !is.na(ID))

# re-calculate CIs:
for(i in 1:nrow(proof)){
  proof$CI95_L[i]<- proof$g[i] - 1.96*sqrt(proof$g_var[i])
  proof$CI95_R[i]<- proof$g[i] + 1.96*sqrt(proof$g_var[i]) 
}

save(proof, file= "Data/subset/proof.Rda")
write.csv(proof, file= "Data/subset/proof.csv")


proofSO<- subset(proof, cit!= "Weinstein (1974)") # speech only
save(proofSO, file= "Data/subset/proofSO.Rda")
write.csv(proofSO, file= "Data/subset/proofSO.csv")

rm(proof, proofSO)


#===============================
#   Meta-regression subsets:
#===============================

# lyrical vs non-lyrical music:

d<- subset(subset(data, is.element(task, RC) & measure!="reading_speed" & sound=="music"))

NL<- c("classical", "random tones", "stimulative classical", "sedative classical",
       "instrumental", "rock non-lyrical", "classical non-lyrical", "high information load",
       "instrumental/ familiar", "non-lyrical")

d<- subset(d, cit!="Johansson et al. (2012)")# various music including vocal and instrumental
# no experimental control over music that was played

uit<- c("various", "TV music videos", "radio/ generic")
d<-subset(d, !is.element(sound_type, uit))

a<- d[which(is.element(d$sound_type, NL)),]

d<- d[-which(is.element(d$sound_type, NL)),]


# music was chosen by participants (no control), exclude:
d<- d[-which(d$cit=="Ahuja (2016)"),]

# music type unknown, participants brought their own:
d<- d[-which(d$cit=="Etaugh & Michals (1975)"| d$cit=="Etaugh & Ptasnik (1982)"),]

# no information about rock music, removed:
d<- d[-which(d$cit=="Mullikin & Henk (1985)"),]

# Furnham & Allass (1999): both conditions are lyrical (average them):
c<- subset(d, cit=="Furnham & Allass (1999)")
d<- d[-which(d$cit=="Furnham & Allass (1999)"),]
d<- rbind(d,t)
d[nrow(d), studyCols]<- c[1,studyCols]

d$N_C[nrow(d)]<- c$N_C[1]
d$N_E[nrow(d)]<- sum(c$N_E)
d$sound[nrow(d)]<- "music"
#d$sound_type[nrow(d)]<- "complex+simple"
d$mean_C[nrow(d)]<- c$mean_C[1]
d$var_C[nrow(d)]<- c$var_C[1]
d$mean_E[nrow(d)]<- mean(c$mean_E)
d$var_E[nrow(d)]<- mean(c$var_E)
d$d[nrow(d)]<- mean(c$d)
d$d_var[nrow(d)]<- mean(c$d_var)
d$g[nrow(d)]<- mean(c$g)
d$g_var[nrow(d)]<- mean(c$g_var)


# Fogelson (1973): contained instrumental music (see paper):
a<- rbind(a, d[which(d$cit=="Fogelson (1973)"),])
d<- d[-which(d$cit=="Fogelson (1973)"),]

# the music in Kiger is instrumental: https://www.youtube.com/watch?v=XKZ27HW8Q0k

# Furnham & Bradley (1997) classifies as lyrical (checked it)

# Tucker & Bushman (1991): no info whether music was lyrical, exclude:
d<- d[-which(d$cit=="Tucker & Bushman (1991)"),]

# Daoussis & McKelvie (1986): not know if all the music was lyrical, exclude:
d<- d[-which(d$cit=="Daoussis & McKelvie (1986)"),]

# Miller & Schyb (1989); 
# pop condition is also instrumental average out with the classical condition:

a<- rbind(a, d[which(d$cit=="Miller & Schyb (1989)" & d$sound_type=="pop"),])

c<-subset(a, cit=="Miller & Schyb (1989)")
a<- a[-which(a$cit=="Miller & Schyb (1989)"),]
d<- d[-which(d$cit=="Miller & Schyb (1989)"& d$sound_type=="pop"),]

a<- rbind(a, t)
a[nrow(a), studyCols]<- c[1,studyCols]

a$N_C[nrow(a)]<- c$N_C[1]
a$N_E[nrow(a)]<- sum(c$N_E)
a$sound[nrow(a)]<- "music"
#a$sound_type[nrow(a)]<- "complex+simple"
a$mean_C[nrow(a)]<- c$mean_C[1]
a$var_C[nrow(a)]<- c$var_C[1]
a$mean_E[nrow(a)]<- mean(c$mean_E)
a$var_E[nrow(a)]<- mean(c$var_E)
a$d[nrow(a)]<- mean(c$d)
a$d_var[nrow(a)]<- mean(c$d_var)
a$g[nrow(a)]<- mean(c$g)
a$g_var[nrow(a)]<- mean(c$g_var)


# Kelly (1994): impossible to determine if all music was lyrical, exclude:
d<- d[-which(d$cit=="Kelly (1994)"),]

# Miller (2014): average out two lyrical conditions:
c<- subset(d, cit=="Miller (2014)")
d<- d[-which(d$cit=="Miller (2014)"),]

d<- rbind(d, t)
d[nrow(d), studyCols]<- c[1,studyCols]

d$N_C[nrow(d)]<- c$N_C[1]
d$N_E[nrow(d)]<- sum(c$N_E)
d$sound[nrow(d)]<- "music"
#d$sound_type[nrow(d)]<- "complex+simple"
d$mean_C[nrow(d)]<- c$mean_C[1]
d$var_C[nrow(d)]<- c$var_C[1]
d$mean_E[nrow(d)]<- mean(c$mean_E)
d$var_E[nrow(d)]<- mean(c$var_E)
d$d[nrow(d)]<- mean(c$d)
d$d_var[nrow(d)]<- mean(c$d_var)
d$g[nrow(d)]<- mean(c$g)
d$g_var[nrow(d)]<- mean(c$g_var)


# Perham & Currie (2014): average over the two lyrical conditions
c<- subset(d, cit=="Perham & Currie (2014)")
d<- d[-which(d$cit=="Perham & Currie (2014)"),]


d<- rbind(d, t)
d[nrow(d), studyCols]<- c[1,studyCols]

d$N_C[nrow(d)]<- c$N_C[1]
d$N_E[nrow(d)]<- c$N_C[1]
d$sound[nrow(d)]<- "music"
#d$sound_type[nrow(d)]<- "complex+simple"
d$mean_C[nrow(d)]<- c$mean_C[1]
d$var_C[nrow(d)]<- c$var_C[1]
d$mean_E[nrow(d)]<- mean(c$mean_E)
d$var_E[nrow(d)]<- mean(c$var_E)
d$d[nrow(d)]<- mean(c$d)
d$d_var[nrow(d)]<- mean(c$d_var)
d$g[nrow(d)]<- mean(c$g)
d$g_var[nrow(d)]<- mean(c$g_var)

# Fendrick (1937): paper discription suggests music was instrumental:
a<- rbind(a, d[which(d$cit=="Fendrick (1937)"),])
d<- d[-which(d$cit=="Fendrick (1937)"),]

# Henderson et al. (1945): mixture of lyrical and instrumental (checked on youtube), exclude:
d<- d[-which(d$cit=="Henderson et al. (1945)"),]


# Freeburne & Fleischer (1952): all music was instrumental (checked it on youtube):
c<- d[which(d$cit=="Freeburne & Fleischer (1952)"),]
d<- d[-which(d$cit=="Freeburne & Fleischer (1952)"),]
c<- rbind(c, a[which(a$cit=="Freeburne & Fleischer (1952)"),])
a<- a[-which(a$cit=="Freeburne & Fleischer (1952)"),]


a<- rbind(a, t)
a[nrow(a), studyCols]<- c[1,studyCols]

a$N_C[nrow(a)]<- c$N_C[1]
a$N_E[nrow(a)]<- sum(c$N_E)
a$sound[nrow(a)]<- "music"
#a$sound_type[nrow(a)]<- "complex+simple"
a$mean_C[nrow(a)]<- c$mean_C[1]
a$var_C[nrow(a)]<- c$var_C[1]
a$mean_E[nrow(a)]<- mean(c$mean_E)
a$var_E[nrow(a)]<- mean(c$var_E)
a$d[nrow(a)]<- mean(c$d)
a$d_var[nrow(a)]<- mean(c$d_var)
a$g[nrow(a)]<- mean(c$g)
a$g_var[nrow(a)]<- mean(c$g_var)


# lyrical music:
l<- data.frame(table(d$cit))

max(l$Freq) # all ES are statistically independent


# non-lyrical music:


#Miller (2014):
c<- a[which(a$cit=="Miller (2014)"),]
a<- a[-which(a$cit=="Miller (2014)"),]


a<- rbind(a, t)
a[nrow(a), studyCols]<- c[1,studyCols]

a$N_C[nrow(a)]<- c$N_C[1]
a$N_E[nrow(a)]<- sum(c$N_E)
a$sound[nrow(a)]<- "music"
#a$sound_type[nrow(a)]<- "complex+simple"
a$mean_C[nrow(a)]<- c$mean_C[1]
a$var_C[nrow(a)]<- c$var_C[1]
a$mean_E[nrow(a)]<- mean(c$mean_E)
a$var_E[nrow(a)]<- mean(c$var_E)
a$d[nrow(a)]<- mean(c$d)
a$d_var[nrow(a)]<- mean(c$d_var)
a$g[nrow(a)]<- mean(c$g)
a$g_var[nrow(a)]<- mean(c$g_var)



# Dove (2009):
c<- a[which(a$cit=="Dove (2009)"),]
a<- a[-which(a$cit=="Dove (2009)"),]


a<- rbind(a, t)
a[nrow(a), studyCols]<- c[1,studyCols]

a$N_C[nrow(a)]<- c$N_C[1]
a$N_E[nrow(a)]<- sum(c$N_E)
a$sound[nrow(a)]<- "music"
#a$sound_type[nrow(a)]<- "complex+simple"
a$mean_C[nrow(a)]<- c$mean_C[1]
a$var_C[nrow(a)]<- c$var_C[1]
a$mean_E[nrow(a)]<- mean(c$mean_E)
a$var_E[nrow(a)]<- mean(c$var_E)
a$d[nrow(a)]<- mean(c$d)
a$d_var[nrow(a)]<- mean(c$d_var)
a$g[nrow(a)]<- mean(c$g)
a$g_var[nrow(a)]<- mean(c$g_var)


# Martin et al. (1988), Exp.1:
c<- a[which(a$cit=="Martin et al. (1988), Exp.1"),]
a<- a[-which(a$cit=="Martin et al. (1988), Exp.1"),]

a<- rbind(a, t)
a[nrow(a), studyCols]<- c[1,studyCols]

a$N_C[nrow(a)]<- c$N_C[1]
a$N_E[nrow(a)]<- c$N_C[1]
a$sound[nrow(a)]<- "music"
#a$sound_type[nrow(a)]<- "complex+simple"
a$mean_C[nrow(a)]<- c$mean_C[1]
a$var_C[nrow(a)]<- c$var_C[1]
a$mean_E[nrow(a)]<- mean(c$mean_E)
a$var_E[nrow(a)]<- mean(c$var_E)
a$d[nrow(a)]<- mean(c$d)
a$d_var[nrow(a)]<- mean(c$d_var)
a$g[nrow(a)]<- mean(c$g)
a$g_var[nrow(a)]<- mean(c$g_var)


l2<- data.frame(table(a$cit))
max(l2$Freq)

# merge lyrical and non-lyrical data frames:
a$type<- "non-lyrical"
a$cov<- -1
d$type<- "lyrical"
d$cov<- 1

lm<- rbind(a, d)  

lm$cit<- as.character(lm$cit)
l3<- data.frame(table(lm$cit))

overlap<- as.character(l3$Var1[which(l3$Freq==2)])

LM1<-lm[-which(lm$type== "non-lyrical" & is.element(lm$cit, overlap[1:length(overlap)-1])),]
LM1<- LM1[-which(LM1$type== "lyrical" & LM1$cit== overlap[length(overlap)]),]


LM2<- lm[-which(lm$type== "lyrical" & is.element(lm$cit, overlap[1:length(overlap)-1])),]
LM2<- LM2[-which(LM2$type== "non-lyrical" & LM2$cit== overlap[length(overlap)]),]

save(LM1, file= "Data/subset/metareg/LM1.Rda")
save(LM2, file= "Data/subset/metareg/LM2.Rda")



######################

# Foreign vs native speech:

db<- subset(subset(data, is.element(task, RC) & measure!="reading_speed" & sound=="speech"))

lab<- c("foreign", "non-word")

f<- subset(db, is.element(sound_type, lab))
outn<- as.character(f$cit)

n<- subset(db, !is.element(sound_type, lab))
n<- subset(n, !is.element(cit, outn))
n<- subset(n, sound_type!="babble")

# Halin (2016):
c<- n[which(n$cit=="Halin (2016)"),]
n<- n[-which(n$cit=="Halin (2016)"),]


n<- rbind(n, t)
n[nrow(n), studyCols]<- c[1,studyCols]

n$N_C[nrow(n)]<- c$N_C[1]
n$N_E[nrow(n)]<- c$N_C[1]
n$sound[nrow(n)]<- "speech"
n$mean_C[nrow(n)]<- c$mean_C[1]
n$var_C[nrow(n)]<- c$var_C[1]
n$mean_E[nrow(n)]<- mean(c$mean_E)
n$var_E[nrow(n)]<- mean(c$var_E)
n$d[nrow(n)]<- mean(c$d)
n$d_var[nrow(n)]<- mean(c$d_var)
n$g[nrow(n)]<- mean(c$g)
n$g_var[nrow(n)]<- mean(c$g_var)


# Armstrong et al. (1991):
c<- n[which(n$cit=="Armstrong et al. (1991)"),]
n<- n[-which(n$cit=="Armstrong et al. (1991)"),]


n<- rbind(n, t)
n[nrow(n), studyCols]<- c[1,studyCols]

n$N_C[nrow(n)]<- c$N_C[1]
n$N_E[nrow(n)]<- sum(c$N_E)
n$sound[nrow(n)]<- "speech"
n$mean_C[nrow(n)]<- c$mean_C[1]
n$var_C[nrow(n)]<- c$var_C[1]
n$mean_E[nrow(n)]<- mean(c$mean_E)
n$var_E[nrow(n)]<- mean(c$var_E)
n$d[nrow(n)]<- mean(c$d)
n$d_var[nrow(n)]<- mean(c$d_var)
n$g[nrow(n)]<- mean(c$g)
n$g_var[nrow(n)]<- mean(c$g_var)


# Martin et al. (1988), Exp.1:
c<- n[which(n$cit=="Martin et al. (1988), Exp.1"),]
n<- n[-which(n$cit=="Martin et al. (1988), Exp.1"),]

n<- rbind(n, t)
n[nrow(n), studyCols]<- c[1,studyCols]

n$N_C[nrow(n)]<- c$N_C[1]
n$N_E[nrow(n)]<- c$N_C[1]
n$sound[nrow(n)]<- "speech"
n$mean_C[nrow(n)]<- c$mean_C[1]
n$var_C[nrow(n)]<- c$var_C[1]
n$mean_E[nrow(n)]<- mean(c$mean_E)
n$var_E[nrow(n)]<- mean(c$var_E)
n$d[nrow(n)]<- mean(c$d)
n$d_var[nrow(n)]<- mean(c$d_var)
n$g[nrow(n)]<- mean(c$g)
n$g_var[nrow(n)]<- mean(c$g_var)

# too much variability of audio content:
n<- n[-which(n$sound_type=="movies"),]

table(as.character(n$cit))

#####
f$type<- "unintelligible"
f$cov<- -1
n$type<- "ïntelligible"
n$cov<- 1

PH<- rbind(f,n)

save(PH, file="Data/subset/metareg/PH.Rda")



###### lyrical music vs intelligible speech:
d$type<- "music"
d$cov<- -1
n$type<- "speech"
n$cov<- 1

SM<- rbind(d,n)

l4<- data.frame(table(as.character(SM$cit)))

# no overlap:
max(l4$Freq)==1

save(SM, file= "Data/subset/metareg/SM.Rda")


#####- environmental noise vs acoustical noise- ######
inst<- a

db<- subset(subset(data, is.element(task, RC) & measure!="reading_speed" & sound=="noise"))

an<- c("continuous", "white", "speech-spectrum")

ac<- subset(db, is.element(sound_type, an))

d<- subset(db, !is.element(sound_type, an))

env<- d[1:3,]

# 27
N<- 27
a<- db[which(db$ID==N),]

env[N,studyCols]<- a[1,studyCols]
env$task[N]<- "reading comprehension"
env$N_C[N]<- a$N_C[1]
env$N_E[N]<- a$N_C[1]
env$sound[N]<- "noise"
env$mean_C[N]<- mean(a$mean_C[1:2]) # because they have the same silence baseline
env$var_C[N]<- mean(a$var_C[1:2])
env$mean_E[N]<- mean(a$mean_E)
env$var_E[N]<- mean(a$var_E)
env$d[N]<- mean(a$d)
env$d_var[N]<- mean(a$d_var)
env$g[N]<- mean(a$g)
env$g_var[N]<- mean(a$g_var)
env$CI95_L[N]<- env$g[N] - 1.96*sqrt(env$g_var[N])
env$CI95_R[N]<- env$g[N] + 1.96*sqrt(env$g_var[N]) 


# 30
N<- 30
a<- db[which(db$ID==N),]
env<- rbind(env, a)


# 42
N<- 42
a<- db[which(db$ID==N),]

env[N,studyCols]<- a[1,studyCols]
env$N_C[N]<- a$N_C[1]
env$N_E[N]<- sum(a$N_E)
env$sound[N]<- "noise"
env$mean_C[N]<- a$mean_C[1]
env$var_C[N]<- a$var_C[1]
env$mean_E[N]<- mean(a$mean_E)
env$var_E[N]<- mean(a$var_E)
env$d[N]<- mean(a$d)
env$d_var[N]<- mean(a$d_var)
env$g[N]<- mean(a$g)
env$g_var[N]<- mean(a$g_var)
env$CI95_L[N]<- env$g[N] - 1.96*sqrt(env$g_var[N])
env$CI95_R[N]<- env$g[N] + 1.96*sqrt(env$g_var[N])


# 49
N<- 49
a<- db[which(db$ID==N),]
env<- rbind(env, a)


# 62
N<- 62
a<- db[which(db$ID==N),]
env<- rbind(env, a)

env<- subset(env, !is.na(ID))
env<- subset(env, cit!="Martin et al. (1988), Exp.1")
env<- subset(env, cit!="Johansson (1983)") # to avoid non-independence

# re-calculate CIs:
for(i in 1:nrow(env)){
  env$CI95_L[i]<- env$g[i] - 1.96*sqrt(env$g_var[i])
  env$CI95_R[i]<- env$g[i] + 1.96*sqrt(env$g_var[i]) 
}

env$type<- "environmental"
env$cov<- 1

ac$type<- "acoustical"
ac$cov<- -1

EAN<- rbind(ac,env)


n4<- data.frame(table(as.character(EAN$cit)))

# no overlap:
max(n4$Freq)==1


for(i in 1:nrow(EAN)){
  EAN$CI95_L[i]<- EAN$g[i] - 1.96*sqrt(EAN$g_var[i])
  EAN$CI95_R[i]<- EAN$g[i] + 1.96*sqrt(EAN$g_var[i]) 
}


save(EAN, file= "Data/subset/metareg/EAN.Rda")


#####- instrumental music vs acoustical noise- ######
inst<- subset(inst, cit!="Martin et al. (1988), Exp.1")
inst$type<- "instrumental"
inst$cov<- 1

MAN<- rbind(ac, inst)

mn4<- data.frame(table(as.character(MAN$cit)))

# no overlap:
max(mn4$Freq)==1

for(i in 1:nrow(MAN)){
  MAN$CI95_L[i]<- MAN$g[i] - 1.96*sqrt(MAN$g_var[i])
  MAN$CI95_R[i]<- MAN$g[i] + 1.96*sqrt(MAN$g_var[i]) 
}

save(MAN, file= "Data/subset/metareg/MAN.Rda")

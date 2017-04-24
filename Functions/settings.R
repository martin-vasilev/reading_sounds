
# correlation between means:
r<- 0.5; save(r, file= "data/r.Rda")

# color-blind pallete:
pallete<- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# study lists:

RC<- c("reading comprehension/ select word",  "select word", "reading comprehension",
       "reading comprehension (easy font)", "reading comprehension (difficult font)", 
       "reading test (composite)")
Proof<- c("proofreading", "proofreading (non-contextual errors)", "proofreading (contextual errors)",
          "proofreading (spelling errors)")
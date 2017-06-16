
# correlation between means:
load("r.Rda")

# color-blind pallete:
pallete<- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


# study lists:

RC<- c("reading comprehension/ select word",  "select word", "reading comprehension",
       "reading comprehension (easy font)", "reading comprehension (difficult font)", 
       "reading test (composite)")
Proof<- c("proofreading", "proofreading (non-contextual errors)", "proofreading (contextual errors)",
          "proofreading (spelling errors)")

# columns that stay the same when aggregating ESs:
studyCols<- c(1,4,5,6,7,10,11,12,17,18,19,26)

# Whether to apply Morris and de Shon (2002) correction
# this converts between- and within-subject studies to the same scale 
MdS<- TRUE

# same, but also for variance:
MdS_var= FALSE



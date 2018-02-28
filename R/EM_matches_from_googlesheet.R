library(googlesheets)
library(elmr)

g = gs_title("EMsearch")
gs = googlesheets::gs_read(g, ws = 1, range = NULL, literal = TRUE, verbose = TRUE, col_names = TRUE)
f = gs$em.match.skid[!is.na(gs$em.match.skid)]
neurons = fetchn_fafb(unique(f),reference=JFRC2013)
df = as.data.frame(gs)
df = df[!is.na(gs$em.match.skid),]


neurons.duplicated = neurons[as.character(f[duplicated(f)])]
names(neurons.duplicated) = paste0(names(neurons.duplicated),"_1")
neurons = c(neurons,neurons.duplicated)
df[duplicated(df$em.match.skid),]$em.match.skid = paste0(df[duplicated(df$em.match.skid),]$em.match.skid,"_1")
neurons = neurons[as.character(df$em.match.skid)]
attr(neurons,"df") = df
saveRDS(neurons,"/Users/abates/Downloads/emmatches_JFRC2013.rds")
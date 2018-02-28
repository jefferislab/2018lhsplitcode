library(elmr)

path = "/Volumes/Neuronaut1/LHsplits/skels/"
lf = list.files(path)

lh.splits = list()
for(l in lf){
  d  =  dotprops(paste0(path,l),k=5)
  lh.splits = c(lh.splits,c)
}
lh.splits = as.neuronlist(lh.splits)
names(lh.splits) = lf
lh.splits[,"file"] = lf


save(lh.splits,"Data/lhsplits.rda")
# save(lh.splits, file = "/Users/abates/projects/lhns/data-raw/dolanlhsplits.rda")

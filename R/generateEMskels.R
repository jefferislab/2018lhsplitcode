library(elmr)
library(googlesheets)

# INSERT CATMAID_LOGIN

# Get all of our input info
googlesheets::gs_auth(verbose=TRUE)
gs = googlesheets::gs_title("EMsearch")
gs = googlesheets::gs_read(gs, ws = 1, range = NULL, literal = TRUE, verbose = TRUE, col_names = TRUE)
g = subset(gs, Miketype!=FALSE)
skids = g$em.match.skid
cts = unique(g$cell.type)
neurons = tryCatch(fetchn_fafb(unique(skids)[!is.na(unique(skids))],mirror=FALSE,reference = JFRC2013), error = function(e) NA)
neurons = neurons[!is.na(neurons)]

matches = neuronlist()
for (c in cts){
  skid = subset(g,cell.type==c)$em.match.skid[1]
  if(skid%in%names(neurons)){
    print(c)
    m = paste(subset(g,cell.type==c)$Miketype,collapse="/")
    neuron = fetchn_fafb(skid,mirror=FALSE,reference = JFRC2013)
    names(neuron) = c
    neuron[,"cell.type"] = c
    neuron[,"mike.type"] = m
    matches = c(matches,neuron)
  }
}

strip_connectivity <- function(neuron){
  neuron$connectors = NULL
  neuron
}
emlhns = nlapply(matches,strip_connectivity)


save(emlhns, file = "/Users/abates/projects/lhns/data/emlhns.rda")





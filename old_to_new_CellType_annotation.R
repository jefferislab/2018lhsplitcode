#Looking at the cell-types Alex identified. Interactively go through each one and use this to annotate the Split-GAL4 lines 
library(devtools)
install_github("jefferislab/lhns")
library(lhns)
library(xlsx)
library(dplyr)
set3d <- function(pos = c("front", "left", "back", "right",
                          "ventral", "dorsal"), zoom = 0.7, ...) {
  pos <- match.arg(pos)
  m <- diag(c(1, -1, -1, 1)) # front
  if (pos == "left") {
    m <- diag(c(0, -1, 0, 1))
    m[1, 3] <- 1
    m[3, 1] <- 1
  }
  if (pos == "back") {
    m <- diag(c(-1, -1, 1, 1))
  }
  if (pos == "right") {
    m <- diag(c(0, -1, 0, 1))
    m[1, 3] <- m[3, 1] <- -1
  }
  if (pos == "ventral") {
    m <- diag(c(1, -1, -1, 1))
  }
  if (pos == "dorsal") {
    m <- diag(c(1, 1, 1, 1))
  }
  4
  view3d(userMatrix = m, zoom = zoom, ...)
}

#Chunk to plot individual LH MCFO data according to the number, line and imagecode
db<-lh.mcfo[,]
View(db)

#Example using the linecode 
clear3d()
plot3d(subset(db, old.cell.type=="16B"), soma=T)
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom 

#Example using a specific code 
clear3d()
line<-"JRC_SS22647-20161007_29_E6-Aligned63xScale_c2a.Smt.SptGraph.swc"
plot3d(subset(db, file==line), soma=T, col = "blue")
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom 

#Example using the new nomenclature 
clear3d()
plot3d(subset(db, cell.type=="4A"), soma=T)
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom 



#Write out alex's db in a spreadsheet 
write.xlsx(x =db, file = "Desktop/Alexdb.xlsx")



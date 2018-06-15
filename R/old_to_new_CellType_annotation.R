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

#Chunk to plot individual LH MCFO data according to the number, line and imagecode. Can also see what cell-types were catagorized by MCFO and polarity
View(lh.mcfo[,])

#To look at other data (flycircuit, tracings)
View(most.lhns[,])

#Example using the linecode
clear3d()
plot3d(subset(lh.mcfo, old.cell.type=="16A"), soma=T)
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom

#Example using the new nomenclature
clear3d()
plot3d(subset(lh.mcfo, cell.type=="PV4c3"), soma=T)
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom

#Looking at the other data in Shahar's paper
clear3d()
plot3d(subset(most.lhns, cell.type=="PV4b3"), soma=T)
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom

#Look at the dotprops for my splits
clear3d()
plot3d(subset(lh.splits.dps, cell.type=="PV4b1"), soma=T)
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom

#Looking at non-Split cell-types
clear3d()
plot3d(subset(lh.mcfo, cell.type=="AV4a3"), soma=T, col="magenta")
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom
plot3d(subset(lh.mcfo, cell.type=="PV2b1"), soma=T, col="green")
plot3d(FCWB)
set3d("front", 0.7, zoom = 0.5) #Function that sets the angle and zoom


#Write out alex's db in a spreadsheet
write.xlsx(x =db, file = "Desktop/Alexdb.xlsx")



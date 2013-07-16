library(ggplot2)
library(scales)

asinh_trans <- function(){
  trans_new(name = 'asinh', transform = function(x) asinh(x), 
            inverse = function(x) sinh(x))
}


Args     <- commandArgs()

indir    <- Args[4]
all.inf  <- Args[5]

intab     = paste( indir, all.inf,  sep="" )

all.tab   = read.table( file = intab,   header = FALSE )

grid = c(2,4,6,8,10)
grid = c(0, grid, 10*grid, 100*grid, 1000*grid, 10000*grid, 100000*grid)
grid2 = c(0,1,2,3,4,5,6,7,8,9,10)



m<-ggplot(dataTable, aes(x=dataTable[,2])) +
  #, origin = (bw/2)
  geom_histogram(binwidth = 1 , origin = -.5)+ 
  scale_y_continuous(trans=asinh_trans(), breaks = grid , name = "SFam Frequency (arcSinh transformed)")+
  scale_x_continuous( breaks=grid2,name = "Kegg Orthology Hits") +
  ggtitle("Number of Kegg Orthology hits per Sfam Family (FCI0, FCI1, FCI2)")

ggsave(m, filename="SFamKeggOrthologyHits.pdf", width = 7, height = 7)

grid2 = c(0,1,2,3,4,5,6,7,8,9,10)
grid2 = grid2*10

m<-ggplot(dataTable, aes(x=dataTable[,3])) +
  #, origin = (bw/2)
  geom_histogram(binwidth = 1 , origin = -.5)+ 
  scale_y_continuous(trans=asinh_trans(), breaks = grid , name = "SFam Frequency (arcSinh transformed)")+
  scale_x_continuous( breaks=grid2,name = "Kegg Orthology Hits") +
  ggtitle("Number of Kegg Pathway hits per Sfam Family (FCI0, FCI1, FCI2)")

ggsave(m, filename="SFamPathwayHits.pdf", width = 7, height = 7)

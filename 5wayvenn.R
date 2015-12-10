
# Program takes in 5 input files and creates venn diagrams based on the common elements in all pairwise files based on the first column

# Function to find overlaps. It goes over the pairs and create multiple objects, record their lengths and create venn. It also subsets gene information from the common list.
# Current format : Rscript venn.R label1 file1 label2 file2 label3 file3 label4 file4 label5 file5 outputfilename

library(VennDiagram)
args <- commandArgs(TRUE)

overlap <- function(l) {
        results <- list()

        l <- lapply(l, unique)
        for (m in seq(along=l)) {
               	for (indices in combn(seq(length(l)), m, simplify=FALSE)) {
                        name <- paste(names(l)[indices], collapse="_")

                       	results[[name]] <- Reduce(intersect, l[indices])
                }
        }
	      results
label1 <- args[1]
file1  <- args[2]
label2 <- args[3]
file2 <- args[4]
label3 <- args[5]
file3 <- args[6]
label4 <- args[7]
file4 <- args[8]
label5 <- args[9]
file5 <- args[10]

# File name
outfile <- args[11]
#Open file handles and save the first columns
f1 <- read.delim(file1, sep="\t", header=TRUE)
#head(f1)
f2 <- read.delim(file2, sep="\t", header=TRUE)
f3 <- read.delim(file3, sep="\t", header=TRUE)
f4 <- read.delim(file4, sep="\t", header=TRUE)
f5 <- read.delim(file5, sep="\t", header=TRUE)
# Individual sets
f1id <- f1$gene_id
f2id <- f2$gene_id
f3id <- f3$gene_id
f4id <- f4$gene_id
f5id <- f5$gene_id
n1 <- length(f1id)
n2 <- length(f2id)
n3 <- length(f3id)
n4 <- length(f4id)
n5 <- length(f5id)
# Pairwise comparisons
n12 <- length(tail(overlap(list(f1id, f2id)), n=1)[[1]])
n13 <- length(tail(overlap(list(f1id, f3id)), n=1)[[1]])
n14 <- length(tail(overlap(list(f1id, f4id)), n=1)[[1]])
n15 <- length(tail(overlap(list(f1id, f5id)), n=1)[[1]])
n23 <- length(tail(overlap(list(f2id, f3id)), n=1)[[1]])
n24 <- length(tail(overlap(list(f2id, f4id)), n=1)[[1]])
n25 <- length(tail(overlap(list(f2id, f5id)), n=1)[[1]])
n34 <- length(tail(overlap(list(f3id, f4id)), n=1)[[1]])
n35 <- length(tail(overlap(list(f3id, f5id)), n=1)[[1]])
n45 <- length(tail(overlap(list(f4id, f5id)), n=1)[[1]])
# Three-way comparisons
n123 <- length(tail(overlap(list(f1id, f2id, f3id)), n=1)[[1]])
n124 <- length(tail(overlap(list(f1id, f2id, f4id)), n=1)[[1]])
n125 <- length(tail(overlap(list(f1id, f2id, f5id)), n=1)[[1]])
n134 <- length(tail(overlap(list(f1id, f3id, f4id)), n=1)[[1]])
n135 <- length(tail(overlap(list(f1id, f3id, f5id)), n=1)[[1]])
n145 <- length(tail(overlap(list(f1id, f4id, f5id)), n=1)[[1]])
n234 <- length(tail(overlap(list(f2id, f3id, f4id)), n=1)[[1]])
n235 <- length(tail(overlap(list(f2id, f3id, f5id)), n=1)[[1]])
n245 <- length(tail(overlap(list(f2id, f4id, f5id)), n=1)[[1]])
n345 <- length(tail(overlap(list(f3id, f4id, f5id)), n=1)[[1]])
# Four-way comparisons
n1234 <- length(tail(overlap(list(f1id, f2id, f3id, f4id)), n=1)[[1]])
n1235 <- length(tail(overlap(list(f1id, f2id, f3id, f5id)), n=1)[[1]])
n1245 <- length(tail(overlap(list(f1id, f2id, f4id, f5id)), n=1)[[1]])
n1345 <- length(tail(overlap(list(f1id, f3id, f4id, f5id)), n=1)[[1]])
n2345 <- length(tail(overlap(list(f2id, f3id, f4id, f5id)), n=1)[[1]])
n12345 <- length(tail(overlap(list(f1id, f2id, f3id, f4id, f5id)), n=1)[[1]])
#Drawvenndiagram
category <- c(label1, label2, label3, label4, label5)
print(category)
output <- paste(outfile, ".png", sep="")
fill <- c("dodgerblue", "goldenrod1", "seagreen3", "orchid3", "coral")
main= "Venn Diagram for 5-way comparison"
cat.col <- rep("black", 5)
png(output, height=1000, width=1000)
draw.quintuple.venn(n1,n2,n3,n4,n5,n12,n13,n14,n15,n23,n24,n25,n34,n35,n45,n123,n124,n125,n134,n135,n145,n234,n235,n245,n345,n1234,n1235,n1245,n1345,n2345,n12345, cat.col=cat.col, fill=fill, category=category, cex=rep(2,31), fontfamily=rep("arial", 31), cat.cex=rep(2,5), cat.fontfamily=rep("arial", 5), cat.pos=c(0, 287.5, 215, 145, 70))
dev.off()

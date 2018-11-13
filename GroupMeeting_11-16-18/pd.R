devtools::load_all("~/Code/Matsen/sumrep")

dat <- read.fasta("~/Code/Matsen/Data/IB-igh-p14d.fa",
                  as.string=TRUE,
                  seqonly=TRUE) %>%
    sapply(toString) %>%
    data.table(sequence=.)

pt <- proc.time()
approx <- dat %>% 
    getPairwiseDistanceDistribution
approx_time <- (proc.time() - pt)[3]

pt <- proc.time()
subsamp <- dat[sample(nrow(dat), 1000), ] %>%
    getPairwiseDistanceDistribution(approximate=FALSE)
subsamp_time <- (proc.time() - pt)[3]

pt <- proc.time()
full <- dat %>% 
    getPairwiseDistanceDistribution(approximate=FALSE)
full_time <- (proc.time() - pt)[3]

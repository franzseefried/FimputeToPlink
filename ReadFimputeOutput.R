###
###
###   Purpose:   Process FImpute result To PLINK
###   started:   2017/05/15 (fsf)
###
### ############################################# ###

### # recoding with a function
recodeSnpInfo <- function(psInputFn, pbHasHeader = FALSE) {
  ###
  ###   recodeSnpInfo(psInputFn): recoding of SNP Info in psInputFn
  ###     results will be written to an output file which has the 
  ###     same name as the input file with ".out" pasted to it. 
  ###     If old output files with the same name exist, new output
  ###     will be appended, hence delete any old output first
  ### ############################################################# ###
  ### # check whether input file exists
  stopifnot(file.exists(psInputFn))
  ### # define output filename based on psInputFn
  sOutputFn <- paste(psInputFn, ".out", sep = "")
  #remove outfile if it exists
  if(file.exists(sOutputFn))file.remove(sOutputFn)
  ### # open a connection to input file
  conSnpInfo  <- file(psInputFn, "r")
  ### # read header, if we have one
  if (pbHasHeader) {
    sCurSnpLine  <- readLines(conSnpInfo, n = 1)
    cat("Header: ", sCurSnpLine, "\n")
  }
  ### # loop ueber input lines
  while (length(sCurSnpLine  <- readLines(conSnpInfo, n = 1) ) > 0) {
    # split input line at white-space into character vector
    ##vecCurSnp <- unlist(strsplit(sCurSnpLine, "[\t ]+"))
    # convert char with calls into a vector of chars
    #    vecCurCall <- as.numeric(unlist(strsplit(vecCurSnp[3], "")))
    vecCurCall <- as.numeric(unlist(strsplit(sCurSnpLine, "")))
    vecCurCall <- replace(vecCurCall, vecCurCall>2, c("9 9"))
    vecCurCall <- replace(vecCurCall, vecCurCall==0, c("A A"))
    vecCurCall <- replace(vecCurCall, vecCurCall==1, c("A B"))
    vecCurCall <- replace(vecCurCall, vecCurCall==2, c("B B"))
    cat( vecCurCall, "\n", file = sOutputFn, append = TRUE)
  }
  
  close(conSnpInfo)
}

# recodeSnpInfo(smallSnpInput.fn, TRUE)
### # 700000 columns
snpInput.fn <- "/Users/fsf/Documents/MyC++/FimputeToPlink/data/BSWBTAwholeGenome.genotypes_imp.txt"
recodeSnpInfo(snpInput.fn, FALSE)
#unix.time(recodeSnpInfo(snpInput.fn, FALSE))



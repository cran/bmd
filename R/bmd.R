"bmd" <- function(object, level, def = c("excess", "additional"), interval = c("delta"))
{
    resMat <- ED(object, level, ci = interval, display = FALSE)[, c(1, 3), drop = FALSE]
    colnames(resMat) <- c("BMD", "BMDL")

    resMat
}
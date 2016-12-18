##########################################
##PLOT HEXAGONAL COMPONENT PLANES
##from "kohnonen" library output
##
##
##BY SETH E. SPIELMAN, UNIVERSITY OF COLORADO
##
##NEEDS SOME LOVE.  
##RUDIMENTRARY BUT FUNCTIONAL
##
##BORROWS CODE FROM
##http://nbremer.blogspot.nl/2013/11/how-to-create-hexagonal-heatmap-in-r.html
##kohnonen library source
################################################

##PLOTTING FUNCTION
plotCplane <- function(som_obj, variable=sample(colnames(som_obj$data), 1), 
                       type="Quantile", legend=FALSE, Y = F, title=NULL){
  par(mar=c(1,1,2,1))
  if (is.numeric(variable)){
    variable <- colnames(som_obj$data)[variable]
  }
  
  if (som_obj$grid$topo != "hexagonal"){
    stop("function assumes hexgonal SOM")
  }
  #xCoord <- rep(1:som_obj$grid$xdim, som_obj$grid$ydim)
  #yCoord <- rep(1:som_obj$grid$ydim, each=som_obj$grid$xdim)
  #plane_codebook <- data.frame(xCoord, yCoord, som_obj$codes) #contains vector codebook and position
  
  component_plane_matrix <- function(data=plane_codebook, variable_index_or_name=variable){
    
    if(class(som_obj$codes) == "list")
      cp <- matrix(nrow=som_obj$grid$ydim, ncol=som_obj$grid$xdim, data=data$X[,variable_index_or_name]) #, byrow=TRUE)
    else
      cp <- matrix(nrow=som_obj$grid$ydim, ncol=som_obj$grid$xdim, data=data[,variable_index_or_name]) #, byrow=TRUE)

    if(Y == T)
      cp <- matrix(nrow=som_obj$grid$ydim, ncol=som_obj$grid$xdim, data=data$Y) #, byrow=TRUE)
    
    return(cp)
  }
  
  #Function to create the polygon for each hexagon
  #from http://nbremer.blogspot.nl/2013/11/how-to-create-hexagonal-heatmap-in-r.html
  Hexagon <- function (x, y, unitcell = 1, col = "grey", border=NA) {
    polygon(c(x, x, x + unitcell/2, x + unitcell, x + unitcell, 
              x + unitcell/2), c(y + unitcell * 0.125, y + unitcell * 
                                   0.875, y + unitcell * 1.125, y + unitcell * 0.875, 
                                 y + unitcell * 0.125, y - unitcell * 0.125), 
            col = col, border=border)
  }
  
  hm <- component_plane_matrix(data=som_obj$codes, variable_index_or_name=variable)
  
  p_title <- substr(variable, 1, 10)
  if(Y == T)
    p_title <- "Training Data"
  
  if(!is.null(title))
    p_title <- title
  
  plot(0, 0, type = "n", axes = FALSE, xlim=c(0, som_obj$grid$xdim), 
       ylim=c(0, som_obj$grid$ydim), xlab="", ylab= "", asp=1, main=p_title)
  
  ColRamp <- rev(designer.colors(n=50, col=brewer.pal(9, "Spectral")))
  
  ColorCode <- rep("#FFFFFF", length(hm)) #default is all white
  
  if(type == "Equal Interval") {
    #Equal interval bins
    Bins <- seq(-1.5, 1.5, length=length(ColRamp))
  }
  
  if(type == "Quantile") {
    #Quantile colorbins

    if(class(som_obj$codes) == "list")
      Bins <- quantile(x=som_obj$codes$X, probs=cumsum(rep(1/length(ColRamp), length(ColRamp))))
    else
      Bins <- quantile(x=som_obj$codes, probs=cumsum(rep(1/length(ColRamp), length(ColRamp))))

    if(Y == T)
      Bins <- quantile(x=som_obj$codes$Y, probs=cumsum(rep(1/length(ColRamp), length(ColRamp))))

  }
  
  
  for (i in 1:length(hm))
    if (!is.na(hm[i])) ColorCode[i] <- ColRamp[which.min(abs(Bins-hm[i]))] 
  
  
  offset <- 0.5 #offset for the hexagons when moving up a row
  ind <- 1
  for (row in 1:som_obj$grid$ydim) {
    for (column in 0:(som_obj$grid$xdim - 1)) {
      Hexagon(column + offset, row - 1, col = ColorCode[ind])
      ind <- ind +1}
    offset <- ifelse(offset, 0, 0.5)
  }  
  if (legend==TRUE){
    image.plot(legend.only=TRUE, col=ColRamp, zlim=c(-1.5,1.5))
  }
  
}
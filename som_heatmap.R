plot_som_hm <-
  function(som_obj,
           variable = sample(colnames(som_obj$data), 1),
           type="Quantile",
           Y = F,
           title=NULL,
           scale_label_high = "Highest Decile",
           scale_label_low = "Lowest Decile")
  {
    if (is.numeric(variable)){
      variable <- colnames(som_obj$data)[variable]
    }
    
    if (som_obj$grid$topo != "hexagonal"){
      stop("function assumes hexgonal SOM")
    }
  
  
  ### ggplot script for plotting hex map from SOM
  
  component_plane_matrix <- 
    function(data=plane_codebook, variable_index_or_name=variable)
    {
      if(class(som_obj$codes) == "list")
        cp <- matrix(nrow=som_obj$grid$ydim, ncol=som_obj$grid$xdim, data=data$X[,variable_index_or_name]) #, byrow=TRUE)
      else
        cp <- matrix(nrow=som_obj$grid$ydim, ncol=som_obj$grid$xdim, data=data[,variable_index_or_name]) #, byrow=TRUE)
  
      if(Y == T)
        cp <- matrix(nrow=som_obj$grid$ydim, ncol=som_obj$grid$xdim, data=data$Y) #, byrow=TRUE)
      
      return(cp)
    }
  
    create_hexagon <- function (x, y, unitcell = 1) {
      cbind.data.frame(
        x = c(x, 
          x, 
          x + unitcell/2, 
          x + unitcell, 
          x + unitcell, 
          x + unitcell/2), 
        y = c(y + unitcell * 0.125, 
          y + unitcell * 0.875, 
          y + unitcell * 1.125, 
          y + unitcell * 0.875,
          y + unitcell * 0.125, 
          y - unitcell * 0.125)
        )
    }
  
    hm <- component_plane_matrix(data=som_obj$codes, variable_index_or_name=variable)
  
    
    p_title <- substr(variable, 1, 10)
    if(Y == T)
      p_title <- "Training Data"
    
    if(!is.null(title))
      p_title <- title
    
    ColRamp <- rev(designer.colors(n=50, col=brewer.pal(9, "Spectral")))
    
    if(Y == T)
      ColRamp <- designer.colors(n=50, col=brewer.pal(9, "Spectral"))
    
    ColorCode <- rep("#FFFFFF", length(hm)) #default is all white
    
    if(type == "Equal Interval")
    {
      Bins <- seq(-1.5, 1.5, length=length(ColRamp))
    }
    
    if(type == "Quantile")
    {
      if(class(som_obj$codes) == "list")
        Bins <- quantile(x=som_obj$codes$X, probs=cumsum(rep(1/length(ColRamp), length(ColRamp))))
      else
        Bins <- quantile(x=som_obj$codes, probs=cumsum(rep(1/length(ColRamp), length(ColRamp))))
  
      if(Y == T)
        Bins <- quantile(x=som_obj$codes$Y, probs=cumsum(rep(1/length(ColRamp), length(ColRamp))))
    }
    
    for (i in 1:length(hm))
      if (!is.na(hm[i])) ColorCode[i] <- ColRamp[which.min(abs(Bins-hm[i]))] 
    
    hex_data_frame <- data.frame(x = c(), y = c(), index = c(), col = c())
    
    offset <- 0.5 #offset for the hexagons when moving up a row
    ind <- 1
    for (row in 1:som_obj$grid$ydim) 
    {
      for (column in 0:(som_obj$grid$xdim - 1)) 
      {
        ind <- ind +1
        hex_data_frame <- rbind.data.frame(
          hex_data_frame, 
          cbind.data.frame(
            create_hexagon(column + offset, row - 1),
            index = rep(ind, 6),
            col = rep(which.min(abs(Bins-hm[row, column + 1])), 6)
          )
        )
      }
      offset <- ifelse(offset, 0, 0.5)
    }
    
    # hex_data_frame <- 
    #   hex_data_frame %>% 
    #   mutate(col = as.ordered(col))
    
    p <- hex_data_frame %>% 
      ggplot(aes(x = x, y = y, 
                 group = index, fill = col)) + 
      geom_polygon() + 
      scale_x_continuous(
        name = "",
        breaks = NULL
      ) +
      scale_y_continuous(
        name = "",
        breaks = NULL
      ) +
      scale_fill_gradientn(
        colors = ColRamp,
        breaks = c(min(hex_data_frame$col),
                   # median(as.integer(hex_data_frame$col)),
                   max(hex_data_frame$col)),
        labels = c(scale_label_low, 
                   # "Median", 
                   scale_label_high),
        name = ""
      ) +
      ggtitle(p_title) + 
      theme(
        panel.background = element_blank(),
        text = element_text(family = "Consolas"),
        plot.title = element_text(hjust = 0.5),
        legend.position = "bottom",
        legend.key.width = unit(1.5, "cm")
      )
    
    return(p)
 }
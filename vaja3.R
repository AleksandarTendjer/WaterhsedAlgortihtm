    extract_matrix<-function(i,j,img,kernel){
      #extract neighbouring pixel values to calculate erosion
      x=2*kernel+1
      extract_mat=matrix(data=0,nrow=x,ncol=x)
      
      for( k in 1:x)
        for(l in 1:x)
        {
          extract_mat[k,l] = img[i-kernel+k,j-kernel+l]
        }
      return(extract_mat)
    }
    
    ######krcenje/erosion#######
    erosion<-function(img,kernel){
      
      img_height = dim(img)[1]
      img_width = dim(img)[2]
      #we  have only odd numbers like 3,5,9...
      
      s=2*kernel+1
      res=matrix(0L, nrow = img_height, ncol = img_width) 
      
      for(i in (kernel+1):(img_height-kernel-1))
        for(j in (kernel+1):(img_width-kernel-1))
        {
          #extract neighbouring pixel values to calculate erosion
          p = extract_matrix(i,j,img,kernel)
          #find minimum
          res[i,j] = min(p) 
        }
      #return errosion
      return(res)
    }
    ######dilatuion#######
    dilation<-function(img,kernel){
      
      img_height = dim(img)[1]
      img_width = dim(img)[2]
      #we  have only odd numbers like 3,5,9...
      
      s=2*kernel+1
      res=matrix(0L, nrow = img_height, ncol = img_width) 
      
      for(i in (kernel+1):(img_height-kernel-1))
        for(j in (kernel+1):(img_width-kernel-1))
        {
          #extract neighbouring pixel values to calculate erosion
          p = extract_matrix(i,j,img,kernel)
          #find minimum
          res[i,j] = max(p) 
        }
      return(res)
    }
    function<-gradient_calculation(img,kernel){
      eroded_Img=
        
    }
    
    ### Load packages
    library(sp)
    library(rgdal)
    library(raster)
    library(ggplot2)
    #library that can represent images for people with low eye sight
    library(viridis)
    library(rasterVis)
    library(imager)
    
    
    
    getwd()
    setwd("imgs/")
    img_name="primer1.jpg"
    imgOrig=raster(readGDAL(img_name))
    imgInput=raster::as.matrix(imgOrig)
    
    
    
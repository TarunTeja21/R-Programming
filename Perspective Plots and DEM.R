#Perspective Plot of a Cone
cone <- function(x, y){
  sqrt(x ^ 2 + y ^ 2)
}
cone
#Preparing the variables
x <- y <- seq(-1, 1, length = 30)
z <- outer(x, y, cone)
#Plotting the 3D surface
persp(x, y, z)
persp(x, y, z,
      main="Perspective Plot of a Cone",
      zlab = "Height",
      theta = 30, phi = 15,
      col = "red", shade = 0.5)
#Perspective plots through the dataset volcano
View(volcano)
#Creating a contour plot
filled.contour(volcano,color=terrain.colors, asp=1, plot.axes=contour(volcano,add=T))
#Creating a perspective plot
persp(volcano,theta=25,phi=30,expand=0.5,col="red")
#Visualizing a simple DEM(Digital elevation model)
z <- 2 * volcano     # Exaggerate the relief
x <- 10 * (1:nrow(z)) # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z)) # 10 meter spacing (E to W)
# Don't draw the grid lines : border = NA
par(bg = "gray")
persp(x, y, z, theta = 135, phi = 30,
      col = "brown", scale = FALSE,
      ltheta = -120, shade = 0.75,
      border = NA, box = FALSE)
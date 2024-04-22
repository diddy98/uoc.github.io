# Basado en: https://flowingdata.com/2016/09/08/beeswarm-plot-in-r-to-show-distributions/

# Instalación y carga de librerías

packages_required <- c("beeswarm")

for (package in packages_required) {
  if (!(package %in% installed.packages())) {
    install.packages(package)}}    

lapply(packages_required, library, character.only = TRUE)

# Carga de datos

happiness_2015 <- read.csv("./Datasets/happiness_2015.csv", 
                           header=TRUE)

# Gráfico

par(mar = c(1, 6, 1, 6) + 5)

beeswarm(Family ~ Region, 
         data = happiness_2015, 
         col = sample(colors(), 10), 
         pch = 10, 
         method = "swarm", 
         cex = 0.5, 
         horizontal = TRUE, 
         xlab = "", 
         ylab = "",  
         cex.axis = 0.8,
         las = 1)

# Guardar gráfico

png(file = "./Output/plot_beeswarm.png", width = 800, height = 600)
dev.off()


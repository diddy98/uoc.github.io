# Basado en: https://flowingdata.com/2016/09/08/beeswarm-plot-in-r-to-show-distributions/


library(beeswarm)

happiness_2015 <- read.csv("G:/Mi unidad/Semestre actual/Visualización de datos/PEC2/happiness_2015.csv")

beeswarm(happiness_2015$Family)

beeswarm(Family  ~ Region, data=happiness_2015, col=sample(colors(), 10), pch=10, method="swarm", cex=0.5, las=2, xlab="", cex.axis= 0.4)

par(las=1)
beeswarm(Family  ~ Region, data=happiness_2015, col=sample(colors(), 10), pch=10, method="swarm", cex=0.5, horizontal=TRUE, xlab="PIB per capita", main="Distribución de PIB per capita, por región")


# Versión final

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


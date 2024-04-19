
# Based on https://r-graph-gallery.com/340-custom-your-dendrogram-with-dendextend.html

# Import data

library(tidyverse)
library(dendextend)

happiness_2015 <- read.csv("G:/Mi unidad/Semestre actual/Visualización de datos/PEC2/happiness_2015.csv")

rownames(happiness_2015) <- happiness_2015$Country
happiness_2015$Country <- NULL

# Clusterisation
happiness_2015 %>% 
 filter(Region == "Western Europe") %>% 
 select(Economy..GDP.per.Capita., Family, Health..Life.Expectancy., Freedom, Trust..Government.Corruption.) %>% 
 dist() %>% 
 hclust() %>% 
 as.dendrogram() -> dend

# Plot
par(mar=c(7,3,1,1))  # Increase bottom margin to have the complete label
plot(dend)



# Color in function of the cluster
par(mar=c(1,1,1,7))
dend %>%
 set("labels_col", value = c("skyblue", "orange"), k=2) %>%
 set("branches_k_color", value = c("skyblue", "orange"), k = 2) %>%
 plot(horiz=TRUE, axes=FALSE)
abline(v = 350, lty = 2)


# Basado on https://r-graph-gallery.com/340-custom-your-dendrogram-with-dendextend.html

# Instalación y carga de librerías

packages_required <- c("tidyverse", "dendextend")

for (package in packages_required) {
  if (!(package %in% installed.packages())) {
    install.packages(package)}}    

lapply(packages_required, library, character.only = TRUE)

# Carga de datos

happiness_2015 <- read.csv("./Datasets/happiness_2015.csv", 
                           header=TRUE)

rownames(happiness_2015) <- happiness_2015$Country
happiness_2015$Country <- NULL

# Agrupamiento y creación de objeto dend

happiness_2015 %>% 
 filter(Region == "Western Europe") %>% 
 select(Economy..GDP.per.Capita., Family, Health..Life.Expectancy., Freedom, Trust..Government.Corruption.) %>% 
 dist() %>% 
 hclust() %>% 
 as.dendrogram() -> dend

# Creación de gráfico, color por número de clusters

par(mar=c(1,1,1,7))
dend %>%
 set("labels_col", value = c("skyblue", "orange"), k=2) %>%
 set("branches_k_color", value = c("skyblue", "orange"), k = 2) %>%
 plot(horiz=TRUE, axes=FALSE)
abline(v = 350, lty = 2)

# Guardar gráfico

png(file = "./Output/plot_dendogram.png", width = 800, height = 600)
dev.off()


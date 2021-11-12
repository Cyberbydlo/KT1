#1)установим пакет,который позволяет строить красивые графики
install.packages('ggplot2')
install.packages('tidyverse')

#2)подлкючаем скаченный пакет
library(ggplot2)
library(tidyverse)

#3)Подключаем данные из таблицы"RU_Electricity_Market_PZ_dayahead_price_volume"
table1 <- read.csv("C:/Users/Андрей/OneDrive/Рабочий стол/KR/RU_Electricity_Market_PZ_dayahead_price_volume.csv", header = TRUE, sep = ",")

#4)Зададим имена функцией
names(table1)

#5)Применил метод авторегрессии для временных рядов
set.seed(40)
x <- arima.sim(n = nrow(table1), table1)
plot(x)


#Построим график 1
ggplot(data = table1)+
  geom_point(alpha = 1/2, mapping = aes(x= timestep, y = price_eur, color = consumption_eur))

#Построим график 2
ggplot(data = table1)+
  geom_point(alpha = 1/4, mapping = aes(x= consumption_eur, y = price_eur))
  

# 
# I'm using R to clean up the data, create some preliminary charts, set up a new
# dataframe to measure economic impact on GDP, and then create charts and maps. 
# I first start with removing any existing variables in the environment 
# 

rm(list=ls())

# 
# Again, I did this over multiple sessions. So my initial plan was to restrict myself
# to South Asian countries, so I decided to start out by looking at avg temperature
# trends from 1920 all the way to 2100. I did that for about six South Asian 
# countries before realizing that the temperature trends (because I had access to
# only average temp data) were fairly similar across countries, and it wasn't very
# informative to plot them. So I didn't create those charts for other countries. 
# 
# 

India_data<-read.csv("WB_data_India.csv") #Reading the csv file in R
India_data_real<-subset(India_data,select = c(-1,-5,-6)) #Subsetting the dataframe
#by removing unwanted columns from the dataframe
library(reshape2) #Bringing in reshape2 package to convert my dataframe from
#wide to long. This will make plotting avg temperature trends easier
India_plot_data<-melt(India_data_real,id.vars="toYear") #Specifying the variable
#along which the data needs to be arranged in the long format
library(ggplot2) #Calling on the ggplot2 package
# 
# I graphed a line chart to track temperature changes over time. 
# I set the x axis equal to year and the y axis equal to average temperature
# color parameter within the aes argument to specify that. I labelled the axes and
# the title, and then specified label names for the two separate scenarios.
# I also linked the label names with actual variable names to ensure that the right
# label gets matched with the appropriate variable. Finally, I specified y axis
# limits because initially I'd thought I'd use facet-wrap and compare temperature 
# trends across countries - so I wanted the axes to be comparable. 
# Once I realized that the average temperature data doesn't really indicate much, 
# I decided against creating these charts
# 
India_plot<-ggplot(data = India_plot_data,aes(x=toYear,y=value,color=variable)) + geom_line(stat="identity",position="dodge") + xlab("Year") + ylab("Average temperature in Celsisus") + ggtitle("Dual Scenario Temperature Trend - India") + scale_color_discrete(name="Scenarios", breaks=c("Avg.temperature.a2","Avg.temperature.b1"),labels=c("Weak\nEffort","Moderate\nEffort")) +ylim(15,25)


#Did the exact same thing for Afghanistan as I did for India
Afghanistan_data<-read.csv("WB_data_AFG.csv")
Afg_data_real<-subset(Afghanistan_data,select = c(-1,-2,-4))
Afg_plot_data<-melt(Afg_data_real,id.vars="toYear")
Afg_plot<-ggplot(data=Afg_plot_data,aes(x=toYear,y=value,color=variable)) + geom_line(stat="identity",position="dodge") + xlab("Year") + ylab("Average temperature in Celsisus") + ggtitle("Dual Scenario Temperature Trend - Afghanistan") + scale_color_discrete(name="Scenarios", breaks=c("Avg.temperature.a2","Avg.temperature.b1"),labels=c("Weak\nEffort","Moderate\nEffort")) + ylim(8,14)

#Did the same thing for Bhutan
Bhutan_data<-read.csv("WB_data_BTN.csv")
Bhutan_data_real<-subset(Bhutan_data,select = c(-1,-2,-4))
Bhutan_plot_data<-melt(Bhutan_data_real,id.vars = "toYear")
Bhutan_plot<-ggplot(data = Bhutan_plot_data,aes(x=toYear,y=value,color=variable)) +
  geom_line(stat="identity",position="dodge") + xlab("Year") + ylab("Average Temperature in Celsius") +ggtitle("Dual Scenario Temperature Trend - Bhutan") + 
  scale_color_discrete(name="Scenarios", breaks=c("Avg.temperature.a2","Avg.temperature.b1"),labels=c("Weak\nEffort","Moderate\nEffort")) + 
  ylim(8,14)

#Similar chart generated for Nepal
Nepal_data<-read.csv("WB_data_NPL.csv")
Nepal_data_real<-subset(Nepal_data,select = c(-1,-2,-4))
Nepal_plot_data<-melt(Nepal_data_real,id.vars="toYear")
Nepal_plot<-ggplot(data = Nepal_plot_data,aes(x=toYear,y=value,color=variable)) + geom_line(stat="identity",position="dodge")+xlab("Year") +ylab("Average temperature in Celsius") + ggtitle("Dual Scenario Temperature Trend - Nepal") + scale_color_discrete(name="Scenarios",breaks=c("Avg.temperature.a2","Avg.temperature.b1"),labels=c("Weak\nEffort","Moderate\nEffort")) + ylim(8,14)

#Bangladesh avg temp chart
Bangladesh_data<-read.csv("WB_data_BGD.csv")
Bangladesh_data_real<-subset(Bangladesh_data,select = c(-1,-2,-4))
Bangladesh_plot_data<-melt(Bangladesh_data_real,id.vars = "toYear")
Bangladesh_plot<-ggplot(data = Bangladesh_plot_data,aes(x=toYear,y=value,color=variable)) + geom_line(stat="identity",position="dodge")+xlab("Year") +ylab("Average temperature in Celsius") + ggtitle("Dual Scenario Temperature Trend - Bangladesh") + scale_color_discrete(name="Scenarios",breaks=c("Avg.temperature.a2","Avg.temperature.b1"),labels=c("Weak\nEffort","Moderate\nEffort")) + ylim(15,25)

#Finally, Pakistan data
Pakistan_data<-read.csv("WB_data_PAK.csv")
Pakistan_data_real<-subset(Pakistan_data,select = c(-1,-2,-4))
Pakistan_plot_data<-melt(Pakistan_data_real,id.vars = "toYear")
Pakistan_plot<-ggplot(data = Pakistan_plot_data,aes(x=toYear,y=value,color=variable)) + geom_line(stat="identity",position="dodge")+xlab("Year") +ylab("Average temperature in Celsius") + ggtitle("Dual Scenario Temperature Trend - Pakistan") + scale_color_discrete(name="Scenarios",breaks=c("Avg.temperature.a2","Avg.temperature.b1"),labels=c("Weak\nEffort","Moderate\nEffort")) + ylim(14,20)

# 
# Once I'd collected all of the other data from the API, I read in all of the CSV
# files, here in R
# 
Arg_data<-read.csv("WB_data_ARG.csv")
Bol_data<-read.csv("WB_data_BOL.csv")
Bra_data<-read.csv("WB_data_BRA.csv")
Can_data<-read.csv("WB_data_CAN.csv")
Chn_data<-read.csv("WB_data_CHN.csv")
Deu_data<-read.csv("WB_data_DEU.csv")
Dza_data<-read.csv("WB_data_DZA.csv")
Egy_data<-read.csv("WB_data_EGY.csv")
Esp_data<-read.csv("WB_data_ESP.csv")
Eth_data<-read.csv("WB_data_ETH.csv")
Fra_data<-read.csv("WB_data_FRA.csv")
Gbr_data<-read.csv("WB_data_GBR.csv")
Ita_data<-read.csv("WB_data_ITA.csv")
Ken_data<-read.csv("WB_data_KEN.csv")
Mex_data<-read.csv("WB_data_MEX.csv")
Moz_data<-read.csv("WB_data_MOZ.csv")
Nga_data<-read.csv("WB_data_NGA.csv")
Pry_data<-read.csv("WB_data_PRY.csv")
Rus_data<-read.csv("WB_data_RUS.csv")
Sdn_data<-read.csv("WB_data_SDN.csv")
Tcd_data<-read.csv("WB_data_TCD.csv")
Tza_data<-read.csv("WB_data_TZA.csv")
Usa_data<-read.csv("WB_data_USA.csv")
Zaf_data<-read.csv("WB_data_ZAF.csv")

# 
# Because average temperature data by itself didn't provide much insight, 
# I decided to look at temperature variance for each country across time, as well
# as across the two scenarios. This was definitely more useful than averages 
# because it clearly indicated how different countries had been and were going to
# be experiencing changes in temperatures caused by climate change.
# 

#Using R's variance function to get the variance for average temperatures over
#time for each scenario, and for each country and assigning it to a specific
#variable
Arg_a2_var<-var(Arg_data$Avgtemp.a2)
Arg_b1_var<-var(Arg_data$Avgtemp.b1)
Bol_a2_var<-var(Bol_data$Avgtemp.a2)
Bol_b1_var<-var(Bol_data$Avgtemp.b1)
Bra_a2_var<-var(Bra_data$Avgtemp.a2)
Bra_b1_var<-var(Bra_data$Avgtemp.b1)
Can_a2_var<-var(Can_data$Avgtemp.a2)
Can_b1_var<-var(Can_data$Avgtemp.b1)
Chn_a2_var<-var(Chn_data$Acgtemp.a2)
Chn_b1_var<-var(Chn_data$Avgtemp.b1)
Deu_a2_var<-var(Deu_data$Avgtemp.a2)
Deu_b1_var<-var(Deu_data$Avgtemp.b1)
Dza_a2_var<-var(Dza_data$Avgtemp.a2)
Dza_b1_var<-var(Dza_data$Avgtemp.b1)
Egy_a2_var<-var(Egy_data$Acgtemp.a2)
Egy_b1_var<-var(Egy_data$Avgtemp.b1)
Esp_a2_var<-var(Esp_data$Avgtemp.a2)
Esp_b1_var<-var(Esp_data$Avgtemp.b1)
Eth_a2_var<-var(Eth_data$Avgtemp.a2)
Eth_b1_var<-var(Eth_data$Avgtemp.b1)
Fra_a2_var<-var(Fra_data$Avgtemp.a2)
Fra_b1_var<-var(Fra_data$Avgtemp.b1)
Gbr_a2_var<-var(Gbr_data$Avgtemp.a2)
Gbr_b1_var<-var(Gbr_data$Avgtemp.b1)
In_a2_var<-var(India_data$Avg.temperature.a2)
In_b1_var<-var(India_data$Avg.temperature.b1)
Ita_a2_var<-var(Ita_data$Avgtemp.a2)
Ita_b1_var<-var(Ita_data$Avgtemp.b1)
Ken_a2_var<-var(Ken_data$Avgtemp.a2)
Ken_b1_var<-var(Ken_data$Avgtemp.b1)
Mex_a2_var<-var(Mex_data$Avgtemp.a2)
Mex_b1_var<-var(Mex_data$Avgtemp.b1)
Moz_a2_var<-var(Moz_data$Avgtemp.a2)
Moz_b1_var<-var(Moz_data$Avgtemp.b1)
Nga_a2_var<-var(Nga_data$Avgtemp.a2)
Nga_b1_var<-var(Nga_data$Avgtemp.b1)
Pry_a2_var<-var(Pry_data$Avgtemp.a2)
Pry_b1_var<-var(Pry_data$Avgtemp.b1)
Rus_a2_var<-var(Rus_data$Avgtemp.a2)
Rus_b1_var<-var(Rus_data$Avgtemp.b1)
Sdn_a2_var<-var(Sdn_data$Avgtemp.a2)
Sdn_b1_var<-var(Sdn_data$Avgtemp.b1)
Tcd_a2_var<-var(Tcd_data$Avgtemp.a2)
Tcd_b1_var<-var(Tcd_data$Avgtemp.b1)
Tza_a2_var<-var(Tza_data$Avgtemp.a2)
Tza_b1_var<-var(Tza_data$Avgtemp.b1)
Usa_a2_var<-var(Usa_data$Avgtemp.a2)
Usa_b1_var<-var(Usa_data$Avgtemp.b1)
Zaf_a2_var<-var(Zaf_data$Avgtemp.a2)
Zaf_b1_var<-var(Zaf_data$Avgtemp.b1)
Bgd_a2_var<-var(Bangladesh_data$Avg.temperature.a2)
Bgd_b1_var<-var(Bangladesh_data$Avg.temperature.b1)
Pak_a2_var<-var(Pakistan_data$Avg.temperature.a2)
Pak_b1_var<-var(Pakistan_data$Average.temperature.b1)
Afg_a2_var<-var(Afghanistan_data$Avg.temperature.a2)
Afg_b1_var<-var(Afghanistan_data$Avg.temperature.b1)
Btn_a2_var<-var(Bhutan_data$Avg.temperature.a2)
Btn_b1_var<-var(Bhutan_data$Avg.temperature.b1)
Npl_a2_var<-var(Nepal_data$Avg.temperature.a2)
Npl_b1_var<-var(Nepal_data$Avg.temperature.b1)

# 
# In order to visualize all of this data, I had to create a new dataframe in R
# that would compile variance values for each country and each scenario. So first,
# I created a list with all the variances for weak effort scenario, then one for
# moderate effort scenario. Then I had to link each country with each variance,
# and because I was now sorting countries on the basis of ISO3 codes, to make it
# easy for mapping later, I just created a new list with the country names.
# I was pulling in data from three separate research papers that had estimated 
# the impact of climate change on GDP in 2100. I created a list that contained all
# of the GDP change values. The GDP changes are all negative - i.e. GDP of 
# all of the countries in my sample is decreasing in 2100, and so I decided to drop
# the negative sign, because it wouldn't have been useful to try and plot that or
# map that, and scale all percentages to decimals. 
# Finally, I figured that a scatterplot that contained all countries' data was too
# messy and uninformative. So as a preliminary step,I decided to sort data and 
# visualization on the basis of regions. I don't think that's the accurate way to
# go about it, but regional level frameworks provide a clean way of looking at data
# initially. 
# 


Variance_weak.effort.scenario<-c(Afg_a2_var,Arg_a2_var,Bgd_a2_var,Bol_a2_var,Bra_a2_var,Btn_a2_var,Can_a2_var,
                                 Chn_a2_var,Deu_a2_var,Dza_a2_var,Egy_a2_var,Esp_a2_var,Eth_a2_var,Fra_a2_var,
                                 Gbr_a2_var,In_a2_var,Ita_a2_var,Ken_a2_var,Mex_a2_var,Moz_a2_var,Nga_a2_var,
                                 Npl_a2_var,Pak_a2_var,Pry_a2_var,Rus_a2_var,Sdn_a2_var,Tcd_a2_var,Tza_a2_var,
                                 Usa_a2_var,Zaf_a2_var)
Variance_moderate.effort.scenario<-c(Afg_b1_var,Arg_b1_var,Bgd_b1_var,Bol_b1_var,Bra_b1_var,Btn_b1_var,
                                     Can_b1_var,Chn_b1_var,Deu_b1_var,Dza_b1_var,Egy_b1_var,Esp_b1_var,
                                     Eth_b1_var,Fra_b1_var,Gbr_b1_var,In_b1_var,Ita_b1_var,Ken_b1_var,
                                     Mex_b1_var,Moz_b1_var,Nga_b1_var,Npl_b1_var,Pak_b1_var,Pry_b1_var,
                                     Rus_b1_var,Sdn_b1_var,Tcd_b1_var,Tza_b1_var,Usa_b1_var,Zaf_b1_var)
Country<-c("Afghanistan","Argentina","Bangladesh","Bolivia","Brazil","Bhutan","Canada","China","Germany",
           "Algeria","Egypt","Spain","Ethiopia","France","Great Britain","India","Italy","Kenya","Mexico",
           "Mozambique","Nigeria","Nepal","Pakistan","Paraguay","Russia","Sudan","Chad","Tanzania","USA","South Africa")
GDPchange<-c(0.36,0.53,0.9,0.69,0.83,0.16,0.00247,0.42,0.063,0.67,0.84,0.46,0.74,0.1,
             0.042,0.92,0.26,0.73,0.73,0.89,0.91,0.93,0.85,0.84,0.00419,0.87,0.86,0.84,
             0.36,0.66)
Region<-c("Asia","Americas","Asia","Americas","Americas","Asia","Americas","Asia","Europe","Africa","Africa","Europe","Africa","Europe","Europe","Asia","Europe","Africa","Americas","Africa","Africa","Asia","Asia","Americas","Europe","Africa","Africa","Africa","Americas","Africa")


# 
# I combined all of the lists defined above into a dataframe that I could easily
# use to create 4 separate scatterplots. Each scatterplot data subset 
# incorporates 3 variables - the variance of average temperatures in weak effort 
# scenario, the variance of average temperatures in strong effort scenario and 
# the total change in GDP in 2100. I created subsets for each region which then
# makes it easy to identify the dataframe to call on when plotting it. 
# 

Scatterplot_data<-data.frame(Country,Variance_weak.effort.scenario,Variance_moderate.effort.scenario,GDPchange,Region)
Scatter_sub_Asia<-Scatterplot_data[Scatterplot_data$Region=="Asia",]
Scatter_sub_Americas<-Scatterplot_data[Scatterplot_data$Region=="Americas",]
Scatter_sub_Africa<-Scatterplot_data[Scatterplot_data$Region=="Africa",]
Scatter_sub_Europe<-Scatterplot_data[Scatterplot_data$Region=="Europe",]

# 
# The first scatterplot is for Asian countries, where x axis is for weak effort 
# variances, y indicates moderate effort variances and the size of the bubble is
# GDP change. I define size through geom_point function and then using aes argument,
# link size parameters to GDP change variable. I then added labels and because the 
# legend label was long, used line breaks to make sure that the final legend label
# text did not take over the entire chart space. I used the theme functionality
# to dictate legend position, font size and font face. Because I wanted to 
# show each country label on the plot itself, I used geom-text and specified how
# the labels should appear in relation to the bubbles. That is also why I used
# guides to indicate that I didn't want a legend for the countries. My functions
# for all of the scatterplots are the same except for Americas - the last one, 
# where data labels were overlapping. So I used check overlap parameter in geom-text
# functionality to avoid overlaps, and so had to reintroduce legends for countries
# 
Variance_scatter_1<-ggplot(Scatter_sub_Asia,aes(x=Variance_weak.effort.scenario,y=Variance_moderate.effort.scenario)) + geom_point(aes(size= GDPchange,color=Country)) + xlab("Temperature Variance - Weak Effort Scenario") + ylab("Temperature Variance - Moderate Effort Scenario") + ggtitle("Climate change impact - Temperature variance and economic fallout in Asia") + labs(color="Country",size="Change in GDP in 2100\n(Percentages scaled\n down to decimals)") + theme(axis.text=element_text(size=8), axis.title=element_text(size=8),title = element_text(size = 10,face = "bold"),legend.position = "right",legend.title = element_text(size = 7),legend.direction = "vertical") + guides(color = FALSE) + geom_text(aes(label=Country),hjust=0,vjust=0.5,size=3) + xlim(1.2,2.7)
Variance_scatter_1

Variance_scatter_2<-ggplot(Scatter_sub_Africa,aes(x=Variance_weak.effort.scenario,y=Variance_moderate.effort.scenario)) + geom_point(aes(color=Country,size= GDPchange)) + xlab("Temperature Variance - Weak Effort Scenario") + ylab("Temperature Variance - Moderate Effort Scenario") + ggtitle("Climate change impact - Temperature variance and economic fallout in Africa") + labs(color="Country",size="Change in GDP in 2100\n(Percentages scaled\n down to decimals)") + theme(axis.text=element_text(size=8), axis.title=element_text(size=8),legend.text = element_text(size=10),legend.title = element_text(size=7),title = element_text(size = 10,face = "bold"),legend.position = "right",legend.direction = "vertical") + guides(color = FALSE) + geom_text(aes(label=Country),hjust=0,vjust=0.5,size=3) + xlim(1.5,2.5)
Variance_scatter_2

Variance_scatter_3<-ggplot(Scatter_sub_Europe,aes(x=Variance_weak.effort.scenario,y=Variance_moderate.effort.scenario)) + geom_point(aes(color=Country,size= GDPchange)) + xlab("Temperature Variance - Weak Effort Scenario") + ylab("Temperature Variance - Moderate Effort Scenario") + ggtitle("Climate change impact - Temperature variance and economic impact in Europe") + labs(color="Country",size="Change in GDP in 2100\n(Percentages scaled\n down to decimals)") + theme(axis.text=element_text(size=8), axis.title=element_text(size=8),legend.text = element_text(size=10),legend.title = element_text(size=7),title = element_text(size = 10,face = "bold"),legend.position = "right",legend.direction = "vertical") + guides(color = FALSE) +geom_text(aes(label=Country),hjust=0,vjust=0.5,size=3) + xlim(0.5,5.5)
Variance_scatter_3

Variance_scatter_4<-ggplot(Scatter_sub_Americas,aes(x=Variance_weak.effort.scenario,y=Variance_moderate.effort.scenario)) + geom_point(aes(color=Country,size= GDPchange)) + xlab("Temperature Variance - Weak Effort Scenario") + ylab("Temperature Variance - Moderate Effort Scenario") + ggtitle("Climate change impact - Temperature variance and economic fallout in the Americas") + labs(color="Country",size="Change in GDP in 2100\n(Percentages scaled\n down to decimals)") + theme(axis.text=element_text(size=8), axis.title=element_text(size=8),legend.text = element_text(size=10),legend.title = element_text(size=7),title = element_text(size = 10,face = "bold"),legend.position = "right", legend.direction = "vertical",legend.box = "horizontal") + geom_text(aes(label=Country),vjust=0,size=3, check_overlap = TRUE) + xlim(1,4)
Variance_scatter_4


# 
# Once I had my scatterplots/bubbleplots, I wanted to create a few basic maps
# showing the same information. I tried out various map packages, but rworldmap
# seemed to work the best and was also the easiest to use, mainly because it didn't
# require a spatial polygons dataframe. However, seeing as my end goal is to create 
# an interactive map, I have started playing around with SPDFs more, and in the future
# will be constructing comprehensive SPDFs. 
# 
# 


install.packages('rworldmap', dependencies = TRUE)
library(rworldmap)
# 
# I created a separate dataframe to use for maps and attached ISO codes for each
# country to the dataframe. This is because rworldmaps identifies country data more
# accurately through ISO3 codes than country names, and maps them on fairly quickly.
# I then used the joincountry2map function in order to map my dataframe to rworldmap's
# spdf, which I could then easily use to create world maps. 
# 

Map_df<-data.frame(Country,Variance_weak.effort.scenario,Variance_moderate.effort.scenario,GDPchange)
Map_df$CountryISO<-c("AFG","ARG","BGD","BOL","BRA","BTN","CAN","CHN","DEU","DZA",
                     "EGY","ESP","ETH","FRA","GBR","IND","ITA","KEN","MEX","MOZ",
                     "NGA","NPL","PAK","PRY","RUS","SDN","TCD","TZA","USA","ZAF")
trial<-joinCountryData2Map(Map_df,joinCode = "ISO3",nameJoinColumn = "CountryISO")


# 
# Here I'm defining a color palette using R color brewer package. I went with Yellow,
# Oranges and Reds here because I was illustrating temperature variance in weak
# effort scenario, which is quite extreme. So I figured the warm colors would sort of
# be intuitive and show the viewer that these countries have been and will literally
# be warming up over this century.
# Also calling in the RColorBrewer package to get color palettes
library(RColorBrewer)
color_1<-brewer.pal(8,name="YlOrRd")
# 
# 
# To be honest, I have NO idea what the par function does, just that it's needed
# before plotting the map. I plan on figuring it out soon, just haven't gotten
# around to it yet!
# 


par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")

# 
# Here, I use mapCountryData function to specify which variable to map from the trial
# sPDF. I also use other arguments to specify the title and to indicate that the missing countries should be
# colored gray and the ocean should be colored lightblue. I used the mtext
# function to insert some explanatory text below the map scale. 
# 


mapCountryData(trial,nameColumnToPlot = "Variance_weak.effort.scenario",missingCountryCol = gray(0.8),mapTitle = "Temperature Variance in Weak Effort Scenario",colourPalette = color_1,oceanCol = "lightblue")
mtext("The scale represents average temperature variance\n from 1920-2100 and is in degrees Celsius", side = 1, line = -1)

# For moderate effort, I used warm colors again, but not reds, to differentiate it
# from the weak effort scenario and also to maybe? indicate that the moderate
# effort scneario isn't as dire - though still dire enough! I use the exact same
# function as above


color_2<-brewer.pal(8,name = "YlOrBr")
trial_2<-joinCountryData2Map(Map_df,joinCode = "ISO3",nameJoinColumn = "CountryISO")
mapCountryData(trial_2,nameColumnToPlot = "Variance_moderate.effort.scenario",missingCountryCol = gray(0.8),mapTitle = "Temperature Variance in Moderate Effort Scenario",colourPalette = color_2, oceanCol = "lightblue")
mtext("The scale represents average temperature variance\n from 1920-2100 and is in degrees Celsius", side = 1, line = -1)


#I finally wanted to create a more qualitative map showing which countries are
#likely to be the most impacted economically by climate change in 2100. 
#I'm using the same GDPchange data, but just sort of ranking the countries
#here in terms of "worst impacted" to "least impacted" through this map

color_3<-brewer.pal(7,name="Reds")
mapCountryData(trial_2,nameColumnToPlot = "GDPchange",missingCountryCol = "darkgray",mapTitle = "Economic impact of climate change in 2100",colourPalette = color_3,oceanCol = "lightblue",addLegend = FALSE) 
mtext("Darker colors represent greater negative impacts on GDP",side = 1,line = -3)



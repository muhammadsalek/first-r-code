#dplyr Functionality
#Installing dplyr
install.packages('dplyr')
library(dplyr)
# Load gapminder dataset
install.packages("gapminder")
library(gapminder)
View(gapminder)

#Exploring the Gapminder Data set
#Examine first few rows
head(gapminder)
#Examine last few rows
tail(gapminder)
# Dimensions
dim(gapminder)
#Colnames
names(gapminder)
#Datastructure
str(gapminder)
#Summary
summary(gapminder)
#onecolumn summary
summary(gapminder$lifeExp)

#load dplyr
library(dplyr)
library(gapminder)
# Pick  single Column by Name
select(gapminder, country)
# Pick multiple columns
select(gapminder, country,year,pop,continent)
#Remove single column
select(gapminder, -gdpPercap)

# Removing multiple columns
select(gapminder, -c(gdpPercap,pop))

#Select column using range
#select(gapminder,country:year)
#select(gapminder,contains("c"))
#select(gapminder,contains("c"), contains('g'))#multiple
#select(gapminder, starts_with('c'))
#select(gapminder,ends_with('p'))

#Select column using range
select(gapminder,country:year)
#Select column using contains
select(gapminder,contains("c"))
#Select column using multiple columns
select(gapminder,contains("c"),contains("g"))

#Select column using strts_with
select(gapminder,starts_with("c"))
#Select column using ends_with
select(gapminder,ends_with(("p")))

#Chaining Method: The Pipe(%>%) Operator
gapminder %>%
  select(country, continent,year)%>%
  head()


#The count verb
gapminder %>%
  count()


#The count variable 
gapminder %>%
  count(country)
#Count and Sort
gapminder %>%
  count(country,sort = TRUE)
#Count Population
gapminder %>%
  select(country,pop) %>%
  count(country,wt=pop,sort = T)


#Relational Operator
#filter:Equality("=")
filter(gapminder,country=="Bangladesh")



#filter:Inequality("!=")
filter(gapminder,country!="Bangladesh")

#filter:Greater(">")
filter(gapminder,gdpPercap>800)
#filter:greater or equal(">=")
filter(gapminder,gdpPercap>=800)

#filter:less("<")
filter(gapminder,gdpPercap<800)
#filter:less("<=")
filter(gapminder,gdpPercap <= 800)

#filter:Logical AND("&")
filter(gapminder,country=="Bangladesh" & gdpPercap>800)


filter(gapminder,country=="Bangladesh" | gdpPercap>800)

#filter:The "%in% Operator
filter(gapminder,country %in% c("Bangladesh",'Australia'))
#Create a new column
gapminder%>%
  mutate(gdp = gdpPercap * pop) %>%
  head()


## Load the dplyr package
library(dplyr)

library(gapminder)
View(gapminder)

# Assuming gapminder is already loaded
gapminder %>%
  mutate(gdp = gdpPercrap * pop / 10^6) %>%
  head()




#GDP in Million
gapminder %>%
  mutate(gdp=gdpPercrap * pop/10^6)%>%
  head()

colnames(gapminder)

gapminder %>%
  mutate(gdp = gdpPercap * pop / 10^6) %>%
  head()

#Reorder Rows
gapminder %>%
  select(country,pop) %>%
  arrange(pop) %>%
  head()

#Descending order
gapminder %>%
  select(country,pop) %>%
  arrange(desc(pop)) %>%
  head()

#Grouping data
gapminder %>%
group_by(continent) %>%
  head()





#summarize
gapminder %>%
summarize(total_pop= sum(pop))
#Aggregate and summarize
gapminder %>%
  summarize(total_population = sum(pop),
            avg_gdppercap = mean(gdpPercap))

#Aggregate within Groups
gapminder %>%
  group_by(continent) %>%
  summarise(max_lifeexp = max(lifeExp))


# The top_n Verb
gapminder%>%
  group_by(continent) %>%
  top_n(1,pop)
#REnaming Column
gapminder%>%
  rename(population = pop) %>%
  head()





#Data structure
glimpse(gapminder)
# The easiest way to get dplyr is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just dplyr:
install.packages("dplyr")
# Five basic verb: filter,select,arrange,mutate,summarise and group_by

#create a data set
library(gapminder)
View(gapminder)
gapminder %>%
  filter(country =='Bangladesh')
bd_df <- gapminder %>%
  filter(country == 'Bangladesh')
df_2007 <-gapminder %>%
     filter(year == 2007)
df_2008 <- gapminder %>%
              filter(year==2008)




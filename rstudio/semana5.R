#dependencies
#install.packages("jsonlite")
#install.packages("XML")
#uncomment above if u have not installed 

library("jsonlite")
library("XML")

pob_esp = fromJSON("https://servicios.ine.es/wstempus/js/ES/DATOS_TABLA/2852?nult=5&tip=AM")

floatrates = fromJSON("https://www.floatrates.com/daily/usd.json")

students = fromJSON("files/students.json")

students_per_course = fromJSON("files/students_per_course.json")


bm_doc = xmlParse("http://api.worldbank.org/v2/countries/all/indicators/NY.GDP.MKTP.CD?date=2019:2020&per_page=500&page=1")
root_node = xmlRoot(bm_doc)
bm_dataframe = xmlSApply(root_node, function(x) xmlSApply(x, xmlValue))
bm_datos = data.frame(t(bm_dataframe), row.names = NULL)

cd_catalog_doc = xmlParse("files/cd_catalog.xml")
root_node_0= xmlRoot(cd_catalog_doc)
cd_catalog_df= xmlSApply(root_node_0, function(x) xmlSApply(x, xmlValue))
cd_catalog_datos = data.frame(t(cd_catalog_df), row.names = NULL)

auto = read.csv("files/auto-mpg.csv", header = TRUE, sep = ",")
names(auto)

wiki_table = readHTMLTable("files/WorldPopulation-wiki.html")
most_wiki_pob = wiki_table[[5]]
head(most_wiki_pob, 3)

unique_table = readHTMLTable("files/WorldPopulation-wiki.html", which = 5)

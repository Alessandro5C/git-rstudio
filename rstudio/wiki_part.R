#upc_url = "https://pregrado.upc.edu.pe/carrera-de-ciencias-de-la-computacion/malla-curricular"
wiki_url = "https://es.wikipedia.org/wiki/Ayuda:Tablas"

wiki_read = readLines(wiki_url, encoding= "UTF-8", warn= FALSE)
parsed_wiki = htmlParse(wiki_read, encoding = "UTF-8")
wiki_enter_text = parsed_wiki["//p"]
length(wiki_enter_text)
wiki_enter_text [[10]]
length(getHTMLLinks(wiki_read))
length((readHTMLTable(wiki_read)))

names(readHTMLTable(wiki_read))
readHTMLTable(wiki_read)$"Una tabla ejemplo\n"

#upc_url = "https://pregrado.upc.edu.pe/carrera-de-ciencias-de-la-computacion/malla-curricular"
upc_url = "https://pregrado.upc.edu.pe/facultad-de-ingenieria/ciencias-de-la-computacion/"

upc_read = readLines(upc_url, encoding= "UTF-8", warn= FALSE)
parsed_upc = htmlParse(upc_read, encoding = "UTF-8")
upc_enter_text = parse_upc["//p"]
lenght(upc_enter_text)
upc_enter_text [[10]]
length(getHTMLLinks(upc_read))
length((readHTMLTable(upc_read)))
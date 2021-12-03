## TO RUN THIS SCRIPTS:
#library()
#   +XML
#   +xml2
#   +rvest
#   +ggplot2

my_url = "https://www.imdb.com/search/title/?count=100&release_date=2020,2020&title_type=feature"

pelis = read_html(my_url)

rank_data_html = html_nodes(pelis,'.text-primary')
rank_data = html_text(rank_data_html)

head(rank_data)

rank_data = as.numeric(rank_data)
head(rank_data)


tit_data_html = html_nodes(pelis,'.lister-item-header a')
tit_data = html_text(tit_data_html)
head(tit_data)


desc_data_html = html_nodes(pelis,'.ratings-bar+ .text-muted')
desc_data = html_text(desc_data_html)
head(desc_data)
desc_data = gsub("\n","",desc_data)
head(desc_data)


runtime_data_html = html_nodes(pelis,'.text-muted .runtime')
runtime_data = html_text(runtime_data_html)
head(runtime_data)

runtime_data = gsub(" min","",runtime_data)
runtime_data = as.numeric(runtime_data)
head(runtime_data)


genre_data_html = html_nodes(pelis,'.genre')
genre_data = html_text(genre_data_html)
head(genre_data)

genre_data = gsub("\n","",genre_data)
head(genre_data)

genre_data = gsub(" ","",genre_data)
head(genre_data)

genre_data = gsub(",.*","",genre_data)
head(genre_data)

genre_data = as.factor(genre_data)
head(genre_data)


rating_data_html = html_nodes(pelis,'.ratings-imdb-rating strong')
rating_data = html_text(rating_data_html)
head(rating_data)

rating_data = as.numeric(rating_data)
head(rating_data)


metascore_data_html = html_nodes(pelis,'.metascore')
metascore_data = html_text(metascore_data_html)
head(metascore_data)

metascore_data = gsub(" ","",metascore_data)
head(metascore_data)

metascore_data = as.numeric(metascore_data)
head(metascore_data)


votos_data_html = html_nodes(pelis,'.sort-num_votes-visible span:nth-child(2)')
votos_data = html_text(votos_data_html)
head(votos_data)

votos_data = gsub(' ','', votos_data)
votos_data = gsub(' ','', votos_data)
head(votos_data)


gross_data_html = html_nodes(pelis,'.ghost~ .text-muted+ span')
gross_data = html_text(gross_data_html)
head(gross_data)

gros_data = gsub("M","", gross_data)
gross_data = substring(gross_data,2,6)

length(gross_data)

gross_data = as.numeric(gross_data)
head(gross_data)


director_data_html = html_nodes(pelis,'.text-muted+ p a:nth-child(1)')
director_data = html_text(director_data_html)
head(director_data)

director_data = as.numeric(director_data)
head(director_data)


actor_data_html = html_nodes(pelis,'.lister-item-content .ghost+ a')
actor_data = html_text(actor_data_html)
head(actor_data)

actor_data = as.factor(actor_data)
head(actor_data)


pelis_df = data.frame(Rank = rank_data, Titulo = tit_data, Runtime = runtime_data, Genero = genre_data, Director = director_data, Actor = actor_data)
str(pelis_df)

write.csv(pelis_df, 'pelis_df.csv', row.names = TRUE)

qplot(data = pelis_df,Runtime, fill= Genero, bins=30, main="Película: Duración vs Genero")

tot_pelis = table(pelis_df$Genero)
tot_pelis
head(tot_pelis)

barplot(tot_pelis,main="Distribución de peliculas según Genero", xlab="Genero",ylab="Total Películas")

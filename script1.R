library(fivethirtyeight)
library(tidyverse)

data("steak_survey", package="fivethirtyeight")
view(steak_survey)

sdat <- na.omit(steak_survey) %>%
  filter(region=="Mountain")

ggplot(sdat,
       aes(x = steak_prep, fill = female)) +
  geom_bar(position="dodge") +
  ggtitle(paste0("Steak Preparation Preference by Gender for ","Mountain"," Region"))


rmarkdown::render("C:/Reproducible-Templates/Module3/steakArticleParameters.Rmd",
                  params = list(region = "South Atlantic"))

render_report <-function(regionvar){
  template <-"C:/Reproducible-Templates/Module3/steakArticleParameters.Rmd"
  outfile <-sprintf("steakArticle_%s.html",regionvar)
  parameters <-list(region = regionvar)
  rmarkdown::render(template,
                    output_file=outfile,
                    params=parameters)
  invisible(TRUE)
}

render_report("Pacific")

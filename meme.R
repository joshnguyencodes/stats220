# inspo_meme link https://imgflip.com/i/393ddh

library(magick)

#links to images
confused_dog_url <- "https://media.istockphoto.com/id/94740594/photo/intrigued.jpg?s=612x612&w=0&k=20&c=mn8cFeCJkdFFzyPtHgTjdM1EM8waO5-FB1IJO_Mz6gU="
happy_dog_url <- "https://as1.ftcdn.net/v2/jpg/01/71/47/90/1000_F_171479019_6UvsiH5Erd8m3GCcCC5AdhVwpiqkfvJb.jpg"

#square 1
top_row_image <- image_read(confused_dog_url) %>%
  image_scale(500)

#square 2
top_row_text <- image_blank(width = 500,
                            height =500,
                            color = "#000000") %>%
  image_annotate(text = "$10 with $5 shipping",
                 color = "#FFFFFF",
                 size = 30,
                 font = "Calibri",
                 gravity = "center")
  

#square 3
bottom_row_image <- image_read(happy_dog_url) %>%
  image_scale(500)

#square 4
bottom_row_text <- image_blank(width=500,
                            height=500,
                            color="#000000") %>%
  image_annotate(text = "$15 with free shipping",
                 color = "#FFFFFF",
                 size = 30,
                 font = "Calibri",
                 gravity = "center")

#making first row
first_row <- image_append(c(top_row_image, top_row_text))

#making second row
second_row <- image_append(c(bottom_row_image, bottom_row_text))

#putting everything together
my_meme <- image_append(c(first_row, second_row), stack = TRUE) %>%
  image_scale(800)

#saving the meme as a png
image_write(my_meme, "my_meme.png")





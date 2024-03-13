# inspo_meme link https://imgflip.com/i/393ddh

library(magick)

#links to images
confused_dog_url <- "https://media.istockphoto.com/id/94740594/photo/intrigued.jpg?s=612x612&w=0&k=20&c=mn8cFeCJkdFFzyPtHgTjdM1EM8waO5-FB1IJO_Mz6gU="
happy_dog_url <- "https://as1.ftcdn.net/v2/jpg/01/71/47/90/1000_F_171479019_6UvsiH5Erd8m3GCcCC5AdhVwpiqkfvJb.jpg"
money_glasses_url = "https://png.pngtree.com/png-clipart/20221001/original/pngtree-modern-shades-sunglasses-money-vector-png-image_8647116.png" 


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

#money glasses image
glasses_image <- image_read(money_glasses_url) %>%
  image_scale(200) 


#creating each frame where the glasses keeps coming closer to the happy dog
frame_1 <- image_composite(my_meme, glasses_image, offset = "+0+345")

frame_2 <- image_composite(my_meme, glasses_image, offset = "+5+355")

frame_3 <- image_composite(my_meme, glasses_image, offset = "+10+365")

frame_4 <- image_composite(my_meme, glasses_image, offset = "+15+375")

frame_5 <- image_composite(my_meme, glasses_image, offset = "+20+385")

frame_6 <- image_composite(my_meme, glasses_image, offset = "+25+395")

frame_7 <- image_composite(my_meme, glasses_image, offset = "+25+395")

frame_8 <- image_composite(my_meme, glasses_image, offset = "+25+395")


#putting the frames in order using a vector
frames <- c(frame_1, frame_2, frame_3, frame_4, frame_5, frame_6, frame_7, frame_8)

#creating animation
my_meme_gif <- image_animate(frames, fps = 5)

image_write(my_meme_gif, "my_animation.gif")
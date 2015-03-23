#!/usr/bin/Rscript
# Please install package called "mailR"
library(mailR)
sender<-"your@email.address"
recipient<-c("recipient@email.address")
send.mail(from = sender,
   		  to = recipient,
		  subject = "Give a title",
		  body = "Write something here..",
		  smtp = list(host.name = "smtp.gmail.com",
		 			  port = 465,
					  user.name = sender,
					  passwd = "password for your email",
					  ssl = TRUE),
		  authenticate = TRUE,
		  send = TRUE)



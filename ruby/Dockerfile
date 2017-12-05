FROM ruby

RUN gem install pg
RUN gem install sinatra

RUN mkdir /app
COPY *.rb /app/
#COPY *.pem /app/
#COPY *.crt /app/
WORKDIR /app
CMD ruby app.rb

FROM ruby:2.6.1-alpine3.9

WORKDIR /normalize

ADD ./ /normalize

CMD ruby normalize.rb

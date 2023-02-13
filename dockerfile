# Use Ruby official image as base image
FROM ruby:2.7.6

# Set environment variables
ENV APP_HOME /app

# app directory
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl git

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
RUN echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
RUN echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc


# Install plugins for asdf
RUN asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

RUN asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Install Ruby and Node.js versions
RUN asdf install ruby 2.7.6
RUN asdf install nodejs 16.19.0

# Set default version for Ruby and Node.js
RUN asdf global ruby 2.7.6
RUN asdf global nodejs 16.19.0




# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock package.json package-lock.json ./

# Install required gems
RUN bundle install --without debug && npm install

# Copy the rest of the application code to the container
COPY . $APP_HOME

EXPOSE 4567




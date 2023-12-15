# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler && bundle install

# Copy the main application
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000
EXPOSE 5432


# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]





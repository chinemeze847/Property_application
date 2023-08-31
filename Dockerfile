# Use the official Ruby image as the base image
FROM ruby:3.2.2

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the bundler gem
RUN gem install bundler

# Install the project dependencies
RUN bundle install

# Copy the application code into the container
COPY . .


# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

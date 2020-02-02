FROM ruby:2.6.5

# Copy application code
COPY . /application
# Change to the application's directory
WORKDIR /application

# Set Rails environment to production
ENV RAILS_ENV production

# Install gems, nodejs and precompile the assets
RUN bundle install --deployment --without development test \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt install -y nodejs \
    && chmod +x /application/entrypoint.sh

# Start the application server
# Add a script to be executed every time the container starts.
ENTRYPOINT ["./entrypoint.sh"]

# docker build . -t rails-app
# docker run --name rails-app-pg -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
# docker run --name rails-app-redis -p 6379:6379 -d redis
# docker run --name rails-app-web -e DATABASE_HOST=172.17.0.1 -e DATABASE_PORT=5432 -e DATABASE_USERNAME=postgres -e DATABASE_PASSWORD=postgres -e REDIS_URL=redis://172.17.0.1:6379/1 -p 3000:3000 rails-app
# docker-compose run web rails new . --force --no-deps --database=postgresql

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
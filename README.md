# Rails chat application
Code of the rails chat tutorial from [iridakos.com](https://iridakos.com/tutorials/2019/04/04/creating-chat-application-rails-websockets.html)

![Bash completion demo](https://iridakos.com/assets/images/posts/rails-chat-tutorial/rails-chat-tutorial.gif)

# MIT License

Copyright (c) 2019 Lazarus Lazaridis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


A Demo Rails App (chat app), with Docker, PostGres, Redis on docker images and with commands on how to run it.

Run the following commands on the root of the folder, to generate the Gemfile and Gemfile.lock:

# bundle update
# bundle install --no-deployment

The Docker commands to build and run the application.

# docker build . -t rails-app
# docker run --name rails-app-pg -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
# docker run --name rails-app-redis -p 6379:6379 -d redis
# docker run --name rails-app-web -e DATABASE_HOST=172.17.0.1 -e DATABASE_PORT=5432 -e DATABASE_USERNAME=postgres -e DATABASE_PASSWORD=postgres -e REDIS_URL=redis://172.17.0.1:6379/1 -p 3000:3000 rails-app
# docker-compose run web rails new . --force --no-deps --database=postgresql

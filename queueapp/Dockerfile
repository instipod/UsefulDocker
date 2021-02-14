FROM laravel-container

RUN apt-get update
RUN apt-get install supervisor -y

COPY supervisor.conf /etc/supervisor.conf
COPY queue.conf /etc/supervisor/conf.d/queue.conf
COPY apache.conf /etc/supervisor/conf.d/apache.conf

CMD supervisord -c /etc/supervisor.conf

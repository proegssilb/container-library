FROM alpine:3.9

LABEL maintainer="proegssilb@gmail.com"

RUN apk --no-cache add gettext

COPY main.sh /

RUN chmod u+x /main.sh

CMD /main.sh

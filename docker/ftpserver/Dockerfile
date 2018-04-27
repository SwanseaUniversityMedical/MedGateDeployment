FROM stilliard/pure-ftpd

ARG PASSWORD
ARG USERID

RUN ( echo $PASSWORD ; echo $PASSWORD ) | pure-pw useradd $USERID -u ftpuser -d /home/ftpusers/$USERID 
RUN pure-pw mkdb

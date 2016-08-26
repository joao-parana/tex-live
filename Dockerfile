FROM debian:testing
#
MAINTAINER João Antonio Ferreira "joao.parana@gmail.com"

ENV REFRESHED_AT 2016-08-26

# instalando o software
RUN apt-get update && \
    apt-get install -y curl wget xzdec sudo unzip python vim nano

# Instalação Minimalista
RUN apt-get install -y --no-install-recommends texlive

RUN ls -la /usr/bin | grep texlive

WORKDIR /tmp

ENV PRIMARYGRP dev
ENV MYGROUP    latex
ENV USER_NAME  latex

RUN groupadd $MYGROUP && \
    groupadd $PRIMARYGRP && \
    useradd $USER_NAME -s /bin/bash -m -g $PRIMARYGRP -G $MYGROUP && \
    echo "echo \"Execute do-latex passando o nome do arquivo tex, sem extenssão\" ">> /home/$USER_NAME/.profile && \
    echo "texliveonfly \$1.tex" > /usr/local/bin/do-latex && \
    echo "mv \$1.pdf /tex/data/out" >> /usr/local/bin/do-latex && \
    echo "mv \$1.log /tex/data/logs" >> /usr/local/bin/do-latex && \
    echo "rm \$1.aux" >> /usr/local/bin/do-latex && \
    echo "rm \$1.synctex.gz" >> /usr/local/bin/do-latex && \
    chmod a+rx /usr/local/bin/do-latex
    
USER root
# RUN cd ~ && mkdir texmf && tlmgr init-usertree && tlmgr install texliveonfly
# Alternativa ao erro: running on Debian, switching to user mode!
RUN wget http://mirrors.ctan.org/support/texliveonfly.zip && \
    unzip texliveonfly.zip && \
    chmod a+rx  texliveonfly/texliveonfly.py && \
    mv texliveonfly/texliveonfly.py /usr/local/bin/texliveonfly 

RUN mkdir /desenv && chmod 777 /desenv   

USER $USER_NAME

RUN echo "Rodando como usuário : `whoami`" && \
    mkdir -p /home/$USER_NAME/texmf && \
    cd /home/$USER_NAME && \
    echo "Diretório corrente : `pwd`" && \
    tlmgr init-usertree && \
    tlmgr install helvetic && \
    tlmgr install courier

WORKDIR /desenv
ADD artigo-1.tex /desenv
RUN echo "Diretório corrente : `pwd`" && \
    ls -lat && \
    texliveonfly artigo-1.tex

USER root

VOLUME /tex/data

CMD [ "/bin/bash" ]

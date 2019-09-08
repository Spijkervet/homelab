# Upgrade Sharelatex Texlive to latest version

FROM sharelatex/sharelatex

MAINTAINER janewilde janne.spijkervet@gmail.com

RUN ls /usr/local/texlive
RUN mv /usr/local/texlive/2017 /usr/local/texlive/2019 
ENV PATH="${PATH}:/usr/local/texlive/2019/bin/x86_64-linux/"

RUN cd /usr/local/texlive/2019/ \
    && tlmgr init-usertree \
    && tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet/ \
    && wget http://ctan.triasinformatica.nl/systems/texlive/tlnet/update-tlmgr-latest.sh \
    && chmod +x update-tlmgr-latest.sh \
    && sh ./update-tlmgr-latest.sh \
    && tlmgr update --self --all


# Install Pygments for minted
RUN set -x \
    && apt-get update \
    && apt-get install -y xzdec python-pygments


# -shell-escape is required by minted
# https://github.com/sharelatex/sharelatex-docker-image/issues/45#issuecomment-247809588
RUN sed -i 's/concat(\[\"-pdf\",/concat(\[\"-pdf\",\"-shell-escape\",/g' /var/www/sharelatex/clsi/app/js/LatexRunner.js

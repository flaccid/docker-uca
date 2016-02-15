FROM       ubuntu
MAINTAINER Chris Fordham <chris@fordham-nagy.id.au>

ENV WSTUNNEL_HOST wstunnel1-1.rightscale.com
ENV WSTUNNEL_TOKEN acme-super-cloud-124567876543abd56cbt
ENV API_HOST us-3.rightscale.com
ENV REFRESH_TOKEN token
ENV UCA_CMD config

RUN apt-get update && apt-get install -y ca-certificates

ADD uca-linux-amd64.tgz /opt
RUN chown -Rv root:root /opt/uca
RUN chmod +x /opt/uca/uca

VOLUME /opt/uca

WORKDIR /opt/uca

CMD /opt/uca/uca "$UCA_CMD" \
  --wstunsrv="$WSTUNNEL_HOST" \
  --wstuntok="$WSTUNNEL_TOKEN" \
  --apihost="$API_HOST" \
  --apicreds="$REFRESH_TOKEN"

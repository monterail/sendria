FROM python:3.10-alpine as dev

RUN addgroup -S sendria && adduser -S sendria -G sendria
WORKDIR /home/sendria
USER sendria
RUN python3 -m pip install --user sendria==2.2.2

ENV PATH="/home/sendria/.local/bin:$PATH"

EXPOSE 1025 1080

RUN mkdir -p ./data
ENTRYPOINT [ "sendria", "--foreground", "--no-quit", "--db=./data/mails.sqlite", \
  "--smtp-ip=0.0.0.0", "--http-ip=0.0.0.0" ]

FROM dev as prod

COPY --chown=sendria:sendria start.sh .
RUN chmod +x ./start.sh

ENTRYPOINT ["./start.sh"]

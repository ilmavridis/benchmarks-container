FROM alpine:3.13

MAINTAINER Ilias Mavridis <il.mavridis@gmail.com>

RUN apk add --no-cache gcc musl-dev make linux-headers ca-certificates\
    && apk add --no-cache --upgrade bash\
    && update-ca-certificates \
    && apk add openssl wget build-base \
    && apk add --update linux-headers


RUN addgroup -S bench_group \
    && adduser -S bench_user -G bench_group\
    && mkdir /benchmarks


COPY Makefile /benchmarks/
COPY run.sh /benchmarks/
COPY linpack /benchmarks/linpack
COPY benchs_sh_files /benchmarks/benchs_sh_files
COPY stream /benchmarks/stream
COPY fio /benchmarks/fio

RUN chown -R bench_user /benchmarks
USER bench_user
WORKDIR /benchmarks


RUN make all\
    && chmod +x benchs_sh_files/* \
    && chmod +x run.sh

ENTRYPOINT ["/bin/bash"]
CMD ["run.sh"]

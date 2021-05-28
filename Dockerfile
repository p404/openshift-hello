FROM registry.access.redhat.com/ubi8/go-toolset:1.15.7 as build
WORKDIR /opt/app-root
COPY . .
RUN go build

FROM registry.access.redhat.com/ubi8/ubi-minimal
WORKDIR /opt/app-root
COPY --from=build /opt/app-root/openshift-hello /opt/app-root/openshift-hello

LABEL io.openshift.build.commit.author="Test author" \
      io.openshift.build.commit.date="Wed Jan 20 10:14:27 2021 -0500" \
      io.openshift.build.commit.id="0000000000c392d39d5ef9117cbc8a31db0889eedd442" \
      io.openshift.build.commit.message="This is a test" \
      io.openshift.build.commit.ref="master"

ENTRYPOINT ["./openshift-hello"]
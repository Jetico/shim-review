FROM fedora:32

RUN dnf -y update
RUN dnf -y install git gcc make gnu-efi-devel patch diffutils

RUN git clone https://github.com/rhboot/shim.git
RUN git clone https://github.com/Jetico/shim-review

WORKDIR /shim
RUN git checkout -b 15.2 origin/15.2
RUN patch -p1 < /shim-review/shim.patch
RUN make VENDOR_CERT_FILE=/shim-review/pub_cert.der

RUN ls -la

WORKDIR /
RUN hexdump -Cv /shim-review/shimx64.efi > orig
RUN hexdump -Cv /shim/shimx64.efi > build
RUN diff -u orig build

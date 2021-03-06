FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://ip_forward.conf \
"
SRC_URI_remove = " \
    file://eth0.network \
"

PACKAGECONFIG_append = " networkd"
PACKAGECONFIG_append = " iptc"
PACKAGECONFIG_append = " resolved"

USERADD_ERROR_DYNAMIC = "warn"

do_install_append() {
    install -m 0644 ${WORKDIR}/ip_forward.conf ${D}${sysconfdir}/tmpfiles.d/
}

cmake_minimum_required(VERSION 4.0)

project(rtmpdump
    VERSION 2.6
    HOMEPAGE_URL https://rtmpdump.mplayerhq.hu/
    DESCRIPTION "Toolkit for RTMP streams"
    LANGUAGES C
)

include(GNUInstallDirs)

find_package(ZLIB)
find_package(OpenSSL)

add_library(rtmp
    librtmp/amf.c
    librtmp/hashswf.c
    librtmp/log.c
    librtmp/parseurl.c
    librtmp/rtmp.c
)
target_compile_definitions(rtmp
    PRIVATE
        USE_OPENSSL
        BUILD_RTMP
)
target_link_libraries(rtmp
    PRIVATE
        WS2_32
        WinMM
        Gdi32
        OpenSSL::SSL
        ZLIB::ZLIB
)
target_sources(rtmp
    PUBLIC
        FILE_SET hdrs TYPE HEADERS
        FILES
            librtmp/amf.h
            librtmp/http.h
            librtmp/log.h
            librtmp/rtmp.h
)
set_target_properties(rtmp
    PROPERTIES
        WINDOWS_EXPORT_ALL_SYMBOLS ON
)

block()
set(prefix ${CMAKE_INSTALL_PREFIX})
set(libdir ${CMAKE_INSTALL_FULL_LIBDIR})
set(CRYPTO_REQ "libssl,libcrypto,zlib")
set(VERSION ${rtmpdump_VERSION})
configure_file(librtmp/librtmp.pc.in librtmp.pc @ONLY)
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/librtmp.pc"
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)
endblock()

cmake_minimum_required(VERSION 4.1)

project(rtmpdump VERSION 2.6 LANGUAGES C)

include(GNUInstallDirs)
include(GenerateExportHeader)

set(CMAKE_C_STANDARD 17)
set(BUILD_SHARED_LIBS ON)

find_package(getopt CONFIG REQUIRED)
find_package(ZLIB REQUIRED)

add_library(rtmp
  librtmp/amf.c
  librtmp/hashswf.c
  librtmp/log.c
  librtmp/parseurl.c
  librtmp/rtmp.c
  rtmp.def
)
target_link_libraries(rtmp
    PRIVATE ZLIB::ZLIB WS2_32 WinMM
)
target_compile_definitions(rtmp
  PRIVATE _CRT_DECLARE_NONSTDC_NAMES=1 NO_CRYPTO
)
generate_export_header(rtmp EXPORT_FILE_NAME librtmp/rtmp_export.h)
target_sources(
  rtmp
  PUBLIC
    FILE_SET HEADERS
      FILES
        librtmp/amf.h
        librtmp/bytes.h
        librtmp/dh.h
        librtmp/dhgroups.h
        librtmp/handshake.h
        librtmp/http.h
        librtmp/log.h
        librtmp/rtmp_sys.h
  PUBLIC
    FILE_SET generated_headers
      TYPE HEADERS
      BASE_DIRS $<TARGET_PROPERTY:rtmp,BINARY_DIR>
      FILES ${CMAKE_CURRENT_BINARY_DIR}/librtmp/rtmp_export.h
)

add_compile_definitions(RTMPDUMP_VERSION=\"v${PROJECT_VERSION}\")

add_executable(rtmpdump rtmpdump.c)
target_link_libraries(rtmpdump PRIVATE getopt::getopt_shared rtmp WS2_32)

add_executable(rtmpsrv rtmpsrv.c thread.c)
target_link_libraries(rtmpsrv PRIVATE getopt::getopt_shared rtmp WS2_32)

add_executable(rtmpsuck rtmpsuck.c thread.c)
target_link_libraries(rtmpsuck PRIVATE getopt::getopt_shared rtmp WS2_32)

add_executable(rtmpgw rtmpgw.c thread.c)
target_link_libraries(rtmpgw PRIVATE getopt::getopt_shared rtmp WS2_32)

install(TARGETS
    rtmp
    rtmpdump
    rtmpsrv
    rtmpsuck
    rtmpgw
)
install(
  TARGETS rtmp
  FILE_SET HEADERS
  FILE_SET generated_headers
)
install(
  FILES
    rtmpdump.1
    DESTINATION ${CMAKE_INSTALL_MANDIR}/man1
)
install(FILES rtmpgw.8
  DESTINATION ${CMAKE_INSTALL_MANDIR}/man8
)
install(FILES librtmp/librtmp.3
  DESTINATION ${CMAKE_INSTALL_MANDIR}/man3
)

block()
  set(prefix "${CMAKE_INSTALL_PREFIX}")
  set(libdir "${CMAKE_INSTALL_LIBDIR}")
  set(VERSION "${PROJECT_VERSION}")
  set(PRIVATE_LIBS "-lWS2_32 -lWinMM")
  configure_file(librtmp/librtmp.pc.in librtmp.pc @ONLY)
endblock()
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/librtmp.pc
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig
)

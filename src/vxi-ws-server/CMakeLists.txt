cmake_minimum_required(VERSION 2.8)

set(SAMP vxi-ws-server)
set(SRCS vxi-ws-server.c ../instr-server/datagram.c)

set(MORROWINCLUDES "-I ../morrow/include -I ../morrow")

if (UNIX)
      set(CMAKE_C_FLAGS "-I ../../../include ${MORROWINCLUDES} -g -Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits  -Wundef ${CMAKE_C_FLAGS}" )
endif()

add_executable(${SAMP} ${SRCS})
target_link_libraries(${SAMP} -lwebsockets)

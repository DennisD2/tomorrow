cmake_minimum_required(VERSION 2.8)

set(SAMP instr-server)
set(SRCS server.c datagram.c)

set(TEST datagram-test)
set(TESTSRCS datagram-test.c datagram.c)

if (UNIX)
      set(CMAKE_C_FLAGS "-I ../../../include -Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits  -Wundef ${CMAKE_C_FLAGS}" )
endif()

add_executable(${SAMP} ${SRCS})
add_executable(${TEST} ${TESTSRCS})
target_link_libraries(${SAMP} -lm)

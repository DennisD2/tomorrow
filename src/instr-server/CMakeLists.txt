cmake_minimum_required(VERSION 2.8)

set(SERVER instr-server)
set(SSRCS server.c command.c datagram.c)

set(CLIENT instr-client)
set(CSRCS client.c datagram.c)

set(TESTD datagram-test)
set(TESTDSRCS datagram-test.c datagram.c)

set(TESTC command-test)
set(TESTCSRCS command-test.c command.c datagram.c)

if (UNIX)
      set(CMAKE_C_FLAGS "-g -I ../../../include -Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits  -Wundef ${CMAKE_C_FLAGS}" )
endif()

add_executable(${SERVER} ${SSRCS})
target_link_libraries(${SERVER} -lm)

add_executable(${CLIENT} ${CSRCS})

add_executable(${TESTD} ${TESTDSRCS})
add_executable(${TESTC} ${TESTCSRCS})


cmake_minimum_required(VERSION 3.5)
project(qdft LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Option to choose shared/static
option(BUILD_SHARED_LIBS "Build shared rather than static library" OFF)

# Directories
set(ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}../cpp/")
set(SRC_DIR "${CMAKE_CURRENT_LIST_DIR}/src")
set(CQ_DIR  "${CMAKE_CURRENT_LIST_DIR}/cq")
set(KFFT_DIR "${SRC_DIR}/ext/kissfft")
set(KFFT_TOOLS_DIR "${KFFT_DIR}/tools")

# Include paths
include_directories(
        ${CMAKE_CURRENT_LIST_DIR}
        ${ROOT_DIR}/src/qdft)

message(STATUS "${ROOT_DIR}/src/qdft")

# Create library target
add_library(qdft
        ${CMAKE_CURRENT_LIST_DIR}/qdft_c.cpp)

if(NOT BUILD_SHARED_LIBS)
    set_target_properties(qdft PROPERTIES
            POSITION_INDEPENDENT_CODE ON
            OUTPUT_NAME "qdft")
endif()

install(TARGETS qdft
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        RUNTIME DESTINATION bin)

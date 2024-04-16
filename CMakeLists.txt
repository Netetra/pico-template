cmake_minimum_required(VERSION 3.12)

set(PROJECT_NAME pico-cpp)
set(CMAKE_EXPORT_COMPILE_COMMANDS true)
set(PICO_SDK_FETCH_FROM_GIT true)

### Select Board ###
# set(PICO_BOARD pico)
set(PICO_BOARD pico_w)

include(pico_sdk_import.cmake)

project(${PROJECT_NAME} C CXX ASM)

pico_sdk_init()

add_executable(${PROJECT_NAME}
    src/main.cpp
)

target_link_libraries(${PROJECT_NAME}
    pico_stdlib
    pico_cyw43_arch_none
)

pico_enable_stdio_usb(${PROJECT_NAME} true)
pico_enable_stdio_uart(${PROJECT_NAME} false)

pico_add_extra_outputs(${PROJECT_NAME})

add_compile_options(
    -Wall
    -Wno-format
    -Wno-unused-function
)

if (CMAKE_C_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-Wno-maybe-uninitialized)
endif()

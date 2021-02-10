file(GLOB_RECURSE C_SOURCES ./*.c)
file(GLOB_RECURSE ASM_SOURCES ./*.s)

add_executable(main ${C_SOURCES} ${ASM_SOURCES})

if(MSVC)
    target_compile_options(main PRIVATE /W4 /WX)
else()
<<<<<<< HEAD
  target_compile_options(main PRIVATE -Wall -Wextra -pedantic -Werror)
endif()
=======
    target_compile_options(main PRIVATE -Wall -Wextra -pedantic -Werror)
endif()

>>>>>>> cee803c8b7597d7c05703342cfc4d5da483fea3b

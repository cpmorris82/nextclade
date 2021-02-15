# Adds some useful C compiler flags


####################### GCC ################################
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} \
  -fno-inline-small-functions \
  ")

  set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} \
  -fno-inline-small-functions \
  ")

  set(C_CXX_FLAGS "${C_CXX_FLAGS} \
  -Walloc-zero \
  -Wdangling-else \
  -Wduplicated-cond \
  -Wif-not-aligned \
  -Wmisleading-indentation \
  -Wmissing-attributes \
  -Wmultistatement-macros \
  -Wnonnull \
  -Wnull-dereference \
  -Wrestrict \
  -Wshift-negative-value \
  -Wshift-overflow=2 \
  -Wvector-operation-performance \
  -Wvla-larger-than=1 \
  ")

  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
  -Waligned-new \
  -Wold-style-cast \
  -Wsized-deallocation \
  -Wvector-operation-performance \
  ")

endif ()

####################### Clang ##################################################
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(C_CXX_FLAGS "${C_CXX_FLAGS} \
  -Reverything \
  -Wabsolute-value \
  -Wcomma \
  -Wloop-analysis \
  -Wmove \
  -Wnull-dereference \
  -Wnull-pointer-arithmetic \
  -Wpragma-pack \
  -Wpragma-pack-suspicious-include \
  -Wrange-loop-analysis \
  -Wshift-negative-value \
  -Wshift-overflow \
  -Wtautological-compare \
  -Wtautological-undefined-compare \
  -Wunused-lambda-capture \
  -fdouble-square-bracket-attributes \
  -fstrict-vtable-pointers \
  ")

  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
  ")

  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
  ")
endif ()


####################### GCC and CLANG ##########################################
if (CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  set(C_CXX_FLAGS " \
  ${C_CXX_FLAGS} \
  -Wall \
  -Wextra \
  -fdiagnostics-color \
  -fno-strict-aliasing \
  -fsized-deallocation \
  -ftree-vectorize \
  -funroll-loops \
  -pipe \
  -Warray-bounds \
  -Wcast-qual \
  -Wconversion \
  -Wdeprecated-declarations \
  -Wempty-body \
  -Wfloat-conversion \
  -Wfloat-equal \
  -Wformat-extra-args \
  -Wformat-nonliteral \
  -Wformat-security \
  -Wformat-y2k \
  -Wformat-zero-length \
  -Wformat=2 \
  -Wignored-qualifiers \
  -Winit-self \
  -Wno-cast-align \
  -Wno-conversion \
  -Wno-float-conversion \
  -Wno-format-nonliteral \
  -Wno-shadow \
  -Wno-undef \
  -Wno-unknown-pragmas \
  -Wno-unused-parameter \
  -Wno-unused-variable \
  -Wno-zero-as-null-pointer-constant \
  -Wpointer-arith \
  -Wredundant-decls \
  -Wshadow \
  -Wsign-compare \
  -Wstrict-overflow=5 \
  -Wswitch-default \
  -Wswitch-enum \
  -Wtype-limits \
  -Wundef \
  -Wuninitialized \
  -Wunreachable-code \
  -Wwrite-strings \
  ")

  set(C_FLAGS " ${C_FLAGS} \
  -Waggregate-return \
  -Wcast-qual \
  -Wimplicit-function-declaration \
  -Wincompatible-pointer-types \
  -Wint-conversion \
  -Wstrict-prototypes \
  -Wvla \
  ")

  set(CXX_FLAGS "${CXX_FLAGS} \
  -Woverloaded-virtual \
  ")

  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${C_CXX_FLAGS} ${C_FLAGS}")

  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${C_CXX_FLAGS} ${CXX_FLAGS}")

  set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} \
  -DDEBUG=1 \
  -g \
  -O0 \
  -fstack-protector-all \
  -fno-inline \
  ")

  set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} \
  -DDEBUG=1 \
  -g \
  -O0 \
  -fstack-protector-all \
  -fno-inline \
  ")

  set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} \
  -DNDEBUG=1 \
  -fomit-frame-pointer \
  ")

  set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} \
  -DNDEBUG=1 \
  -fomit-frame-pointer \
  ")

endif ()

####################### Visual C++ #############################################
if (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  set(C_CXX_FLAGS "${C_CXX_FLAGS} \
  /D_CRT_SECURE_NO_WARNINGS \
  /D_SCL_SECURE_NO_WARNINGS \
  /DNOMINMAX \
  /DWIN32_LEAN_AND_MEAN \
  /permissive- \
  /W4 \
  /w14242 \
  /w14254 \
  /w14263 \
  /w14265 \
  /w14287 \
  /w14296 \
  /w14311 \
  /w14545 \
  /w14546 \
  /w14547 \
  /w14549 \
  /w14555 \
  /w14619 \
  /w14640 \
  /w14826 \
  /w14905 \
  /w14906 \
  /w14928 \
  /we4289 \
  ")

  set(LINKER_FLAGS "${LINKER_FLAGS} \
  /ignore:4099
  ")

  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${C_CXX_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${C_CXX_FLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${LINKER_FLAGS}")
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${LINKER_FLAGS}")
endif ()

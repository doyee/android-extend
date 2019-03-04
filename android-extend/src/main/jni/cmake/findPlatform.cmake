FUNCTION(GET_SYSTEM_INFO os arch)
    IF (CMAKE_SYSTEM_NAME MATCHES "Linux")
		MESSAGE(STATUS "current platform: Linux ")
		SET (${os} "linux" PARENT_SCOPE)
	ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
		MESSAGE(STATUS "current platform: Windows")
		SET (${os} "windows" PARENT_SCOPE)
	ELSEIF (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
		MESSAGE(STATUS "current platform: FreeBSD")
	ELSE ()
		MESSAGE(STATUS "other platform: ${CMAKE_SYSTEM_NAME}")
	ENDIF ()

	IF (CMAKE_SIZEOF_VOID_P MATCHES "8")
		MESSAGE(STATUS "current arch: x64")
		SET (${arch} "x64" PARENT_SCOPE)
	ELSEIF (CMAKE_SIZEOF_VOID_P MATCHES "4")
		MESSAGE(STATUS "current arch: x86")
		SET (${arch} "x86" PARENT_SCOPE)
	ENDIF()
ENDFUNCTION()
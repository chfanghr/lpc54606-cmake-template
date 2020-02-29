FUNCTION(POST_BUILD_ELF2BIN target)
	GET_FILENAME_COMPONENT(target_dir $<TARGET_FILE:${target}> DIRECTORY)
	ADD_CUSTOM_COMMAND(
			TARGET "${target}" POST_BUILD
			WORKING_DIRECTORY "${target_dir}"
			COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${target}> ${target}.bin
			COMMENT "Convert target ${target} to binary..."
	)
ENDFUNCTION()

FUNCTION(ADD_EXECUTABLE_CONV)
	ADD_EXECUTABLE(${ARGV})
	TARGET_LINK_LIBRARIES(
			${ARGV0}
			semihost_hardfault
			device
			startup
			cpp_config
			board
			power_hardabi
			arm_cortexM4lf_math)
	TARGET_LINK_OPTIONS(${ARGV0} INTERFACE "-Xlinker -Map=${ARGV0}.map")
	POST_BUILD_ELF2BIN(${ARGV0})
ENDFUNCTION()



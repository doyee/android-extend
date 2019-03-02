FUNCTION(INCLUDE_SUB_DIRECTORIES_RECURSIVELY root_dir)
    IF (IS_DIRECTORY ${root_dir})               # ��ǰ·����һ��Ŀ¼���ǵĻ��ͼ��뵽����Ŀ¼
        MESSAGE("include dir: " ${root_dir})
        INCLUDE_DIRECTORIES(${root_dir})
    ENDIF()

    FILE(GLOB ALL_SUB RELATIVE ${root_dir} ${root_dir}/*) # ��õ�ǰĿ¼�µ������ļ�������ALL_SUB�б���
    FOREACH(sub ${ALL_SUB})
        IF (IS_DIRECTORY ${root_dir}/${sub})                    
            INCLUDE_SUB_DIRECTORIES_RECURSIVELY(${root_dir}/${sub}) # ����Ŀ¼�ݹ���ã�����
        ENDIF()
    ENDFOREACH()
ENDFUNCTION()

FUNCTION(ALL_SUB_DIRECTORIES_RECURSIVELY root_dir sub_dir)
    IF (IS_DIRECTORY ${root_dir})               # ��ǰ·����һ��Ŀ¼���ǵĻ��ͼ��뵽����Ŀ¼
        MESSAGE("add dir: " ${root_dir})
    ENDIF()

    FILE(GLOB ALL_SUB RELATIVE ${root_dir} ${root_dir}/*) # ��õ�ǰĿ¼�µ������ļ�������ALL_SUB�б���
    FOREACH(sub ${ALL_SUB})
        IF (IS_DIRECTORY ${root_dir}/${sub})                    
            ALL_SUB_DIRECTORIES_RECURSIVELY(${root_dir}/${sub} deep) # ����Ŀ¼�ݹ���ã�����
			SET(deep_list ${deep_list} ${deep})
        ENDIF()
    ENDFOREACH()
	SET(${sub_dir} ${root_dir} ${deep_list} PARENT_SCOPE)
ENDFUNCTION()
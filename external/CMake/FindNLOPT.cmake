        find_path(NLOPT_PAGMO_BASE_PATH2 NAMES nlopt.h
            NO_DEFAULT_PATH
            PATHS
                ${PROJECT_SOURCE_DIR}/../nlopt/src/api/
                ${PROJECT_SOURCE_DIR}/../../nlopt/src/api/
                ${PROJECT_SOURCE_DIR}/../../../nlopt/src/api/)

        set(NLOPT_LIBRARY "${NLOPT_PAGMO_BASE_PATH2}/../../lib/libnlopt.a")
        set(NLOPT_INCLUDE_DIR "${NLOPT_PAGMO_BASE_PATH2}/../../")

        add_library(NLOPT::nlopt UNKNOWN IMPORTED)
        set_target_properties(NLOPT::nlopt PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${NLOPT_INCLUDE_DIR}")
        set_target_properties(NLOPT::nlopt PROPERTIES IMPORTED_LINK_INTERFACE_LANGUAGES "C" IMPORTED_LOCATION "${NLOPT_LIBRARY}")


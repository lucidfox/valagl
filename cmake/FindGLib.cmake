message("-- Checking for Glib >= ${GLIB_REQUIRED_VERSION}...")
pkg_check_modules(GLIB2 glib-2.0>=${GLIB_REQUIRED_VERSION})
message("-- Checking for GObject...")
pkg_check_modules(GOBJECT gobject-2.0)
message("-- Checking for GModule...")
pkg_check_modules(GMODULE gmodule-2.0)

if(GLIB2_FOUND AND GMODULE_FOUND)
    set(GLIB_ALL_INCLUDES ${GLIB2_INCLUDE_DIRS} ${GOBJECT_INCLUDE_DIRS} ${GMODULE_INCLUDE_DIRS})
    set(GLIB_ALL_CFLAGS ${GLIB2_CFLAGS_OTHER} ${GOBJECT_CFLAGS_OTHER} ${GMODULE_CFLAGS_OTHER})
    set(GLIB_ALL_LIBS ${GLIB2_LDFLAGS} ${GOBJECT_LDFLAGS} ${GMODULE_LDFLAGS})
else()
    message(FATAL_ERROR "GLib not found")
endif()

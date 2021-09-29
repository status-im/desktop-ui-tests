CONFIG += warn_on qmltestcase

TEMPLATE = app

DESTDIR += $${PWD}/bin

DEFINES += PROJECT_PATH=\"$${PWD}\"

DISTFILES += \
    tst_Modals.qml \
    tst_initialtest.qml

DISTFILES += $$files("StatusQ/src/*", true)
DISTFILES += $$files("status-desktop/ui/app/*", true)

SOURCES += \
    main.cpp \
    setup.cpp

HEADERS += \
    setup.h

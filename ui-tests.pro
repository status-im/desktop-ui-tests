CONFIG += warn_on qmltestcase qtquickcompiler

TEMPLATE = app

DESTDIR += $${PWD}/bin

DEFINES += PROJECT_PATH=\"$${PWD}\"

#DISTFILES += $$

DISTFILES += $$files("$$PWD/*.qml", true)

QML_IMPORT_PATH += status-desktop/ui/StatusQ/src

SOURCES += \
    main.cpp \
    setup.cpp

HEADERS += \
    setup.h

RESOURCES += \
    tests.qrc

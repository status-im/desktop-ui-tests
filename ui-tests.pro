CONFIG += warn_on qmltestcase

TEMPLATE = app

DESTDIR += $${PWD}/bin

DEFINES += PROJECT_PATH=\"$${PWD}\"

DISTFILES += \
    base/ChatsModelData.qml \
    base/Helpers.qml \
    base/ProfileModelData.qml \
    base/WindowTestCase.qml \
    tst_Modals.qml \
    tst_choose_chat_name_modal.qml \
    tst_get_started_modal.qml \
    tst_initialtest.qml

DISTFILES += $$files("status-desktop/ui/*", true)

SOURCES += \
    main.cpp \
    setup.cpp

HEADERS += \
    setup.h

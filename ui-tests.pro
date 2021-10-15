CONFIG += warn_on qmltestcase

TEMPLATE = app

DESTDIR += $${PWD}/bin

DEFINES += PROJECT_PATH=\"$${PWD}\"

DISTFILES += \
    base/ChatsModelData.qml \
    base/Helpers.qml \
    base/ModalHelpers.qml \
    base/ProfileModelData.qml \
    base/WindowTestCase.qml \
    tst_choose_chat_name_modal.qml \
    tst_get_started_modal.qml \
    tst_initialtest.qml \
    tst_profile_popup.qml

DISTFILES += $$files("status-desktop/ui/*", true)

SOURCES += \
    main.cpp \
    setup.cpp

HEADERS += \
    setup.h

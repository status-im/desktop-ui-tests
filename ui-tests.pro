CONFIG += warn_on qmltestcase qtquickcompiler

TEMPLATE = app

DESTDIR += $${PWD}/bin

DEFINES += PROJECT_PATH=\"$${PWD}\"

DISTFILES += \
    base/ChatsModelData.qml \
    base/Helpers.qml \
    base/LegacyModalsHelpers.qml \
    base/ModalHelpers.qml \
    base/ProfileModelData.qml \
    base/WindowTestCase.qml \
    tst_choose_chat_name_modal.qml \
    tst_get_started_modal.qml \
    tst_initialtest.qml \
    tst_profile_popup.qml

DISTFILES += $$files("status-desktop/ui/*", true)

QML_IMPORT_PATH += status-desktop/ui/

SOURCES += \
    main.cpp \
    setup.cpp

HEADERS += \
    setup.h

RESOURCES += \
    tests.qrc

import QtQuick 2.14
import QtQuick.Window 2.14
import QtTest 1.14

import "base"
import "status-desktop/ui/app/AppLayouts/Chat/components" as DesktopComponents


WindowTestCase {
    name: "ProfilePopup"
    when: windowShown

    Helpers { id: helpers }

    /// TODO: add good test data
    ChatsModelData {
        id: chatsModel
    }

    ProfileModelData {
        id: profileModel
    }

    Component {
        id: popupComponent
        DesktopComponents.ProfilePopup {
            id: propfile
        }
    }

    // Catching editClickedSignal
    SignalSpy {
        id: editClickedSpy
        signalName: "editAvatarButtonClicked"
    }

    ///////

    function initTestCase() {
        window.show()
    }

    function cleanupTestCase() {
        window.close()
    }

    function test_case1() {
        var propfilePopup = popupComponent.createObject(window)
        propfilePopup.openPopup(true, "Test user", "Some author", "", "bla bla test it bitch", "Nickname")
        mouseClick(propfilePopup.background, propfilePopup.width - 65, 20, Qt.LeftButton)
        verify(propfilePopup.contentItem.qrCodePopup.visible, "Qr code should be visible")
        propfilePopup.contentItem.qrCodePopup.close()
        verify(!propfilePopup.contentItem.qrCodePopup.visible, "Qr code should be visible")
        propfilePopup.destroy()
    }

    function test_case2CurrentUser() {
        profileModel.profile.pubKey = "current-user"
        var propfilePopup = popupComponent.createObject(window)
        wait(2000)
        propfilePopup.openPopup(true, "Test user", "current-user", "", "bla bla test it bitch", "Nickname")
        editClickedSpy.target = propfilePopup
        verify(propfilePopup.isCurrentUser, "User should be current")
        wait(5000)
        var editbButton = helpers.getObjectByObjectName(propfilePopup.background, "editAvatarButton")
        verify(!!editbButton, "object with name \"editAvatarButton\" not found")
        verify(editbButton.visible, "editAvatarButton should be visible")

        compare(editClickedSpy.count, 0)
        mouseClick(editbButton, 1, 1, Qt.LeftButton)
        wait(5000)
        compare(editClickedSpy.count, 1, "Edit avatar button not clicked")
        propfilePopup.destroy()
    }

    function test_case3NotCurrentUser() {
        profileModel.profile.pubKey = "another-user"
        var propfilePopup = popupComponent.createObject(window)
        wait(2000)
        propfilePopup.openPopup(true, "Test user", "current-user", "", "bla bla test it bitch", "Nickname")
        wait(5000)
        verify(!propfilePopup.isCurrentUser, "User should be is not current")
        var editbButton = helpers.getObjectByObjectName(propfilePopup.background, "editAvatarButton")
        verify(!!editbButton, "object with name \"editAvatarButton\" not found")
        verify(!editbButton.visible, "editAvatarButton should be not visible")
        propfilePopup.destroy()
    }
}

